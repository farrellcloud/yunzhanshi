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
       $("#mask").hide();  
       $("#switch_bg").hide();  
   }  
//////////////////////////////////////////////////////////////////////////
     
     function showganlan(){ 
       $("#mask").hide();  
       $("#switch_bg").hide();  
   }  
//////////////////////////////////////////////////////////////////////////
     
     function showzongse(){ 
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
   
//////////


///////////////////////////////////////////////////////////////
//播放器控制
	function showmusic(){ 
		var audioEle = $("#music_list")[0];	
		if(audioEle.paused){
			audioEle.play();//播放
			//$("#openemusic").innerHtml()("关");
			document.getElementById("openemusic").innerHTML = "&#xe621";
		}
		else
		{
			audioEle.pause();//暂停
			//$("#openemusic").text("开");
			document.getElementById("openemusic").innerHTML = "&#xe609";
		}
	}
//////////////////////////////////////////////////////////////////////////


/*播放器控制
	function showmusic(){ 
	var audioEle = $("#music_list")[0];	
       $("#mask").hide();   
	   $("#openemusic").hide();
	   $("#closemusic").show();
	    audioEle.play();//播放
				
	}
	
	function closemusic(){ 
	var audioEle = $("#music_list")[0];
       $("#mask").hide();  
	   $("#openemusic").show();
	   $("#closemusic").hide();
	   audioEle.pause(); //暂停
				
	}*/
	/////////////////////////////////////////////////////////////////////////  
     
//////////////////////////////////////////////////////////////////////////
     
     function showmusic_2(){ 
       $("#mask").hide();  
       $("#switch_music").hide(); 
		$("#music_list audio").attr("src","images/dizi.mp3");
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
//////////////////////////////////////////////////////////////////////////

   //二维码 

     function showerweima(){ 
	   $("#mask").css("height",$(document).height()); 
       $("#mask").css("width",$(document).width());     
        $("#mask").show();   
        $("#erweima").toggle(500);
		$(document.body).css({"overflow-x":"hidden","overflow-y":"hidden"});
   }  
   //隐藏遮罩层  
    function hideerweima(){ 
       $("#mask").hide();  
        $("#erweima").toggle(500);  
		$(document.body).css({"overflow-x":"hidden","overflow-y":"scroll"});
   }   
   
/////////////////////////////////////////////////////////////////////////
