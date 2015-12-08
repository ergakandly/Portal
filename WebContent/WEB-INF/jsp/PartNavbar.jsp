<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/ico" href="asset/img/icon.ico" />
</head>
<style>
.nav {
    padding: 0 15px;
}

.nav {
	color: #0D47A1;
}

.nav>li {
    display: inline-block;
    float: left;
}

.nav>li>a {
    padding-top: 15px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #999;
}

.nav>li>a:hover,
.nav>li>a:focus,
.nav>.open>a,
.nav>.open>a:hover,
.nav>.open>a:focus {
    color: #fff;
    background-color: #0D47A1 !important;
}

.nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    border: 1px solid rgba(0,0,0,.15);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

ul.message-dropdown {
    padding: 0;
    max-height: 250px;
    overflow-x: hidden;
    overflow-y: auto;
}

li.message-preview {
    width: 275px;
    border-bottom: 1px solid rgba(0,0,0,.15);
}

li.message-preview>a {
    padding-top: 15px;
    padding-bottom: 15px;
}

li.message-footer {
    margin: 5px 0;
}

</style>
<script type="text/javascript">
	function flyToPage(task) {
		document.forms[0].task.value = task;
		document.forms[0].submit();
	}
</script>
<body>

	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

	<!-- LOGO -->
	<div class="navbar-header">
		<a class="navbar-brand" href="#"> <img alt="Brand"
			src="asset/img/logo-hover.png">
		</a>
	</div>
	<!-- END LOGO -->

	<ul class="nav navbar-nav navbar-right">
		<!-- DROPDOWN USER -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class=" fa fa-user"></i> Hi, <%= request.getSession().getAttribute("employeeName") %> <b
				class="caret"> </b></a>
			<ul class="dropdown-menu">
				<li><a href="#" data-toggle="modal" data-target="#modalLogin"
					data-backdrop="static"> <large> <i class=" fa fa-lock"></i>
						<large> User Password </a></li>
				<li class="divider"></li>
				<li><a href="javascript:flyToPage('logout');"><i
						class=" fa fa-sign-out"></i> Log Out</a></li>
			</ul></li>
		<!-- END DROPDOWN USER -->
	</ul>
	</div>

	</nav>
	<!-- END NAVBAR -->
	<br />
	<br />
	<!-- MODAL PASSWORD-->
	<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">User <bean:write name="PortalForm" property="userExist" /></h4>
				</div>
				<div class="modal-body ">

					<!-- PANEL PASSWORD-->
					<div class="panel panel-info ">
						<div class="panel-heading">
							<h5 class="panel-title">
								<span class="glyphicon glyphicon-lock"></span> Change Password
							</h5>
						</div>
						<div class="panel-body">
							<table align="center" class="table table-nonfluid table-hover ">
								<tr>
									<td class="kanan fontBold">Old Password <font color="red">*</font> :</td>			
									<td><html:password styleClass="form-control" name="PortalForm"
										property="oldPass"/></td>	
								</tr>
								<tr>
									<td class="kanan fontBold">New Password <font color="red">*</font> :</td>			
									<td><html:password styleClass="form-control" name="PortalForm"
										property="newPass"/></td>
										
<!-- 									<td><input type="password" class="form-control" name="newPass" placeholder="**********" -->
<%-- 										value="<bean:write name="PortalForm" property="newPass"/>"></td> --%>
<!-- 									<td><input type="password" class="form-control"></td> -->
								</tr>
								<tr>
									<td class="kanan fontBold">Retype New Password <font color="red">*</font> :</td>			
									<td><html:password styleClass="form-control" name="PortalForm"
										property="rePass"/></td>
										
<!-- 									<td><input type="password" class="form-control" name="rePass" placeholder="**********" -->
<%-- 										value="<bean:write name="PortalForm" property="rePass"/>"></td> --%>
<!-- 									<td><input type="password" class="form-control"></td> -->
								</tr>
							</table>
						</div>
					</div>
					<!-- PANEL -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
							onclick="javascript:flyToPage('masterOthers');">
							<i class="fa fa-check"></i> Save Changes
					</button>
					
<!-- 					<button type="button" class="btn btn-primary" -->
<!-- 							onclick="javascript:flyToPage('masterOthers', '', '', 'oldPass', 'newPass', 'rePass');"> -->
<!-- 							<i class="fa fa-check"></i> Save changes -->
<!-- 					</button> -->
<!-- 					<button type="button" class="btn btn-primary"> -->
<!-- 						<i class="fa fa-check"></i> Save changes -->
<!-- 					</button> -->

					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-close"></i> Close
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL -->
	
	<script type="text/javascript">
		$('#validate-form')
				.bootstrapValidator(
						{
							//       live: 'disabled',
							excluded : 'disabled',
							message : 'This value is not valid',
							feedbackIcons : {
								valid : 'glyphicon glyphicon-ok',
								invalid : 'glyphicon glyphicon-remove',
								validating : 'glyphicon glyphicon-refresh'
							},
							fields : {
								'empBean.employeeName' : {
									validators : {
										notEmpty : {
											message : 'Name is required and cannot be empty'
										},

									}
								},
								'currentSpecialDateBean.description' : {
									validators : {
										notEmpty : {
											message : 'Description is required and cannot be empty'
										},

										stringLength : {
											message : 'Description content must be less than 100 characters',
											max : function(value, validator,
													$field) {
												return 100 - (value
														.match(/\r/g) || []).length;
											}
										}
									}
								},
								'empBean.departmentId' : {
									validators : {
										callback : {
											message : 'Destination Department is required and cannot be empty',
											callback : function(value,
													validator, $field) {
												// Get the selected options
												var options = validator
														.getFieldElements(
																'empBean.departmentId')
														.val();

												if (options == null)
													return (false);
												else if (options != null)
													return (true);

											}

										}
									}
								}
							// 								'empBean.roleId' : {
							// 									validators : {
							// 										callback : {
							// 											message : 'Destination Role is required and cannot be empty',
							// 											callback : function(value,
							// 													validator, $field) {
							// 												// Get the selected options
							// 												var options = validator
							// 														.getFieldElements(
							// 																'empBean.departmentId')
							// 														.val();

							// 												if (options == null)
							// 													return (false);
							// 												else if (options != null)
							// 													return (true);
							// 											}
							// 										}
							// 									}
							// 								}
							}
						});
	</script>
</body>
</html>