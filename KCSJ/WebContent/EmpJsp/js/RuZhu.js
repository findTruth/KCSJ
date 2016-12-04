/**
 * 
 */
          //顾客信息页面的弹出
          function ruzhu(data,typeroom){
        	  rmno = data;
        	  type = typeroom;
        	     var r=confirm("该客户是否是会员");
        	     
        	     if(r==true){
        	    	 document.getElementById("Vipdialogs").innerHTML="";  
        	    	 $('#vipDiv').modal();
        	    }else{
        	    	document.getElementById("dialogs").innerHTML="";  	
        	    	 $('#ClientDiv').modal();	
        	    	  		
        	    	 }
        	 }

          
          
          
