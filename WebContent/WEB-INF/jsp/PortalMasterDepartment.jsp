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
<link rel="stylesheet" type="text/css" href="asset/css/sidebar.css">
<title>Master Department</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| isDeleteMasterOthers != 'city')
			document.forms[0].submit();
	
	}
</script>
<body>
	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" />
		<html:hidden name="PortalForm" property="id" />
		<html:hidden name="PortalForm" property="isDeleteMasterOthers" />

		<div id="wrapper">
			<%@include file="PartNavbar2.jsp"%>
			<div id="page-wrapper">

				<!-- CONTAINER -->
				<div class="container-fluid">

					<!-- ROW 12 -->
					<div class="row">
						<div class="col-md-12">
							<!-- PAGE HEADER -->
							<div class="page-header">
								<h3 id="timeline">Master Department</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<logic:equal name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:flyToPage('dashboardSuper');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Department</li>
								</logic:equal>
								<logic:notEqual name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:flyToPage('dashboardUser');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Department</li>
								</logic:notEqual>
							</ul>
							<!-- END BREADCRUMB -->
						</div>
					</div>
					<!-- END ROW 12 -->
					<br />
					<!-- ROW MD6 OFFSET3 -->

					<div class="col-md-8 col-md-offset-2">
						<div class="tengah">
							<button type="button" onclick="javascript:addModalDepartment();"
								class="btn btn-primary" id="addBtnDepartment"
								data-toggle="modal" data-backdrop="static"
								data-target="#modalAddDepartment">
								<span class="fa fa-plus"></span> Add New Department
							</button>
						</div>

						<br /> <br />
						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sortDepartment">
							<thead>
								<tr>
									<th>Department Name</th>
									<th>Description</th>
									<th class="tengah">Action</th>
								</tr>
							</thead>
							<tbody>
								<logic:notEmpty name="PortalForm"
									property="listPortalDepartment">
									<logic:iterate id="portalDepartmentList" name="PortalForm"
										property="listPortalDepartment">
										<tr>
											<td><bean:write name="portalDepartmentList"
													property="msDepartmentName" /></td>
											<td><bean:write name="portalDepartmentList"
													property="description" /></td>
											<td class="width30 tengah">

												<button type="button" class="btn btn-info editBtnDepartment"
													onclick="javascript:editDepartment('<bean:write name="portalDepartmentList"
															property="departmentId" />','<bean:write name="portalDepartmentList"
															property="msDepartmentName" />','<bean:write name="portalDepartmentList"
															property="description" />');"
													data-toggle="modal" data-target="#modalAddDepartment"
													data-backdrop="static">
													<i class="fa fa-pencil"></i> Edit
												</button>

												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#modalYakinDepartment"
													onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalDepartmentList" property="departmentId" />', 'department');">
													<i class="fa fa-trash"></i> Delete
												</button>

											</td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
							</tbody>
						</table>
					</div>
				</div>
				<!-- ROW MD6 OFFSET3 -->
			</div>
		</div>

		<!-- ADD DEPARTMENT MODAL -->
		<div class="modal fade" id="modalAddDepartment" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelDepartment"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Department Name <font color="red">*</font>
									:
								</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm"
											property="portalDepartmentBean.msDepartmentName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalDepartmentBean.description" />
									</div></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">

						<button type="button" class="btn btn-primary"
							onclick="javascript:submitForm('','');">
							<i class="fa fa-check"></i> Submit
						</button>

						<button type="button" class="btn btn-danger" data-dismiss="modal"
							onclick="javascript:departmentClose();">
							<i class="fa fa-close"></i> Close
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END ADD DEPARTMENT MODAL  -->

		<!-- MODAL HAPUS Department-->
		<div class="modal fade" id="modalYakinDepartment" tabindex="-1"
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
							<i class="fa fa-exclamation-triangle"></i> Are you sure want to
							delete this record?
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalDepartmentList" property="departmentId" />', 'department');">
							<i class="fa fa-check"></i> Yes
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<i class="fa fa-close "></i> No
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END MODAL HAPUS-->

		<%@include file="PartJavascript.jsp"%>
		<script type="text/javascript">
		$(document).ready(function() {
			$(document).ready(function() {
				$('#sortDepartment').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});
		});
		
		$(function() {
			$('#addBtnDepartment').click(function() {
				$("#modalLabelDepartment").html("Add New Department");
			});
			$('.editBtnDepartment').click(function() {
				$("#modalLabelDepartment").html("Edit Department");
			});
		});
		
//			MODAL DEPARTMENT
		function addDepartment() {
			document.forms["PortalForm"].id.value = "undefined";
			document.forms["PortalForm"].elements["portalDepartmentBean.msDepartmentName"].value = "";
			document.forms["PortalForm"].elements["portalDepartmentBean.description"].value = "";
			document.forms["PortalForm"].task.value = "masterOthers";
		}
		
		function editDepartment(id, name, desc) {
			document.forms["PortalForm"].task.value = "masterOthers";
			document.forms["PortalForm"].elements["portalDepartmentBean.msDepartmentName"].value = name;
			document.forms["PortalForm"].elements["portalDepartmentBean.description"].value = desc;
			document.forms["PortalForm"].id.value = id;
		}
		
		function departmentClose() {
			document.forms["PortalForm"].elements["portalDepartmentBean.msDepartmentName"].value = "";
			document.forms["PortalForm"].elements["portalDepartmentBean.description"].value = "";
			document.forms["PortalForm"].id.value = "undefined";
		}
		
//		SUBMIT FORM
		function submitForm(task, id) {

						var method = task==""? document.forms["PortalForm"].task.value:task;

						if(id != "")
							document.forms["PortalForm"].id.value= id;

						document.forms["PortalForm"].submit();
					}
			
		</script>
		<script>
			$('#contact-form').bootstrapValidator({
			//  live: 'disabled',
			  message: 'This value is not valid',
			  feedbackIcons: {
			      valid: 'glyphicon glyphicon-ok',
			      invalid: 'glyphicon glyphicon-remove',
			      validating: 'glyphicon glyphicon-refresh'
			  },
			  fields: {
				  'portalCityBean.cityName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'City Name is required'
			              },
			              
			              stringLength: {
			                  message: 'City Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      }
			  }
			});
		</script>
	</html:form>
</body>
</html>