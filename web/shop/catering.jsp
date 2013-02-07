<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/web/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>餐点管理-配餐模式</title>
		<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/web/css/order.css">
		<style type="text/css">
			body {
				/*padding: 50px 0px;*/
				/*background-color: #f5f5f5;*/
			}
		</style>
	</head>
	<body>
		<div class="row-fluid container-fixed">
			<div class="span12">
				<div class="querybar">
					<div class="row-fluid">
						<div class="span3">
						</div>
						<div class="span6">
						</div>
						<div class="span3">
							<a class="btn" href="#dialog-add-category" data-toggle="modal"><i class="icon-plus"></i>添加分类</a>
							<a class="btn" href="#dialog-add-food" data-toggle="modal"><i class="icon-plus"></i>添加食物</a>
						</div>
					</div>
				</div>
				<div class="category">
					<ul>
						<li>
							<label class="checkbox"><input type="checkbox" value="">10元区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">9元区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">8元区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">7元区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">6元区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">例汤区</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">小吃</label>
						</li>
						<li>
							<label class="checkbox"><input type="checkbox">饮品</label>
						</li>
					</ul>
				</div>
				<table class="foods-area">
					<tr>
						<td class="food-area-head">10元区</td>
						<td>
							<ul class="food-area-list">
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/paigu.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/plus.png" class="food-add" alt=""></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="food-area-head">9元区</td>
						<td>
							<ul class="food-area-list">
								<li><img src="${webRoot}/web/img/chaixin.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/chaixin.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/chaixin.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/chaixin.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/plus.png" class="food-add" alt=""></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="food-area-head">8元区</td>
						<td>
							<ul class="food-area-list">
								<li><img src="${webRoot}/web/img/kuguachaodang.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/kuguachaodang.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/kuguachaodang.jpg" alt=""></li>
								<li><img src="${webRoot}/web/img/plus.png" class="food-add" alt=""></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td class="food-area-head">7元区</td>
						<td>
							<ul class="food-area-list">
								<li><img src="${webRoot}/web/img/plus.png" alt="" class="food-add"></li>
							</ul>
						</td>
					</tr>
				</table>
			
			</div>
		</div><!--/ end of container -->

		<!-- 添加分类窗口 -->
		<div id="dialog-add-category" class="modal hide fade">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>添加分类</h3>
			</div>
			<div class="modal-body">
				<form action="" class="form-horizontal">
					<div class="control-group">
						<label for="category" class="control-label">分类</label>
						<div class="controls">
							<input id="category" type="text" style="width:178px;">
						</div>
					</div>
					<div class="control-group">
						<label for="price" class="control-label">价格</label>
						<!-- <div class="controls">
							<input id="category" type="text">
						</div> -->
						<div class="controls">
							<div class="input-prepend input-append">
								<span class="add-on">&yen;</span>
								<input id="price" type="text" class="span2">
								<span class="add-on">元</span>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-primary">保存</a>
				<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">关闭</a>
			</div>
		</div><!--/ end of 添加分类 -->

		<!-- 添加食物窗口 -->
		<div id="dialog-add-food" class="modal hide fade">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h3>添加食物</h3>
			</div>
			<div class="modal-body">
				<form action="" class="form-horizontal addfood-form">
					<div class="control-group">
						<div class="control-label">
							<img src="${webRoot}/web/img/kuguachaodang.jpg" class="addfood-photo img-rounded" id="addfood-photo" alt="">
							<div class="img-tips hide" id="addfood-photo-tips">点击上传图片</div>
						</div>
						<div class="controls controls-addfood">
							<div class="control-group control-group-small">
								<label for="" class="control-label">名称</label>
								<div class="controls"><input type="text"></div>
							</div>
							<div class="control-group control-group-small">
								<label for="" class="control-label">分类</label>
								<div class="controls">
									<select name="" id="">
										<option value="">10元区</option>
										<option value="">9元区</option>
										<option value="">8元区</option>
										<option value="">7元区</option>
										<option value="">6元区</option>
										<option value="">例汤区</option>
										<option value="">小吃</option>
										<option value="">饮品</option>
									</select>
								</div>
							</div>
							<div class="control-group control-group-small">
								<label for="" class="control-label">价格</label>
								<div class="controls">
									<!-- <input type="text"> -->
									<div class="input-prepend input-append">
										<span class="add-on">&yen;</span>
										<input id="price" type="text" style="width:153px;">
										<span class="add-on">元</span>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="control-group control-group-mini control-group-left addfood-describe">
						<label for="" class="control-label">介绍</label>
						<div class="controls">
							<textarea name="" rows="3" ></textarea>
						</div>
					</div>
					<div class="pull-right">
						<label class="checkbox inline"><input type="checkbox" value="">缺货标记</label>
						<label class="checkbox inline"><input type="checkbox" value="">下架</label>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn btn-primary">保存</a>
				<a href="#" class="btn" data-dismiss="modal" aria-hidden="true">关闭</a>
			</div>
		</div><!--/ end of 添加食物 -->


		<script type="text/javascript" src="${webRoot}/web/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/web/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${webRoot}/web/js/jquery.pagination.js"></script>
		<script type="text/javascript">

			jQuery(function ($) {

				$("#page").pagination({
					class: "pagination-right", 
					page: 1, 
					count: 10, 
					callback: function (current_page, new_page) {
					}, 
					refresh: false
				});

				$(".food-add").click(function () {
					$("#dialog-add-food").modal();
				});

				$("#addfood-photo").hover(function () {
					$("#addfood-photo-tips").removeClass("hide");
				}, function () {
					$("#addfood-photo-tips").addClass("hide");
				});
			});

		</script>
	</body>
</html>