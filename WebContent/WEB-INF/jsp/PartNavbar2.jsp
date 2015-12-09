<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- TIME -->
<script type="text/javascript">
	function flyToPage(task) {
		document.forms[0].task.value = task;
		document.forms[0].submit();
	}
</script>
<!-- END TIME -->

</head>

<body>
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top role="navigation">

	<!-- LOGO -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"> <img alt="Brand"
			src="asset/img/logo-hover.png">
		</a>
	</div>
	<!-- END LOGO -->

	<ul class="nav navbar-right top-nav">
		<!-- DROPDOWN USER -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class=" fa fa-user" id="warnaPutih"></i>
				<font color="white">Hi, <%= request.getSession().getAttribute("employeeName") %></font>  <b class="caret" id="warnaPutih"></b></a>
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

	<!-- SIDEBAR  -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">

			
			<li><a href="javascript:flyToPage('masterProvince');"><i class="fa fa-list"></i> Province</a></li>
			<li><a href="javascript:flyToPage('masterCity');"><i class="fa fa-list"></i> City</a></li>
			<li><a href="javascript:flyToPage('mastermajor');"><i class="fa fa-list"></i> Major</a></li>
			<li><a href="javascript:flyToPage('masterDepartment');"><i class="fa fa-list"></i> Department</a></li>
			<li><a href="javascript:flyToPage('masterLocation');"><i class="fa fa-list"></i> Location</a></li>
			<li><a href="javascript:flyToPage('masterPosition');"><i class="fa fa-list"></i> Position</a></li>
			<li><a href="javascript:flyToPage('masterBank');"><i class="fa fa-list"></i> Bank</a></li>
			

		</ul>
	</div>
	<!-- END SIDEBAR --> </nav>

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
								</tr>
								<tr>
									<td class="kanan fontBold">Retype New Password <font color="red">*</font> :</td>			
									<td><html:password styleClass="form-control" name="PortalForm"
										property="rePass"/></td>
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

					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-close"></i> Close
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL -->
</body>
</html>