/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

(function($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    })

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Fit Text Plugin for Main Header
    $("h1").fitText(
        1.2, {
            minFontSize: '35px',
            maxFontSize: '65px'
        }
    );

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })

    // Initialize WOW.js Scrolling Animations
    new WOW().init();

})(jQuery); // End of use strict

/* SET HEIGHT FOR THE <FIRST SECTION> EQUAL THE WINDOW -> IF THIS HAS A LOWER HEIGHT OF A WINDOW */
var section = $("nav + section").outerHeight();
var win = $(window).height();

if (section < win ) {
    $("nav + section").outerHeight(win);
}

/* SIGN-UP PROFESSIONISTI -> SHOW AND HIDE INPUT TEXT "PRIVATE-COMPANY"  */
$("#selSocieta").change(function(){
	$(this).find("option:selected").each(function(){
		if($(this).attr("value")=="altro"){
			$(".private-company").hide();
			$(".private-company").show();
		}
		else{
			$(".private-company").hide();
		}
	});
}).change();

/* TOOLTIP COMPETENZE PROFESSIONISTI */
$('[data-toggle="tooltip"]').tooltip();


/* ANCHOR LINK DASHBOARD WHEN SUBMIT BUTTON - with <a href=""> 
$(function(){
	
  var hash = window.location.hash;
  hash && $('.cont-dash a.reload[href="' + hash + '"]').tab('show') && $('.nav li a[href="' + hash + '"]').tab('show');

  $('.cont-dash a.reload').click(function (e) {
    $(this).tab('show');
    var scrollmem = $('body').scrollTop();
    window.location.hash = this.hash;
    $('html,body').scrollTop(scrollmem);
  });
  
});*/

/* CALC FOOTER HEIGHT AND SET MENU SIDEBAR UL MARGIN-BOTTOM FOR SCROLL MENU */
var footerHeight = $("#footer").outerHeight();
$(".sidebar > ul").css('marginBottom' , footerHeight);
$(window).resize(function(){
	$(".sidebar > ul").css('marginBottom' , footerHeight);
});

/* SUMMERNOTE */
$(document).ready(function() {
	$('.summernote').summernote({
		height: 200,
		toolbar: [
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['para', ['ul', 'ol', 'paragraph']],
			['insert', ['link']],
			['view', ['fullscreen']]
		],
		
	});
});

/*$(".nav > li:nth-child(2) > a").click(function(){
	setTimeout(function(){
		var width = $(".img-container").width();
		var height = $(".img-container").height();
		$(".cropper-container").width(width);
		$(".cropper-container").height(height);
	}, 3000);
});*/

/*$('.cont-dash .form-group > a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
});*/

// FOR FIXED NAV AND MODAL OPEN -> PADDING-RGHT

// TODO: Add any custom classes with 'position: fixed' to the selector below
/*var fixedCls = '.navbar-fixed-top,.navbar-fixed-bottom';
var oldSSB = $.fn.modal.Constructor.prototype.setScrollbar;
$.fn.modal.Constructor.prototype.setScrollbar = function () {
	oldSSB.apply(this);
	if (this.bodyIsOverflowing && this.scrollbarWidth)
		$(fixedCls).css('padding-right', this.scrollbarWidth);
}

var oldRSB = $.fn.modal.Constructor.prototype.resetScrollbar;
$.fn.modal.Constructor.prototype.resetScrollbar = function () {
	oldRSB.apply(this);
	$(fixedCls).css('padding-right', '');
}

$('#modal-pre-register, #modal-register, #modal-login, #modal-pfspecialist').on('show.bs.modal', function (e) {
	if ($(window).width() > 768) {
		$(".navbar-default").css("padding-right","17px");
	}
});

$('#modal-pre-register, #modal-register, #modal-login, #modal-pfspecialist').on('hide.bs.modal', function (e) {
	if ($(window).width() > 768) {
		$(".navbar-default").css("padding-right","0px");
	}
});

$("#linkRegister").click(function(){
	setTimeout(function(){ 
		$('#modal-register').modal(); 
	}, 500);
});*/