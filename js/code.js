$( function() {
    // Window close
    $('.closebox-link').on("click", function () { $(this).parents('div.window').hide(); });
    // Window shrink
    $('.maxbox-link').on("click", function () { $(this).parents('div.window').find('div.windowcontent').slideToggle(); });
} );