<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div class="modal fade" id="myModal${awards.id}" tabindex="-1"
	role="dialog" data-backdrop="true" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form id="optionForm" commandName="awards" class="form-inline"
				action="${ctx}/user/claim" method="post">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">任务认领</h4>
				</div>

				<input type="hidden" name="id" value="${awards.id}">
				<input type="hidden" name="name" value="${awards.name}">
				<input type="hidden" name="awardsType" value="${awardsType}">

				<div class="modal-body">
					<h3>名称:</h3>
					<p>${awards.name}</p>
					<br>
					<h4>所有作者:</h4>
					<p>${awards.allAutherName}</p>
					<br>
					<c:if test="${awardsType == 'chPeriodicalThesis'}">
						<h4>作者单位:</h4>
						<p>${awards.mechanism == '' ? '':awards.mechanism}</p>
						<br>
					</c:if>
					<c:if test="${awardsType == 'enPeriodicalThesis'}">
						<h4>作者地址:</h4>
						<p>${awards.period == '' ? '':awards.period}</p>
						<br>
						<h4>通讯作者地址:</h4>
						<p>${awards.page == '' ? '':awards.page}</p>
						<br>
					</c:if>
					<c:if test="${autherNum >= 1}">
						<c:if test="${awardsType != 'enPeriodicalThesis'}">
						<div class="form-group ">
							<label>第一作者：</label> <input id="no1AutherName" type="text"
								name="no1AutherName" value="${awards.no1AutherName}" readonly="true"
								class="form-control"> <label>工号：</label> <input
								id="no1AutherNumber" type="text" name="no1AutherNumber"
								value="${awards.no1AutherNumber}" class="form-control">
						</div>
						</c:if>
						<c:if test="${awardsType == 'enPeriodicalThesis'}">
						<div class="form-group ">
							<label>第一作者：</label> <input id="no1AutherName" type="text"
								name="no1AutherName" value="${awards.no1AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no1AutherNumber" type="text" name="no1AutherNumber"
								value="${awards.no1AutherNumber}" class="form-control">
						</div>
						</c:if>
					</c:if>
					<c:if test="${autherNum >= 2}">
						<div class="form-group ">
							<label>第二作者：</label> <input id="no2AutherName" type="text"
								name="no2AutherName" value="${awards.no2AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no2AutherNumber" type="text" name="no2AutherNumber"
								value="${awards.no2AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 3}">
						<div class="form-group ">
							<label>第三作者：</label> <input id="no3AutherName" type="text"
								name="no3AutherName" value="${awards.no3AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no3AutherNumber" type="text" name="no3AutherNumber"
								value="${awards.no3AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 4}">
						<div class="form-group ">
							<label>第四作者：</label> <input id="no4AutherName" type="text"
								name="no4AutherName" value="${awards.no4AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no4AutherNumber" type="text" name="no4AutherNumber"
								value="${awards.no4AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 5}">
						<div class="form-group ">
							<label>第五作者：</label> <input id="no5AutherName" type="text"
								name="no5AutherName" value="${awards.no5AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no5AutherNumber" type="text" name="no5AutherNumber"
								value="${awards.no5AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 6}">
						<div class="form-group ">
							<label>第六作者：</label> <input id="no6AutherName" type="text"
								name="no6AutherName" value="${awards.no6AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no6AutherNumber" type="text" name="no6AutherNumber"
								value="${awards.no6AutherNumber}" class="form-control">
						</div>
					</c:if>
					<c:if test="${autherNum >= 7}">
						<div class="form-group ">
							<label>第七作者：</label> <input id="no7AutherName" type="text"
								name="no7AutherName" value="${awards.no7AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no7AutherNumber" type="text" name="no7AutherNumber"
								value="${awards.no7AutherNumber}" class="form-control">
						</div>
					</c:if>
						<div class="form-group ">
							<label>通讯作者1：</label> <input id="no8AutherName" type="text"
								name="no8AutherName" value="${awards.no8AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no8AutherNumber" type="text" name="no8AutherNumber"
								value="${awards.no8AutherNumber}" class="form-control">
						</div>
						<div class="form-group ">
							<label>通讯作者2：</label> <input id="no9AutherName" type="text"
								name="no9AutherName" value="${awards.no9AutherName}"
								class="form-control"> <label>工号：</label> <input
								id="no9AutherNumber" type="text" name="no9AutherNumber"
								value="${awards.no9AutherNumber}" class="form-control">
						</div>
																<!-- selections -->
	<jsp:include page="/views/resources/selections.jsp" flush="true" />
				</div>
				<div class="modal-footer">
					<label>姓名为中文,工号请只保留'数字''学生'或'校外人员'.</label>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary"
						id="Claim${awards.id}">确定认领</button>
				</div>
			</form>
		</div>
	</div>
</div>