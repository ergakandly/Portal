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

<title>Master Lainnya</title>
</head>

<script type="text/javascript">
	function flyToPage(task, id, isDeleteMasterOthers) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].isDeleteMasterOthers.value = isDeleteMasterOthers;
		
		if(task=='dashboardAdmin'|| (isDeleteMasterOthers != 'province' && isDeleteMasterOthers != 'city' && isDeleteMasterOthers != 'major' && isDeleteMasterOthers != 'department' && isDeleteMasterOthers != 'location' && isDeleteMasterOthers != 'position' && isDeleteMasterOthers != 'bank'))
			document.forms[0].submit();

	}
</script>

<body>
	<html:form method="post" action="/portal" styleId="contact-form"
		styleClass="contact-form">
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
								<h3 id="timeline">Module</h3>
							</div>
							<!-- END PAGE HEADER -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<logic:equal property="userExist" name="PortalForm" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:flyToPage('dashboardSuper');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Others</li>
								</logic:equal>
								<logic:notEqual property="userExist" name="PortalForm" value="super">
									<li><i class="fa fa-dashboard"></i><a
										href="javascript:flyToPage('dashboardUser');"> Dashboard</a></li>
									<li><i class="fa fa-th-large"></i> Others</li>
								</logic:notEqual>
							</ul>
							<!-- END BREADCRUMB -->
						</div>
					</div>
					<!-- END ROW 12 -->
					<br />

					<!-- PANEL PROVINCE-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Province
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalProvince();"
									class="btn btn-primary" id="addBtnProvince" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddProvince">
									<span class="fa fa-plus"></span> Add Province
								</button>
								<br /> <br />
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
										<logic:notEmpty name="PortalForm"
											property="listPortalProvince">
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
															data-toggle="modal" data-target="#modalYakinProvince"
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalProvinceList" property="provinceId" />', 'province');">
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
					</div>
					<!-- END PANEL PROVINCE-->

					<!-- PANEL CITY-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master City
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalCity();"
									class="btn btn-primary" id="addBtnCity" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddCity">
									<span class="fa fa-plus"></span> Add New City
								</button>
								<br /> <br />
								<table
									class="table table-striped table-hover table-condensed table-bordered"
									id="sortCity">
									<thead>
										<tr>
											<th>Province Name</th>
											<th>City Name</th>
											<th class="tengah">Action</th>
										</tr>
									</thead>
									<tbody>
										<logic:notEmpty name="PortalForm" property="listPortalCity">
											<logic:iterate id="portalCityList" name="PortalForm"
												property="listPortalCity">
												<tr>
													<td><bean:write name="portalCityList"
															property="cityProvinceName" /></td>
													<td><bean:write name="portalCityList"
															property="cityName" /></td>
													<td class="width30 tengah">

														<button type="button" class="btn btn-info editBtnCity"
															onclick="javascript:editCity('<bean:write name="portalCityList"
															property="cityId" />','<bean:write name="portalCityList"
															property="cityProvinceId" />','<bean:write name="portalCityList"
															property="cityName" />');"
															data-toggle="modal" data-target="#modalAddCity"
															data-backdrop="static">
															<i class="fa fa-pencil"></i> Edit
														</button>
														<button type="button" class="btn btn-danger"
															data-toggle="modal" data-target="#modalYakinCity"
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalCityList" property="cityId" />', 'city');">
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
					</div>
					<!-- END PANEL CITY-->

					<!-- PANEL MAJOR-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Major
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalMajor();"
									class="btn btn-primary" id="addBtnMajor" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddMajor">
									<span class="fa fa-plus"></span> Add New Major
								</button>
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
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalMajorList" property="majorId" />', 'major');">
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
					</div>
					<!-- END PANEL MAJOR-->

					<!-- PANEL DEPARTMENT-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Department
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalDepartment();"
									class="btn btn-primary" id="addBtnDepartment"
									data-toggle="modal" data-backdrop="static"
									data-target="#modalAddDepartment">
									<span class="fa fa-plus"></span> Add New Department
								</button>
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

														<button type="button"
															class="btn btn-info editBtnDepartment"
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
					</div>
					<!-- END PANEL DEPARTMENT-->

					<!-- PANEL LOCATION-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Location
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalLocation();"
									class="btn btn-primary" id="addBtnLocation" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddLocation">
									<span class="fa fa-plus"></span> Add New Location
								</button>
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
										<logic:notEmpty name="PortalForm"
											property="listPortalLocation">
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
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalLocationList" property="locationId" />', 'location');">
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
					</div>
					<!-- END PANEL LOCATION-->

					<!-- PANEL POSITION-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Position
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalPosition();"
									class="btn btn-primary" id="addBtnPosition" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddPosition">
									<span class="fa fa-plus"></span> Add New Position
								</button>
								<br /> <br />
								<table
									class="table table-striped table-hover table-condensed table-bordered"
									id="sortPosition">
									<thead>
										<tr>
											<th>Position Name</th>
											<th>Description</th>
											<th class="tengah">Action</th>
										</tr>
									</thead>
									<tbody>
										<logic:notEmpty name="PortalForm"
											property="listPortalPosition">
											<logic:iterate id="portalPositionList" name="PortalForm"
												property="listPortalPosition">
												<tr>
													<td><bean:write name="portalPositionList"
															property="positionName" /></td>
													<td><bean:write name="portalPositionList"
															property="description" /></td>
													<td class="width30 tengah">

														<button type="button" class="btn btn-info editBtnPosition"
															onclick="javascript:editPosition('<bean:write name="portalPositionList"
															property="positionId" />','<bean:write name="portalPositionList"
															property="positionName" />','<bean:write name="portalPositionList"
															property="description" />');"
															data-toggle="modal" data-target="#modalAddPosition"
															data-backdrop="static">
															<i class="fa fa-pencil"></i> Edit
														</button>

														<button type="button" class="btn btn-danger"
															data-toggle="modal" data-target="#modalYakinPosition"
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalPositionList" property="positionId" />', 'position');">
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
					</div>
					<!-- END PANEL POSITION-->

					<!-- PANEL BANK-->
					<div class="col-md-6">
						<div class="panel panel-info ">
							<div class="panel-heading">
								<h5 class="panel-title">
									<i class="fa fa-lock"></i> Master Bank
								</h5>
							</div>
							<div class="panel-body">
								<button type="button" onclick="javascript:addModalBank();"
									class="btn btn-primary" id="addBtnBank" data-toggle="modal"
									data-backdrop="static" data-target="#modalAddBank">
									<span class="fa fa-plus"></span> Add New Bank
								</button>
								<br /> <br />
								<table
									class="table table-striped table-hover table-condensed table-bordered"
									id="sortBank">
									<thead>
										<tr>
											<th>Bank Name</th>
											<th>Description</th>
											<th class="tengah">Action</th>
										</tr>
									</thead>
									<tbody>
										<logic:notEmpty name="PortalForm" property="listPortalBank">
											<logic:iterate id="portalBankList" name="PortalForm"
												property="listPortalBank">
												<tr>
													<td><bean:write name="portalBankList"
															property="bankName" /></td>
													<td><bean:write name="portalBankList"
															property="description" /></td>
													<td class="width30 tengah">

														<button type="button" class="btn btn-info editBtnBank"
															onclick="javascript:editBank('<bean:write name="portalBankList"
															property="bankId" />','<bean:write name="portalBankList"
															property="bankName" />','<bean:write name="portalBankList"
															property="description" />');"
															data-toggle="modal" data-target="#modalAddBank"
															data-backdrop="static">
															<i class="fa fa-pencil"></i> Edit
														</button>

														<button type="button" class="btn btn-danger"
															data-toggle="modal" data-target="#modalYakinBank"
															onclick="javascript:flyToPage('masterOthers', '<bean:write name="portalBankList" property="bankId" />', 'bank');">
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
					</div>
					<!-- END PANEL BANK-->
				</div>
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
								<td class="kanan">Province Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalProvinceBean.provinceName" />
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
							onclick="javascript:provinceClose();">
							<i class="fa fa-close"></i> Close
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END ADD PROVINCE MODAL  -->

		<!-- ADD CITY MODAL -->
		<div class="modal fade" id="modalAddCity" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelCity"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Province Id :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalCityBean.cityProvinceId" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">City Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalCityBean.cityName" />
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
							onclick="javascript:cityClose();">
							<i class="fa fa-close"></i> Close
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END ADD CITY MODAL  -->

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
								<td class="kanan">Major Name <font color="red">*</font> :</td>
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
								<td class="kanan">Department Name <font color="red">*</font> :</td>
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
								<td class="kanan">Location Name <font color="red">*</font> :</td>
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

		<!-- ADD PRIVILEGE MODAL -->
		<div class="modal fade" id="modalAddPrivilege" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelPrivilege"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Privilege Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm"
											property="portalPrivilegeBean.privilegeName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalPrivilegeBean.description" />
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
							onclick="javascript:privilegeClose();">
							<i class="fa fa-close"></i> Close
						</button>

					</div>
				</div>
			</div>
		</div>
		<!-- END ADD PRIVILEGE MODAL  -->

		<!-- ADD POSITION MODAL -->
		<div class="modal fade" id="modalAddPosition" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelPosition"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Position Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalPositionBean.positionName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalPositionBean.description" />
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
							onclick="javascript:positionClose();">
							<i class="fa fa-close"></i> Close
						</button>

					</div>
				</div>
			</div>
		</div>
		<!-- END ADD POSITION MODAL  -->

		<!-- ADD BANK MODAL -->
		<div class="modal fade" id="modalAddBank" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 id="modalLabelBank"></h4>
					</div>
					<div class="modal-body">
						<table class="table table-borderless">
							<tr>
								<td class="kanan">Bank Name <font color="red">*</font> :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalBankBean.bankName" />
									</div></td>
							</tr>
							<tr>
								<td class="kanan">Description :</td>
								<td><div class="form-group">
										<html:text styleClass="form-control form-control-md"
											name="PortalForm" property="portalBankBean.description" />
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
							onclick="javascript:bankClose();">
							<i class="fa fa-close"></i> Close
						</button>

					</div>
				</div>
			</div>
		</div>
		<!-- END ADD BANK MODAL  -->

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
							<i class="fa fa-exclamation-triangle"></i> Are you sure want to
							delete this province?
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

		<!-- MODAL HAPUS City-->
		<div class="modal fade" id="modalYakinCity" tabindex="-1"
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
							delete this city?
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
														<i class="fa fa-exclamation-triangle"></i> Are you sure
														want to delete this Location?
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary"
														>
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
									
									<!-- MODAL HAPUS -->

									<div class="modal fade" id="modalYakinPosition" tabindex="-1"
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
														<i class="fa fa-exclamation-triangle"></i> Are you sure
														want to delete this Postion?
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary"
														>
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
									
									<!-- MODAL HAPUS -->

									<div class="modal fade" id="modalYakinBank" tabindex="-1"
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
														<i class="fa fa-exclamation-triangle"></i> Are you sure
														want to delete this Bank?
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
		<script>
			$(document).ready(function() {
				$('#sortProvince').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortCity').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortMajor').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortDepartment').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortLocation').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortPrivilege').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortPosition').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});

			$(document).ready(function() {
				$('#sortBank').dataTable({
					"columns" : [ null, null, {
						"orderable" : false
					} ]
				});
			});
		</script>
		<script type="text/javascript">
			$(function() {
				$('#addBtnProvince').click(function() {
					$("#modalLabelProvince").html("Add New Province");
				});
				$('.editBtnProvince').click(function() {
					$("#modalLabelProvince").html("Edit Province");
				});
				$('#addBtnCity').click(function() {
					$("#modalLabelCity").html("Add New City");
				});
				$('.editBtnCity').click(function() {
					$("#modalLabelCity").html("Edit City");
				});
				$('#addBtnMajor').click(function() {
					$("#modalLabelMajor").html("Add New Major");
				});
				$('.editBtnMajor').click(function() {
					$("#modalLabelMajor").html("Edit Major");
				});
				$('#addBtnDepartment').click(function() {
					$("#modalLabelDepartment").html("Add New Department");
				});
				$('.editBtnDepartment').click(function() {
					$("#modalLabelDepartment").html("Edit Department");
				});
				$('#addBtnLocation').click(function() {
					$("#modalLabelLocation").html("Add New Location");
				});
				$('.editBtnLocation').click(function() {
					$("#modalLabelLocation").html("Edit Location");
				});
				$('#addBtnPrivilege').click(function() {
					$("#modalLabelPrivilege").html("Add New Privilege");
				});
				$('.editBtnPrivilege').click(function() {
					$("#modalLabelPrivilege").html("Edit Privilege");
				});
				$('#addBtnPosition').click(function() {
					$("#modalLabelPosition").html("Add New Position");
				});
				$('.editBtnPosition').click(function() {
					$("#modalLabelPosition").html("Edit Position");
				});
				$('#addBtnBank').click(function() {
					$("#modalLabelBank").html("Add New Bank");
				});
				$('.editBtnBank').click(function() {
					$("#modalLabelBank").html("Edit Bank");
				});
			});

