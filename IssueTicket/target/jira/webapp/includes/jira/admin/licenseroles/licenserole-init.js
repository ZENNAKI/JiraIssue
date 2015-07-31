;require(["jquery", "jira/admin/licenseroles/roleseditor"],
(function ($, LicenseRoles) {
    "use strict";

    $(function () {
        new LicenseRoles({
            el: "#license-roles"
        });
    });
}));