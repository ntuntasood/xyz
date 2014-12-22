var ready = function() {
    var p = $(location).attr('pathname');

    if (p == "/users")
        $('a[href="/users/sign_up"]').addClass('selected');

    $('a[href="' + p + '"]').addClass('selected');
    $('a[href="' + p.substring(1) + '"]').addClass('selected');
};

$(document).ready(ready);
$(document).on('page:load', ready);
