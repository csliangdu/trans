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
<title>追加著作成果/著作权</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<jsp:include page="/views/resources/head.jsp" flush="true" />
<link href="${ctx}/views/assets/My97DatePicker/skin/WdatePicker.css" rel="stylesheet" type="text/css"></link>
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
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">著作成果/著作权 追加:</h3>
					    <h3 style="color: red;">${msg}</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<ul class="nav nav-tabs" id="myTab">
									<!-- <li role="presentation" class="active"><a id="to-thesis-tab"
										href="#thesis-tab" data-toggle="tab">论文</a></li> -->
									<li  role="presentation"><a id="to-opusAward-tab" href="#opusAward-tab"
										data-toggle="tab">著作成果/著作权</a></li>
								</ul>
								<div class="tab-content">

									<div class="tab-pane active" id="opusAward-tab">
										<div class="panel-body">
											<div class="form-group">

												<form:form commandName="opusAward" id="thesis-form"
													class="form-inline" action="${ctx}/user/awards-create/opusAward"
													method="post" enctype="multipart/form-data">

													<table>
														<tbody>
															<tr>
																<td width="60%"><label for="name"
																	class="form-control ">著作名称:</label> <input type="text"
																	class="form-control " name="name" id="name" size="40"
																	value="" maxlength="512"><font
																	style="color: #FF0000;"> *</font></td>
															</tr>



															<tr>
																<td width="60%"><label class="form-control ">归属单位:</label>
																	<select name="no10AutherName" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="机械工程学院">机械工程学院</option>
																		<option value="交通与车辆工程学院">交通与车辆工程学院</option>
																		<option value="农业工程与食品科学学院">农业工程与食品科学学院</option>
																		<option value="电气与电子工程学院">电气与电子工程学院</option>
																		<option value="计算机科学与技术学院">计算机科学与技术学院</option>
																		<option value="化学化工学院">化学化工学院</option>
																		<option value="建筑工程学院">建筑工程学院</option>
																		<option value="资源与环境工程学院">资源与环境工程学院</option>
																		<option value="材料科学与工程学院">材料科学与工程学院</option>
																		<option value="生命科学学院">生命科学学院</option>
																		<option value="数学与统计学院">数学与统计学院</option>
																		<option value="物理与光电工程学院">物理与光电工程学院</option>
																		<option value="经济学院">经济学院</option>
																		<option value="管理学院">管理学院</option>
																		<option value="文学与新闻传播学院">文学与新闻传播学院</option>
																		<option value="外国语学院">外国语学院</option>
																		<option value="法学院">法学院</option>
																		<option value="马克思主义学院">马克思主义学院</option>
																		<option value="美术学院">美术学院</option>
																		<option value="音乐学院">音乐学院</option>
																		<option value="体育学院">体育学院</option>
																		<option value="鲁泰纺织服装学院">鲁泰纺织服装学院</option>
																		<option value="齐文化研究院">齐文化研究院</option>
																		<option value="图书馆">图书馆</option>
																		<option value="后勤管理处">后勤管理处</option>
																		<option value="学生工作处">学生工作处</option>
																		<option value="实验管理中心">实验管理中心</option>
																		<option value="校医院">校医院</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																<td width="40%"></td>
															</tr>



															<tr>
																<td width="60%"><label class="form-control ">出版时间:</label>
																	<input type="text" id="publishDate"    class="form-control " onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',maxDate:'%y-%M-%d'})"
																	name="publishDate" value=""> <font
																	style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">出版单位:</label>
																	<input type="text" class="form-control "
																	name="publishWorkunit" value=""> <font
																	style="color: #FF0000;"> *</font></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">出版地:</label>
																	<select name="publishLocation" class=" form-control">
																		<option value="">--请选择--</option>
																		<option value="国内">国内</option>
																		<option value="国外">国外</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">著作类别:</label>
																	<select name="opusCategory" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="工具书">工具书</option>
																		<option value="专著">专著</option>
																		<option value="编著">编著</option>
																		<option value="译著">译著</option>
																		<option value="教材">教材</option>
																		<option value="其他">其他</option>
																</select></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">学科门类:</label>

																	<select class="form-control " name="subjectType"><option
																			value="">--请选择--</option>
																		<option value="科技类">科技类</option>
																		<option value="社科类">社科类</option>
																</select> <font style="color: #FF0000;"> *</font></td>

																<td width="40%"><label class="form-control ">一级学科:</label>
																	<select class="form-control " name="stairSubject"><option
																			value="">--请选择--</option>
																		<option value="数学">数学</option>
																		<option value="信息科学与系统科学">信息科学与系统科学</option>
																		<option value="力学">力学</option>
																		<option value="物理学">物理学</option>
																		<option value="化学">化学</option>
																		<option value="天文学">天文学</option>
																		<option value="地球科学">地球科学</option>
																		<option value="生物学">生物学</option>
																		<option value="心理学">心理学</option>
																		<option value="农学">农学</option>
																		<option value="林学">林学</option>
																		<option value="畜牧、兽医科学">畜牧、兽医科学</option>
																		<option value="水产学">水产学</option>
																		<option value="基础医学">基础医学</option>
																		<option value="临床医学">临床医学</option>
																		<option value="预防医学与公共卫生学">预防医学与公共卫生学</option>
																		<option value="军事医学与特种医学">军事医学与特种医学</option>
																		<option value="药学">药学</option>
																		<option value="中医学与中药学">中医学与中药学</option>
																		<option value="工程与技术科学基础学科">工程与技术科学基础学科</option>
																		<option value="信息与系统科学相关工程与技术">信息与系统科学相关工程与技术</option>
																		<option value="自然科学相关工程与技术">自然科学相关工程与技术</option>
																		<option value="测绘科学技术">测绘科学技术</option>
																		<option value="材料科学">材料科学</option>
																		<option value="矿山工程技术">矿山工程技术</option>
																		<option value="冶金工程技术">冶金工程技术</option>
																		<option value="机械工程">机械工程</option>
																		<option value="动力与电气工程">动力与电气工程</option>
																		<option value="能源科学技术">能源科学技术</option>
																		<option value="核科学技术">核科学技术</option>
																		<option value="电子与通信技术">电子与通信技术</option>
																		<option value="计算机科学技术">计算机科学技术</option>
																		<option value="化学工程">化学工程</option>
																		<option value="产品应用相关工程与技术">产品应用相关工程与技术</option>
																		<option value="纺织科学技术">纺织科学技术</option>
																		<option value="食品科学技术">食品科学技术</option>
																		<option value="土木建筑工程">土木建筑工程</option>
																		<option value="水利工程">水利工程</option>
																		<option value="交通运输工程">交通运输工程</option>
																		<option value="航空、航天科学技术">航空、航天科学技术</option>
																		<option value="环境科学技术及资源科学技术">环境科学技术及资源科学技术</option>
																		<option value="安全科学技术">安全科学技术</option>
																		<option value="管理学">管理学</option>
																		<option value="马克思主义">马克思主义</option>
																		<option value="哲学">哲学</option>
																		<option value="宗教学">宗教学</option>
																		<option value="语言学">语言学</option>
																		<option value="文学">文学</option>
																		<option value="艺术学">艺术学</option>
																		<option value="历史学">历史学</option>
																		<option value="考古学">考古学</option>
																		<option value="经济学">经济学</option>
																		<option value="政治学">政治学</option>
																		<option value="法学">法学</option>
																		<option value="军事学">军事学</option>
																		<option value="社会学">社会学</option>
																		<option value="民族学与文化学">民族学与文化学</option>
																		<option value="新闻学与传播学">新闻学与传播学</option>
																		<option value="图书馆、情报与文献学">图书馆、情报与文献学</option>
																		<option value="教育学">教育学</option>
																		<option value="体育科学">体育科学</option>
																		<option value="统计学">统计学</option>
																</select> <font style="color: #FF0000;"> *</font></td>
															</tr>


															<tr>
																<td width="60%"><label class="form-control ">学校署名:</label>
																	<select name="schoolSign" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="第一单位">第一单位</option>
																		<option value="非第一单位">非第一单位</option>
																</select> <font style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">是否翻译成外文:</label>
																	<select name="translatedForeignOrNot" class="form-control ">
																		<option value="">--请选择--</option>
																		<option value="是">是</option>
																		<option value="否">否</option>
																</select> <font style="color: #FF0000;"> *</font></td>
															</tr>
																<tr>
																<td width="60%"><label class="form-control ">ISBN:</label>
																	<input type="text" name="isbn" class="form-control " value="">
																<font style="color: #FF0000;"> *</font></td>
																<td width="40%"><label class="form-control ">总字数(万字):</label><input type="text" name="wordsNumbers" class="form-control " value="">
																<font style="color: #FF0000;"> *</font></td>
															</tr>														

															<tr>
																<td width="60%"><label class="form-control ">项目来源:</label>
																	<select name="projectSources" class="form-control "><option
																			value="">--请选择--</option>
																		<option value="国家社科基金单列学科项目">国家社科基金单列学科项目</option>
																		<option value="国家社科基金项目">国家社科基金项目</option>
																		<option value="教育部人文社科研究项目">教育部人文社科研究项目</option>
																		<option value="全国教育科学规划">全国教育科学规划（教育部）项目</option>
																		<option value="国家自然科学基金项目">国家自然科学基金项目</option>
																		<option value="中央其他部门社科专门项目">中央其他部门社科专门项目</option>
																		<option value="高校古籍整理研究项目">高校古籍整理研究项目</option>
																		<option value="省、市、自治区社科基金项目">省、市、自治区社科基金项目</option>
																		<option value="省教育厅社科项目">省教育厅社科项目</option>
																		<option value="地、市、厅、局等政府部门项目">地、市、厅、局等政府部门项目</option>
																		<option value="国际合作研究项目">国际合作研究项目</option>
																		<option value="与港、澳、台合作研究项目">与港、澳、台合作研究项目</option>
																		<option value="企事业单位委托项目">企事业单位委托项目</option>
																		<option value="外资项目">外资项目</option>
																		<option value="学校社科项目">学校社科项目</option>
																		<option value="其他研究项目">其他研究项目</option>
																		<option value="无依托项目研究成果">无依托项目研究成果</option>
																		<option value="“９７３”计划">“９７３”计划</option>
																		<option value="国家科技支撑计划">国家科技支撑计划</option>
																		<option value="“８６３”计划">“８６３”计划</option>
																		<option value="国家自然科学基金项目">国家自然科学基金项目</option>
																		<option value="主管部门科技项目">主管部门科技项目</option>
																		<option value="国家科技部">国家科技部</option>
																		<option value="国家发改委">国家发改委</option>
																		<option value="国务院其他部门">国务院其他部门</option>
																		<option value="省、市、自治区科技项目">省、市、自治区科技项目</option>
																		<option value="企事业单位委托科技项目">企事业单位委托科技项目</option>
																		<option value="国际合作项目">国际合作项目</option>
																		<option value="自选课题">自选课题</option>
																		<option value="其他课题">其他课题</option>
																		<option value="科技部重大专项">科技部重大专项</option></select></td>
																<td width="40%"></td>
															</tr>


														</tbody>
													</table>



													<hr>


													<div class="modal-body">


														
														<div class="form-group ">
															<a href="javascript:alert('并列第一作者用分号\';\'分开,\n学生和校外人员工号分别填入:学生、校外人员\n如:\n04192;学生;校外人员\n\n通讯作者及工号 同理')" class=""><span>如何填写?</span></a>
														</div>
														<br>
														<div class="form-group ">
															<label>第一作者:</label> <input type="text"   id="no1AutherName" 
																name="no1AutherName" value="${awards.no1AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" 
 id="no1AutherNumber"
                                                                                                    name="no1AutherNumber"
																value="${awards.no1AutherNumber}" class="form-control">
														</div>
														<br/>
														
														<div class="form-group ">
															<label>通讯作者:</label>
																	<input type="text" class="form-control "  id="communicateAutherName" 
																	name="communicateAutherName" value="">
															 <label>工号:</label> <input
																type="text" id="no10AutherNumber"   name="no10AutherNumber"
																value="${awards.no10AutherNumber}" class="form-control">
														</div>
														<br/>
														
																	
														<div class="form-group ">
															<label>第二作者:</label> <input type="text"
  id="no2AutherName" 
																name="no2AutherName" value="${awards.no2AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no2AutherNumber"
 id="no2AutherNumber"
																value="${awards.no2AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第三作者:</label> <input type="text"
  id="no3AutherName" 
																name="no3AutherName" value="${awards.no3AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no3AutherNumber" 
 id="no3AutherNumber" 
																value="${awards.no3AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第四作者:</label> <input type="text"
  id="no4AutherName" 
																name="no4AutherName" value="${awards.no4AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no4AutherNumber"
 id="no4AutherNumber" 
																value="${awards.no4AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第五作者:</label> <input type="text"
  id="no5AutherName" 
																name="no5AutherName" value="${awards.no5AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no5AutherNumber"
 id="no5AutherNumber" 
																value="${awards.no5AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第六作者:</label> <input type="text"
  id="no6AutherName" 
																name="no6AutherName" value="${awards.no6AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no6AutherNumber"
 id="no6AutherNumber" 
																value="${awards.no6AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第七作者:</label> <input type="text"
  id="no7AutherName" 
																name="no7AutherName" value="${awards.no7AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no7AutherNumber"
 id="no7AutherNumber" 
																value="${awards.no7AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第八作者:</label> <input type="text"
																name="no8AutherName"
  id="no8AutherName"                                                                                value="${awards.no8AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no8AutherNumber"
 id="no8AutherNumber" 
																value="${awards.no8AutherNumber}" class="form-control">
														</div>
														<br/>
														<div class="form-group ">
															<label>第九作者:</label> <input type="text"
  id="no9AutherName" 
																name="no9AutherName" value="${awards.no9AutherName}"
																class="form-control"> <label>工号:</label> <input
																type="text" name="no9AutherNumber"
 id="no9AutherNumber" 
																value="${awards.no9AutherNumber}" class="form-control">
														</div>
														<hr/>


