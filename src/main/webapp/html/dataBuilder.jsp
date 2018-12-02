<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dataBuilder</title>
<meta charset="UTF-8">
</head>
<body>
	<input id="proposer" type="button" value="申请人数据生成" onclick="exec(id)" />
	<input type="button" value="积极分子数据生成" onclick="exec(id)" />
	<input type="button" value="发展对象数据生成" onclick="exec(id)" />
	<input type="button" value="预备党员数据生成" onclick="exec(id)" />
	<input type="button" value="党员数据生成" onclick="exec(id)" />
	<input type="button" value="管理员数据生成" onclick="exec(id)" />
	<br />
	<input id="proposerC" type="button" value="申请人数据清除" onclick="exec(id)" />
	<input type="button" value="积极分子数据清除" onclick="exec(id)" />
	<input type="button" value="发展对象数据清除" onclick="exec(id)" />
	<input type="button" value="预备党员数据清除" onclick="exec(id)" />
	<input type="button" value="党员数据清除" onclick="exec(id)" />
	<input type="button" value="管理员数据清除" onclick="exec(id)" />
</body>
<script src="../js/jquery-3.3.1.min.js"></script>
<script>
	function exec(id){
		$.ajax({
			type: "POST",
				contentType: 'application/json;charset=utf-8',
				url: "/AdataBuilder.do?",
				data: '{"action":"'+id+'"}',
				dataType:"json",
				async: true,
				success:successFun
		});
	}
	function successFun(result){
		alert(result.message);
	}
</script>
</html>
