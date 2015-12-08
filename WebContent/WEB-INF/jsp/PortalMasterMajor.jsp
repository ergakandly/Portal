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
<title>Master Major</title>
</head>

<script type="text/javascript">
	function navigateToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| isDeleteMasterOthers != 'major')
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
								<h3 id="timeline">Master Major</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<logic:equal name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:navigateToPage('dashboardSuper');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Major</li>
								</logic:equal>
								<logic:notEqual name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:navigateToPage('dashboardUser');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Major</li>
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
							<button type="button" onclick="javascript:addModalMajor();"
								class="btn btn-primary" id="addBtnMajor" data-toggle="modal"
								data-backdrop="static" data-target="#modalAddMajor">
								<span class="fa fa-plus"></span> Add New Major
							</button>
						</div>

						<br /> <br />
						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sortMajor">
							<thead>
								<tr>
									<th>Name</th>
									<th>Description</th>
									<th class="tengah">Action</th>
								</tr>
							</thead>
							<tbody>
								<logic:notEmpty name="PortalForm" property="listPortalMajor">
									<logic:iterate id="portalMajorList" name="PortalForm"
										property="listPortalMajor">
										<tr>
											<td><bean:write name="portalMajorList"
													property="majorName" /></td>
											<td><bean:write name="portalMajorList"
													property="description" /></td>
											<td class="width30 tengah">

												<button type="button" class="btn btn-info editBtnMajor"
													onclick="javascript:editMajor('<bean:write name="portalMajorList"
															property="majorId" />','<bean:write name="portalMajorList"
															property="majorName" />','<bean:write name="portalMajorList"
															property="description" />');"
													data-toggle="modal" data-target="#modalAddMajor"
													data-backdrop="static">
													<i class="fa fa-pencil"></i> Edit
												</button>

												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#modalYakinMajor"
													onclick="javascript:navigateToPage('mastermajor', '<bean:write name="portalMajorList" property="majorId" />', 'major');">
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

		<!-- ADD MAJOR MODAL -->
		<div class="modal fade" id="modalAddMajor" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelMajor"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Major Name <font color="red">*</font> :
								</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalMajorBean.majorName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalMajorBean.description" />
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
							onclick="javascript:majorClose();">
							<i class="fa fa-close"></i> Close
						</button>
					</div>

				</div>
			</div>
		</div>
		<!-- END ADD MAJOR MODAL  -->

		<!-- MODAL HAPUS Major-->
		<div class="modal fade" id="modalYakinMajor" tabindex="-1"
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
							delete this Major?
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">
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
				$('#sortMajor').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});
		});
		
		$(function() {
			$('#addBtnMajor').click(function() {
				$("#modalLabelMajor").html("Add New Major");
			});
			$('.editBtnMajor').click(function() {
				$("#modalLabelMajor").html("Edit Major");
			});
		});
		
//			MODAL MAJOR
		function addMajor() {
			document.forms["PortalForm"].id.value = "undefined";
			document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = "";
			document.forms["PortalForm"].elements["portalMajorBean.description"].value = "";
			document.forms["PortalForm"].task.value = "mastermajor";
		}
		
		function editMajor(id, name, desc) {
			document.forms["PortalForm"].task.value = "mastermajor";
			document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = name;
			document.forms["PortalForm"].elements["portalMajorBean.description"].value = desc;
			document.forms["PortalForm"].id.value = id;
		}
		
		function majorClose() {
			document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = "";
			document.forms["PortalForm"].elements["portalMajorBean.description"].value = "";
			document.forms["PortalForm"].id.value = "undefined";
		}
//			SUBMIT FORM
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
				  'portalMajorBean.majorName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Major Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Major Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalMajorBean.description': {
			    	  validators: {
			    		  stringLength: {
			                  message: 'Major Description content must be less than 100 characters',
			                  max: function (value, validator, $field) {
			                      return 100 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			  }
			});
		</script>
	</html:form>
</body>
</html>