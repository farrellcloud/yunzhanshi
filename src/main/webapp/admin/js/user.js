// JavaScript Document
 $(document).ready( function(){
/************************/
  $("#step_1").click(function(){
	 $("#list_a").show().siblings().hide();
	 $("#step_1").addClass("one").siblings().removeClass("one");
	 });		 
/************************/
/************************/
  $("#step_2").click(function(){
	 $("#list_b").show().siblings().hide();
	 $("#step_2").addClass("one").siblings().removeClass("one");
	 });	 
/************************/
/************************/
  $("#step_3").click(function(){
	 $("#list_c").show().siblings().hide();
	 $("#step_3").addClass("one").siblings().removeClass("one");
	 });	 
/************************/
});
