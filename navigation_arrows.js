  var top_arrow    = $("a[href='#top']");
  var bottom_arrow = $("a[href='#bottom']");

  $(top_arrow).click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });

  $(bottom_arrow).click(function() {
    $("html, body").animate({ scrollTop: $(document).height() }, "slow");
    return false;
  });

  $(window).scroll(function () {
    var windowpos = $(window).scrollTop();
    var visible_border = $(window).height() * 1.5;

    // console.log(windowpos);

    if ($(top_arrow).is(':visible')) {
      if (windowpos < visible_border) {
        $(top_arrow).fadeOut("slow");
      }
    } else {
      if (windowpos >= visible_border) {
        $(top_arrow).fadeIn("slow");
      }
    }

    if ( $(bottom_arrow).is(':visible') ) {
      if( ($(document).height() - windowpos) < visible_border ) {
        $(bottom_arrow).fadeOut("slow");
      }
    } else {
      if( ($(document).height() - windowpos) >= visible_border ) {
        $(bottom_arrow).fadeIn("slow");
      }
    }
  });
