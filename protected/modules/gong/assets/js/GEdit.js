$.alm.classes.live.sortable = {
    selector : '.sortable',
    //event : 'click',
    callBack : function(event) {
        $(this).sortable();
    }
};

$.alm.classes.delegate.globalSort = {
    selector : '.globalSort',
    event : 'click',
    callBack :function(event) {
        var widgets = $($(this).attr('target'));
        if(!$(this).hasClass('enabled')) {
            $(this).addClass('enabled');
            widgets.each(function() {
                $(this).addClass('sorting');
                $(this).sortable({
                    containment: $(this),
                    items: '> :not(.dontsort)'
                });
           
            });
        } else {
            $(this).removeClass('enabled');
            $('.sortForm').remove('.weightField');
            widgets.sortable('disable');
            widgets.each(function() {
                $(this).removeClass('sorting');
                var children = $(this).children('.widget');
                var x = 0;
                children.each(function() {
                    var widgetEdit = $($(this).attr('target'));
                    var widgetForm = widgetEdit.find('form');
                    var weightField = widgetForm.children('.weightField');
                    weightField.attr('value', x++);
                    $('.sortForm').append($("<div />").append($(weightField).clone()).html());
                });
            });
            $('.sortForm .returnUrl').attr('value', window.location.href.toString().split(window.location.host)[1].replace('#', ''));
            $('.sortForm').submit();
        }
    }
};

$.alm.classes.delegate.globalEdit = {
    selector : '.globalEdit',
    event : 'click',
    callBack :function(event) {
        $($(this).data('target')).toggleClass('editing');
    }
};

$.alm.classes.live.editable = {
    selector : '.editable',
    callBack : function(event) {
        $(this).click(function(event) {
            $this = $(this);
            if($this.hasClass('editing')) {
                event.stopPropagation();
                event.preventDefault();
                showUrlInDialog($this.data('edit-url'), {
                    modal:true, 
                    title:'Edit Widget'
                });
                $('.editing').removeClass('editing');
            }
        }
        );
    }
};

function initWysiwyg(dialog) {
    dialog.find('.wysihtml5').each(function() {
        var target = this;
        var editor = new wysihtml5.Editor(target, { // id of textarea element
            toolbar: $(target).data('target'),
            parserRules:    {
                classes: {
                    // (path_to_project/lib/css/wysiwyg-color.css)
                    "wysiwyg-color-silver" : 1,
                    "wysiwyg-color-gray" : 1,
                    "wysiwyg-color-white" : 1,
                    "wysiwyg-color-maroon" : 1,
                    "wysiwyg-color-red" : 1,
                    "wysiwyg-color-purple" : 1,
                    "wysiwyg-color-fuchsia" : 1,
                    "wysiwyg-color-green" : 1,
                    "wysiwyg-color-lime" : 1,
                    "wysiwyg-color-olive" : 1,
                    "wysiwyg-color-yellow" : 1,
                    "wysiwyg-color-navy" : 1,
                    "wysiwyg-color-blue" : 1,
                    "wysiwyg-color-teal" : 1,
                    "wysiwyg-color-aqua" : 1,
                    "wysiwyg-color-orange" : 1
                },
                tags: {
                    "b":  {},
                    "i":  {},
                    "br": {},
                    "ol": {},
                    "ul": {},
                    "li": {},
                    "h1": {},
                    "h2": {},
                    "h3": {},
                    "blockquote": {},
                    "u": 1,
                    "img": {
                        "check_attributes": {
                            "width": "numbers",
                            "alt": "alt",
                            "src": "url",
                            "height": "numbers"
                        }
                    },
                    "a":  {
                        set_attributes: {
                            target: "_blank",
                            rel:    "nofollow"
                        },
                        check_attributes: {
                            href:   "url" // important to avoid XSS
                        }
                    },
                    "span": 1,
                    "div": 1
                }
            }
        });
        editor.observe("load", function() {
            $(target).data("editor", editor);
        });
    });
}

$.alm.classes.live.editableHover = {
    selector : '.widgetEdit',
    callBack : function(event) {
        $($(this).data('target')).hover(function(event) {
            if($(this).hasClass('editing')) {
                event.preventDefault();
                if( event.type === 'mouseenter' )  
                    $(this).addClass('hover');
                else
                    $(this).removeClass('hover');
            }
            
        }
        );
    }
};
