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
									<logic:notEmpty scope="request" name="specialDate">
											<table align="center"
												class="table table-striped table-hover table-condensed">
												<tbody>
													<logic:iterate scope="request" name="specialDate" id="record">
														<tr>
															<td class="kanan fontBold" width="25%">
															<bean:write name="record" property="date" />:</td>
															<td width="75%">
															<logic:equal name="record" property="type" value="1">
																Libur
															</logic:equal>
															<logic:equal name="record" property="type" value="2">
																Cuti Bersama
															</logic:equal>
															<bean:write name="record" property="description"/></td>
														</tr>
													</logic:iterate>
												</tbody>
											</table>
									</logic:notEmpty>
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
										
										<logic:notEqual name="noNotification" scope="request" value="1">
											<div class="alert alert-danger alert-dismissible" role="alert">
												<button type="button" class="close" data-dismiss="alert" aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<i class="fa fa-info-circle"></i>
												<logic:notEqual name="totalPendingLeaveApproval" scope="request" value="0">
													<bean:write name="totalPendingLeaveApproval" scope="request"/>
													leave request(s) is waiting for your approval
												</logic:notEqual>
												
												<logic:notEqual name="totalPendingExtraQuotaApproval" scope="request" value="0">
													<bean:write name="totalPendingExtraQuotaApproval" scope="request"/>
													extra quota request(s) is waiting for your approval
												</logic:notEqual>
													
												<logic:notEqual name="totalPendingAttendanceApproval" scope="request" value="0">
													<bean:write name="totalPendingAttendanceApproval" scope="request"/>
													attendance request(s) is waiting for your approval
												</logic:notEqual>
											</div>
										</logic:notEqual>
										
										<table align="center" class="table table-striped table-hover table-condensed">
											<tbody>
												<logic:iterate id="iterateNotifLeave" name="notifApprovedLeave" scope="request">
													<tr>
														<td>
															<bean:write name="iterateNotifLeave" property="name"/> has 
															<bean:write name="iterateNotifLeave" property="status"/> your leave request for 
															<bean:write name="iterateNotifLeave" property="dateOne"/> to 
															<bean:write name="iterateNotifLeave" property="dateTwo"/> on 
															<bean:write name="iterateNotifLeave" property="approvalDate"/>
														</td>
													</tr>
												</logic:iterate>
												<logic:iterate id="iterateNotifExtra" name="notifApprovedExtraLeave" scope="request">
													<tr>
														<td>
															<bean:write name="iterateNotifExtra" property="name"/> has 
															<bean:write name="iterateNotifExtra" property="status"/> your extra leave quota request for 
															<bean:write name="iterateNotifExtra" property="dateOne"/> on 
															<bean:write name="iterateNotifExtra" property="approvalDate"/>
														</td>
													</tr>
												</logic:iterate>
												<logic:iterate id="iterateNotifAttendance" name="notifApprovedAttendance" scope="request">
													<tr>
														<td>
															<bean:write name="iterateNotifAttendance" property="name"/> has
															<bean:write name="iterateNotifAttendance" property="status"/> your attendance request for  
															<bean:write name="iterateNotifAttendance" property="dateOne"/> to 
															<bean:write name="iterateNotifAttendance" property="dateTwo"/> on 
															<bean:write name="iterateNotifAttendance" property="approvalDate"/>
														</td>
													</tr>
												</logic:iterate>
												<logic:empty name="notifApprovedLeave" scope="request">
													<logic:empty name="notifApprovedExtraLeave" scope="request">
														<logic:empty name="notifApprovedAttendance" scope="request">
															<tr>
																<td>
																	You have no recently notification.
																</td>
															</tr>	
														</logic:empty>
													</logic:empty>
												</logic:empty>
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
		<!-- END CONTAINER -->

	</html:form>
	<!-- JAVASCRIPT -->
	<%@include file="PartJavascript.jsp"%>
</body>
</html>