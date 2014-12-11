String.prototype.startsWith = function(needle)
    {
        return(this.indexOf(needle) == 0);
    }

$.fn.selectText = function(){

    var range,
        selection,
        obj = this[0],
        type = {
            func:'function',
            obj:'object'
        },
        // Convenience
        is = function(type, o){
            return typeof o === type;
        };

    if(is(type.obj, obj.ownerDocument)
        && is(type.obj, obj.ownerDocument.defaultView)
        && is(type.func, obj.ownerDocument.defaultView.getSelection)){

        selection = obj.ownerDocument.defaultView.getSelection();

        if(is(type.func, selection.setBaseAndExtent)){
            // Chrome, Safari - nice and easy
            selection.setBaseAndExtent(obj, 0, obj, $(obj).contents().size());
        }
        else if(is(type.func, obj.ownerDocument.createRange)){

            range = obj.ownerDocument.createRange();

            if(is(type.func, range.selectNodefs)
                && is(type.func, selection.removeAllRanges)
                && is(type.func, selection.addRange)){
                // Mozilla
                range.selectNodeContents(obj);
                selection.removeAllRanges();
                selection.addRange(range);
            }
        }
    }
    else if(is(type.obj, document.body) && is(type.obj, document.body.createTextRange)) {

        range = document.body.createTextRange();

        if(is(type.obj, range.moveToElementText) && is(type.obj, range.select)){
            // IE most likely
            range.moveToElementText(obj);
            range.select();
        }
    }

    // Chainable
    return this;
}

function processQueue(origInput, target, append) {
    input = $("<div></div>");
    var updateCount = 0;
   
    input.append(origInput);
    input.store($.alm.classes.processing, $.alm.processing);
    input.store($.alm.classes.processingReady, $.alm.processingReady);
    input.store($.alm.classes.processingEnd, $.alm.processingEnd);
    input.store($.alm.classes.liveHead, $.alm.liveHead);

    $.alm.processing.liveClasses($.alm.classes.processing);
    
    $.alm.processing.contents().filter( function() {
        return $.trim($("<div />").append($(this).clone())) == '';
    }).remove();

    $.alm.liveHead.liveClasses($.alm.classes.liveHead);
    if(input.html() && input.html().trim().length > 0) {
        if(!append) target.empty();
        content = input.contents();
        content.appendTo(target);
        content.liveClasses($.alm.classes.live);
        $.alm.processingEnd.liveClasses($.alm.classes.processingEnd);
    }
    $.alm.processingReady.liveClasses($.alm.classes.processingReady);
    $('.Loading').fadeOut(300);
    $('.Saving').fadeOut(300);
}

function showUrlInDialog(url, options){
    options = options || {};
    var tag = $("<div></div>"); //This tag will the hold the dialog content.
    $.ajax({
        url: url,
        type: (options.type || 'GET'),
        beforeSend: options.beforeSend,
        error: options.error,
        complete: options.complete,
        cache: true,
        ifModified: true,
        success: function(data, textStatus, jqXHR) {
            processQueue(data, tag);
            tag.dialog({
                modal: options.modal, 
                title: options.title,
                width: options.width || 760,
                height: options.height || 480,
                close: function () {
                    $(this).dialog('destroy');
                    $(this).remove();
                }
            }).dialog('open');
            $.isFunction(options.success) && (options.success)(data, textStatus, jqXHR);
        }
    });
}


function getPath(url) {
    var a = document.createElement('a');
    a.href = url;
    return a.pathname.substr(0,1) === '/' ? a.pathname : '/' + a.pathname;
}

