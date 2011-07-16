$(function () {

    $(".refresh_all a").click(function() {
        $(".refresh a").each(function (index, link) { refresh(link) });
    });

    $(".refresh a").click(function() {
        refresh(this)
    });

});

// Refresh a feed:
// * add 'refreshing' class to link to display animated icon
// * post a request to /feeds/:id/refresh for async update
// * call poll_for_update() to start waiting for response.
function refresh(link) {
    $(link).addClass('refreshing')
    $.post(refresh_path(link))  // should check for error here...
    poll_for_update(link)
}

// Perform a get /feeds/:id once every second as long as the return
// status is 304.  When the return status is 200, insert the response
// text.
function poll_for_update(link) {
    var feed_id = $(link).attr('feed_id')
    var last_modified = $(link).attr('last_modified')
    setTimeout(function() {
        $.ajax({
            url: show_path(link),
            type: 'get',
            headers: { 'If-Modified-Since': last_modified },
            complete: function( transport ) {
                blather(" transport.status = " + transport.status);
                if (transport.status == 304) {
                    poll_for_update(link)
                } else if (transport.status == 200) {
                    $('#feed_' + feed_id).html(transport.responseText)
                } else {
                    $(link).html('error ' + transport.status)
                }
            }
        });
    }, 1000)
}

function refresh_path(link) {
    return '/feeds/' + $(link).attr('feed_id') + '/refresh'
}

function show_path(link) {
    return '/feeds/' + $(link).attr('feed_id')
}

function blather(string) {
    if (console && console.log) {
        console.log(string)
    } else {
        alert(string)
    }
}

