
$.alm.classes.delegate.trigger = {
    selector : '.trigger',
    event : 'click',
    callBack: function() {
        var local = $(this);
        eval('$("'+local.attr('target')+'").'+local.attr('action')+'()');
    }
};

$.alm.classes.live.visibleclick = {
    selector : '.visibleclick',
    callBack: function() {
        $(this).one('inview', function (event, visible) {
            if (visible) {
                $(this).click();
            }
        });        
    }
};

$.alm.classes.live.postLink = {
    selector : '.nohijackLinks a',
    callBack: function() {
        $(this).addClass('nohijack');
    }
}

$.alm.classes.live.GInlineEditable = {
    selector : '.GInlineEditable',
    callBack: function() {
        var local = $(this);
        local.editable(local.data('url'), {
            type : local.data('type'),
            name : 'value',
            value: local.data('value'),
            onblur: 'ignore',
            submit    : 'Ok',
            cancel    : 'Cancel',
            width: 'none',
            height: 'none',
            submitdata : {
                name: local.data('name'),
                pk: local.data('pk')
            }
        });
    }
};

$.alm.classes.live.reorder = {
    selector : '.reorder',
    callBack: function() {
        $(this).sortable({
            forcePlaceholderSize: true,
            forceHelperSize: true,
            items: 'tr',
            stop: function(event, ui) {
                // event.toElement is the element that was responsible
                // for triggering this event. The handle, in case of a draggable.
                $( event.toElement ).one('click', function(e){
                    e.stopImmediatePropagation();
                } );
            },
            update : function () {
                serial = $(this).sortable('serialize', {
                    key: 'items[]', 
                    attribute: 'class'
                });
                console.log($(this));
                
                $.ajax({
                    'url': $(this).data('reorder-url'),
                    'type': 'post',
                    'data': serial,
                    'success': function(data){
                        $().processQueue(data, $.alm.defaultTarget);
                    },
                    'error': function(request, status, error){
                        alert('We are unable to set the sort order at this time.  Please try again in a few minutes.');
                    }
                });
            }
        });
    }
}

$.alm.classes.live.jsonEditor = {
    selector : '.jsonEditor',
    callBack: function() {
        var local = $(this);
        editor = new jsoneditor.JSONEditor(this, {
            mode:'tree'
        },local.data('json'));
        submit = $("<a class='Submit', href='javascript:'>Submit</a>");
        submit.click(function() {
            local.next().attr('value',JSON.stringify(editor.get()));
            local.parent().submit()
        });
        copy = $("<a class='copy', href='javascript:'>Copy</a>");
        copy.click(function() {
            text = JSON.stringify(editor.get());
            $(this).next().text(text).toggle(300).selectText();
        });
        paste = $("<a class='paste', href='javascript:'>Paste</a>");
        paste.click(function() {
            text = JSON.stringify(editor.get());
            paste = window.prompt("Paste from clipboard: Ctrl+V, Enter", text);
            editor.set(JSON.parse(paste));
        });
        local.append(copy);
        local.append('<div style="display:none; position:absolute">');
        local.append(paste);
        local.append(submit);
    }
};

$.alm.classes.delegate.tabs = {
    selector : '.nav-tabs li',
    event : 'click',
    callBack : function() {
        $(this).parent().find('li').removeClass('active');
        $(this).addClass('active');
    }
}

$.alm.classes.live.errorElement = {
    selector : '.errorElement',
    callBack: function() {
        var $this = $(this);
        var url = $this.data('href');
        
        $this.append('<div class="errorlink"><div class="glyphicon glyphicon-exclamation-sign errorlinkinner">'+$this.data('errorlinktext')+'</div></div>');
    }
};
$.alm.classes.delegate.dialog = {
    selector : '.dialog',
    event : 'click',
    callBack: function(e) {
        var target = $($(this).data('target'));
        var winW = $(window).width() - 180;
        var winH = $(window).height() - 180;

        target.dialog({
            height: winH,
            width: winW,
            modal: true,
            move:false,
            resizable: false,
            draggable: false,
            close: function () {
                $(this).dialog('destroy');
            }
        }).dialog('open').scrollTop("0");
    }
};

$.alm.classes.live.dialogLink = {
    selector : '.dialogLink',
    callBack: function() {
        $(this).click(function(event) {
            event.stopPropagation();
            event.preventDefault();
            var local = $(this);
            var targlink = local.attr('href');
            var options = {};
            options.width = local.data('width');
            options.height = local.data('height');
            options.modal = local.data('modal');
            local.showUrlInDialog(targlink, options);
        });
    }
};


$.alm.classes.live.onclick = {
    selector : '.onclick',
    callBack: function() {
        var local = $(this).remove();
        $(local.attr('target')).click(eval($.trim(decodeURIComponent(local.text()))));
    }
};

$.alm.classes.delegate.submissionClick = {
    selector: "[type=submit]",
    event: 'click',
    callBack: function() {
        $(this).attr("was_clicked_to_submit","YES");
    }
}
$.alm.classes.delegate.slideClick = {
    selector : '.slideClick',
    event : 'click',
    callBack: function() {
        var local = $(this);
        var target = $(local.attr('target'));
        if(target.is(":visible")) {
            local.addClass('sliderClosed');
            local.removeClass('sliderOpen');
        }
        else {
            local.addClass('sliderOpen');
            local.removeClass('sliderClosed');
        }
        target.toggle('500');
    }
};

$.alm.classes.delegate.nextClick = {
    selector : '.folderHeader, .GFileGroupHeader',
    event : 'click',
    callBack: function() {
        var local = $(this);
        var target = local.next();
        if(target.is(":visible")) {
            local.addClass('sliderClosed');
            local.removeClass('sliderOpen');
        }
        else {
            local.addClass('sliderOpen');
            local.removeClass('sliderClosed');
        }
        target.toggle('500');
    }
};

$.alm.classes.live.scrollto = {
    selector : '.scrollto',
    callBack : function(event) {
        var local = $(this).remove();
        var pos = jQuery(local.attr('target')).offset().top;
        jQuery('html, body').animate(pos, 'slow');
    }
};

$.alm.classes.delegate.load = {
    selector : '.load',
    callBack :function(event) {
        $(this).load($(this).attr("href"));
    }
};

$.alm.classes.live.hideInJava = {
    selector : '.hideInJava',
    callBack : function() {
        $(this).hide();
    }
};

$.alm.classes.live.sortable = {
    selector : '.sortable',
    callBack: function() {
        $(this).sortable();
    }
};

$.alm.classes.live.browserWarning = {
    selector : '.GBrowserWarning',
    callBack: function() {
        if($.alm.isIE)
            $(this).show();
    }
};
