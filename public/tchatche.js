window.onload = function() {
	if ($("#btn2").length > 0){
		$("#btn2").click(function(){
			$.ajax({
				url: "/tchatche/message",
				type:"post",
				data:{content: $("#msgtext")[0].value,current_user_id: $("#myuserid")[0].innerHTML,tchatche_id:$("#tchatcheid")[0].innerHTML},
				success:function(data){
					console.log(data);
				}
			});
			return false;
		});
	}
};
