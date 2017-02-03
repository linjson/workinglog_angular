function searchProjectById($scope, $http, k) {
	$http({
		method : 'get',
		url : 'data/getProjectById.do',
		params : {
			"id" : k

		}
	}).success(function(data, status, headers, config) {

		$scope.project = data.result;
	}).error(function(data, status, headers, config) {

	});
}

function searchWorkingById($scope, $http, pid, pageindex, pagesize) {
	$http({
		method : 'get',
		url : 'data/workinglistByPid.do',
		params : {
			"pid" : pid,
			"pagesize" : pagesize,
			"pageindex" : pageindex

		}
	}).success(function(data, status, headers, config) {

		if (data.state = "success") {
			var total = data.result.total;
			$scope.working = data.result.data;
			var pageCount = Math.ceil(total / pagesize);
			$scope.pages = [];
			for ( var i = 0; i < pageCount; i++) {
				$scope.pages.push({
					"t" : 1
				});
			}
			$scope.pageCount = pageCount;
			$scope.currentPage = pageindex;
		}
	}).error(function(data, status, headers, config) {

	});
}

function resetModel($scope) {
	$scope.projectitem = {};
	$scope.projectitem.createtime = new Date();
}

function addWorking($scope, $http, toaster) {
	var data = $scope.projectitem;
	var pid = $scope.project.id;
	var newtime = data.createtime.getFullYear() + "-"
			+ (data.createtime.getMonth() + 1) + "-"
			+ data.createtime.getDate();
	var worktype = data.worktype == "正常" ? "" : data.worktype;
	var worktime = isNaN(data.worktime) ? 0 : parseFloat(data.worktime);

	$http({
		method : 'get',
		url : 'data/addWorking.do',
		params : {
			"pid" : pid,
			"content" : data.content,
			"createtime" : newtime,
			"worktime" : worktime,
			"worktype" : worktype
		}
	}).success(function(data, status, headers, config) {

		if (data.state == "success") {
			$scope.isShow = false;
			searchProjectById($scope, $http, pid);
			searchWorkingById($scope, $http, pid, 1, pagesize);
			toast(toaster, "success", "增加工时成功");
			$scope.$emit("index_workchange","");
		} else {
			toast(toaster, "error", "增加工时失败");
		}

	}).error(function(data, status, headers, config) {
		toast(toaster, "error", "增加工时失败-->error");
	});

}

function updateWorking($scope, $http,toaster) {
	var data = $scope.projectitem;
	var pid = $scope.project.id;
	var createtime = new Date(data.createtime);
	var newtime = createtime.getFullYear() + "-" + (createtime.getMonth() + 1)
			+ "-" + createtime.getDate();
	var worktype = data.worktype == "正常" ? "" : data.worktype;
	var worktime = isNaN(data.worktime) ? 0 : parseFloat(data.worktime);
	$http({
		method : 'get',
		url : 'data/updateWorking.do',
		params : {
			"id" : data.id,
			"content" : data.content,
			"createtime" : newtime,
			"worktime" : worktime,
			"worktype" : worktype
		}
	}).success(
			function(data, status, headers, config) {

				if (data.state == "success") {
					$scope.isShow = false;
					searchProjectById($scope, $http, pid);
					searchWorkingById($scope, $http, pid, $scope.currentPage,
							pagesize);
					toast(toaster, "success", "更新工时成功");
					$scope.$emit("index_workchange","");
				} else {
					toast(toaster, "error", "更新工时失败");
				}

			}).error(function(data, status, headers, config) {
				toast(toaster, "error", "更新工时失败-->error");
			});

}

function deleteWorking($scope, $http,toaster) {
	var data = $scope.projectitem;
	var pid = $scope.project.id;
	$http({
		method : 'get',
		url : 'data/deleteWorking.do',
		params : {
			"id" : data.id

		}
	}).success(
			function(data, status, headers, config) {

				if (data.state == "success") {
					$scope.isShow = false;
					searchProjectById($scope, $http, pid);
					searchWorkingById($scope, $http, pid, $scope.currentPage,
							pagesize);
					toast(toaster, "success", "删除工时成功");
					$scope.$emit("index_workchange","");
				}else{
					toast(toaster, "error", "删除工时失败");
				}

			}).error(function(data, status, headers, config) {
				toast(toaster, "error", "删除工时失败-->error");

	});

}

function toast(toaster, type, text) {
	toaster.pop({
		type : type,
		title : "提示",
		body : text,
		showCloseButton : true
	});
}

var pagesize = 20;
function projectsDetailController($scope, $http, $routeParams, $location,
		toaster) {

	resetModel($scope);

	var id = $routeParams.id;

	if (!id) {
		$location.path('/projects');
		return;
	}

	$scope.gotoProjects = function() {
		$location.path('/projects');
	};

	$scope.changePage = function(pageindex) {
		searchWorkingById($scope, $http, id, pageindex, pagesize);
	};

	$scope.jumpPage = function(flag) {
		var pageindex = 0;
		if (flag > 0) {
			pageindex = Math.min($scope.pageCount, $scope.currentPage + 1);
		} else {
			pageindex = Math.max(0, $scope.currentPage - 1);
		}

		searchWorkingById($scope, $http, id, pageindex, pagesize);
	};

	searchProjectById($scope, $http, id);

	searchWorkingById($scope, $http, id, 1, pagesize);

	$scope.choiceType = function(value) {
		$scope.projectitem.worktype = value;
	};

	$scope.onItemModify = function(data) {
		$scope.isShow = true;
		$scope.isAdd = false;
		$scope.projectitem = data.d;

	};

	$scope.onItemDelete = function(data) {
		$scope.projectitem = data.d;
		deleteWorking($scope, $http,toaster);
	};

	$scope.onOK = function(isAdd) {
		if (isAdd) {
			addWorking($scope, $http,toaster);
		} else {
			updateWorking($scope, $http,toaster);
		}
	};

	$scope.onShowAddworking = function(isShow) {
		$scope.isShow = isShow;
		$scope.isAdd = true;
		resetModel($scope);
	};

}