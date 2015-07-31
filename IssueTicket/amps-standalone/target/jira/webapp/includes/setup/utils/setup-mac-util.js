define("jira/setup/setup-mac-util", [
    "jquery",
    "underscore"
], function($, _){
    var productBundleKeys = {
        "DEVELOPMENT": "com.pyxis.greenhopper.jira",
        "SERVICEDESK": "com.atlassian.servicedesk"
    };

    var encode_utf8 = function(s){
        return unescape(encodeURIComponent(s));
    };

    var encodeRequestBody = function(obj){
        var charmap = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
        var str = encode_utf8(JSON.stringify(obj)) + "  ";
        var result = [];
        for (var i = 0; i+2 < str.length; i += 3) {
            var threech = 0;
            for (var j = 0; j < 3; ++j) {
                threech = (threech << 8) + str.charCodeAt(i+j);
            }

            // threech is 24bits long, encode this as 4 chars, each with 6 bits
            for (var j = 3; j >= 0; --j) {
                var chpart = (threech >> (6*j)) & 0x3f;
                result.push(charmap.charAt(chpart));
            }
        }
        return result.join('');
    };

    var browserSupportsCORS = _.once(function(){
        return "withCredentials" in new XMLHttpRequest();
    });

    var lassoDevModeUrl = "https://id.stg.internal.atlassian.com/";

    var getLassoURL = function(){
        return AJS.isDevMode() ? lassoDevModeUrl : "https://id.atlassian.com/";
    };

    var hamletDevModeUrl = "https://hamlet.stg.intsys.atlassian.com/";

    var getHamletUrl = function(){
        return AJS.isDevMode() ? hamletDevModeUrl : "https://hamlet.atlassian.com/";
    };

    var performRequest = function(reqData, xsrfToken){
        var deferred = $.Deferred();
        var request;

        var requestTimeout = 20000;

        if (browserSupportsCORS()){
            request = AJS.$.ajax({
                beforeSend: function(xhr){
                    if (xsrfToken){
                        xhr.setRequestHeader("ATL-XSRF-Token", xsrfToken);
                    }
                },
                contentType: "application/json; charset=utf-8",
                data: reqData.data ? JSON.stringify(reqData.data) : undefined,
                dataType: "json",
                timeout: requestTimeout,
                type: reqData.type,
                url: reqData.url,
                xhrFields: {
                    withCredentials: true
                }
            });
        } else {
            request = AJS.$.ajax({
                data: {
                    method: reqData.type,
                    "h-ATL-XSRF-Token": xsrfToken ? xsrfToken : undefined,
                    "h-Content-Type": "application/json",
                    body: reqData.data ? encodeRequestBody(reqData.data) : undefined
                },
                contentType: "application/json",
                dataType: "jsonp",
                jsonp: "jsonp",
                timeout: requestTimeout,
                type: "GET",
                url: reqData.url
            }).pipe(function(dataObjects, textStatus, jqXHR){
                if (dataObjects[0].status !== 200){
                    return $.Deferred().rejectWith(this, [jqXHR, dataObjects[1]]);
                } else {
                    return $.Deferred().resolveWith(this, [dataObjects[1], textStatus, jqXHR]);
                }
            }, function(jqXHR){
                return $.Deferred().rejectWith(this, [jqXHR, {}]);
            });
        }

        request.done(function(data, textStatus, jqXHR){
            deferred.resolve(data, jqXHR);
        });

        request.fail(function(jqXHR, data){
            var json;

            // data is an object for JSONP requests, otherwise it is status string
            if (_.isObject(data)){
                json = data;
            } else {
                try {
                    json = JSON.parse(jqXHR.responseText);
                } catch(e){
                    json = {};
                }
            }

            deferred.reject(json, jqXHR);
        });

        return deferred.promise();
    };

    var Util = function(){
        this._bundleLicense = undefined;
        this._jiraLicense = undefined;
        this._userData = {};
        this._xsrfToken = undefined;
    };

    /**
     * Overrides the custom url for Lasso
     * @VisibleForTesting
     */
    Util.prototype.setDevModeLassoUrl = function(url) {
        lassoDevModeUrl = url;
    };

    /**
     * Overrides the custom url for Hamlet
     * @VisibleForTesting
     */
    Util.prototype.setDevModeHamletUrl = function(url) {
        hamletDevModeUrl = url;
    };

    /**
     * Check if account represented by given email address exists or not.
     *
     * @param {String} email
     * @returns promise resolved with boolean or rejected in case of broken communication
     */
    Util.prototype.checkIfUserExists = function(email){
        var deferred = $.Deferred();
        var request = performRequest({
            type: "GET",
            url: getLassoURL() + "profile/rest/user/" + encodeURIComponent(email)
        });

        request.done(function(response){
            if (response.exists === true){
                deferred.resolve(true);
            } else if (response.exists === false){
                deferred.resolve(false);
            } else {
                deferred.reject();
            }
        });

        request.fail(function(){
            deferred.reject();
        });

        return deferred.promise();
    };

    /**
     * Create a new MAC account.
     *
     * @param {Object} data - The data used to register a new account
     * @returns promise rejected in case of any errors or broken communication
     */
    Util.prototype.createUser = function(data){
        var deferred = $.Deferred();
        var request = performRequest({
            data: {
                "email": data.email,
                "displayName": data.fullname,
                "password": data.password
            },
            type: "POST",
            url: getLassoURL() + "profile/rest/signUp"
        });

        request.done(_.bind(function(response){
            this._userData = {
                email: response.username,
                fullname: data.fullname,
                password: data.password
            };
            this._xsrfToken = response.xsrfToken;

            deferred.resolve();
        }, this));

        request.fail(function(response){
            deferred.reject(response);
        });

        return deferred.promise();
    };

    /**
     * Log user into MAC account using given credentials.
     *
     * @param {Object} credentials
     * @returns promise rejected in case of any errors or broken communication
     */
    Util.prototype.loginUser = function(credentials){
        var deferred = $.Deferred();
        var request = performRequest({
            data: {
                "username": credentials.email,
                "password": credentials.password
            },
            type: "POST",
            url: getLassoURL() + "id/rest/login"
        });

        request.done(_.bind(function(response){
            this._userData = {
                email: response.username,
                fullname: response.firstName + " " + response.lastName,
                password: credentials.password
            };
            this._xsrfToken = response.xsrfToken;

            deferred.resolve();
        }, this));

        request.fail(function(response){
            deferred.reject(response);
        });

        return deferred.promise();
    };

    /**
     * Generate new evaluation license for JIRA. If one is already generated, don't generate another one.
     *
     * @returns promise resolved if generation succeeded or one is already generated, rejected otherwise
     */
    Util.prototype.generateEvaluationLicense = function(){
        var deferred = $.Deferred();

        if (this._jiraLicense){
            deferred.resolve();
            return deferred.promise();
        }

        var request = performRequest({
            data: {
                "productKey": "jira",
                "serverId": AJS.Meta.get("server-id")
            },
            type: "POST",
            url: getHamletUrl() + "1.0/public/license/createEvaluation"
        }, this._xsrfToken);

        request.done(_.bind(function(response){
            this._jiraLicense = response.licenseKey;

            deferred.resolve();
        }, this));

        request.fail(function(){
            deferred.reject();
        });

        return deferred.promise();
    };

    /**
     * Generate new evaluation license for bundle. If one is already generated, don't generate another one.
     *
     * @returns promise resolved if generation succeeded or one is already generated, rejected otherwise
     */
    Util.prototype.generateBundleEvaluationLicense = function(){
        var deferred = $.Deferred();
        var productBundle = this.getChosenBundle();

        if (this.isBundleChosen()){
            if (this._bundleLicense){
                deferred.resolve();
                return deferred.promise();
            }

            var request = performRequest({
                data: {
                    "productKey": productBundleKeys[productBundle],
                    "serverId": AJS.Meta.get("server-id")
                },
                type: "POST",
                url: getHamletUrl() + "1.0/public/license/createEvaluation"
            }, this._xsrfToken);

            request.done(_.bind(function(response){
                this._bundleLicense = response.licenseKey;

                deferred.resolve();
            }, this));

            request.fail(function(){
                deferred.reject();
            });
        } else {
            deferred.reject();
        }

        return deferred.promise();
    };

    /**
     * @returns {String} one of TRACKING|DEVELOPMENT|SERVICEDESK
     */
    Util.prototype.getChosenBundle = function(){
        return AJS.Meta.get("setup-chosen-bundle");
    };

    /**
     * @returns {String}
     */
    Util.prototype.getChosenBundleName = function(){
        return AJS.Meta.get("setup-chosen-bundle-name");
    };

    /**
     * @returns {boolean} whether any additional bundle has been chosen
     */
    Util.prototype.isBundleChosen = function(){
        var productBundle = this.getChosenBundle();

        return productBundle in productBundleKeys;
    };

    /**
     * Return previously generated bundle license, requires calling generateBundleEvaluationLicense().
     *
     * @returns {String|undefined} bundle evaluation license
     */
    Util.prototype.getBundleLicense = function(){
        return this._bundleLicense;
    };

    /**
     * Return previously generated license, requires calling generateEvaluationLicense().
     *
     * @returns {String|undefined} JIRA evaluation license
     */
    Util.prototype.getJiraLicense = function(){
        return this._jiraLicense;
    };

    /**
     * Return data of currently logged in user.
     *
     * @returns {Object} an object containing email, fullname and password
     */
    Util.prototype.getUserData = function(){
        return this._userData;
    };

    // maps AID error messages to soy templates rendering error messages
    var errorMessages = {
        "Login is not possible as your email address is not verified yet.": "accountNeedsVerificationMessage",
        "You will be temporarily blocked for five minutes due to excessive login attempts.": "accountBlockedMessage",
        "The email address or password you entered is incorrect.": "credentialsIncorrect"
    };

    Util.prototype.transformAIDErrorMessage = function (aidMessage) {
        if (aidMessage in errorMessages) {
            var messageTemplateName = errorMessages[aidMessage];
            // messages are defined in setup-layout.soy
            var messageTemplate = JIRA.Templates.Setup[messageTemplateName];

            return typeof(messageTemplate) === 'function' ? new soydata.SanitizedHtml(messageTemplate()) : aidMessage;
        }
        else {
            return aidMessage;
        }
    };

    Util.prototype.isUserAlreadyExistsErrorMessage = function(message){
        return message === "A user with that email already exists";
    };

    Util.prototype.isEmailNotVerifiedErrorMessage = function(message){
        return message === "Login is not possible as your email address is not verified yet."
    };

    // http://www.w3.org/TR/html5/forms.html#valid-e-mail-address
    // without &
    var emailRegex = /^[a-zA-Z0-9.!#$%'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

    Util.prototype.validateEmail = function (email) {
        if (email.length > 255) {
            return false;
        }
        return emailRegex.test(email);
    }

    return Util;
});