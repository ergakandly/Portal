<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="asset/css/login.css">
<link rel="shortcut icon" type="image/ico" href="asset/img/icon.ico" />
<%@include file="PartBootstrap.jsp"%>
<title>Login Page</title>
<script language="JavaScript">
	function doSubmit() {
		var frm = document.forms[0];
		if (!validateForm(frm)) {
			alert("I am an alert box!");
			return;
		}
		frm.submit();
	}
	
	function flyToPage(task) {
		document.forms[0].task.value = task;
		document.forms[0].user.value = $('#userForgotPassword').val();
		document.forms[0].submit();
	}
</script>
</head>
<body>

	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" value="login" />
		<div id="login_el">
			<h1 class="loginFont">login</h1>
			<form action="#">
				<div class="input">
					<label for="name" class="entypo-user"></label>
					<input type="text" name="user" placeholder="username"
						styleClass="form-control"
						value="<bean:write name="PortalForm" property="user"/>">
				</div>
				<div class="input">
					<label for="name" class="entypo-lock"></label>
					<%-- <html:password name="PortalForm" property="pass"></html:password> --%>
					<input type="password" name="pass" placeholder="**********"
						value="<bean:write name="PortalForm" property="pass"/>">
				</div>
				<html:submit value="Login" onclick="javascript:doSubmit();" />
				<div class="kiri">
					<small><a href="#" data-toggle="modal" data-target="#modalForgot" style="color:white">
						Forgot Password?</a></small>
				</div>
			</form>
		</div>
	</html:form>
	<!-- JAVASCRIPT -->
	<%@include file="PartJavascript.jsp"%>

	<!-- MODAL FORGOT-->
	<div class="modal fade" id="modalForgot" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" id="modalForgot">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Forgot Password</h4>
				</div>
				<div class="modal-body ">
					Please input your <strong>username</strong> to reset your password.<br />
					We will notify your new	password to your email.<br /> <br />
					<input type="text" id="userForgotPassword"
						class="form-control"
						placeholder="input your username here">

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="javascript:flyToPage('forgotPassword');">
						<i class="fa fa-check"></i> Send Me New Password
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-close"></i> Close
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END MODAL FORGOT-->
</body>
</html>