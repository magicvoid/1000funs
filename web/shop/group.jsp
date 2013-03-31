<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/web/inc/header.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>餐点管理-分类管理</title>
		<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${webRoot}/web/bootstrap/css/bootstrap-responsive.min.css">
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
						<div class="span4">
						</div>
						<div class="span4">
						</div>
						<div class="span4 btn-right">
							<button type="button" class="btn" id="btn_delete" data-toggle="button">删除</button>
							<button type="button" class="btn" id="btn_edit" data-toggle="button">编辑</button>
							<button type="button" class="btn" id="btn_insert" data-toggle="button">新增</button>
						</div>
					</div>
				</div>
				
				<div id="groupList" class="common-list group-list">
					<ul>
						<c:forEach items="${groupList}" var="group">
						<li id="item_${group.id }">
							<div class="list-item">
								<div class="pic">
									<img id="img_${group.id }" src="${webRoot}/${group.image }" alt="${group.groupName }">
								</div>
								<div class="btns hide">
									<i class="icon2-edit" value="${group.id }"></i>
								</div>
								<div class="text">
									<p class="header">${group.groupName }</p>
									<p class="detail">${group.detail }</p>
								</div>
							</div>
						</li>
						</c:forEach>
						
						<c:if test="${fn:length(groupList) < 1}"><!-- empty -->
						<li>
							<div class="list-item center">
								本列表暂无记录
							</div>
						</li>
						</c:if>
					</ul>
				</div><!-- /end of group list -->
				
				<div id="add_panel" class="panel-bottom hide">
					<form class="group-list" id="groupForm" name="groupForm" action="${webRoot}/shop/group" method="post" enctype="multipart/form-data">
						<div class="pic">
							<div class="img-wapper"><img id="image-preview" src="" data-toggle="tooltip" data-placement="right" data-original-title="图片不能为空" data-validate="imgValid();"></div>
							<div class="img-tips hide">点击上传图片</div>
							<input type="file" id="file-upload" name="file" class="hide">
						</div>
						<div class="btns">
							<button class="btn btn-primary btn-large" id="btn_save_group">保存</button>
						</div>
						<div class="text">
							<div class="control-group control-group-mini">
								<label for="" class="control-label">分类</label>
								<div class="controls"><input type="text" name="groupName" id="groupName" class="input-block-level" data-toggle="tooltip" data-original-title="分类不能为空" data-validate></div>
							</div>
							<div class="control-group control-group-mini">
								<label for="" class="control-label">描述</label>
								<div class="controls">
									<input type="text" name="detail" id="detail" class="input-block-level" data-toggle="tooltip" data-original-title="描述不能为空" data-validate>
								</div>
							</div>
						</div>
					</form>
				</div><!-- /end of add panel -->
				
				<form id="editForm" name="editForm" action="${webRoot}/shop/group" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id">
					<input type="hidden" name="groupName">
					<input type="hidden" name="detail">
					<input type="file" id="edit-file-upload" name="file" class="hide">
				</form>
			</div>
		</div><!--/ end of container -->


		<script type="text/javascript" src="${webRoot}/web/js/jquery-1.8.0.js"></script>
		<script type="text/javascript" src="${webRoot}/web/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${webRoot}/web/js/jquery.pagination.js"></script>
		<script type="text/javascript" src="${webRoot}/web/js/jquery.bootstrap.extension.js"></script>
		<script type="text/javascript" src="${webRoot}/web/js/1000funs.js"></script>
		<script type="text/javascript" src="${webRoot}/web/js/jquery.form.js"></script>
		<script type="text/javascript">

			jQuery(function ($) {
				Init.run();
			});
			
			// Init
			var Init = (function($) {
				
				/**
				 * single toggle button click event
				 * @param  {string}   id       
				 * @param  {Function} callback 
				 */
				function toggle(id, callback) {
					$("#"+id).click(function () {
						var $this = $(this);
						setTimeout(function() {
							var checked = $this.hasClass("active");
							callback(checked, $this);
						}, 0);
					});
				}
				

				function insertBtnClick (checked) {
					var $addPanel = $("#add_panel"), 
						$groupList = $("#groupList"), 
						winHeight = $(window).height();
					if(checked) {
						$groupList.addClass("overflow");
						$addPanel.removeClass("hide");
						adjustHeight();
					} else {
						$groupList.height(winHeight).removeClass("overflow");
						$addPanel.addClass("hide");
					}
				}

				function resetHeight () {
					var insertChecked = $("#btn_insert").hasClass("active");
					if(insertChecked) {
						adjustHeight();
					}
				}
				
				function adjustHeight() {
					$("#groupList").height($(window).height() - 200);
				}

				function showRowEditBtn(checked, className) {
					var $btns = $("#groupList .btns");
					if(checked) {
						$btns.removeClass("hide").children("i").removeClass().addClass(className);
					} else {
						$btns.addClass("hide");
					}
				}
				
				return {
					// main
					run: function() {
						for(var fn in Init) {
							if(fn === "run" || fn.startsWith('_')) continue;
							Init[fn].call(window);
						}
					}, 
					
					// bind button event
					btnEvent: function() {
						toggle("btn_insert", insertBtnClick);
						toggle("btn_edit", function (checked) {
							$("#btn_delete.active").removeClass("active");
							showRowEditBtn(checked, "icon2-edit");
						});
						toggle("btn_delete", function (checked) {
							$("#btn_edit.active").removeClass("active");
							showRowEditBtn(checked, "icon2-remove");
						});
					}, 
					
					// image wrapper hover & click event
					imgUploadEvent: function() {
						$(".img-wapper").hover(function () {
							$(this).siblings(".img-tips").removeClass("hide");
						}, function () {
							$(this).siblings(".img-tips").addClass("hide");
						})
						.click(function() {
							$(this).siblings("input[type='file']").click();
						});
					}, 
					
					// html5 upload image preview
					imagePreview: function() {
						imagePreview($("#file-upload"), $("#image-preview"));
						
						// when edit
						$("#edit-file-upload").change(function() {
							var img = this.files[0], 
								reader = new FileReader(), 
								orderId = $(this).data("orderId");
							
							reader.onload = function(evt) {
								$("#img_" + orderId).attr("src", evt.target.result);
							}
							reader.readAsDataURL(img);
						});
					}, 
					
					// form submit validate
					validate: function() {
						$.validation().init();
					}, 
					
					submit: function() {
						$("#groupForm").submit(function() {
							if($.validation().check()) { // validate 
								//ajax submit form
								var options = {
									success: function(responseText, statusText, xhr, $form) {
										var data = responseText, 
											form = $form.get(0), 
											groupName = form.groupName.value, 
											detail = form.detail.value;
										var groupVO = {
											"groupName": groupName, 
											"detail": detail, 
											"image": data.image, 
											"id": data.id
										};
										appendToList(groupVO);
									}
								};
								$(this).ajaxSubmit(options);
							}
							return false;
						});
						
						// form for update
						$("#editForm").submit(function() {
							var orderId = $("input[name='id']", this).val(), 
								options = {
									type: "put", 
									url: "${webRoot}/shop/group/" + orderId, 
									success: function(responseText, statusText, xhr, $form) {
										//alert(responseText);
									}
								};
							$(this).ajaxSubmit(options);
							return false;
						});
					}, 
					
					// edit and delete operate btn
					operateEvent: function() {
						$(document).on("click", "#groupList .btns i", function() {
							var $this = $(this), 
								orderId = $this.attr("value");
							if($this.hasClass("icon2-remove")) {
								deleteItem(orderId);
							} else if($this.hasClass("icon2-edit")) {
								editItem(orderId);
							} else if($this.hasClass("icon2-ok")) {
								saveItem(orderId);
							} else {
								throw "btns的样式必须是icon2-remove, icon2-edit, icon2-ok之一";
							}
						});
					}, 
					
					// event for edit/update record dynamic
					dynamicUpdateEvent: function() {
						$(document).on("keypress", "#groupList .text p input", function(e) {
							var keycode = e.which;
							if(keycode == 13 || keycode == 108) { // Enter
								saveItem($(this).attr("orderId"));
							}
						});
					}, 
					
					// bind window resize event
					resizeEvent: function() {
						$(window).bind("resize", resetHeight);
					}
					
				};
			})(jQuery);
			
			function imgValid() {
				return !!$("#file-upload").get(0).files[0];
			}
			
			/**
			 */
			function appendToList(groupVO) {
				var $firstItem = $("#groupList > ul > li").eq(0), 
					$newNode = $firstItem.clone();
				$firstItem.before($newNode);
				$newNode.attr("id", "item_" + groupVO.id);
				$("img", $newNode).attr("src", "${webRoot}"+groupVO.image);
				$(".header", $newNode).html(groupVO.groupName);
				$(".detail", $newNode).html(groupVO.detail);
				$(".btns i", $newNode).attr("value", groupVO.id);
			}
			
			function deleteItem(orderId) {
				var url = "${webRoot}/shop/group/" + orderId;
				$.ajax({
					url: url, 
					type: "delete"
				})
				.done(function() {
					$("#item_"+orderId).animate({
						opacity: 0, 
						height: 0
					}, 1000, function() {
						$(this).remove();
					});
				})
				.fail(function(jqXHR) {
					alert("删除失败. " + jqXHR.responseText);
				});
			}
			
			function editItem(orderId) {
				$("#item_" + orderId + " .text p").each(function() {
					var $this = $(this);
					$this.wrapInner("<input type='text' orderId='"+orderId+"' value='"+$this.html()+"'>");
				});
				$("#item_" + orderId + " .btns i").removeClass().addClass("icon2-ok");
				$("#item_" + orderId + " .pic").addClass("pointer").on("click", function() {
					$("#edit-file-upload").data("orderId", orderId).click();
				});
			}
			
			function saveItem(orderId) {
				
				$("#item_" + orderId + " .text p").each(function() {
					var $this = $(this), 
						text = $this.children("input").val();
					$this.html(text);
					
					if($this.hasClass("header")) {
						$("#editForm input[name='groupName']").val(text);
					} else if($this.hasClass("detail")) {
						$("#editForm input[name='detail']").val(text);
					} else {
					}
					
				});
				$("#item_" + orderId + " .btns i").removeClass().addClass("icon2-edit");
				$("#item_" + orderId + " .pic").removeClass("pointer").off("click");
				
				// do update to db
				$("#editForm input[name='id']").val(orderId);
				$("#editForm").submit();
			}

		</script>
	</body>
</html>