<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">
<style type="text/css">
	#mydiv1{
		height: 100px;
	}
	#mydiv2{
		width: 100%;
		background-color: gray;
		text-align: center;
	}
	#mydiv2 h2{
		left: 100px;
	}
	#mydiv3{
		height: 10px;
	}
	#memu{
		height: 550px;
		background-color: gainsboro;
	}
	#memu li{
		text-align: center;		
		font-size: small;
	}
	#addForm sapn{
		width: 50px;
	}
	#toolbar{
		display: inline;
	}
</style>
</head>
<body>
	
	<div id="mydiv2" class="col-lg-12">
		<h2>商品信息列表</h2>
	</div>
	
	<div class="container-fluid">
	<div class="row">
		<div id="memu" class="col-lg-2">
			<div id="mydiv1"></div>
			<ul class="nav nav-stacked">
                <li><a href="#">HTML5</a></li>
                <li><a href="#">CSS</a></li>
                <li><a href="#">JavaScript</a></li>
                <li><a href="#">Bootstrap</a></li>
                <li><a href="#">PHP</a></li>
                <li><a href="#">SQL</a></li>
                <li><a href="#">MySQL</a></li>
            </ul>
		</div>
		
		<div class="col-lg-10">
			<div id="mydiv3"></div>
		
		<!-- 模态框内容 -->
			<div id="myModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">  
				<div class="modal-dialog modal-lg" style="width:400px" >    
					<div class="modal-content" > 
						<div class="modal-header bg-primary" style="text-align:center;height:50px" >
			                <h4 class="modal-title">
			                    <i class="icon-pencil"></i>
			                    <span id="lblAddTitle" style="font-weight:bold">新增商品</span>
			                </h4>
			            </div>
			            <form  id ='myForm' class="bs-example bs-example-form" role = "form">
					 		<div class="modal-body" style="height:280px">
					 				<input type="hidden" id="pid" name="pid" value="">
	                            <div class="form-group">
								    <label for="pname">商品名称</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								    <span></span>
								    <input type="text" name="pname" class="form-control" id="pname" placeholder="请输入商品名称">
								</div>
								<div class="form-group">
								    <label for="price">商品价格/元</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								    <span></span>
								    <input type="text" name="price" class="form-control" id="price" placeholder="请输入商品价格">
								</div>
								<div class="form-group">
								    <label for="pdate">生产日期</label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								    <span></span>
								    <input type="text" name="pdate" class="form-control" id="pdate" placeholder="请输入生产日期（yyyy-MM-dd）">
								</div>
	                        </div>  
				            <div class="modal-footer bg-info" style="height:50px">
			                    <button type="submit" class="btn btn-primary">确定</button>
			                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
			                </div>
			            </form>
			        </div>
				</div>  
			</div>
				
			
		<!--商品信息列表-->	
			<div>
				<table id="mytable" align="center" width="80%">
					<!--添加新增和批量删除按钮 -->
					<div id="toolbar" class="btn-group">
						<button id="btn_add" type="button" class="btn  btn-success" data-toggle="modal" data-target=".bs-example-modal-lg">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
						</button>
						<button id="deleteProds" class="btn btn-danger">
							<i class="glyphicon glyphicon-remove"></i>删除
						</button>
					</div>
				</table>
			</div>
		
		</div>
	</div>
	</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		//每行点击删除按钮执行的方法
		window.operateEvents = {
			'click .deleteProduct' :function(e, value, row, index){
				//1.先将选中行在前端隐藏
				var deltr = document.getElementById("mytable").getElementsByTagName("tr")[index+1];
				deltr.style.display = "none";
				
				//2.发送ajax请求，并将数据库中对应数据删除
				$.post("${pageContext.request.contextPath}/deleteProduct.do",{'pid':row.pid},function(rec){
					if(rec=="ok"){
			    		alert("删除成功！");
			    		window.location.reload();			//删除成功后刷新当前页面
			    	}else{
			    		alert("删除失败！");
			    	}
				});
			},
			'click .editProduct' :function(e, value, row, index){
				//1.将模态框中的标题信息修改为“修改商品信息”
				$("#lblAddTitle").html("修改商品信息");
				
				//2.将选中商品信息回显到模态框的表单控件中
				$("#pid").val(row.pid);
				$("#pname").val(row.pname);
				$("#price").val(row.price);
				$("#pdate").val(row.pdate);
				
				
			}
		};
		
		//给操作列对应的每一行添加修改和删除按钮
		function operateFormatter(value, row, index) {
			return [
				'<input type="button" value="修改" class="editProduct btn btn-primary btn-sm" data-toggle="modal" data-target=".bs-example-modal-lg">', 
				'<input type="button" value="删除" class="deleteProduct btn btn-danger btn-sm">'
			].join('');
		};
		
		//使用bootstrap table 创建商品信息列表
		$('#mytable').bootstrapTable({
		    columns: [{
		        field: 'state',
		        width: '5%',
		        checkbox: true,
		        align: 'center'
		    }, {
		        field: 'pid',
		        title: '商品编号',
		        width: '10%',
		        visible: false,
		        align: 'center'					//让单元格中元素居中
		    }, {
		        field: 'ID',
		        title: '商品编号',
		        width: '10%',
		        align: 'center',
		        formatter: function(value, row, index){
		        	return index+1;
		        }
		    },{
		        field: 'pname',
		        title: '商品名称',
		        width: '45%',
		        align: 'center'
		    }, {
		        field: 'price',
		        title: '商品价格',
		        width: '12%',
		        align: 'center'
		    }, {
		        field: 'pdate',
		        title: '生产日期',
		        width: '12%',
		        align: 'center'
		    }, {
		    	field: 'button',
		        title: '操作',
		        width: '15%',
		        align: 'center',
		        events: operateEvents,
		       	formatter: operateFormatter
		    }],
		    url: "${pageContext.request.contextPath}/showPageProducts",
		    method: "post",
		    
		//搜索控件
		    search: true,
		    searchOnEnterKey: true,				//按回车触发搜索方法
		//分页控件
		    pagination: true,                   //是否显示分页（*）
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5,10,15,20],
			paginationPreText:"上一页",
			paginationNextText:"下一页",
		//每行样式设置
			striped: true,                      //是否显示行间隔色
            height: 450,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
           
		});
		
		
		
		
		//使用 validate 对添加数据弹窗中的表单控件进行校验
		$("#myForm").validate({
			rules:{
				"pname":{required:true},
				"price":{required:true,number:true},
				"pdate":{required:true,dateISO:true}
			},
			messages:{
				"pname":{required:"商品名称不能为空"},
				"price":{required:"商品价格不能为空",number:"价格必须为数值"},
				"pdate":{required:"生产日期不能为空",dateISO:"日期格式错误"}
			},
			//将校验错误提示信息显示在指定位置（控件的上方）
			errorPlacement: function(error, element) {  
			    error.appendTo(element.prev());  
			},
			//校验通过后执行ajax提交
			submitHandler:function(){
				var param = $("#myForm").serialize();
				
				//进行判断，如果pid有值就访问编辑商品的控制器，如果pid为空则访问添加商品的控制器
				if($("#pid").val()){
					$.ajax({
						url: "${pageContext.request.contextPath}/editProduct.do",    
					    type: "post",
					    dataType: "text",
					    data:param,
					    success:function(rec){
					    	if(rec=="ok"){
					    		alert("修改成功！");
					    		$('#myModal').modal('hide');
					    		window.location.reload();			//修改成功后刷新当前页面
					    	}else{
					    		alert("修改失败！");
					    	}
					    }
					});
				}else{
					$.ajax({
						url: "${pageContext.request.contextPath}/addProduct.do",    
					    type: "post",
					    dataType: "text",
					    data:param,
					    success:function(rec){
					    	if(rec=="ok"){
					    		alert("提交成功！");
					    		$('#myModal').modal('hide');
					    	}else{
					    		alert("提交失败！");
					    	}
					    }
					});
				}
				
			}
		});
		
		//批量删除商品
		$("#deleteProds").click(function(){
			if(confirm("确定要删除所选项吗？")){
				//1.获取所有选中行
				var rows = $("#mytable").bootstrapTable("getSelections");
				
				//2.进行数组非空判断
				if(rows.length==0){
					alert("请先选择要删除的行！");
				}else{
					//3.遍历所有选中行数组，并拼接所有选中商品的字符串（pid）
					var pids = "";
					for(var i=0;i<rows.length;i++){
						pids+= rows[i].pid+',';
					};
					//4.使用ajax提交
					$.get("${pageContext.request.contextPath}/deleteProducts.do?ids="+pids,function(rec){
						if(rec=="ok"){
				    		alert("删除成功！");
				    		window.location.reload();
				    	}else{
				    		alert("删除失败！");
				    	};
					});
				};
			};
		});
		
	});
	
	
	
	
	
</script>
</body>

</html>