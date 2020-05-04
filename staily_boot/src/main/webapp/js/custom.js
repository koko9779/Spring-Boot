jQuery(function ($) {
	"use strict";

	// Headhesive
	var options = {
			offset: 600,
			classes: {
			clone:   'banner--clone',
			stick:   'banner--stick',
			unstick: 'banner--unstick'
		}
	};

	// Initialise with options
	var banner = new Headhesive('.navbar', options);

	// Bootstrap carousel
	$('.bs-carousel').carousel({
		interval: 10000,
		pause: "hover"
	});

	// Tabs
	if ($(".tabs").length > 0){
		$('.tabs').tabs();
		$('.tabs.movies').tabs({ active: 2 });
	}

	// Accordion
	if ($(".accordion").length > 0){
		$('.accordion').accordion();
	}

	// Venobox modal
	$('.venobox').venobox({
		autoplay: true
	});

	$('.social-share').on('click', 'a', function(event) {
		$(this).hide();
		$('.social-share .share').fadeIn('slow');
		$('.social-share .share a').fadeIn('slow');
		return false;
	});

	// Slick carousel
	$(window).on('load resize scroll', function(){  
		
		$('.newIn').not('.slick-initialized').slick({
			autoplay: false,
			autoplaySpeed: 3000,
			slidesToShow: 4,
			centerPadding: '60px',
			prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
			nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
			responsive: [
			    {
			      breakpoint: 768,
			      settings: {
			        slidesToShow: 2
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 1
			      }
			    }
			  ]
		});


		$('#comingSoon').not('.slick-initialized').slick({
			autoplay: false,
			slidesToShow: 6,
			centerPadding: '60px',
			prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
			nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
			responsive: [
			    {
			      breakpoint: 1024,
			      settings: {
			        slidesToShow: 4
			      }
			    },
			    {
			      breakpoint: 768,
			      settings: {
			        slidesToShow: 3
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 2
			      }
			    }
			  ]
		});
		
		$('.gallery').not('.slick-initialized').slick({
			autoplay: false,
			slidesToShow: 6,
			centerPadding: '60px',
			prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
			nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
			responsive: [
			    {
			      breakpoint: 1024,
			      settings: {
			        slidesToShow: 4
			      }
			    },
			    {
			      breakpoint: 768,
			      settings: {
			        slidesToShow: 3
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 2
			      }
			    }
			  ]
		});

		$('.news-carousel').not('.slick-initialized').slick({
			autoplay: false,
			autoplaySpeed: 3000,
			slidesToShow: 3,
			centerPadding: '60px',
			prevArrow: '<i class="material-icons left">keyboard_arrow_left</i>',
			nextArrow: '<i class="material-icons right">keyboard_arrow_right</i>',
			responsive: [
			    {
			      breakpoint: 768,
			      settings: {
			        slidesToShow: 2
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 1
			      }
			    }
			  ]
		});
		
	});

	// Vertical align navbar
	var $nav = $('.nav').height();
	$('.nav').css('margin-top', - $nav / 2 );

	// Hero slide dynamic sizing
	$(window).on('load resize scroll', function(){

		var $heading = $('.wrapper .heading').outerHeight();
		var $navbar = $('.wrapper .navbar-header').outerHeight();
		$('#hero .item, #hero.single-page .blurb, #hero.error-page .container').css('padding-top', $heading + $navbar );

		var $window = $(window).height();
		$('#hero').css('height', window.innerHeight - 50);
		$('#hero.error-page').css('height', window.innerHeight);

	});

	

	// Live movie search
	var $rows = $('.movie-tabs');
	jQuery('#search').keyup(function() {
	    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
	    
	    $rows.show().filter(function() {
	        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
	        return !~text.indexOf(val);
	    }).hide();
	});

	// Coming soon slide
	jQuery('.single-slide').first().css({ opacity: '1', height: 'auto', paddingBottom: '60px' }).siblings('.single-slide').css({ opacity: '0', height: '0', paddingBottom: '0' });
	jQuery('#comingSoon div').first().css('opacity', '1').siblings().css('opacity', '.35');

	jQuery('#comingSoon div').click(function() {
		var currentClass = $(this).data("dynamicclass");
	    $("div." + currentClass).css({ opacity: '1', height: 'auto', paddingBottom: '60px' }).siblings('.single-slide').css({ opacity: '0', height: '0', paddingBottom: '0' });
	    $(this).css('opacity', '1').siblings().css('opacity', '.35');
	    return false;
	});

	// Scroll smoothly to an element
    function smooth_scroll_to(elem){

        $('html, body').animate({
            scrollTop: $(elem).offset().top-50
        }, 550);

    }

    // Initiate smooth scroll to area based on navigation item title attr
	$('body').on('click', 'a.anchor[href^="#"]', function(e) {
        e.preventDefault();

        var elem = $(this).attr('href')
        smooth_scroll_to(elem);

    });

});