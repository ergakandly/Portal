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

<title>Dashboard Super Admin</title>
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
					<br />
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

							<!-- PANEL LEAVE-->
							<div class="panel panel-info">
								<div class="panel-heading">
									<h5 class="panel-title">
										<i class="fa fa-info-circle"></i> Next Leave Day
									</h5>
								</div>
								<div class="panel-body">
									<table align="center"
										class="table table-striped table-hover table-condensed">
										<tbody>
											<tr>
												<td class="kanan fontBold" width="25%">30 Desember 2015 :</td>
												<td width="75%">Leave Mass New Year</td>
											</tr>
											<tr>
												<td class="kanan fontBold">1 Januari 2016 :</td>
												<td>New Year 2016</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- END PANEL -->
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
									<div class="row">
										<div id="Carousel" class="carousel slide">
											<ol class="carousel-indicators">
												<li data-target="#Carousel" data-slide-to="0" class="active"></li>
												<li data-target="#Carousel" data-slide-to="1"></li>
											</ol>

											<!-- Carousel items -->
											<div class="carousel-inner">

												<div class="item active">
													<div class="row">
														<div class="col-md-4">
															<button class="btn btn-default iconDashboard"
																type="button"
																onclick="javascript:flyToPage('masterRole');">
																<span class="glyphicon glyphicon-king"
																	style="font-size: 60px;"></span><br>
																<h3>Roles</h3>
															</button>
														</div>
														<div class="col-md-4">
															<button class="btn btn-default iconDashboard"
																type="button"
																onclick="javascript:flyToPage('assignRoleEmployee');">
																<span class="glyphicon glyphicon-screenshot"
																	style="font-size: 60px;"></span><br>
																<h3>Activation</h3>
															</button>
														</div>
														<div class="col-md-4">
															<button class="btn btn-default iconDashboard"
																type="button"
																onclick="javascript:flyToPage('masterModul');">
																<span class="glyphicon glyphicon-th-large"
																	style="font-size: 60px;"></span><br>
																<h3>Modules</h3>
															</button>
														</div>
													</div>
													<!--.row-->
												</div>
												<!--.item-->

												<div class="item">
													<div class="row">
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
													<!--.row-->
												</div>
												<!--.item-->
											</div>
											<!--.carousel-inner-->
											<a data-slide="prev" href="#Carousel"
												class="left carousel-control">&lt;</a> <a data-slide="next"
												href="#Carousel" class="right carousel-control">&gt;</a>
										</div>
										<!--.Carousel-->

									</div>
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
									<table align="center"
										class="table table-striped table-hover table-condensed">
										<tbody>
											<tr>
												<td>Guntur2 Gozali has approved your request leave</td>
											</tr>
											<tr>
												<td>Guntur Gozali has approved your request leave</td>
											</tr>
											<tr>
												<td>Guntur Gozali has approved your request leave</td>
											</tr>
											<tr>
												<td>Guntur Gozali has approved your request leave</td>
											</tr>
											<tr>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- END PANEL -->
						</div>
					</div>
				</div>
			</div>
			<!-- END ROW 12 -->
		</div>
		</div>
		<!-- END ROW 12 -->
		</div>
		<!-- END CONTAINER -->

	</html:form>
	<!-- JAVASCRIPT -->
	<%@include file="PartJavascript.jsp"%>
	<script>
	$(document).ready(function() {
	    $('#Carousel').carousel({
	        interval: 5000
	    })
	});
	$(document).ready(function() {
	    $('#Carousel2').carousel({
	        interval: 5000
	    })
	});
	</script>
</body>
</html>