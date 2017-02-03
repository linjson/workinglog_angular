<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<title></title>
<!-- Loading Bootstrap -->
<jsp:include page="statics.jsp"></jsp:include>
<style>
body {
	padding-top: 70px;
}

.col-border {
	background-color: rgb(247, 247, 249);
	border: 2px solid rgb(225, 225, 232);
	border-radius: 6px;
	padding: 10px;
}

.table-cell{
	background-color: rgb(247, 247, 249);
	border: 1px solid rgb(225, 225, 232);
	padding: 5px;
}

.table-cell2{
	background-color: rgb(247, 247, 249);
	border-left: 1px solid rgb(225, 225, 232);
	border-right: 1px solid rgb(225, 225, 232);
	border-bottom: 1px solid rgb(225, 225, 232);
	padding: 5px;
}

.table-row{
	
}

.vspace{
	margin-bottom: 10px;
}

.projectitem{
	font-size:12px;
}

.dropmenu{
	margin-top:0px;
	background: white;
	border:1px solid rgb(225, 225, 232);
}
.projectitemwindow-in.ng-hide-add,.projectitemwindow-in.ng-hide-remove,
.fade-in.ng-hide-add,.fade-in.ng-hide-remove{
	transition:0.5s linear all;
	-webkit-transition:0.5s linear all;
}

.fade-in.ng-hide-add{
	opacity:1;
	top:40px;
}

.fade-in.ng-hide-add.ng-hide-add-active{
	top:0px;
	opacity:0;
}

.fade-in.ng-hide-remove{
	top:0px;
	opacity:0;
}
.fade-in.ng-hide-remove.ng-hide-remove-active{
	top:40px;
	opacity:1;
}

.projectitemwindow-in.ng-hide-add{
	opacity:1;
	top:0px;
}

.projectitemwindow-in.ng-hide-add.ng-hide-add-active{
	top:-90px;
	opacity:0;
}

.projectitemwindow-in.ng-hide-remove{
	top:-90px;
	opacity:0;
}
.projectitemwindow-in.ng-hide-remove.ng-hide-remove-active{
	top:0px;
	opacity:1;
}

.addworking{
	background-color: rgb(247, 247, 249);
	border: 1px solid rgb(225, 225, 232);
	padding: 5px;
}

</style>
</head>
<body>
	<!-- Static navbar -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation"
		>
		<div class="container">
			<div class="navbar-header ">
				<a class="navbar-brand" href="#">行尸走肉</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">项目统计</a></li>
					<li><a href="#about">项目管理</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><p class="navbar-text">{{date}}</p></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>


	<div class="container"  ng-controller="indexController">
		<div class="row">
			<div class="col-md-3">
				<div class="col-border">
					<p>统计:</p>
					<label>{{data.week.data}}周工时:{{data.week.workcount}}h</label><br />
					<label>{{data.month.data}}月工时:{{data.month.workcount}}h</label><br />
					<label>总&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;长:{{data.all.workcount}}h</label><br />
					<div id="calendar"></div>
					<script type="text/javascript">
						WdatePicker({
							eCont : 'calendar'
						})
					</script>
				</div>

			</div>
			<div class="col-md-9">
				<div ng-view></div>
			</div>

		</div>

	</div>

</body>
</html>

