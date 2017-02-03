
function getNowTime(){
	var date=new Date();
	
	return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	
}

function showWorkcount($scope,$http){
	$http({
		method:'get',
		url:'data/workingCount.do'
		
	}).success(function(data,status,headers,config){
		if(data.state=='success'){
			$scope.data=data.result;
		}
		
	}).error(function(data,status,headers,config){
		
	});
}

function indexController($scope,$http){
	$scope.$on("index_workchange",function(e,d){
		showWorkcount($scope,$http);
	});
	
	
	
	
	$scope.date=getNowTime();
	
	
	showWorkcount($scope,$http);
	

}