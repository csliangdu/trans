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
									<li id="achievementAward-tag"><a href="#achievementAward" data-toggle="tab">成果奖励</a></li>
									<li id="opusAward-tag"><a href="#opusAward" data-toggle="tab">著作奖励/版权</a></li>
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
												<label>审核状态:</label> <select id="paAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
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
												<label>审核状态:</label> <select  id="enAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
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
												<label>审核状态:</label> <select id="chAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='ch-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									
									
									<div class="tab-pane" id="achievementAward">
										<div class="panel-body">
										<form class="form-inline" id="achievementAwardForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="achievementAward" class="type-control">
											</div>
											<div class="form-group">
												<label>成果名称:</label> <input type="text" name="achievementName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>
											<div class="form-group">
												<label>年:</label> <input type="text" name="year"
													class="form-control">
											</div>
											
											<div class="form-group">
												<label>审核状态:</label> <select id="achievementAwardAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='achievementAward-btn' type="submit" class="btn btn-primary">查询</button>
										</form>
										</div>
									</div>
									
									<div class="tab-pane" id="opusAward">
										<div class="panel-body">
										<form class="form-inline" id="opusAwardForm">
											<div class="form-group" style="display: none;">
												<input type="text" name="awardsType"
													value="opusAward" class="type-control">
											</div>
											<div class="form-group">
												<label>成果名称:</label> <input type="text" name="name"
													class="form-control">
											</div>
											<div class="form-group">
												<label>作者:</label> <input type="text" name="autherName"
													class="form-control">
											</div>
											<div class="form-group">
												<label>归属学院:</label> <select name="no10AutherName"
													class="form-control">
													<option value="${sessionScope.currentUser.college}">${sessionScope.currentUser.college}</option>
												</select>
											</div>
											<div class="form-group">
												<label>审核状态:</label> <select id="opusAwardAuditStatus" name="no10AutherNumber"
													class="form-control">
													<option value="未审核">未审核</option>
													<option value="通过审核">通过审核</option>
													<option value="未通过审核">未通过审核</option>
												</select>
											</div>
											<button id='opusAward-btn' type="submit" class="btn btn-primary">查询</button>
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
												<!-- <th>作者信息</th> -->
												<!-- <th>通讯作者</th> -->
												<th>详细</th>
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
		$('#achievementAward-tag').click(function(){initical('achievementAward');});
		$('#opusAward-tag').click(function(){initical('opusAward');});



            $('#ch-btn,#en-btn,#patent-btn,#achievementAward-btn,#opusAward-btn').bind('click', function(){
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

			
			var auditSelectedText = '';
			if(currentAwardsType=='chPeriodicalThesis'){
			    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='enPeriodicalThesis'){
			    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='patent'){
			    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='achievementAward'){
			    selectedText = $("#achievementAwardClaimStatus option:selected").text();
			    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
			}
			if(currentAwardsType=='opusAward'){
			    selectedText = $("#opusAwardClaimStatus option:selected").text();
			    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
			}
			
			
			
            	$(this).parent().attr('target','nm_iframe');
            	$.ajax({
                    type: 'post',
                    url: '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
                    data: paramMap,
                    success: function (page) {
                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {


                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                if(currentAwardsType=='opusAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].name).appendTo(tr);
                                   $("<td/>").html(page.list[i].wordsNumbers).appendTo(tr);
                               		}else
                                if(currentAwardsType=='achievementAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
                                   $("<td/>").html(page.list[i].otherAutherName).appendTo(tr);
                                }else{
                                	 $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                    $("<td/>").html(page.list[i].name).appendTo(tr);
                                    $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                     }
					 				$("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
					 				if(auditSelectedText=='未审核'){
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
			                         $("<td class=\"options-contant\"/>").appendTo(tr);
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
									 }
						 					if(auditSelectedText=='未通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
	                             $("<td class=\"options-contant\"/>").appendTo(tr);
						 					}//未通过审核
						 					if(auditSelectedText=='通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
						 					}//通过审核
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
                var awardsName = $(this).parent().siblings()[3].innerHTML;
                
                if (confirm("确认[ "+awardsName+" ]通过审核?")) {
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
                  $(this).parent().parent().remove();
                }//if
                
                
            })


//notPass
            $('body').on('click', '#notPassBtn', function () {
                var id = $(this).parent().siblings()[0].innerHTML;
                var awardsName = $(this).parent().siblings()[3].innerHTML;
                
                if (confirm("确认[ "+awardsName+" ]不通过审核?")) {
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
                  $(this).parent().parent().remove();
                }//if
                  
            })








///////////////////////////////   prePage   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

$('body').on('click', '.prePage', function () {
       currentPageNum = currentPageNum - 1 ;
       
       
		var auditSelectedText = '';
		if(currentAwardsType=='chPeriodicalThesis'){
		    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='enPeriodicalThesis'){
		    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='patent'){
		    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='achievementAward'){
		    selectedText = $("#achievementAwardClaimStatus option:selected").text();
		    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='opusAward'){
		    selectedText = $("#opusAwardClaimStatus option:selected").text();
		    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
		}
		
       
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

					/* var comuAuther = '';
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
 */

                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                if(currentAwardsType=='opusAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].name).appendTo(tr);
                                   $("<td/>").html(page.list[i].wordsNumbers).appendTo(tr);
                               		}else
                                if(currentAwardsType=='achievementAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
                                   $("<td/>").html(page.list[i].otherAutherName).appendTo(tr);
                                }else{
                                	 $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                    $("<td/>").html(page.list[i].name).appendTo(tr);
                                    $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                     }
                                /* $("<td/>").html(all7Auther).appendTo(tr);
					 				$("<td/>").html(comuAuther).appendTo(tr); */
					 				$("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
					 				if(auditSelectedText=='未审核'){
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
			                         $("<td class=\"options-contant\"/>").appendTo(tr);
										 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
									 }
						 					if(auditSelectedText=='未通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
	                             $("<td class=\"options-contant\"/>").appendTo(tr);
						 					}//未通过审核
						 					if(auditSelectedText=='通过审核'){
	                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
						 					}//通过审核
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
       
       
		var auditSelectedText = '';
		if(currentAwardsType=='chPeriodicalThesis'){
		    auditSelectedText = $("#chAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='enPeriodicalThesis'){
		    auditSelectedText = $("#enAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='patent'){
		    auditSelectedText = $("#paAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='achievementAward'){
		    selectedText = $("#achievementAwardClaimStatus option:selected").text();
		    auditSelectedText = $("#achievementAwardAuditStatus").find("option:selected").text();
		}
		if(currentAwardsType=='opusAward'){
		    selectedText = $("#opusAwardClaimStatus option:selected").text();
		    auditSelectedText = $("#opusAwardAuditStatus").find("option:selected").text();
		}
		
       
		$.ajax({
			type : 'post',
			url : '${ctx}/secretary/audit-list'+'?pageNum='+currentPageNum+'&',
			data : paramMap,
			success : function(page) {
                        $('#tbody').empty();//清空-------------------------------------------------
                        $('.page-div').empty();//清空-------------------------------------------------

                        if (page != null) {
                            for (var i = 0; i < page.list.length; i++) {

					/* var comuAuther = '';
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
 */

                                var tr = $("<tr/>");
                                $("<td class=\"id\"/ display=\"none;\">").html(page.list[i].id).appendTo(tr);
                                $("<td/>").html(i + 1).appendTo(tr);
                                if(currentAwardsType=='opusAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].name).appendTo(tr);
                                   $("<td/>").html(page.list[i].wordsNumbers).appendTo(tr);
                               		}else
                                if(currentAwardsType=='achievementAward'){
                               	    $("<td/>").html(page.list[i].projectSources).appendTo(tr);
                                   $("<td/>").html(page.list[i].achievementName).appendTo(tr);
                                   $("<td/>").html(page.list[i].otherAutherName).appendTo(tr);
                                }else{
                                	 $("<td/>").html(page.list[i].keyId).appendTo(tr);
                                    $("<td/>").html(page.list[i].name).appendTo(tr);
                                    $("<td/>").html(page.list[i].allAutherName).appendTo(tr);
                                     }
                                /* $("<td/>").html(all7Auther).appendTo(tr);
					 			    $("<td/>").html(comuAuther).appendTo(tr); */
								    $("<td/>").html("<button type=\"button\" class=\"btn btn-success\" id=\"detaile\">详情</button>").appendTo(tr);
								 if(auditSelectedText=='未审核'){
									 $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
		                         $("<td class=\"options-contant\"/>").appendTo(tr);
									 $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
								 }
					 					if(auditSelectedText=='未通过审核'){
                             $("<td/>").html("<button type=\"button\" class=\"btn btn-primary\" id=\"passBtn\">通过</button>").appendTo(tr);
                             $("<td class=\"options-contant\"/>").appendTo(tr);
					 					}//未通过审核
					 					if(auditSelectedText=='通过审核'){
                             $("<td/>").html("<button type=\"button\" class=\"btn btn-danger\" id=\"notPassBtn\">不通过</button>").appendTo(tr);
					 					}//通过审核
					 			
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




          //************************************详细detaile*********************************************//

            $('body').on('click', '#detaile', function () {
            	var id = $(this).parent().siblings()[0].innerHTML;
            	
            		$.ajax({
            			type : 'get',
            			url : '${ctx}/secretary/detaile',
            			data : {
                                   id:id,
                                   awardsType:currentAwardsType
                        },
            			dataType : 'json',
            			success : function(data) {
            				if (data != null) {

            					var detaileStr = '';
            					
            					if(currentAwardsType=='opusAward'){
            						detaileStr += "唯一标识符: " + data.projectSources + "\n";
            						detaileStr += "名称: " + data.name + "\n";
            						detaileStr += "所有作者: " + data.wordsNumbers + "\n";
            						detaileStr += "年: " + data.publishDate+ "\n";
            						detaileStr += "ISBN: " + data.isbn+ "\n";
                               	}
            					if(currentAwardsType=='achievementAward'){
            						detaileStr += "唯一标识符: " + data.projectSources + "\n";
            						detaileStr += "标题: " + data.achievementName + "\n";
            						detaileStr += "所有作者: " + data.otherAutherName + "\n";
            						detaileStr += "年: " + data.awardDate+ "\n";
            						detaileStr += "奖: " + data.awardType + " " + data.awardGrade + "\n";
            					}
            					
            					if(currentAwardsType=='chPeriodicalThesis'){
            						
            						detaileStr += "唯一标识符: " + data.keyId + "\n";
            						detaileStr += "标题: " + data.name + "\n";
            						detaileStr += "所有作者: " + data.allAutherName + "\n";
            						detaileStr += "期刊: " + data.provenance+ "\n";
            						detaileStr += "年: " + data.year+ "\n";
            						detaileStr += "卷: " + data.ministry+ "\n";
            						detaileStr += "期: " + data.period+ "\n";
            						detaileStr += "关键字: " + data.keyWords+ "\n";
            						detaileStr += "机构: " + data.mechanism+ "\n";
            					}
            					if(currentAwardsType=='enPeriodicalThesis'){
            						
            						detaileStr += "唯一标识符: " + data.keyId + "\n";
            						detaileStr += "标题: " + data.name + "\n";
            						detaileStr += "所有作者: " + data.allAutherName + "\n";
            						detaileStr += "期刊:  " + data.provenance+ "\n";
            						detaileStr += "学科: " + data.subject+ "\n";
            						detaileStr += "年: " + data.year+ "\n";
            						detaileStr += "卷: " + data.volume+ "\n";
            						detaileStr += "期: " + data.period+ "\n";
            						detaileStr += "页: " + data.page+ "\n";
            					}
            					if(currentAwardsType=='patent'){
            						
            						detaileStr += "唯一标识符: " + data.keyId + "\n";
            						detaileStr += "标题: " + data.name + "\n";
            						detaileStr += "所有作者: " + data.allAutherName + "\n";
            						detaileStr += "类型: " + data.type + "\n";
            					}
            					
            					if(data.no1AutherName != ""){detaileStr += "*第一作者姓名: " + data.no1AutherName + "\n";}
            					if(data.no1AutherNumber != ""){detaileStr += "*第一作者工号: " + data.no1AutherNumber + "\n";}
            					if(data.no2AutherName != ""){detaileStr += "*第二作者姓名: " + data.no2AutherName + "\n";}
            					if(data.no2AutherNumber != ""){detaileStr += "*第二作者工号: " + data.no2AutherNumber + "\n";}
            					if(data.no3AutherName != ""){detaileStr += "*第三作者姓名: " + data.no3AutherName + "\n";}
            					if(data.no3AutherNumber != ""){detaileStr += "*第三作者工号: " + data.no3AutherNumber + "\n";}
            					if(data.no4AutherName != ""){detaileStr += "*第四作者姓名: " + data.no4AutherName + "\n";}
            					if(data.no4AutherNumber != ""){detaileStr += "*第四作者工号: " + data.no4AutherNumber + "\n";}
            					if(data.no5AutherName != ""){detaileStr += "*第五作者姓名: " + data.no5AutherName + "\n";}
            					if(data.no5AutherNumber != ""){detaileStr += "*第五作者工号: " + data.no5AutherNumber + "\n";}
            					if(data.no6AutherName != ""){detaileStr += "*第六作者姓名: " + data.no6AutherName + "\n";}
            					if(data.no6AutherNumber != ""){detaileStr += "*第六作者工号: " + data.no6AutherNumber + "\n";}
            					if(data.no7AutherName != ""){detaileStr += "*第七作者姓名: " + data.no7AutherName + "\n";}
            					if(data.no7AutherNumber != ""){detaileStr += "*第七作者工号: " + data.no7AutherNumber + "\n";}
            					if(data.no8AutherName != ""){detaileStr += "*通讯作者1姓名: " + data.no8AutherName + "\n";}
            					if(data.no8AutherNumber != ""){detaileStr += "*通讯作者1工号: " + data.no8AutherNumber + "\n";}
            					if(data.no9AutherName != ""){detaileStr += "*通讯作者2姓名: " + data.no9AutherName + "\n";}
            					if(data.no9AutherNumber != ""){detaileStr += "*通讯作者2工号: " + data.no9AutherNumber + "\n";}
            					detaileStr += "*成果归属单位: " + data.no10AutherName + "\n";
            					
            					detaileStr += "审核状态: " + data.no10AutherNumber + "\n";
            					if(currentAwardsType=='opusAward'){
            						detaileStr += "认领状态: " + data.status + "\n";
                             }else{
            						detaileStr += "认领状态: " + data.claimStatus + "\n";
                               	}
            					alert(detaileStr);

            				}
            			},
            		});

            });





});//ready
        </script>
</body>

</html>