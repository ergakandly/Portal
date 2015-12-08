<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="PartBootstrap.jsp"%>

<title>Dashboard Admin</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].submit();
	}
</script>

<body>
	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" />
		<html:hidden name="PortalForm" property="id" />

		<%@include file="PartNavbar.jsp"%>

		<!-- CONTAINER -->
		<div class="container-fluid">

			<!-- ROW 12 -->
			<div class="row">
				<div class="col-md-12">
					<!--JUDUL-->
					<div class="page-header">
						<h3 id="timeline">Dashboard</h3>
					</div>
					<!-- END JUDUL -->

					<!-- BREADCRUMB -->
					<ul class="breadcrumb">
						<li><i class="fa fa-dashboard"></i> Dashboard</a></li>
					</ul>
					<!-- END BREADCRUMB -->
					<br /> <br /> <br />
					<div class="row">
						<div class="col-md-6">
							<h3>
								<small><b>CHART</b></small>
							</h3>
							<hr style="margin: -5px 0 5px 0">
						</div>
						<div class="col-md-6">
							<h3>
								<small><b>MENU</b></small>
							</h3>
							<hr style="margin: -5px 0 5px 0">
							</td>
							<button class="btn btn-default iconDashboard" type="button"
								onclick="javascript:flyToPage('masterRole');">
								<span class="glyphicon glyphicon-king" style="font-size: 100px;"></span><br>
								<h3>Roles</h3>
							</button>
							<button class="btn btn-default iconDashboard" type="button"
								onclick="javascript:flyToPage('assignRoleEmployee');">
								<span class="glyphicon glyphicon-screenshot"
									style="font-size: 100px;"></span><br>
								<h3>User Activation</h3>
							</button>
							<button class="btn btn-default iconDashboard" type="button"
								onclick="javascript:flyToPage('masterModul');">
								<span class="glyphicon glyphicon-th-large"
									style="font-size: 100px;"></span><br>
								<h3>Modules</h3>
							</button>
							<br> <br>
						</div>
						<div class="col-md-12">
							<div class="alert alert-info alert-dismissible" role="alert">
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<i class="fa fa-info-circle"></i> <strong>Notification : </strong> 1 Pending Request
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- END ROW 12 -->
		</div>
		<!-- END CONTAINER -->

	</html:form>
	<!-- JAVASCRIPT -->
	<%@include file="PartJavascript.jsp"%>
</body>
</html>