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

<body onload="startTime()">
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
		<li><label id="timeText"></label></li>

		<!-- NOTIFICATION -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><span id="warnaPutih"
				class="glyphicon glyphicon-bell"></span> <small><span class="badge">3</span></small>
				<b class="caret" id="warnaPutih"></b></a>
			<ul class="dropdown-menu message-dropdown">
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-preview"><a href="#">
						<div class="media">
							<span class="pull-left"> <img class="media-object"
								src="http://placehold.it/50x50" alt="">
							</span>
							<div class="media-body">
								<h5 class="media-heading">
									<strong>John Smith</strong>
								</h5>
								<p class="small text-muted">
									<i class="fa fa-clock-o"></i> Yesterday at 4:32 PM
								</p>
								<p>Lorem ipsum dolor sit amet, consectetur...</p>
							</div>
						</div>
				</a></li>
				<li class="message-footer"><a href="#">Read All New
						Messages</a></li>
			</ul></li>
		<!-- END NOTIFICATION -->

		<!-- DROPDOWN USER -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class=" fa fa-user" id="warnaPutih"></i>
				<font color="white">Hi, <%= request.getSession().getAttribute("employeeName") %></font>  <b class="caret" id="warnaPutih"></b></a>
			<ul class="dropdown-menu">
				<li><a href="" data-toggle="modal" data-target="#modalLogin"><large>
						<i class=" fa fa-user"></i> <large> Profile</a></li>
				<li class="divider"></li>
				<li><a href="javascript:flyToPage('logout');"><span
						class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
			</ul></li>
		<!-- END DROPDOWN USER -->
	</ul>

	<!-- SIDEBAR  -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">

			
				<li><a href="javascript:flyToPage('backToList','','1','1')"><i
						class="fa fa-list"></i> Master</a></li>
			

		</ul>
	</div>
	<!-- END SIDEBAR --> </nav>

	</nav>
	<!-- END NAVBAR -->

	
</body>
</html>