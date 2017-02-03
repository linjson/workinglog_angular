<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head>
<title></title>
<%
	String basePath = request.getContextPath();
	String staticResPath = basePath + "/statics";
%>
<meta name='viewport'
	content='width=device-width, initial-scale=1, minimum-scale=0.1, maximum-scale=10, user-scalable=yes' />

<link rel="stylesheet" href="<%=staticResPath%>/bower_components/bootstrap/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="<%=staticResPath%>/bower_components/bootstrap-additions/dist/bootstrap-additions.min.css">


<script src="<%=staticResPath%>/bower_components/angular/angular.min.js"></script>
<script src="<%=staticResPath%>/bower_components/angular-strap/dist/angular-strap.min.js"></script>
<script src="<%=staticResPath%>/bower_components/angular-strap/dist/angular-strap.tpl.min.js"></script>
<style>

</style>
</head>
<body>
	
<span class="glyphicon glyphicon-chevron-left"></span>
<form name="datepickerForm" class="form-inline" role="form">
  <!-- Basic example -->
  <div class="form-group" ng-class="{'has-error': datepickerForm.date.$invalid}">
    <label class="control-label"><i class="fa fa-calendar"></i> Date <small>(as date)</small></label>
    <input type="text" class="form-control" ng-model="selectedDate" name="date" bs-datepicker>
  </div>
  <!-- Custom example -->
  <div class="form-group" ng-class="{'has-error': datepickerForm.date2.$invalid}">
    <label class="control-label"><i class="fa fa-calendar"></i> Date <small>(as number)</small></label>
    <input type="text" class="form-control" ng-model="selectedDateAsNumber" data-date-format="yyyy-MM-dd" data-date-type="number" data-min-date="02/10/86" data-max-date="today" data-autoclose="1" name="date2" bs-datepicker>
  </div>
  <hr>
  <!-- Date range example -->
  <div class="form-group">
    <label class="control-label"><i class="fa fa-calendar"></i> <i class="fa fa-arrows-h"></i> <i class="fa fa-calendar"></i> Date range <small>(dynamic)</small></label><br>
    <div class="form-group col-xs-6">
      <input type="text" class="form-control" ng-model="fromDate" data-max-date="{{untilDate}}" placeholder="From" bs-datepicker>
    </div>
    <div class="form-group col-xs-6">
      <input type="text" class="form-control" ng-model="untilDate" data-min-date="{{fromDate}}" placeholder="Until" bs-datepicker>
    </div>
  </div>
</form>
</body>


<script type="text/javascript">
var myModule = angular.module('myApp', ['mgcrea.ngStrap']);


</script>


</html>

