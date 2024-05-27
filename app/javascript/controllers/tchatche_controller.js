window.onload = function() {
	if ($("#btn2")){
		$("#btn2").onclick=function(){
			$.ajax({
				url: "/tchatche/message",
				type:"post",
				data:{content: $("#msgtext").value,current_user_id: $("#myuserid").innerHTML,tchatche_id:$("#tchatcheid").innerHTML},
				success:function(data){
					console.log(data);
				}
			});
			return false;
		};
	}
};
