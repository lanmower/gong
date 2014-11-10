(function($) {
$.editable.addInputType('editor', {
    element : function(settings, original) {
        var textarea = $('<textarea class="editor">');
        $(this).append(textarea);
        return(textarea);
    },
    content : function(string, settings, original) { 
        /* jWYSIWYG plugin uses .text() instead of .val()        */
        /* For some reason it did not work work with generated   */
        /* textareas so I am forcing the value here with .text() */
        $('.editor', this).text(string);
    },
    plugin : function(settings, original) {
        settings.onblur = 'ignore';
        var self = this;
        if (settings.editor) {
            $('.editor', self).wysihtml5(settings.editor);
        } else {
            $('.editor', self).wysihtml5();
        }
    },
    submit : function(settings, original) {
        
    }
});
})(jQuery);