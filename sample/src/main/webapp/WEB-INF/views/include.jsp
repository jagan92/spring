<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tld/sample.tld" prefix="sample"%>
<%@ page import="com.sample.constants.AppConstants"%>
<%@ page import="com.sample.logging.LogManager"%>
<%@ page import="com.sample.logging.Logger"%>
<%@ page import="com.sample.entity.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page session="true"%>
<c:set var="loginUser" value="<%= session.getAttribute(AppConstants.LOGIN_USER) %>" />
<c:set var="logUserRole" value="<%= session.getAttribute(AppConstants.LOG_USER_ROLE) %>" />
<c:set var="appType" value="<%= session.getAttribute(AppConstants.APP_TYPE) %>" />