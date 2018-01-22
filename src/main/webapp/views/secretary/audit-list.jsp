<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
<title>审核</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<jsp:include page="/views/resources/head.jsp" flush="true" />

</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<jsp:include page="/views/common/nav.jsp" flush="true" />
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<jsp:include page="/views/common/left.jsp" flush="true" />
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">审核</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<li class="active" id="ch-tag"><a href="#Chinese" data-toggle="tab">中文期刊论文</a></li>
									<li id="en-tag"><a href="#English" data-toggle="tab">英文期刊论文</a></li>
									<li id="patent-tag"><a href="#Patent" data-toggle="tab">专利</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane" id="Patent">
										<div class="panel-body">
											<form class="form-inline" id="PatentForm">
												<div class="form-group" style="display: none;">
													<input type="text" name="awardsType" value="enPeriodicalThesis"
														class="type-control">
												</div>
												<div class="form-group">
													<label>名称:</label> <input type="text" name="name"
														class="form-control">
												</div>
												<div class="form-group">
													<label>发明(设计)人:</label> <input type="text"
														name="autherName" class="form-control">
												</div>
												<div class="form-group">
													<label>授权号:</label> <input type="text"
														name="authorizationNumber" class="form-control">
												</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>
											<div class="form-group">
												<label>审核状态:</label> <select name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<!-- <option value="通过审核">通过审核</option> -->
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
												<button id='patent-btn' type="submit" class="btn btn-primary">查询</button>
											</form>
										</div>
									</div>
									<div class="tab-pane" id="English">
										<div class="panel-body">
										<form class="form-inline" id="EnglishForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="enPeriodicalThesis" class="type-control">
											</div>
											<div class="form-group">
												<label>标题:</label> <input type="text" name="name"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>来源/期刊:</label> <input type="text" name="provenance"
													class="form-control" >
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>				
											<div class="form-group">
												<label>审核状态:</label> <select name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<!-- <option value="通过审核">通过审核</option> -->
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='en-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									<div class="tab-pane active" id="Chinese">
										<div class="panel-body">
										<form class="form-inline" id="ChineseForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="chPeriodicalThesis" class="type-control">
											</div>
											<div class="form-group">
												<label>标题:</label> <input type="text" name="name"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>出处/期刊:</label> <input type="text" name="provenance"
													class="form-control" >
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>
											<div class="form-group">
												<label>审核状态:</label> <select name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<!-- <option value="通过审核">通过审核</option> -->
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='ch-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">${manager.title}</h3>
								</div>
								<div class="panel-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>#</th>
												<th>唯一编号</th>
												<th>标题</th>
												<th>作者</th>
												<th>作者信息</th>
												<th>通讯作者</th>
												<th>操作</th>
												<th>操作2</th>
											</tr>
										</thead>
										<tbody id="tbody">
										</tbody>
										<div id="Modal"></div>
									</table>
								</div>
								<div class="page-div" align="center"></div>
							</div>
							<!-- END TABLE HOVER -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>

		<!-- END MAIN -->
		<div class="clearfix"></div>
		<jsp:include page="/views/common/copyright.jsp" flush="true" />
	</div>
	<!-- END WRAPPER -->
	<jsp:include page="/views/resources/footer.jsp" flush="true" />
	<!-- options-contant -->
	<script type="text/javascript">
