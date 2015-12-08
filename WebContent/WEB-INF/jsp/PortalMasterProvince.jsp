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
<title>Master Province</title>
</head>

<script type="text/javascript">
	function navigateToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| isDeleteMasterOthers != 'province')
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
								<h3 id="timeline">Master Province</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<logic:equal name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:navigateToPage('dashboardSuper');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Province</li>
								</logic:equal>
								<logic:notEqual name="PortalForm" property="userExist" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:navigateToPage('dashboardUser');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Master Province</li>
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
							<button type="button" onclick="javascript:addModalProvince();"
								class="btn btn-primary" id="addBtnProvince" data-toggle="modal"
								data-backdrop="static" data-target="#modalAddProvince">
								<span class="fa fa-plus"></span> Add Province
							</button>
						</div>

						<br /> <br />
						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sort">
							<table
								class="table table-striped table-hover table-condensed table-bordered"
								id="sortProvince">
								<thead>
									<tr>
										<th>Province ID</th>
										<th>Province Name</th>
										<th class="tengah">Action</th>
									</tr>
								</thead>
								<tbody>
									<logic:notEmpty name="PortalForm" property="listPortalProvince">
										<logic:iterate id="portalProvinceList" name="PortalForm"
											property="listPortalProvince">
											<tr>
												<td><bean:write name="portalProvinceList"
														property="provinceId" /></td>
												<td><bean:write name="portalProvinceList"
														property="provinceName" /></td>
												<td class="width30 tengah">
													<button type="button" class="btn btn-info editBtnProvince"
														onclick="javascript:editProvince('<bean:write name="portalProvinceList"
															property="provinceId" />','<bean:write name="portalProvinceList"
															property="provinceName" />');"
														data-toggle="modal" data-target="#modalAddProvince"
														data-backdrop="static">
														<i class="fa fa-pencil"></i> Edit
													</button>

													<button type="button" class="btn btn-danger"
														data-toggle="modal" data-backdrop="static" data-target="#modalYakinProvince"
														onclick="javascript:navigateToPage('masterProvince', '<bean:write name="portalProvinceList" property="provinceId" />', 'province');">
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

							<!-- ADD PROVINCE MODAL -->
							<div class="modal fade" id="modalAddProvince" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 id="modalLabelProvince"></h4>
										</div>
										<div class="modal-body">
											<table class="table table-borderless">
												<tr>
													<td class="kanan">Province Name <font color="red">*</font>
														:
													</td>
													<td><div class="form-group">
															<html:text styleClass="form-control form-control-md"
																name="PortalForm"
																property="portalProvinceBean.provinceName" />
														</div></td>
												</tr>
											</table>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												onclick="javascript:submitForm('','');">
												<i class="fa fa-check"></i> Submit
											</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal" onclick="javascript:provinceClose();">
												<i class="fa fa-close"></i> Close
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- END ADD PROVINCE MODAL  -->

							<!-- MODAL HAPUS Province-->
							<div class="modal fade" id="modalYakinProvince" tabindex="-1"
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
												<i class="fa fa-exclamation-triangle"></i> Are you sure want
												to delete this province?
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
							<!-- END MODAL HAPUS-->
							<%@include file="PartJavascript.jsp"%>
							<script type="text/javascript">
		$(document).ready(function() {
			$('#sortProvince').dataTable({
				"columns" : [ null, null, {
					"orderable" : false
				} ]
			});
		});
		
		$(function() {
			$('#addBtnProvince').click(function() {
				$("#modalLabelProvince").html("Add New Province");
			});
			$('.editBtnProvince').click(function() {
				$("#modalLabelProvince").html("Edit Province");
			});
		});
		

		
//			MODAL PROVINCE
		function addProvince() {
			document.forms["PortalForm"].id.value = "undefined";
//				document.forms["PortalForm"].elements["portalProvinceBean.provinceId"].value = "";
			document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = "";
			document.forms["PortalForm"].task.value = "masterProvince";
		}
		
		function editProvince(id, name) {
			document.forms["PortalForm"].task.value = "masterProvince";
			document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = name;
//				document.forms["PortalForm"].elements["portalProvinceBean.provinceId"].value = id;
			document.forms["PortalForm"].id.value = id;
		}
		
		function provinceClose() {
			document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = "";
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
				  'portalProvinceBean.provinceName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Province Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Province Name content must be less than 30 characters',
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