<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="PartBootstrap.jsp"%>

<title>Assign Role</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		
		if(task != 'select')
			document.forms[0].submit();
	}
</script>

<body>
	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" />
		<html:hidden name="PortalForm" property="id" />

		<div id="wrapper">
			<%@include file="PartNavbar.jsp"%>
			<div id="page-wrapper">

				<!-- CONTAINER -->
				<div class="container-fluid">

					<!-- ROW 12 -->
					<div class="row">
						<div class="col-md-12">
							<!-- PAGE HEADER -->
							<div class="page-header">
								<h3 id="timeline">Assign Role</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a
									href="javascript:flyToPage('dashboardAdmin');"> Dashboard</a></li>
								<li><i class="fa fa-crosshairs"></i> Assign Role</li>
							</ul>
							<!-- END BREADCRUMB -->
						</div>
					</div>
					<!-- END ROW 12 -->
					<br />
					<!-- ROW MD6 OFFSET3 -->
					<div class="col-md-8 col-md-offset-2">

						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sort">
							<thead>
								<tr>
									<th>NIK</th>
									<th>Employee Name</th>
									<th>Department Name</th>
									<th>Location Name</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<logic:notEmpty name="PortalForm" property="listPortal">
									<logic:iterate id="portalList" name="PortalForm"
										property="listPortal">

										<tr>
											<td><bean:write name="portalList" property="nik" /></td>
											<td><bean:write name="portalList"
													property="employeeName" /></td>
											<td><bean:write name="portalList"
													property="departmentName" /></td>
											<td><bean:write name="portalList"
													property="locationName" /></td>
											<td><logic:empty name="portalList"
													property="userEmployeeId">
													<button type="button" class="btn btn-primary"
														data-toggle="modal" data-target="#modalYakin"
														onclick="javascript:flyToPage('select', '<bean:write name="portalList" property="employeeId" />');"
														data-backdrop="static" >
														<i class="fa fa-check-square-o">Active</i>
													</button>
												</logic:empty> <logic:notEmpty name="portalList" property="userEmployeeId">
													<i class="fa fa-check" style="color: green">Activate</i>
												</logic:notEmpty></td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
							</tbody>
						</table>
						<!-- MODAL MAKE IT ACTIVE -->
						<div class="modal fade" id="modalYakin" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">Notification</h4>
									</div>
									<div class="modal-body">
										<div class="alert alert-danger kiri" role="alert">
											<i class="fa fa-exclamation-triangle"></i> Are you sure make this employee active?
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary">
											
											<i class="fa fa-check"></i> Yes
										</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">
											<i class="fa fa-close "></i> No
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- END MODAL MAKE IT ACTIVE-->
					</div>
					<!-- ROW MD6 OFFSET3 -->
				</div>
				<!-- END CONTAINER -->
			</div>
			<!-- END PAGE WRAPPER -->
		</div>
		<!-- END WRAPPER -->
	</html:form>
	<%@include file="PartJavascript.jsp"%>
	<script>
		$(document).ready(function() {
			$('#sort').DataTable();
		});
	</script>
</body>
</html>