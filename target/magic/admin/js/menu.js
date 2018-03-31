$(document).ready( function() {
	var $submenu = $('.submenu');
	var $mainmenu = $('.mainmenu');
	$submenu.hide();
	//$submenu.first().delay(400).slideDown(700);
	$submenu.on('click','li', function() {
		$submenu.siblings().find('li').removeClass('chosen');
		$(this).addClass('chosen');
	});
	$mainmenu.on('click', 'h1', function() {
		$(this).next('.submenu').slideToggle().siblings('.submenu').slideUp();
		$('.mainmenu>h1').siblings().removeClass('one');
		$(this).addClass('one');
		selectCategory = $(this);
	});
	$mainmenu.children('li:last-child').on('click', function() {
		$mainmenu.fadeOut().delay(500).fadeIn();
	});
});