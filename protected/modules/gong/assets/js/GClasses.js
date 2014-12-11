if(!$.alm) $.alm = {};
if(!$.alm.classes) $.alm.classes = {};
if(!$.alm.classes.live) $.alm.classes.live = {};
if(!$.alm.classes.liveHead) $.alm.classes.liveHead = {};
if(!$.alm.classes.delegate) $.alm.classes.delegate = {};
if(!$.alm.classes.processing) $.alm.classes.processing = {};
if(!$.alm.classes.processingReady) $.alm.classes.processingReady = {};
if(!$.alm.classes.processingEnd) $.alm.classes.processingEnd = {};
if(!$.alm.called) $.alm.called = [];
if(!$.alm.done) $.alm.done = {};
if(!$.alm.loaded) $.alm.loaded = 0;

$.expr[':'].childof = function(obj, index, meta, stack){
    return $(obj).parent().is(meta[3]);
};


$.alm.classes.processing.append = {
    selector : '.append',
    callBack: function() {
        var task = $(this).remove();
        var target = $(task.attr('target'));
        task.contents().appendTo(target).liveClasses($.alm.classes.live);
    }
};

$.alm.classes.processing.hashChange = {
    selector : '.hashChange',
    callBack: function() {
        var task = $(this).remove();
        $.alm.updateState('#'+task.attr('target').substring(1));
    }
}

$.alm.classes.processing.replace = {
    selector : '.replace',
    callBack: function() {
        var contents = $(this).contents();
        var targetSelector = $(this).attr('target');
        $(this).remove();
        $(targetSelector).each(function() {
        	//$.fn.processQueue(contents.clone(), $(this), false);
            $(this).replaceWith(contents.clone())
            });
        $(targetSelector).liveClasses($.alm.classes.processing);
        $(targetSelector).liveClasses($.alm.classes.live);
        $(targetSelector).liveClasses($.alm.classes.liveHead);
        $(targetSelector).liveClasses($.alm.classes.processingEnd);
        $(targetSelector).liveClasses($.alm.classes.processingReady);
    }
};

/*$.alm.classes.processing.prepend = {
    selector : '.prepend',
    callBack: function() {
        task = $(this).remove();
        var target = $(task.attr('target'));
        task.contents().prependTo(target).liveClasses($.alm.classes.live);
    }
};*/
$.alm.classes.processing.remove = {
    selector : '.remove',
    callBack: function() {
        var task = $(this).remove();
        $(task.attr('target')).remove();
    }
};
$.alm.classes.processing.hide = {
    selector : '.hide',
    callBack: function() {
        var task = $(this).remove();
        $(task.attr('target')).hide();
    }
};
$.alm.classes.processing.show = {
    selector : '.show',
    callBack: function() {
        var task = $(this).remove();
        $(task.attr('target')).show();
    }
};

$.alm.classes.processing.closeRight = {
    selector : '.closeRight',
    callBack: function() {
        var task = $(this).remove();
        $('.rightContent').hide(300);
        if($('#right').css('width') == '770px') $('#right').animate({
            width:20, 
            marginLeft:930
        });
    }
};

$.alm.classes.processing.liveDialog = {
    selector : '.liveDialog',
    callBack: function() {
        var task = $(this).remove();
        var options = {};
        $(this).removeClass('liveDialog');
        var tag = $("<div></div>");
        tag.processQueue(task, tag);
        var winW = $(window).width() - 180;
        var winH = $(window).height() - 180;
        var dialogClass = task.data('dialogclass');
        if(dialogClass == null) dialogClass = 'gongDialog';
        tag.dialog({
            dialogClass: dialogClass,
            width: "auto",
            modal: true,
            move:false,
            resizable: false,
            draggable: false,
            close: function () {
                $(this).dialog('destroy');
                $(this).remove();
            }
        }).dialog('open');
    }
};
$.alm.classes.processing.log = {
    selector : '.log',
    callBack: function() {
        task = $(this).remove();
    }
};

jQuery.cachedScript = function(url, options) {
    options = $.extend(options || {}, {
        dataType: "script",
        cache: true,
        url: url,
        async: false
    });
    return jQuery.ajax(options);
};

$.alm.classes.liveHead.loadscriptHead = {
    selector : '.loadscriptHead',
    callBack: function() {
        var task = $(this).remove();
        var url = task.attr('url');
        if($.inArray(url, $.alm.called) != -1) return false;
        $.alm.called.push(url);
        $.cachedScript(task.attr('url')).done(function(script, textStatus) {
            });
        return true;
    }
};

$.alm.classes.liveHead.loadCSSHead = {
    selector : '.loadCSSHead',
    callBack: function() {
        var task = $(this).remove();
        var url = task.attr('url');
        if($.inArray(url, $.alm.called) != -1)  {
            return false;
        }
        $.alm.called.push(url);
        $.alm.done[url] = 0;
        $.alm.LazyLoader(Array(url), function () {
            $.alm.done[url] = 1;
            
        });
    }
};

$.alm.classes.liveHead.loadscriptBegin = {
    selector : '.loadscriptBegin',
    callBack: function() {
        var task = $(this).remove();
        var url = task.attr('url');
        if($.inArray(url, $.alm.called) != -1) return false;
        $.alm.called.push(url);
        $.cachedScript(task.attr('url')).done(function(script, textStatus) {
            });
        return true;
    }
};

$.alm.classes.liveHead.callBegin = {
    selector : '.callBegin',
    callBack: function() {
        var task = $(this).remove();
        $.alm.defaultTarget.append('<script>'+task.text()+'</script>');
    }
};

$.alm.classes.processingEnd.loadscriptEnd = {
    selector : '.loadscriptEnd',
    callBack: function() {
        var task = $(this).remove();
        var url = task.attr('url');
        if($.inArray(url, $.alm.called) != -1) return false;
        $.alm.called.push(url);
        
        $.cachedScript(task.attr('url')).done(function(script, textStatus) {
            });
        return true;
    }
};

$.alm.classes.live.callEnd = {
    selector : '.callEnd',
    callBack: function() {
        var task = $(this).remove();
        $.alm.defaultTarget.append('<script>'+task.text()+'</script>');
    }
};
$.alm.classes.live.callLoad = {
    selector : '.callLoad',
    callBack: function() {
        var task = $(this).remove();
        $.alm.defaultTarget.append('<script>'+task.text()+'</script>');
    }
};
$.alm.classes.processingReady.callReady = {
    selector : '.callReady, script',
    callBack: function() {
        var task = $(this).remove();
        try {
            $.alm.defaultTarget.append('<script>'+task.text()+'</script>');
        } catch (e) {
            console.error("Error in the following code:\n"+task.text());
            console.log(e.message);
        }
    }
};

