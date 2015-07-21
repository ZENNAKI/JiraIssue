define('jira/ajs/select/scrollable-single-select', [
    'jira/ajs/select/single-select',
    'jira/ajs/layer/inline-layer-factory',
    'jira/ajs/list/pageable-list',
    'jquery',
    'underscore'
], function(
    SingleSelect,
    InlineLayerFactory,
    PageableList,
    jQuery,
    _
) {
    /**
     * A SingleSelect that implements infinite scroll - it renders more pages of records as user scrolls down the dropdown.
     * In case of suggestions fetched by AJAX requests - rendering next page of results will not trigger another request,
     * only previously fetched results will be paginated
     *
     * @class ScrollableSingleSelect
     * @extends SingleSelect
     */
    return SingleSelect.extend({
        init: function(options) {
            var defaults = {
                newResultsThreshold: 90
            };

            options = jQuery.extend(true, defaults, options);
            this._super(options);

            this.newResultsThreshold = options.newResultsThreshold;
        },

        _assignEventsToFurniture: function () {
            var instance = this,
                promise;
            this._super();

            this.dropdownController.$layer.on('scroll', function() {
                if (this.scrollTop * 100/instance.newResultsThreshold > this.scrollHeight - this.clientHeight) {
                    if (!promise || promise.isResolved()) {
                        promise = instance._fetchNewContent().fail(function(e) {
                            instance.listController.showPageRenderError();
                            //clear promise on dropdown refresh
                            instance.model.$element.one('suggestionsRefreshed',function() {
                                promise = undefined;
                            });
                        });
                    }
                }
            });
        },

        _createListController: function() {
            var instance = this;
            this.listController = new PageableList({
                containerSelector: jQuery(".aui-list", this.$container),
                groupSelector: "ul.aui-list-section",
                matchingStrategy: this.options.matchingStrategy,
                pageSize: this.options.pageSize,
                pagingThreshold: this.options.pagingThreshold,
                matchItemText: this.options.matchItemText,
                hasLinks: this.options.hasLinks,
                selectionHandler: function (e) {
                    var selectedSuggestion = this.getFocused(),
                        selectedDescriptor = selectedSuggestion.data("descriptor");

                    instance.setSelection(selectedDescriptor);
                    instance.$field.select();

                    e.preventDefault();
                    return false;
                }
            });
        },

        /**
         * Internal method used to trigger adding next page of records to dropdown
         *
         * @returns {jQuery.Deferred}
         * @private
         */
        _fetchNewContent: function() {
            var promise = jQuery.Deferred();
            _.defer(function() {
                try {
                    this.listController.addNextPage();
                    promise.resolve();
                }
                catch(error) {
                    promise.reject(error);
                }
            }.bind(this));
            return promise;
        }
    })

});