$.alm.classes.delegate.link = {
    selector : 'a:not(.nohijack)',
    event : 'click',
    callBack: function (event) {
        $this = $(this);
        var type = $this.data('type');
        var target = null;
        if($this.attr('href').startsWith('javascript:')) return true;
        event.preventDefault();
        if($this.attr('href') == '#') return true;
        if(!$this.hasClass('targetlink')) {
            href = $this.attr('href');
            url = '#'+getPath(href).substring(1);
        } else {
            href = $this.data('href');
            url = '#'+getPath(href).substring(1);
            target = $($this.attr('href'));
            console.log(target);
            console.log($this.attr('href'));
            //$.alm.defaultTarget.empty();
        }
        if(!$this.hasClass('targetlink')) {
            if($this.is('[data-toggle="tab"]')) {
                return true;
            }
        }
        if($this.hasClass('prompt')) {
            var buttons = {};
            var label = $this.data('confirm-button-label');
            if(!label) label = 'Confirm';
            var cancelLabel = $this.data('cancel-button-label');
            if(!cancelLabel) cancelLabel = 'Cancel';
            buttons[label] = function() {
                if(!$this.hasClass('nohash')) {
                    $.alm.updateState('#'+url.toString().substring(1));
                }
                $.alm.load(event, target, type, url, $this.hasClass('appendToTarget'));
                $( this ).dialog( "close" );
                $(this).remove();
            };
            buttons[cancelLabel] = function() {
                $( this ).dialog( "close" );
            };
            var message = $this.data('message');
            if(!message) message = 'Are you sure?';
            $('<div>'+message+'</div>').dialog({
                modal: true,
                height: 'auto',
                width: 'auto',
                buttons: buttons,
                open: function() {
                    $('.ui-dialog :button').blur();
                }
            });
        } else {
            if(!$this.hasClass('nohash')) {
                $.alm.updateState('#'+url.toString().substring(1));
            }
            $.alm.load(event, target, type, url, $this.hasClass('appendToTarget'));
        }
    }
}
$.alm.classes.live.submitForm = {
    selector : 'form',
    callBack: function() {
        var local = $(this);
        if(local.hasClass('targetForm'))  {
            var target = local.data('target');
            local.submit(function(event) {
                local.submitForm(event, $(target));
            });
        }
        else {
            local.submit(function(event) {
                local.submitForm(event, $.alm.defaultTarget);
            });
        }
    }
};

$.alm.hashchange = function (event) {
    $.alm.load(event);
}

$.alm.load = function (event, target, type, url, append) {
    firstUrl = false;
    if(type == null) type="GET";
    if(target == null) target = $.alm.defaultTarget;
    if(url == null) url = window.location.toString();
    if($.alm.lastUrl == url) return;
    if(event) event.preventDefault();

    var hash = url.toString().split('#')[1];

    if (hash) {
        url = '/'+hash;
    }
    if(url) {
        $('.urlListener').trigger("changed", [url]);
        if($('.dirtyField')[0])
            $('<div>This section has been modified and is not yet submitted</div>').dialog({
                modal: true,
                height: 'auto',
                width: 'auto',
                buttons: {
                    "Lose progress": function() {
                        $('.Loading').fadeIn(300);
                        $.ajax({
                            type: type,
                            url: url,
                            cache: true,
                            ifModified: true,
                            success: function(input) {
                                processQueue(input, target, append);
                            }
                        });
                        $( this ).dialog( "close" );
                    },
                    Cancel: function() {
                        $( this ).dialog( "close" );
                    }
                }
            });
        else {
            $('.Loading').fadeIn(300);
            $.ajax({
                type: type,
                url: url,
                cache: true,
                ifModified: true,
                success: function(input) {
                    processQueue(input, target, append);
                }
            });
        }
    }
}

/* this makes bootstrap toggles work with or without hijacker */
$.alm.classes.live.checkbutton = {
    selector : "[data-toggle='button']",
    callBack: function (event) {
        $this = $(this);
        console.log('toggle');
        checkbox = $("<input type='checkbox' style='display:none' name="+$this.attr('name')+" value="+$this.attr('value')+">");
        $this.attr('name', $this.attr('name')+'-button');

        form = $(this).closest('form');
        form.append(checkbox);

        $this.click(function() {
            if($(this).hasClass('active')) {
                checkbox.prop('checked', false);
            } else {
                checkbox.prop('checked', true);
            }
        }); 
   }
}
function submitForm(event, target) {
    if(target == null) target = $.alm.defaultTarget;
    var form = $(this);
    if (!jQuery.fn.ajaxForm || form.hasClass('nohijack')) {
        return this;
    }
    event.preventDefault();
    var params = {};
    $('.Saving').fadeIn(300);

    form.find("input[type='submit'][was_clicked_to_submit=YES]").each(function() {
        form.append('<input type="hidden" name="'+(this.name || this.id || this.parentNode.name || this.parentNode.id)+'" value="'+this.value+'"/>');
    });
    var formData = new FormData(form[0]);
    $.ajax({
        type: form.attr("method"),
        url: form.attr("action"),
        data: formData,
        datatype:'json',
        cache: false,
        ifModified: true,
        success: function(input) {
            processQueue(input, target);
        },
        contentType: false,
        processData: false
    });
    return false;
}

