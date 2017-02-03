function searchProject($scope, $http, k, callback) {
	$http({
		method : 'get',
		url : 'data/projectlist.do',
		params : {
			"key" : k
		}
	}).success(function(data, status, headers, config) {

		if (callback) {
			callback(data);
		}
	}).error(function(data, status, headers, config) {

	});

}

function toast(toaster,type,text) {
	toaster.pop({
		type : type,
		title : "提示",
		body : text,
		showCloseButton : true
	});
}


function projectsController($scope, $http,toaster) {

	searchProject($scope, $http, "", function(data) {
		$scope.searchlist = [];

		if (data.state == 'success') {

			$scope.searchlist = (data.result);
			$scope.data = $scope.searchlist.slice(0);
		}
		$scope.searchlist.splice(0, 0, {
			projectname : "全部"
		});

	});

	$scope.projectOpen = function(target) {
		var pid = target.d.id;
		target.d.isopen = !target.d.isopen;
		$http({
			method : 'get',
			url : 'data/workinglistByPid.do',
			params : {
				"pid" : pid,
				"pageindex" : 1,
				"pagesize" : 10
			}

		}).success(function(data, status, headers, config) {
			if (data.state == 'success') {
				target.d.items = data.result.data;
			}

		}).error(function(data, status, headers, config) {

		});
	};

	$scope.searchProject = function(target) {
		var key = target.d.id ? target.d.projectname : "";
		searchProject($scope, $http, key, function(data) {
			if (data.state == 'success') {
				$scope.data = data.result;
			}
		});
	};

	$scope.onChange = function(key) {

		searchProject($scope, $http, key, function(data) {
			$scope.searchlist = [];

			if (data.state == 'success') {
				$scope.searchlist = (data.result);
			}
			$scope.searchlist.splice(0, 0, {
				projectname : "全部"
			});

		});
	};

	$scope.onEnter = function(event, key) {
		if (event.keyCode == 13) {
			searchProject($scope, $http, key, function(data) {
				if (data.state == 'success') {
					$scope.data = data.result;
				}
			});
		}
	};

	$scope.onShowAddworking = function(target, isShow) {
		target.d.isAdd = isShow;
		target.d.new_time = new Date();
	};

	$scope.onAddWorking = function(target) {
		
		var data = target.d;
		var newtime = data.new_time.getFullYear() + "-"
				+ (data.new_time.getMonth() + 1) + "-"
				+ data.new_time.getDate();
		var worktype = data.new_workType == "正常" ? "" : data.new_workType;
		var worktime = isNaN(data.new_worktime) ? 0
				: parseFloat(data.new_worktime);
		$http({
			method : 'get',
			url : 'data/addWorking.do',
			params : {
				"pid" : data.id,
				"content" : data.new_content,
				"createtime" : newtime,
				"worktime" : worktime,
				"worktype" : worktype
			}
		}).success(function(data, status, headers, config) {
			
			if (data.state == "success") {
				toast(toaster,"success","增加成功");
				target.d.isAdd = false;
				$scope.projectOpen(target);
				target.d.isopen = true;
				target.d.workcount = worktime + Number(target.d.workcount);

				data.new_time = new Date();
				data.new_content = "";
				data.new_workType = "";
				data.new_worktime = 0;
				$scope.$emit("index_workchange","");
			}else{
				toast(toaster,"error","增加失败");
			}

		}).error(function(data, status, headers, config) {
			toast(toaster,"error","增加失败-->error");
		});

	};

	$scope.choiceType = function(target, value) {
		target.d.new_workType = value;
	};

}