$(document).ready(function () {

	var currentAwardsType='chPeriodicalThesis';//维护一个 类型参数字符串,仅在每次切换标签时变化.
	var currentPageNum=1;//维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
	var currentPageSize=30;
	var paramMap='';//维护一个 请求参数字符串,仅在每次查询时变化.
	

       function initical(type){currentAwardsType=type;currentPageNum=1;$('#tbody').empty();$('.page-div').empty();}

            $(function () {
                $('#myTab li:eq(0) a').tab('show');
           });

            
		$('#ch-tag').click(function(){initical('chPeriodicalThesis');});
		$('#en-tag').click(function(){initical('enPeriodicalThesis');});
		$('#patent-tag').click(function(){initical('patent');});


            $('#ch-btn,#en-btn,#patent-btn').bind('click', function(){
				currentPageNum=1;    ////维护一个 当前页参数,换页时+ - ,在每次切换标签/查询时初始化.
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------


            	var temp_form;
            	if (temp_form != $(this).parent().attr('id')) {
            		temp_form = $(this).parent().attr('id');
            		$('#tbody').empty();
            		}
			
			//变换当前类型
 			$('.type-control').attr('value',currentAwardsType);
			paramMap = $(this).parent().serialize();

            	$(this).parent().attr('target','nm_iframe');
            	$.ajax({
                    type: 'post',
                    url: '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
                    data: paramMap,
                    success: function (page) {
                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

					var comuAuther = '';
					if (page.list[i].no8AutherName != null && page.list[i].no8AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no8AutherName + ':' + page.list[i].no8AutherNumber + ';'}

					if (page.list[i].no9AutherName != null && page.list[i].no9AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no9AutherName + ':' + page.list[i].no9AutherNumber + ';'}

					var all7Auther = page.list[i].no1AutherNumber + ';';
					if (page.list[i].no2AutherName != null && page.list[i].no2AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no2AutherNumber + ';'}
					if (page.list[i].no3AutherName != null && page.list[i].no3AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no3AutherNumber + ';'}
					if (page.list[i].no4AutherName != null && page.list[i].no4AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no4AutherNumber + ';'}
					if (page.list[i].no5AutherName != null && page.list[i].no5AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no5AutherNumber + ';'}
					if (page.list[i].no6AutherName != null && page.list[i].no6AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no6AutherNumber + ';'}
					if (page.list[i].no7AutherName != null && page.list[i].no7AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no7AutherNumber + ';'}


                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                $("<td/>").html(all7Auther).appendTo(tr);
					 $("<td/>").html(comuAuther).appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
                                $("<td class=\"options-contant\"/>").appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
                                $('#tbody').append(tr);
                                  }

					  var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        			var ul = $("<ul class=\"pagination pagination-lg\"/>");
             		           $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
             		    	       $("<li/>").html(pageNumAndTotal).appendTo(ul);
              	    	   	  $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                         	 	 $('.page-div').append(ul);
                        } else {
                            $.confirm({
                                title: 'Data error',
                                content: '没有与您相关的数据!',
                                autoClose: 'cancel|1500',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '取消',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                    }
                }, 'json');
            });


//pass
            $('body').on('click', '#passBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                if (true) {
                    $.ajax({
                        url: '${ctx}/secretary/audit',
                        type: 'POST',
                        data: {id: id,awardsType:currentAwardsType,btnType:'pass'},
                        success: function (data) {
                            $.confirm({
                                title: data.status,
                                content: '该条通过审核',
                                autoClose: 'cancel|1000',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '确定',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                    })
                }//if
                  $(this).parent().parent().remove();
                
            })


//notPass
            $('body').on('click', '#notPassBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                if (true) {
                    $.ajax({
                        url: '${ctx}/secretary/audit',
                        type: 'POST',
                        data: {id: id,awardsType:currentAwardsType,btnType:'notPass'},
                        success: function (data) {
                            $.confirm({
                                title: data.status,
                                content: '该条未通过审核',
                                autoClose: 'cancel|1000',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '确定',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
                    })
                }//if
                  $(this).parent().parent().remove();
            })








///////////////////////////////   prePage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

$('body').on('click', '.prePage', function () {
       currentPageNum = currentPageNum - 1 ;
       
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

					var comuAuther = '';
					if (page.list[i].no8AutherName != null && page.list[i].no8AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no8AutherName + ':' + page.list[i].no8AutherNumber + ';'}

					if (page.list[i].no9AutherName != null && page.list[i].no9AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no9AutherName + ':' + page.list[i].no9AutherNumber + ';'}

					var all7Auther = page.list[i].no1AutherNumber + ';';
					if (page.list[i].no2AutherName != null && page.list[i].no2AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no2AutherNumber + ';'}
					if (page.list[i].no3AutherName != null && page.list[i].no3AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no3AutherNumber + ';'}
					if (page.list[i].no4AutherName != null && page.list[i].no4AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no4AutherNumber + ';'}
					if (page.list[i].no5AutherName != null && page.list[i].no5AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no5AutherNumber + ';'}
					if (page.list[i].no6AutherName != null && page.list[i].no6AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no6AutherNumber + ';'}
					if (page.list[i].no7AutherName != null && page.list[i].no7AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no7AutherNumber + ';'}


                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                $("<td/>").html(all7Auther).appendTo(tr);
					 $("<td/>").html(comuAuther).appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
                                $("<td class=\"options-contant\"/>").appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
                                $('#tbody').append(tr);
                                  }

					  var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        			var ul = $("<ul class=\"pagination pagination-lg\"/>");
             		           $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
             		    	       $("<li/>").html(pageNumAndTotal).appendTo(ul);
              	    	   	  $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                         	 	 $('.page-div').append(ul);
                        } else {
                            $.confirm({
                                title: 'Data error',
                                content: '没有与您相关的数据!',
                                autoClose: 'cancel|1500',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '取消',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
			}
		});
            })




///////////////////////////////   nextPage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
$('body').on('click', '.nextPage', function () {

       currentPageNum = currentPageNum + 1 ;
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

					var comuAuther = '';
					if (page.list[i].no8AutherName != null && page.list[i].no8AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no8AutherName + ':' + page.list[i].no8AutherNumber + ';'}

					if (page.list[i].no9AutherName != null && page.list[i].no9AutherName != '') 
						{comuAuther = comuAuther + page.list[i].no9AutherName + ':' + page.list[i].no9AutherNumber + ';'}

					var all7Auther = page.list[i].no1AutherNumber + ';';
					if (page.list[i].no2AutherName != null && page.list[i].no2AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no2AutherNumber + ';'}
					if (page.list[i].no3AutherName != null && page.list[i].no3AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no3AutherNumber + ';'}
					if (page.list[i].no4AutherName != null && page.list[i].no4AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no4AutherNumber + ';'}
					if (page.list[i].no5AutherName != null && page.list[i].no5AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no5AutherNumber + ';'}
					if (page.list[i].no6AutherName != null && page.list[i].no6AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no6AutherNumber + ';'}
					if (page.list[i].no7AutherName != null && page.list[i].no7AutherName != '') 
						{all7Auther = all7Auther + page.list[i].no7AutherNumber + ';'}


                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                $("<td/>").html(page.list[i].name).appendTo(tr);
                                $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                $("<td/>").html(all7Auther).appendTo(tr);
					 $("<td/>").html(comuAuther).appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
                                $("<td class=\"options-contant\"/>").appendTo(tr);
                                $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
                                $('#tbody').append(tr);
                                  }

					  var pageNumAndTotal = "<a class=\"disabled\">第" + page.pageNum + " /" + page.pages + "页(共" + page.total + "条)</a>" 
                    
                        			var ul = $("<ul class=\"pagination pagination-lg\"/>");
             		           $("<li/>").html("<a href=\"#\" class=\"prePage\">&laquo;上一页</a>").appendTo(ul);
             		    	       $("<li/>").html(pageNumAndTotal).appendTo(ul);
              	    	   	  $("<li/>").html("<a href=\"#\" class=\"nextPage\">下一页&raquo;</a>").appendTo(ul);
                         	 	 $('.page-div').append(ul);
                        } else {
                            $.confirm({
                                title: 'Data error',
                                content: '没有与您相关的数据!',
                                autoClose: 'cancel|1500',
                                backgroundDismiss: true,
                                buttons: {
                                    cancel: {
                                        text: '取消',
                                        btnClass: 'waves-effect waves-button'
                                    }
                                }
                            })
                        }
			}
		});
            })










});//ready
        </script>
</body>

</html>