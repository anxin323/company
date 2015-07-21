<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=basePath%>/resource/img/favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>/resource/css/dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="<%=basePath%>/resource/js/ie-emulation-modes-warning.js"></script>
<script src="<%=basePath%>/resource/js/jquery-1.8.3.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="font-size: 28px;">后台管理系统</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right" style="margin-right: 15px;">
					<li><a href="#">首页</a></li>
					<li><a href="#">设置</a></li>
					<li><a href="#">博客</a></li>
					<li><a href="#">帮助</a></li>
				</ul>
				<!-- <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form> -->
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="">用户管理 <span class="sr-only">(current)</span></a></li>
					<li><a href="">权限管理</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">流量统计</a></li>
					<li><a href="">用户统计</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="">性能监控</a></li>
					<li><a href="api.html">系统接口</a></li>
					<li><a href="">关于系统</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<!--           <h1 class="page-header">Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
          </div> -->
				<div class="sub-header">
					<h2>
						用户列表 <input
							style="font-size: 16pX; margin-right: 10px; float:right"
							type="button" name="deleteUser" value="删除" onclick="deleteUser()"> <input
							style="font-size: 16pX; margin-right: 10px; float:right"
							type="button" name="modifyUser" value="修改" onclick="modifyUser()"> <input
							style="font-size: 16pX; margin-right: 10px; float:right"
							type="button" name="addUser" value="新增" onclick="addUser()">
					</h2>
				</div>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th><input type='checkbox' name='chkAll'
									onclick="checkAllBox(this)"></th>
								<th>ID</th>
								<th>用户名</th>
								<th>邮箱</th>
								<th>手机</th>
							</tr>
						</thead>
						<tbody id="tby">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var queryByPage = function() {
								$("#tby tr").remove();
								$
										.ajax({
											type : "get",
											url : "/company/console/user/getUser1",
											data : "{}",
											dataType : 'text',
											contentType : "application/json; charset=utf-8",
											success : function(data) {
												//var array=data; 
												var tby = $("#tby");
												//alert("用户列表长度：" + data);
												var obj = eval(data);
												$(obj)
														.each(
																function(index) {
																	var val = obj[index];
																	//alert("userName="+ val.userName);
																	var td1 = $("<td style='vertical-align:middle;width:30px;'><input type='checkbox' name='chk'></td>");
																	var td2 = $("<td>"
																			+ val.id
																			+ "</td>");
																	var td3 = $("<td>"
																			+ val.userName
																			+ "</td>");
																	var td4 = $("<td>"
																			+ val.email
																			+ "</td>");
																	var td5 = $("<td>"
																			+ val.mobile
																			+ "</td>");
																	var tr = $("<tr></tr>");
																	tr
																			.append(
																					td1)
																			.append(
																					td2)
																			.append(
																					td3)
																			.append(
																					td4)
																			.append(
																					td5);
																	tr
																			.appendTo(tby);
																});

											},
											error : function(XMLHttpRequest,
													textStatus, errorThrown) {
												alert(errorThrown);
											}
										});
							}
							//初始化列表 
							queryByPage();
						});

		function addUser() {
			alert("Add User。。。");
		}
		
		function modifyUser() {
			
			 if (checkData()){
			 	alert("Modify User。。。");
			 }
		}
		
		function deleteUser() {
			alert("Delete User。。。");
		}

		function checkAllBox(obj) {
			var answer = document.getElementsByName("chk");
			if (obj.checked == true) {
				for (var i = 0; i < answer.length; i++) {
					answer[i].checked = true;
				}
			} else {
				for (var i = 0; i < answer.length; i++) {
					answer[i].checked = false;
				}
			}
		}

		function checkData() {
			var answer = document.getElementsByName("chk");
			var flag = false;
			for (var i = 0; i < answer.length; i++) {
				if (answer[i].checked == true) {
					flag = true;
					break;
				}
			}
			if (!flag) {
				alert("请至少选择一项");
			}
			return flag;
		}
	</script>
</body>
</html>
