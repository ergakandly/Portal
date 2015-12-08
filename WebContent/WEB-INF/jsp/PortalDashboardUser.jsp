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

<title>Dashboard User</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].submit();
	}
</script>
<style>
body {
	padding-top: 20px;
}

.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	margin-top: 60px;
	margin-left: 5px;
}

/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}

.carousel-indicators .active {
	background: #428bca;
}
</style>

<body>
	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" />
		<html:hidden name="PortalForm" property="id" />

		<div id="wrapper">
			<%@include file="PartNavbar.jsp"%>
			<div id="page-wrapper">
				<!-- CONTAINER -->
				<div class="container-fluid"">
					<div class="row">
						<div class="col-md-12">
							<!-- PAGE HEADER -->
							<div class="page-header">
								<h3 id="timeline">Dashboard User</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i> Dashboard</li>
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
										<div class="panel-body">
										<div class="row">
											<div id="Carousel2" class="carousel slide">
												<ol class="carousel-indicators">
													<li data-target="#Carousel2" data-slide-to="0"
														class="active"></li>
													<li data-target="#Carousel2" data-slide-to="1"></li>
													<li data-target="#Carousel2" data-slide-to="2"></li>
													<li data-target="#Carousel2" data-slide-to="3"></li>
												</ol>
	
												<!-- Carousel items -->
												<div class="carousel-inner">
													<div class="item active">
														<div class="row">
															<div class="col-md-12 tengah">
																<img alt="Attendance"
																	src="/HRIS_Portal/chart.do?method=getPastAttendance">
															</div>
														</div>
													</div>
													<!--.row-->
													<div class="item">
														<div class="row">
															<div class="col-md-12 tengah">
																<img alt="Late"
																	src="/HRIS_Portal/chart.do?method=getPastLate">
															</div>
														</div>
													</div>
													<!--.row-->
													<div class="item">
														<div class="row">
															<div class="col-md-12 tengah">
																<img alt="Working Hours"
																	src="/HRIS_Portal/chart.do?method=getPastWorkingHours">
															</div>
														</div>
													</div>
													<!--.row-->
													<div class="item">
														<div class="row">
															<div class="col-md-12 tengah">
																<img alt="Leave"
																	src="/HRIS_Portal/chart.do?method=getPastLeave">
															</div>
														</div>
													</div>
													<!--.row-->
	
													<!--.item-->
												</div>
												<!--.carousel-inner-->
												<a data-slide="prev" href="#Carousel2"
													class="left carousel-control">&lt;</a> <a data-slide="next"
													href="#Carousel2" class="right carousel-control">&gt;</a>
											</div>
											<!--.Carousel-->
										</div>
									</div>
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

											<logic:notEmpty name="PortalForm"
												property="listPortalMasterRoleMenu">
												<logic:iterate id="portalMasterRoleMenuList"
													name="PortalForm" property="listPortalMasterRoleMenu">
													<bean:define id="url" name="portalMasterRoleMenuList"
														property="urlMenuRole" />
													<%
														String newurl = null;
																	String urlstr = url.toString();
																	int max = urlstr.length();

																	if (urlstr.contains("location"))
																		newurl = urlstr.substring(0, max - 1) + request.getAttribute("zx") + "'";
																	else
																		newurl = url.toString();
													%>
													<div class="col-md-3">
														<button class="btn btn-default iconDashboard"
															type="button" onclick="<%=newurl.toString()%>">
															<span
																class="<bean:write name="portalMasterRoleMenuList" property="icon" />"
																style="font-size: 60px;"></span><br>
															<h3>
																<bean:write name="portalMasterRoleMenuList"
																	property="menuName" />
															</h3>
														</button>
													</div>
												</logic:iterate>
											</logic:notEmpty>
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
				</div>
				<!-- END CONTAINER -->
			</div>
		</div>
	</html:form>
	<!-- JAVASCRIPT -->
	<%@include file="PartJavascript.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#Carousel2').carousel({
		        interval: 5000
		    })
		});
	</script>
</body>
</html>