function print(basePath){
	//检查今年是否签订协议，没签署你打印个毛
	  $.ajax({
    	    url:basePath+"servlet/CheckProtocolServlet?temptime="+Math.random(),
    	    data:{},
    	    type:'GET',
    	    cache:false, 
    	    dataType:'text',
    	    success:function(result) {
    	    	if (result == "repeat") {
    	    		//今年已经签署，可以打印
    	    		SimplePop.confirm("您今年还未签署协议不能进行打印，请确认!",
							  {
						  		type: "error",
						  		title: "错误提示",
						  		opacity: 0.2,
						  		cancel: function(){
				                 }
    	    		           });
    	    	} else {
    	    		PrintOneURL(basePath + result);
    	    	}
    	    },
    	    error : function() {
    	    	
    	    }
    	});
}

var LODOP; //声明为全局变量      
function PrintOneURL(url){
	CreatePage();
	LODOP=getLodop();
	LODOP.ADD_PRINT_URL(30,20,746,"95%",url);
	LODOP.SET_PREVIEW_WINDOW(0,0,0,1000,600,"");
	LODOP.SET_SHOW_MODE("SKIN_TYPE",14);	
	LODOP.PREVIEW();
};
function CreatePage(){
	LODOP=getLodop();  
	LODOP.PRINT_INITA(12,14,690,450,"按网址打印");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",30);
	LODOP.SET_PRINT_STYLEA(1,"Horient",2);
};	