$.alm.updateState  = function (state) {
    var win = $(window);

    function temporaryHandler() {
        win.unbind('hashchange', temporaryHandler);
        win.bind('hashchange', $.alm.hashchange);
    //console.log('rebound hashchange handler');
    };

    if($._data(window, "events")['load'][0]['handler']['name'] != "temporaryHandler") {
        win.unbind('hashchange', $.alm.hashchange);
        win.bind('hashchange', temporaryHandler);
    //console.log('unbound hashchange handler');
    }
    window.location.hash = state;
}

function liveClasses(classes) {
    for(var name in classes) {
        var c=classes[name];
        this.filter(c.selector).add(this.find(c.selector)).each(function() {
            c.callBack.call(this);
        });
    }
    return this;
}

function store(classes, store) {
    for(var name in classes) {
        var c=classes[name];
        this.filter(c.selector).add(this.find(c.selector)).each(function() {
            store.append(this);
        });
        this.filter(c.selector).add(this.find(c.selector)).remove();
        
    }
    return this;
}

function delegate(classes) {
    for(var name in classes) {
        var c=classes[name];
        $("body").delegate(c.selector, c.event, c.callBack);
    }
}
function clearForm(form) {
    // iterate over all of the inputs for the form
    // element that was passed in
    $(':input', form).each(function() {
        var type = this.type;
        var tag = this.tagName.toLowerCase(); // normalize case
        // it's ok to reset the value attr of text inputs,
        // password inputs, and textareas
        if (type == 'text' || type == 'password' || tag == 'textarea')
            this.value = "";
        // checkboxes and radios need to have their checked state cleared
        // but should *not* have their 'value' changed
        else if (type == 'checkbox' || type == 'radio')
            this.checked = false;
        // select elements need to have their 'selectedIndex' property set to -1
        // (this works for both single and multiple select elements)
        else if (tag == 'select')
            this.selectedIndex = -1;
    });
};
(function($){
    if(!$.alm.run) {
        $.fn.submitForm = submitForm;
        $.fn.liveClasses = liveClasses;
        $.fn.store = store;
        $.fn.processQueue = processQueue;
        $.fn.clearForm = clearForm;
        $.fn.showUrlInDialog = showUrlInDialog;
        $.alm.defaultTarget = $(".content");

        $(function(){
            /*window.onerror = function (err, file, line) {
                console.log('The following error occured: ' + err + '\n' +
                    'In file: ' + file + '\n' +
                    'At line: ' + line);
                return true;
            }*/
            $(document).ajaxError(function(event, request, settings) {
                processQueue(request.responseText, $.alm.defaultTarget);
            });
            $(window).hashchange( $.alm.hashchange );

            var hash = window.location.toString().split('#')[1];

            if (hash) {
                $.alm.load();
            }
        
            $.alm.processing = $("#processing");
            $.alm.processingReady = $("#processingReady");
            $.alm.processingEnd = $("#processingEnd");
            $.alm.liveHead = $("#liveHead");
            body = $('body');
            
            //body.store($.alm.classes.liveHead, liveHead);
            body.liveClasses($.alm.classes.liveHead);

            //body.store($.alm.classes.processing, processing);
            body.liveClasses($.alm.classes.processing);

            //body.store($.alm.classes.processingReady, processingReady);
            //body.liveClasses($.alm.classes.processingReady);

            //body.store($.alm.classes.processingEnd, processingEnd);
            body.liveClasses($.alm.classes.processingEnd);

            body.liveClasses($.alm.classes.live);
   
            delegate($.alm.classes.delegate);
        });
    }
    $.alm.run=1;
    
})(jQuery);

