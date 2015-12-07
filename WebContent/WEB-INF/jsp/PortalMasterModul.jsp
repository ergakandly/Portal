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
<title>Master Module</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		
		if(task != 'deleteModul')
			document.forms[0].submit();
	}
</script>

<body>
	<html:form method="post" action="/portal" styleId="contact-form"
		styleClass="contact-form">
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
								<h3 id="timeline">Module</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a
									href="javascript:flyToPage('dashboardAdmin');"> Dashboard</a></li>
								<li><i class="fa fa-th-large"></i> Module</li>
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
								data-backdrop="static" data-target="#modalAddModul">
								<span class="fa fa-plus"></span> Add New Module
							</button>
						</div>

						<br /> <br />
						<table
							class="table  table-striped table-hover table-condensed table-bordered"
							id="sort">
							<thead>
								<tr>
									<th>Module Name</th>
									<th>Module Link</th>
									<th>Module Icon</th>
									<th class="tengah" width="20%">Button Action</th>
								</tr>
							</thead>
							<tbody>

								<logic:notEmpty name="PortalForm" property="listPortalModulBean">
									<logic:iterate id="portalModulBeanList" name="PortalForm"
										property="listPortalModulBean">
										<tr>
											<td><bean:write name="portalModulBeanList"
													property="menuName" /></td>
											<td><bean:write name="portalModulBeanList"
													property="urlMenu" /></td>
											<td class="tengah"><span
												class="<bean:write name="portalModulBeanList" property="icon" />"></span>
											<td class="tengah">
												<button type="button" class="btn btn-info editBtn"
													onclick="javascript:editModal('<bean:write name="portalModulBeanList"
													property="menuIdModul" />','<bean:write name="portalModulBeanList"
													property="menuName" />','<bean:write name="portalModulBeanList"
													property="urlMenu" />','<bean:write name="portalModulBeanList" property="icon" />');"
													data-toggle="modal" data-target="#modalAddModul">
													<i class="fa fa-pencil"></i> Edit
												</button>
												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#modalYakin" data-backdrop="static"
													onclick="javascript:flyToPage('deleteModul', '<bean:write name="portalModulBeanList" property="menuIdModul" />');">
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
		<div class="modal fade" id="modalAddModul" tabindex="-1" role="dialog"
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
								<td class="kanan">Module Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control" name="PortalForm"
											property="portalModulBean.menuName" size="30" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Module Link <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control" name="PortalForm"
											property="portalModulBean.urlMenu" size="30" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Icon :</td>
								<td>
									<button class="btn btn-default" data-iconset="glyphicon"
										data-icon="glyphicon-camera" role="iconpicker"
										name="portalModulBean.icon"></button>
								</td>
							</tr>
						</table>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-check"></i> Submit
						</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal"
							onclick="javascript:onModalClose();">
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
					$("#modalLabel").html("Add New Module");
					$("#iconnya").html("glyphicon-camera");
				});
				$('.editBtn').click(function() {
					$("#modalLabel").html("Edit Module");
					$("#iconnya").html("glyphicon-calendar");
				});
			});

			$(document).ready(function() {
				$('#sort').DataTable();
			});

			function addModal() {
				document.forms["PortalForm"].elements["portalModulBean.menuName"].value = "";
				document.forms["PortalForm"].elements["portalModulBean.urlMenu"].value = "";
				document.forms["PortalForm"].task.value = "saveAddModule";
			}

			function editModal(id, name, link, icon) {
				document.forms["PortalForm"].task.value = "editModule";
				document.forms["PortalForm"].elements["portalModulBean.menuName"].value = name;
				document.forms["PortalForm"].elements["portalModulBean.urlMenu"].value = link;
				document.forms["PortalForm"].elements["portalModulBean.icon"].value = icon;
				document.forms["PortalForm"].id.value = id;
			}

			function onModalClose() {
				$('#contact-form').bootstrapValidator('resetField','portalModulBean.menuName');
				$('#contact-form').bootstrapValidator('resetField','portalModulBean.urlMenu');
				document.forms["PortalForm"].elements["portalModulBean.menuName"].value = "";
				document.forms["PortalForm"].elements["portalModulBean.urlMenu"].value = "";
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
			     'portalModulBean.menuName': {
			          validators: {
			              notEmpty: {
			                  message: 'Modul Name is required and cannot be empty'
			              },
			              
			              stringLength: {
			                  message: 'Modul Name content must be less than 20 characters',
			                  max: function (value, validator, $field) {
			                      return 20 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalModulBean.urlMenu': {
			          validators: {
			              notEmpty: {
			                  message: 'Menu URL is required and cannot be empty'
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