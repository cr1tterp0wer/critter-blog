"use strict"; // Start of use strict
document.addEventListener("turbolinks:load",function(){
  
  function homeScroll() {
     // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function(e) {
      e.preventDefault();

      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top)
        }, 1000, "easeInOutExpo");
        return false;
      }

    });

    // Closes responsive menu when a scroll trigger link is clicked
    $('.js-scroll-trigger').click(function() {
      $('.navbar-collapse').collapse('hide');
    });

    // Activate scrollspy to add active class to navbar items on scroll
    $('body').scrollspy({
      target: '#sideNav'
    });

    //Contact-Form Ajax callback
    $(".contact-form").on("ajax:success", function(event){
      let data = event.detail
      let message = "";

      $("#errors").remove();
      $("#notice").remove();

      if( data[0].status == "failure"){

        data[0].message.forEach(function(e,i){
          message += e;
        });
        $('<p id="errors">'+message+'</p>')
          .insertBefore('section#contact')
          .delay(3000).fadeOut('slow')
      }else{
        $('.contact-form input').val('')
        $('.contact-form textarea').val('')

        message =  "Thank you, Your Message has been sent."
        $('<p id="notice">'+message+'<p>')
          .insertBefore('section#contact')
          .delay(3000).fadeOut('slow')
      }
    }).on("ajax:error", function(event){ 
        alert('error')
        $("#notice").append("<p>ERROR</p>")
       });
  }

  homeScroll();
});
