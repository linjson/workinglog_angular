<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="toast.jsp"></jsp:include>

<div class="row">

	<div class="col-border">
		<div class="row">
			<div class="col-md-10">
				<a href="#/projects"><span class="fui-arrow-left" /></a>
				{{project.projectname}}({{project.workcount}}h)
			</div>
			
			<div class="col-md-2">
				<button type="button" class="btn btn-primary btn-xs" ng-click="onShowAddworking(true)">
									<span class="fui-plus"></span>
				</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div style="position: relative;" ng-show="isShow" class="projectitemwindow-in">
					<div
						style="display: block; width: 100%; position: absolute; z-index: 99;"
						class="fade-in addworking">
						<span class="label label-info">{{isAdd?"增加":"修改"}}</span>
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputTime" class="col-lg-2 control-label">时间</label>
								<div class="col-lg-3">
									<input type="text" class="form-control" id="inputTime"
										ng-model="projectitem.createtime" bs-datepicker />
								</div>
							</div>
							<div class="form-group">
								<label for="inputContent" class="col-lg-2 control-label">内容</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="inputContent" ng-model="projectitem.content" >
								</div>
							</div>
							<div class="form-group">
								<label for="inputWorktime" class="col-lg-2 control-label">工时</label>
								<div class="col-lg-2">
									<input type="text" class="form-control" id="inputWorktime" ng-model="projectitem.worktime" >
								</div>
							</div>
							<div class="form-group">
								<label for="inputWorktype" class="col-lg-2 control-label">类型</label>
								<div class="col-lg-4">
									<div class="btn-group">
										<button data-toggle="dropdown" type="button"
											class="btn btn-default btn-sm dropdown-toggle">
											{{projectitem.worktype }}<span class="caret"></span>
										</button>
										<ul role="menu" class="dropdown-menu">
											<li><a href ng-click="choiceType('正常')">正常</a></li>
											<li><a href ng-click="choiceType('赶工')">赶工</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-offset-2 col-lg-10">
									<button class="btn btn-primary" ng-click="onOK(isAdd)">完成</button>
									<button class="btn btn-warning" ng-click="onShowAddworking(false)">取消</button>
								</div>
							</div>
						</form>

					</div>
				</div>
				<table class="table table-condensed table-hover">
					<thead>
						<tr style="font-size: 14px;">
							<th width="10%">时间</th>
							<th>内容</th>
							<th width="5%">时长</th>
							<th width="10%">类型</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="d in working" class="projectitem">
							<td>{{d.createtime}}</td>
							<td>{{d.content}}</td>
							<td>{{d.worktime}}</td>
							<td>{{d.worktype}}</td>
							<td><a ng-click="onItemModify(this)"><span class="fui-new" /></a>&nbsp;&nbsp;&nbsp; 
								<a ng-click="onItemDelete(this)"><span
									class="fui-cross" /></a></td>
						</tr>
					</tbody>
				</table>

				<div style="text-align: center">
					<div class="pagination pagination-minimal">
						<ul>
							<li class="previous"><a ng-click="jumpPage(-1)"
								class="fui-arrow-left"></a></li>
							<li class='{{currentPage==$index+1?"active":""}}'
								ng-repeat="d in pages"><a ng-click="changePage($index+1)">{{$index+1}}</a></li>
							<li class="next"><a ng-click="jumpPage(1)"
								class="fui-arrow-right"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>
