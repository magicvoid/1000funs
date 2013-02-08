<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/web/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>店铺管理主页</title>
		<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" href="${webRoot}/web/css/order.css">
		<style type="text/css">
			body {
				padding: 50px 0px 0px;
				/*background-color: #f5f5f5;*/
			}
		</style>
	</head>
	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">

					<a href="#" class="brand">店铺管理</a>
					<ul class="nav">
						<li><a href="#">关于</a></li>
					</ul>
					<ul class="nav pull-right">
						<li>
							<a href="#">
								<i class="icon-bell"></i> 待处理(<span class="red">20</span>)
							</a>
						</li>
						<li>
							<a href="#">
								<i class="icon-home"></i> 景田店(001)
							</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-user"></i> 张三
							</a>
							<div class="dropdown-menu" style="">
								<div class="user-info">
									<div class="user-avatar">
										<img src="${webRoot}/web/img/avatar.jpg" alt="" width="96px" height="96px">
									</div>
									<div class="user-text-info">
										<p>
											<b>张三</b> <br>
											<span>zhangshan@gmail.com</span>
										</p>
										<div>
											<input type="button" class="btn" value="查看个人资料">
											<input type="button" class="btn pull-right" value="退出登录">
										</div>
									</div>
								</div><!--/ user-info -->
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="container-fluid main">
			<div class="row-fluid">
				<div class="span2">
					<div class="sidebar">
						<ul class="nav nav-list">
							<li class="nav-header">订单管理</li>
							<li class="active"><a href="todo.jsp">未处理</a></li>
							<li><a href="history.jsp">已处理</a></li>
							<li class="nav-header">餐点管理</li>
							<li><a href="catering.jsp">配餐模式</a></li>
							<li><a href="package.jsp">套餐模式</a></li>
							<li class="nav-header">店铺管理</li>
							<li><a href="#">基本信息</a></li>
							<li class="nav-header">评价管理</li>
							<li><a href="#">查看评价</a></li>
						</ul>
					</div>
				</div>
				<div class="span10">
					<iframe id="mainFrame" src="" frameborder="0" width="100%" height="100%" style="vertical-align: top;"></iframe>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="${webRoot}/web/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/web/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">

			jQuery(function ($) {

				$(".sidebar .nav > li").click(function() {
					var $this = $(this);
					$this.addClass("active").siblings().removeClass("active");
					setFrameURL($this.children("a").attr("href"));
					return false;
				})

				// 选中第一个.
				.eq(5).click();

				initHeight();

				$(window).bind("resize", initHeight);

			});

			function setFrameURL (url) {
				$("#mainFrame").attr("src", url);
			}

			function initHeight () {
				var height = $(window).height() - $(".navbar-fixed-top").outerHeight() - 60;
				$("#mainFrame").attr("height", height);
			}

		</script>
	</body>
</html>