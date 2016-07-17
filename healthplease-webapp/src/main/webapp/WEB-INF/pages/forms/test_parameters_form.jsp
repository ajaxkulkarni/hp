<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${test.fileLocation == null }">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<input type="checkbox" value="${test.id}" name="testIds" /> 
					<a data-toggle="collapse" data-parent="#accordion" href="#${test.id}">${test.name}</a>
					<c:if test="${test.reportSent == 'Y' }">
						<img src="<c:url value="/resources/images/ico.png"/>" style='float: right' height="14px" width="14px" />
					</c:if>
				</h4>
			</div>
			<input type="hidden" name="tests[${t.index}].id" value="${test.id}" />
			<div id="${test.id}" class="panel-collapse collapse">
				<div class="panel-body">
					<table class="table table-bordered">
						<thead>
							<th>Sr.No</th>
							<th>Tests</th>
							<th>Test Values</th>
							<th>Units</th>
							<th>Normal Values</th>
							<th>Remarks</th>
						</thead>
						<tbody>
							<c:forEach items="${test.parameters}" var="testParameter" varStatus="p">
								<tr>
									<td>${p.index + 1}</td>
									<td>${testParameter.name}</td>
									<td><c:if test="${test.reportSent == 'Y' }">
											<c:if test="${testParameter.type == 'D' }">
												<textarea
													name="tests[${t.index}].parameters[${p.index}].actualValue"
													rows="5" cols="50" readonly="readonly">${testParameter.actualValue}</textarea>
											</c:if>
											<c:if test="${testParameter.type != 'D' }">
												<input type="text"
													name="tests[${t.index}].parameters[${p.index}].actualValue"
													value="${testParameter.actualValue}" readonly="readonly" />
											</c:if>
										</c:if> <c:if
											test="${test.reportSent == null  || test.reportSent == 'N'}">
											<c:if test="${testParameter.type == 'D' }">
												<textarea
													name="tests[${t.index}].parameters[${p.index}].actualValue"
													rows="5" cols="50" maxlength="250">${testParameter.actualValue}</textarea>
											</c:if>
											<c:if test="${testParameter.type != 'D' }">
												<input type="text"
													name="tests[${t.index}].parameters[${p.index}].actualValue"
													value="${testParameter.actualValue}" />
											</c:if>
										</c:if> <input type="hidden"
										name="tests[${t.index}].parameters[${p.index}].id"
										value="${testParameter.id}" /></td>
									<td>${testParameter.unit}</td>
									<td>${testParameter.normalValue}</td>
									<td><c:if test="${test.reportSent == 'Y' }">
											<input type="text"
												name="tests[${t.index}].parameters[${p.index}].remark"
												value="${testParameter.remark}" readonly="readonly" />
										</c:if> <c:if
											test="${test.reportSent == null  || test.reportSent == 'N'}">
											<input type="text"
												name="tests[${t.index}].parameters[${p.index}].remark"
												value="${testParameter.remark}" />
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</c:if>

</body>
</html>