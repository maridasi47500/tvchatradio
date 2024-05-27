window.onload = function() {
	if ($("#btn2").length > 0){
		$("#btn2").click(function(){
			$.ajax({
				url: "/tchatche/message",
				type:"post",
				data:{content: $("#msgtext").val(),current_user_id: $("#myuserid").html(),tchatche_id:$("#tchatcheid").html()},
				success:function(data){
					console.log(data);
				}
			});
			return false;
		});
	}
};
