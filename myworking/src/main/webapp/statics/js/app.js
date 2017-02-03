var myModule = angular.module("myApp", [ "ngRoute", "ngMessages", "ngAnimate",
		'mgcrea.ngStrap', 'mgcrea.ngStrap.datepicker', 'toaster' ]);

myModule.config([ '$routeProvider', function($routeProvider) {
	$routeProvider.when("/projects", {
		templateUrl : "web/projects.do",
		controller : "projectsController"

	}).when("/projects_detail/:id", {
		templateUrl : "web/projects_detail.do",
		controller : "projectsDetailController"

	}).otherwise({
		redirectTo : "/projects"

	});

} ]).config(function($datepickerProvider) {
	angular.extend($datepickerProvider.defaults, {
		dateFormat : 'yyyy-MM-dd',
		iconLeft : "fui-arrow-left",
		iconRight : "fui-arrow-right",
		autoclose : true
	});
})
;

myModule.controller("indexController", indexController);
myModule.controller("projectsController", projectsController);
myModule.controller("projectsDetailController", projectsDetailController);