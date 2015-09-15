// For Search Icon Toggle effect added at the top
jQuery(document).ready(function () {
    jQuery(".search-top").click(function () {
        jQuery("#masthead .search-form-top").toggle();
    });
    jQuery(".search-form").submit(function(e){
        jQuery(".error", jQuery(this)).removeClass("error");

        if (!jQuery.trim(jQuery("input[name='query']", jQuery(this)).val())) {
            jQuery("input[name='query']", jQuery(this)).addClass('error');
            return false;
        }
    });
});

jQuery(document).ready(function () {
    jQuery("#scroll-up").hide();
    jQuery(function () {
        jQuery(window).scroll(function () {
            if (jQuery(this).scrollTop() > 1000) {
                jQuery('#scroll-up').fadeIn();
            } else {
                jQuery('#scroll-up').fadeOut();
            }
        });
        jQuery('a#scroll-up').click(function () {
            jQuery('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });
});