// 			MODAL PROVINCE
			function addProvince() {
				document.forms["PortalForm"].id.value = "undefined";
// 				document.forms["PortalForm"].elements["portalProvinceBean.provinceId"].value = "";
				document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editProvince(id, name) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = name;
// 				document.forms["PortalForm"].elements["portalProvinceBean.provinceId"].value = id;
				document.forms["PortalForm"].id.value = id;
			}
			
			function provinceClose() {
				document.forms["PortalForm"].elements["portalProvinceBean.provinceName"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL CITY
			function addCity() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalCityBean.cityProvinceId"].value = "";
				document.forms["PortalForm"].elements["portalCityBean.cityName"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editCity(id, idProv, name) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalCityBean.cityProvinceId"].value = idProv;
				document.forms["PortalForm"].elements["portalCityBean.cityName"].value = name;
				document.forms["PortalForm"].id.value = id;
			}
			
			function cityClose() {
				document.forms["PortalForm"].elements["portalCityBean.cityProvinceId"].value = "";
				document.forms["PortalForm"].elements["portalCityBean.cityName"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL MAJOR
			function addMajor() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = "";
				document.forms["PortalForm"].elements["portalMajorBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editMajor(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = name;
				document.forms["PortalForm"].elements["portalMajorBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}
			
			function majorClose() {
				document.forms["PortalForm"].elements["portalMajorBean.majorName"].value = "";
				document.forms["PortalForm"].elements["portalMajorBean.description"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL DEPARTMENT
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
			
// 			MODAL LOCATION
			function addLocation() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = "";
				document.forms["PortalForm"].elements["portalLocationBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editLocation(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = name;
				document.forms["PortalForm"].elements["portalLocationBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}
			
			function locationClose() {
				document.forms["PortalForm"].elements["portalLocationBean.locationName"].value = "";
				document.forms["PortalForm"].elements["portalLocationBean.description"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL PRIVILEGE
			function addPrivilege() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = "";
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editPrivilege(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = name;
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}
			
			function privilegeClose() {
				document.forms["PortalForm"].elements["portalPrivilegeBean.privilegeName"].value = "";
				document.forms["PortalForm"].elements["portalPrivilegeBean.description"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL POSITION
			function addPosition() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalPositionBean.positionName"].value = "";
				document.forms["PortalForm"].elements["portalPositionBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editPosition(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalPositionBean.positionName"].value = name;
				document.forms["PortalForm"].elements["portalPositionBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}
			
			function positionClose() {
				document.forms["PortalForm"].elements["portalPositionBean.positionName"].value = "";
				document.forms["PortalForm"].elements["portalPositionBean.description"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
// 			MODAL BANK
			function addBank() {
				document.forms["PortalForm"].id.value = "undefined";
				document.forms["PortalForm"].elements["portalBankBean.bankName"].value = "";
				document.forms["PortalForm"].elements["portalBankBean.description"].value = "";
				document.forms["PortalForm"].task.value = "masterOthers";
			}
			
			function editBank(id, name, desc) {
				document.forms["PortalForm"].task.value = "masterOthers";
				document.forms["PortalForm"].elements["portalBankBean.bankName"].value = name;
				document.forms["PortalForm"].elements["portalBankBean.description"].value = desc;
				document.forms["PortalForm"].id.value = id;
			}
			
			function bankClose() {
				document.forms["PortalForm"].elements["portalBankBean.bankName"].value = "";
				document.forms["PortalForm"].elements["portalBankBean.description"].value = "";
				document.forms["PortalForm"].id.value = "undefined";
			}
			
			
			
			
			
// 			SUBMIT FORM
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
			      },
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
			      },
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
			      'portalDepartmentBean.msDepartmentName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Department Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Department Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalDepartmentBean.description': {
			          validators: {
			        	  stringLength: {
			                  message: 'Department Description content must be less than 100 characters',
			                  max: function (value, validator, $field) {
			                      return 100 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
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
			      },
			      'portalPrivilegeBean.privilegeName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Privilege Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Privilege Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalPrivilegeBean.description': {
			    	  validators: {
			        	  stringLength: {
			                  message: 'Privilege Description content must be less than 100 characters',
			                  max: function (value, validator, $field) {
			                      return 100 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalPositionBean.positionName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Position Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Position Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalPositionBean.description': {
			    	  validators: {
			        	  stringLength: {
			                  message: 'Position Description content must be less than 100 characters',
			                  max: function (value, validator, $field) {
			                      return 100 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalBankBean.bankName': {
			    	  validators: {
			              notEmpty: {
			                  message: 'Bank Name is required'
			              },
			              
			              stringLength: {
			                  message: 'Bank Name content must be less than 30 characters',
			                  max: function (value, validator, $field) {
			                      return 30 - (value.match(/\r/g) || []).length;
			              }}
			          }
			      },
			      'portalBankBean.description': {
			    	  validators: {
			        	  stringLength: {
			                  message: 'Bank Description content must be less than 100 characters',
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