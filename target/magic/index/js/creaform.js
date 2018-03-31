// JavaScript Document
 $(document).ready( function(){
 });
/////////////////////////////下面是main代码//////////////////////////////////////

 function showmain(){ 
       $("#main").css("height",$(document).height());   
       $("#main").css("width",$(document).width());
   }  
 
///////////////////////////////main结束///////////////////////////////////  
   
   
//////////////////////////////////////////////////////////////////////////
    

     function showswitch_bg(){ 
	   $("#mask").css("height",$(document).height()); 
       $("#mask").css("width",$(document).width());     
        $("#mask").show();   
        $("#switch_bg").toggle(500);
		$(document.body).css({"overflow-x":"hidden","overflow-y":"hidden"});
   }  
   //隐藏遮罩层  
    function hideswitch_bg(){ 
       $("#mask").hide();  
        $("#switch_bg").toggle(500);  
		$(document.body).css({"overflow-x":"hidden","overflow-y":"scroll"});
   }   
   
//////////////////////////////////////////////////////////////////////////
       
     
     function showhei(){ 
       $("#main").css({"background":"#000000"});
       $("body").css({"background":"#000000"});
       $("#mask").hide();  
       $("#switch_bg").hide();  
   }  
//////////////////////////////////////////////////////////////////////////
     
     function showganlan(){ 
       $("#main").css({"background":"#808000"});
       $("body").css({"background":"#808000"});
       $("#mask").hide();  
       $("#switch_bg").hide();  
   }  
//////////////////////////////////////////////////////////////////////////
     
     function showzongse(){ 
       $("#main").css({"background":"#8B4513"});
       $("body").css({"background":"#8B4513"});
       $("#mask").hide();  
       $("#switch_bg").hide();  
   }  
//////////////////////////////////////////////////////////////////////////

//音乐设置
   
//////////////////////////////////////////////////////////////////////////
    

     function showswitch_music(){ 
	   $("#mask").css("height",$(document).height()); 
       $("#mask").css("width",$(document).width());     
        $("#mask").show();   
        $("#switch_music").toggle(500);
		$(document.body).css({"overflow-x":"hidden","overflow-y":"hidden"});
   }  
   //隐藏遮罩层  
    function hideswitch_bg(){ 
       $("#mask").hide();  
        $("#switch_music").toggle(500);  
		$(document.body).css({"overflow-x":"hidden","overflow-y":"scroll"});
   }   
   
/////////////////////////////////////////////////////////////////////////
///切换音乐
//////////////////////////////////////////////////////////////////////////
       
     
     function showmusic_1(){
       $("#mask").hide();  
       $("#switch_music").hide(); 
		$("#music_list audio").attr("src","images/gaoshan.mp3");
   }  
//////////////////////////////////////////////////////////////////////////
     
     function showmusic_2(){ 
       $("#mask").hide();  
       $("#switch_music").hide(); 
		$("#music_list audio").attr("src","images/dizi.mp3");
   }      
     function closeusic(){ 
       $("#mask").hide();  
       $("#switch_music").hide(); 
		$("#music_list audio").attr("src","");
   }
   
    
   
//////////////////////////////////////////////////////////////////////////

   //描述 

     function showdescribe(){ 
	   $("#mask").css("height",$(document).height()); 
       $("#mask").css("width",$(document).width());     
        $("#mask").show();   
        $("#describe").toggle(500);
		$(document.body).css({"overflow-x":"hidden","overflow-y":"hidden"});
   }  
   //隐藏遮罩层  
    function hidedescribe(){ 
       $("#mask").hide();  
        $("#describe").toggle(500);  
		$(document.body).css({"overflow-x":"hidden","overflow-y":"scroll"});
   }   
   
/////////////////////////////////////////////////////////////////////////
   
//////////////////////////////////////////////////////////////////////////

   //关于我们 

     function showaboutus(){ 
	   $("#mask").css("height",$(document).height()); 
       $("#mask").css("width",$(document).width());     
        $("#mask").show();   
        $("#aboutus").toggle(500);
		$(document.body).css({"overflow-x":"hidden","overflow-y":"hidden"});
   }  
   //隐藏遮罩层  
    function hideaboutus(){ 
       $("#mask").hide();  
        $("#aboutus").toggle(500);  
		$(document.body).css({"overflow-x":"hidden","overflow-y":"scroll"});
   }   
   
/////////////////////////////////////////////////////////////////////////