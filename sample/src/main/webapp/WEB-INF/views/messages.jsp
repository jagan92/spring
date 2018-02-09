<%@ include file="/WEB-INF/views/include.jsp"%>
<c:choose>
  <c:when test="${!empty requestScope.info}">
    <c:set var="alertType" value="info"></c:set>
	<c:set var="alertMessage" value="${requestScope.info}"></c:set>
  </c:when>
  <c:when test="${!empty requestScope.warning}">
    <c:set var="alertType" value="error"></c:set>
	<c:set var="alertMessage" value="${requestScope.warning}"></c:set>
  </c:when>
  <c:when test="${!empty requestScope.success}">
    <c:set var="alertType" value="success"></c:set>
	<c:set var="alertMessage" value="${requestScope.success}"></c:set>
  </c:when>
  <c:when test="${!empty requestScope.error}">
    <c:set var="alertType" value="error"></c:set>
	<c:set var="alertMessage" value="${requestScope.error}"></c:set>
  </c:when>
</c:choose>
<c:set var="alertTitle" value=""></c:set>
<c:if test="${!empty requestScope.title}">
	<c:set var="alertTitle" value="${requestScope.title}"></c:set>	
</c:if>
<script>
var alertType = "${alertType}"
var alertMessage = "${alertMessage}"
var alertTitle = "${alertTitle}"
if(alertType != null && alertType != "" && alertType != undefined && alertMessage != null && alertMessage != "" && alertMessage != undefined){
	callToastr(alertType, alertMessage, alertTitle);
}
</script>