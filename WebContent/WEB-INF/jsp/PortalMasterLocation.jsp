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
<title>Master Location</title>
</head>

<script type="text/javascript">
	function navigateToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| isDeleteMasterOthers != 'location')
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
								<h3 id="timeline">Master Location</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a
									href="<bean:write name="PortalForm" property="urlPortal"/><%= request.getAttribute("zx") %>"> Dashboard</a></li>
								<li><i class="fa fa-th-large"></i> Master Location</li>
							</ul>
							<!-- END BREADCRUMB -->
						</div>
					</div>
					<!-- END ROW 12 -->
					<br />
					<!-- ROW MD6 OFFSET3 -->

					<div class="col-md-8 col-md-offset-2">
						<div class="tengah">
							<button type="button" onclick="javascript:addModalLocation();"
								class="btn btn-primary" id="addBtnLocation" data-toggle="modal"
								data-backdrop="static" data-target="#modalAddLocation">
								<span class="fa fa-plus"></span> Add New Location
							</button>
						</div>

						<br /> <br />
						<table
							class="table table-striped table-hover table-condensed table-bordered"
							id="sortLocation">
							<thead>
								<tr>
									<th>Location Name</th>
									<th>Description</th>
									<th class="tengah">Action</th>
								</tr>
							</thead>
							<tbody>
								<logic:notEmpty name="PortalForm" property="listPortalLocation">
									<logic:iterate id="portalLocationList" name="PortalForm"
										property="listPortalLocation">
										<tr>
											<td><bean:write name="portalLocationList"
													property="locationName" /></td>
											<td><bean:write name="portalLocationList"
													property="description" /></td>
											<td class="width30 tengah">

												<button type="button" class="btn btn-info editBtnLocation"
													onclick="javascript:editLocation('<bean:write name="portalLocationList"
															property="locationId" />','<bean:write name="portalLocationList"
															property="locationName" />','<bean:write name="portalLocationList"
															property="description" />');"
													data-toggle="modal" data-target="#modalAddLocation"
													data-backdrop="static">
													<i class="fa fa-pencil"></i> Edit
												</button>

												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#modalYakinLocation"
													onclick="javascript:navigateToPage('masterLocation', '<bean:write name="portalLocationList" property="locationId" />', 'location');">
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

		<!-- ADD LOCATION MODAL -->
		<div class="modal fade" id="modalAddLocation" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelLocation"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Location Name <font color="red">*</font>
									:
								</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalLocationBean.locationName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalLocationBean.description" />
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
							onclick="javascript:locationClose();">
							<i class="fa fa-close"></i> Close
						</button>

					</div>
				</div>
			</div>
		</div>
		<!-- END ADD LOCATION MODAL  -->

		<!-- MODAL HAPUS -->
		<div class="modal fade" id="modalYakinLocation" tabindex="-1"
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
							delete this Location?
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
				$('#sortLocation').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
		});
		
		$(function() {
			$('#addBtnLocation').click(function() {
				$("#modalLabelLocation").html("Add New Location");
			});
			$('.editBtnLocation').click(function() {
				$("#modalLabelLocation").html("Edit Location");
			});
		});
		
//			MODAL LOCATION
		function addLocation() {
			document.forms["PortalForm"].id.value = "undefined";
			document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = "";
			document.forms["PortalForm"].elements["portalLocationBean.description"].value = "";
			document.forms["PortalForm"].task.value = "masterLocation";
		}
		
		function editLocation(id, name, desc) {
			document.forms["PortalForm"].task.value = "masterLocation";
			document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = name;
			document.forms["PortalForm"].elements["portalLocationBean.description"].value = desc;
			document.forms["PortalForm"].id.value = id;
		}
		
		function locationClose() {
			document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = "";
			document.forms["PortalForm"].elements["portalLocationBean.description"].value = "";
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
				  'portalLocationBean.locationName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Location Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Location Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalLocationBean.description': {
			    	  validators: {
			        	  stringLength: {
			                  message: 'Location Description content must be less than 100 characters',
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