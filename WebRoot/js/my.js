function print(basePath){
	//�������Ƿ�ǩ��Э�飬ûǩ�����ӡ��ë
	  $.ajax({
    	    url:basePath+"servlet/CheckProtocolServlet?temptime="+Math.random(),
    	    data:{},
    	    type:'GET',
    	    cache:false, 
    	    dataType:'text',
    	    success:function(result) {
    	    	if (result == "repeat") {
    	    		//�����Ѿ�ǩ�𣬿��Դ�ӡ
    	    		SimplePop.confirm("�����껹δǩ��Э�鲻�ܽ��д�ӡ����ȷ��!",
							  {
						  		type: "error",
						  		title: "������ʾ",
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

var LODOP; //����Ϊȫ�ֱ���      
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
	LODOP.PRINT_INITA(12,14,690,450,"����ַ��ӡ");
	LODOP.SET_PRINT_STYLEA(0,"FontSize",30);
	LODOP.SET_PRINT_STYLEA(1,"Horient",2);
};	