$.alm.isDone = function() {
    var done = 1;
    $.each($.alm.done, function(index, value) {
        if(value == 0) {
            done = 0;
        }
    });
    return done;
}
//used for lazy loading css files
$.alm.LazyLoader = function(files, callback){

    var filesToLoad = 0,
    file,
    obj,
    newStylesheetIndex = document.styleSheets.length-1;
  
    for (index in files) {

        filesToLoad++;
    
        var file = files[index];
    
        if(getFileType(file)=='css') {
            appendStylesheet(file);
            newStylesheetIndex++;
            if(!window.opera && navigator.userAgent.indexOf("MSIE") == -1)
                callCallbackForStylesheet(newStylesheetIndex);
        }
    
        if(getFileType(file)=='js') {
            appendScriptAndCallCallback(file);
        }
 
    }
  
    function getFileType(file) {
        file = file.toLowerCase()
  
        var jsIndex = file.indexOf('js'),
        cssIndex = file.indexOf('css');
    
        if(jsIndex==-1 && cssIndex==-1)
            return false;
    
        if(jsIndex > cssIndex)
            return 'js';
        else
            return 'css';
    }
  
    function appendStylesheet(url) {
        var oLink = document.createElement("link")
        oLink.href = url;
        oLink.rel = "stylesheet";
        oLink.type = "text/css";
        oLink.onload = decrementAndCallGlobalCallback;
        oLink.onreadystatechange= function () {
            if(this.readyState == 'loaded' || this.readyState == 'complete') decrementAndCallGlobalCallback();
        }
        document.getElementsByTagName("head")[0].appendChild(oLink);
    }
  
    function callCallbackForStylesheet(index) {

        try {
            if (document.styleSheets[index].cssRules) {
                decrementAndCallGlobalCallback();
            } else {
                if (document.styleSheets[index].rules && document.styleSheets[index].rules.length) {
                    decrementAndCallGlobalCallback();
                } else {
                    setTimeout(function() {
                        callCallbackForStylesheet(index);
                    }, 250);
                }
            }
        }
        catch(e) {
            setTimeout(function() {
                callCallbackForStylesheet(index);
            }, 250);
        }

    }
  
    function appendScriptAndCallCallback(url) {
        var oScript = document.createElement('script');
        oScript.type = 'text/javascript';
        oScript.src = url;
        oScript.onload = decrementAndCallGlobalCallback;
        document.getElementsByTagName("head")[0].appendChild(oScript);
    }

    function decrementAndCallGlobalCallback() {
        filesToLoad--;

        if(filesToLoad == 0)
            callback();
    }
};

/**
 * used to find out if an element is in view
 * url http://remysharp.com/2009/01/26/element-in-view-event-plugin/
 */
(function ($) {
    function getViewportHeight() {
        var height = window.innerHeight; // Safari, Opera
        var mode = document.compatMode;

        if ( (mode || !$.support.boxModel) ) { // IE, Gecko
            height = (mode == 'CSS1Compat') ?
            document.documentElement.clientHeight : // Standards
            document.body.clientHeight; // Quirks
        }

        return height;
    }

    $(window).scroll(function () {
        var vpH = getViewportHeight(),
        scrolltop = (document.documentElement.scrollTop ?
            document.documentElement.scrollTop :
            document.body.scrollTop),
        elems = [];
        
        // naughty, but this is how it knows which elements to check for
        $.each($.cache, function () {
            if (this.events && this.events.inview) {
                elems.push(this.handle.elem);
            }
        });

        if (elems.length) {
            $(elems).each(function () {
                var $el = $(this),
                top = $el.offset().top,
                height = $el.height(),
                inview = $el.data('inview') || false;

                if (scrolltop > (top + height) || scrolltop + vpH < top) {
                    if (inview) {
                        $el.data('inview', false);
                        $el.trigger('inview', [ false ]);                        
                    }
                } else if (scrolltop < (top + height)) {
                    if (!inview) {
                        $el.data('inview', true);
                        $el.trigger('inview', [ true ]);
                    }
                }
            });
        }
    });
    
    // kick the event to pick up any elements already in view.
    // note however, this only works if the plugin is included after the elements are bound to 'inview'
    $(function () {
        $(window).scroll();
    });
})(jQuery);
