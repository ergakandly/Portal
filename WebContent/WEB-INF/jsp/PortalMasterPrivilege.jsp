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
<title>Master Privilege</title>
</head>

<script type="text/javascript">
	function navigateToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| isDeleteMasterOthers != 'privilege')
			document.forms[0].submit();
	
	}
</script>

<body>
	<html:form method="post" action="/portal">
		<html:hidden name="PortalForm" property="task" />
		<html:hidden name="PortalForm" property="id" />
		<html:hidden name="PortalForm" property="isDeleteMasterOthers" />

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
								<h3 id="timeline">Master Privilege</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a
									href="javascript:navigateToPage('dashboardAdmin');"> Dashboard</a></li>
								<li><i class="fa fa-th-large"></i> Master Privilege</li>
							</ul>
							<!-- END BREADCRUMB -->
						</div>
					</div>
					<!-- END ROW 12 -->
					<br />
					<!-- ROW MD6 OFFSET3 -->

					<div class="col-md-8 col-md-offset-2">
						<div class="tengah">
							<button type="button" onclick="javascript:addModal();"
								class="btn btn-primary" id="addBtn" data-toggle="modal"
								data-backdrop="static" data-target="#modalAddPrivilege">
								<span class="fa fa-plus"></span> Add New Privilege
							</button>
						</div>

						<br /> <br />
						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sort">
							<thead>
								<tr>
									<th>Privilege ID</th>
									<th>Privilege Name</th>
									<th>Description</th>
									<th>Button Action</th>
								</tr>
							</thead>
							<tbody>

								<logic:notEmpty name="PortalForm" property="listPortalPrivilege">
									<logic:iterate id="portalPrivilegeList" name="PortalForm"
										property="listPortalPrivilege">
										<tr>
											<td><bean:write name="portalPrivilegeList"
													property="privilegeId" /></td>
											<td><bean:write name="portalPrivilegeList"
													property="privilegeName" /></td>
											<td><bean:write name="portalPrivilegeList"
													property="description" /></td>
											<td class="tengah width30">
												<button type="button" class="btn btn-info editBtn"
													onclick="javascript:editModal('<bean:write name="portalPrivilegeList"
													property="privilegeId" />','<bean:write name="portalPrivilegeList"
													property="privilegeName" />','<bean:write name="portalPrivilegeList"
													property="description" />');"
													data-toggle="modal" data-target="#modalAddPrivilege" data-backdrop="static">
													<i class="fa fa-pencil"></i> Edit
												</button>
												<button type="button" class="btn btn-danger"
															data-toggle="modal" data-backdrop="static" data-target="#modalYakin"
															onclick="javascript:navigateToPage('masterPrivilege', '<bean:write name="portalPrivilegeList" property="privilegeId" />', 'privilege');">
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

		<!-- MODAL ADD/EDIT-->
		<div class="modal fade" id="modalAddPrivilege" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabel"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Privilege Name :</td>
								<td><html:text styleClass="form-control form-control-md" name="PortalForm"
										property="portalPrivilegeBean.privilegeName" /></td>
<!-- 								<td><div class="form-group"> -->
<%-- 										<html:text styleClass="form-control" name="PortalForm" --%>
<%-- 											property="portalModulBean.menuName" size="30" /> --%>
<!-- 									</div></td> -->
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><html:text styleClass="form-control form-control-md" name="PortalForm"
										property="portalPrivilegeBean.description" /></td>
<!-- 								<td><div class="form-group"> -->
<%-- 										<html:text styleClass="form-control" name="PortalForm" --%>
<%-- 											property="portalModulBean.urlMenu" size="30" /> --%>
<!-- 									</div></td> -->
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary"
							onclick="javascript:submitForm('','');">
							<i class="fa fa-check"></i> Submit
						</button>
						
<!-- 						<button type="submit" class="btn btn-primary"> -->
<!-- 							<i class="fa fa-check"></i> Submit -->
<!-- 						</button> -->

						<!-- 						<button type="submit" class="btn main-btn pull-right">Send -->
						<!-- 									a message</button> -->
<!-- 						<button type="button" class="btn btn-danger" data-dismiss="modal" -->
<!-- 							onclick="javascript:onModalClose();"> -->
<!-- 							<i class="fa fa-close"></i> Close -->
<!-- 						</button> -->
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							onclick="javascript:privilegeClose();">
							<i class="fa fa-close"></i> Close
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END MODAL ADD/EDIT -->

		<!-- MODAL HAPUS -->
		<div class="modal fade" id="modalYakin" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
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
						<button type="submit" class="btn btn-primary" >
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
			$(function() {
				$('#addBtn').click(function() {
					$("#modalLabel").html("Add New Privilege");
					$("#iconnya").html("glyphicon-camera");
				});
				$('.editBtn').click(function() {
					$("#modalLabel").html("Edit Privilege");
					$("#iconnya").html("glyphicon-calendar");
				});
			});

			$(document).ready(function() {
				$('#sort').DataTable();
			});

			function addModal() {
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = "";
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterPrivilege";
			}

			function editModal(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterPrivilege";
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = name;
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}

			function onModalClose() {
				$('#contact-form').bootstrapValidator('resetField','portalPrivilegeBean.privilegeName');
				$('#contact-form').bootstrapValidator('resetField','portalPrivilegeBean.description');
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = "";
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = "";
			}
			
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
			     'portalPrivilegeBean.privilegeName': {
			          validators: {
			              notEmpty: {
			                  message: 'Privilege Name is required and cannot be empty'
			              },
			              
			              stringLength: {
			                  message: 'Privilege Name content must be less than 20 characters',
			                  max: function (value, validator, $field) {
			                      return 20 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalPrivilegeBean.description': {
			          validators: {
			              notEmpty: {
			                  message: 'Description is required and cannot be empty'
			              },
			              
			              stringLength: {
			                  message: 'Menu URL content must be less than 100 characters',
			                  max: function (value, validator, $field) {
			                      return 100 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      }
			  }
			});
		</script>
	</html:form>
</body>
</html>