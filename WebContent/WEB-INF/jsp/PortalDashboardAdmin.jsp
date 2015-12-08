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
							<!-- PANEL CHART-->
							<div class="panel panel-success ">
								<div class="panel-heading">
									<h5 class="panel-title">
										<i class="fa fa-bar-chart"></i> Chart
									</h5>
								</div>
								<div class="panel-body"></div>
							</div>
							<!-- END PANEL -->
						</div>
						<div class="col-md-6">
							<!-- PANEL MENU-->
							<div class="panel panel-info ">
								<div class="panel-heading">
									<h5 class="panel-title">
										<i class="fa fa-th-large"></i> Menu
									</h5>
								</div>
								<div class="panel-body tengah">
									<button class="btn btn-default iconDashboard" type="button"
										onclick="javascript:flyToPage('masterRole');">
										<span class="glyphicon glyphicon-king"
											style="font-size: 60px;"></span><br>
										<h3>Roles</h3>
									</button>
									<button class="btn btn-default iconDashboard" type="button"
										onclick="javascript:flyToPage('assignRoleEmployee');">
										<span class="glyphicon glyphicon-screenshot"
											style="font-size: 60px;"></span><br>
										<h3>Activation</h3>
									</button>
									<button class="btn btn-default iconDashboard" type="button"
										onclick="javascript:flyToPage('masterModul');">
										<span class="glyphicon glyphicon-th-large"
											style="font-size: 60px;"></span><br>
										<h3>Modules</h3>
									</button>
									<br> <br>
								</div>
							</div>
							<!-- PANEL -->

							<!-- PANEL NOTIFICATION-->
							<div class="panel panel-danger">
								<div class="panel-heading">
									<h5 class="panel-title">
										<i class="fa fa-bell"></i> Notification
									</h5>
								</div>
								<div class="panel-body">
									<ul>
										<li>Guntur Gozali has approved your request leave</li>
										<li>Satria has approved your request leave</li>
										<li>Donny Setiawan has approved your request leave</li>
										<li>Erga Kandly has approved your request leave</li>
										<li>Edwin has approved your request leave</li>
									</ul>
								</div>
							</div>
							<!-- END PANEL -->
						</div>
						<div class="col-md-12">
							<!-- PANEL CHART-->
							<div class="panel panel-info">
								<div class="panel-heading">
									<h5 class="panel-title">
										<i class="fa fa-info-circle"></i> Next Leave Day
									</h5>
								</div>
								<div class="panel-body">
									<ul>
										<li>30 Desember 2015 : Leave Mass New Year</li>
										<li>1 Januari 2016 : New Year 2016</li>
									</ul>
								</div>
							</div>
							<!-- END PANEL -->
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