<div class="form-group ">
															<a href="javascript:alert('可拍摄，可截图,\n\n第一个图片文件:包含论文首页及通讯作者\n\n第二个图片文件:包含以下任一类即可:\n 1.团队负责人\n 2.项目组负责人\n 3.师生关系\n\n图片支持格式:\njpg,jpeg,bmp,png,webp')" class=""><span>如何提供证明材料图片文件?</span></a>
														</div>
                                                                                       <br/>
														<div class="form-group ">
															<label>选择文件一:</label> <input type="file"
  id="pictureFile1" 
																name="pictureFile1" accept="image/*"
																class="required"> <br/>
                                                                                              <label>选择文件二:</label> <input type="file"
  id="pictureFile2" 
																name="pictureFile2" accept="image/*"
																class="required"> <br/>
														</div>


													</div>




													<div align="center">

														<button type="submit" class="btn btn-primary" id="submit">确定提交</button>
														<hr>

													</div>


												</form:form>
											</div>
										</div>
									</div>
									
								</div>
								<iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe>
							</div>
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


	<script src="${ctx}/views/assets/vendor/jquery/jquery.js"></script>


	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>

	<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

<script src="${ctx}/views/assets/My97DatePicker/WdatePicker.js"></script>


	<script type="text/javascript">
		$.validator.setDefaults({

 

			submitHandler : function(form) {

/* 
            var options  = {         
                type:'post',
                dataType: 'json',      
                success:function(data)      
                {    //成功执行的方法  
                     alert(data.msg);   
                } ,
            error: function(data)      
                {    //成功执行的方法  
                     alert("OKKOK");   
                }    
            };  
 */
				//$(form).ajaxSubmit(options);
 
				$(form).ajaxSubmit();
			}
		});

		$().ready(function() {

			$("form").validate({
				event : 'keyup',
				rules : {
					name : {
						required : true,
						minlength : 1
					},
					publishDate : {
						required : true,
						dateISO : true
					},
					publishWorkunit : {
						required : true
					},
					publishLocation : {
						required : true
					},
					subjectType : {
						required : true
					},
					stairSubject : {
						required : true
					},
					publishRange : {
						required : true
					},
					no1AutherName : {
						required : true
					},
					no10AutherName : {//工号
						required : true
					},
					no1AutherNumber : {
						required : true
					},
					schoolSign:{
						required : true
					},
					pictureFile1:{
						  required:true,
				    },
					pictureFile2:{
						  required:true,
					}//		extension:'jpg|jpeg|bmp|png|webp'
					

				}
			//rules.

			});//validate



//*************************************1*************************************************//
//输入框的失去焦点事件=>改变值
$('body').on('blur', '#no1AutherName', function () {
	var no1AutherName = $('#no1AutherName').val();//获取输入的名字
	if(no1AutherName != ''){//输入不为空
		$.ajax({
			type : 'get',
			url : '${ctx}/user/sereachUser',
			data : {inputName:no1AutherName},
			dataType : 'json',
			success : function(data) {
				if (data != null) {
					$('#no1AutherNumber').val(data.number);
				}
			},
		});
	}
});

//*************************************2***********************************************//
          //输入框的失去焦点事件=>改变值
          $('body').on('blur', '#no2AutherName', function () {
          	var no2AutherName = $('#no2AutherName').val();//获取输入的名字

          	if(no2AutherName != ''){//是英文,且输入不为空

          		$.ajax({
          			type : 'get',
          			url : '${ctx}/user/sereachUser',
          			data : {inputName:no2AutherName},
          			dataType : 'json',
          			success : function(data) {
          				if (data != null) {
          					$('#no2AutherNumber').val(data.number);
          				}
          			},
          			error : function(){
          			}
          		});

          	}
          });
          
        //*************************************3********************************************//
        //输入框的失去焦点事件=>改变值
        $('body').on('blur', '#no3AutherName', function () {
        	var no3AutherName = $('#no3AutherName').val();//获取输入的名字

        	if(no3AutherName != ''){//是英文,且输入不为空

        		$.ajax({
        			type : 'get',
        			url : '${ctx}/user/sereachUser',
        			data : {inputName:no3AutherName},
        			dataType : 'json',
        			success : function(data) {
        				if (data != null) {
        					$('#no3AutherNumber').val(data.number);
        				}
        			},
        			error : function(){
        			}
        		});

        	}
        });
        
      //**************************************4***********************************************//
      //输入框的失去焦点事件=>改变值
      $('body').on('blur', '#no4AutherName', function () {
      	var no4AutherName = $('#no4AutherName').val();//获取输入的名字

      	if(no4AutherName != ''){//是英文,且输入不为空

      		$.ajax({
      			type : 'get',
      			url : '${ctx}/user/sereachUser',
      			data : {inputName:no4AutherName},
      			dataType : 'json',
      			success : function(data) {
      				if (data != null) {
      					$('#no4AutherNumber').val(data.number);
      				}
      			},
      			error : function(){
      			}
      		});

      	}
      });
      
    //**************************************5***********************************************//
    //输入框的失去焦点事件=>改变值
    $('body').on('blur', '#no5AutherName', function () {
    	var no5AutherName = $('#no5AutherName').val();//获取输入的名字

    	if(no5AutherName != ''){//是英文,且输入不为空

    		$.ajax({
    			type : 'get',
    			url : '${ctx}/user/sereachUser',
    			data : {inputName:no5AutherName},
    			dataType : 'json',
    			success : function(data) {
    				if (data != null) {
    					$('#no5AutherNumber').val(data.number);
    				}
    			},
    			error : function(){
    			}
    		});

    	}
    });
    
  //**************************************6***********************************************//
  //输入框的失去焦点事件=>改变值
  $('body').on('blur', '#no6AutherName', function () {
  	var no6AutherName = $('#no6AutherName').val();//获取输入的名字

  	if(no6AutherName != ''){//是英文,且输入不为空

  		$.ajax({
  			type : 'get',
  			url : '${ctx}/user/sereachUser',
  			data : {inputName:no6AutherName},
  			dataType : 'json',
  			success : function(data) {
  				if (data != null) {
  					$('#no6AutherNumber').val(data.number);
  				}
  			},
  			error : function(){
  			}
  		});

  	}
  });
  
//*************************************7***********************************************//
//输入框的失去焦点事件=>改变值
$('body').on('blur', '#no7AutherName', function () {
	var no7AutherName = $('#no7AutherName').val();//获取输入的名字

	if(no7AutherName != ''){//是英文,且输入不为空

		$.ajax({
			type : 'get',
			url : '${ctx}/user/sereachUser',
			data : {inputName:no7AutherName},
			dataType : 'json',
			success : function(data) {
				if (data != null) {
					$('#no7AutherNumber').val(data.number);
				}
			},
			error : function(){
			}
		});

	}
});

//**************************************8**********************************************//
//输入框的失去焦点事件=>改变值
$('body').on('blur', '#no8AutherName', function () {
	var no8AutherName = $('#no8AutherName').val();//获取输入的名字

	if(no8AutherName != ''){//是英文,且输入不为空

		$.ajax({
			type : 'get',
			url : '${ctx}/user/sereachUser',
			data : {inputName:no8AutherName},
			dataType : 'json',
			success : function(data) {
				if (data != null) {
					$('#no8AutherNumber').val(data.number);
				}
			},
			error : function(){
			}
		});

	}
});

//**************************************9**********************************************//
//输入框的失去焦点事件=>改变值
$('body').on('blur', '#no9AutherName', function () {
	var no9AutherName = $('#no9AutherName').val();//获取输入的名字

	if(no9AutherName != ''){//是英文,且输入不为空

		$.ajax({
			type : 'get',
			url : '${ctx}/user/sereachUser',
			data : {inputName:no9AutherName},
			dataType : 'json',
			success : function(data) {
				if (data != null) {
					$('#no9AutherNumber').val(data.number);
				}
			},
			error : function(){
			}
		});

	}
});

//**************************************9**********************************************//
//输入框的失去焦点事件=>改变值
$('body').on('blur', '#communicateAutherName', function () {
	var communicateAutherName = $('#communicateAutherName').val();//获取输入的名字

	if(communicateAutherName != ''){//是英文,且输入不为空

		$.ajax({
			type : 'get',
			url : '${ctx}/user/sereachUser',
			data : {inputName:communicateAutherName},
			dataType : 'json',
			success : function(data) {
				if (data != null) {
					$('#no10AutherNumber').val(data.number);
				}
			},
			error : function(){
			}
		});

	}
});



		});//ready
	</script>


</body>
</html>