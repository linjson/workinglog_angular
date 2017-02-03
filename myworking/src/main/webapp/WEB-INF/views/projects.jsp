<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="toast.jsp"></jsp:include>
<div class="row">

	<div class="col-border">
		<div class="row vspace">
			<div class="col-md-6">
				<div class="btn-group">
					<input type="text" class="form-control" data-toggle="dropdown"
						ng-model="key" ng-change="onChange(key)"
						ng-keypress="onEnter($event,key)" aria-expanded="false"
						style="width: 400px" placeholder="搜索项目" />
					<ul class="dropdown-menu dropmenu" role="menu">

						<li ng-repeat="d in searchlist"><a href
							ng-click="searchProject(this)">{{d.projectname}}</a></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="datarow" ng-repeat="d in data"
					style="position: relative;">
					<div class='{{$index==0?"table-cell":"table-cell2"}}'>
						<div class="row">
							<div class="col-md-9">
								{{$index+1}}.
								<a href="#/projects_detail/{{d.id}}">{{d.projectname}}</a>
							</div>
							<div class="col-md-1">{{d.workcount}}</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary btn-xs" ng-click="onShowAddworking(this,true)">
									<span class="fui-plus"></span>
								</button>
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary btn-xs" ng-click="projectOpen(this)">
									{{d.isopen?"收起":"展开"}}
								</button>
							</div>
						</div>
					</div>
					<div
						style="display:block;width:100%;position: absolute; z-index: 99;"
						ng-show="d.isAdd" class="fade-in addworking">
						<div class="row">
							<div class="col-md-1"><span class="label label-info">增加</span></div>
							<div class="col-md-2">
								<input type="text" class="form-control input-sm" placeholder="选择时间" ng-model="d.new_time" bs-datepicker/>
							</div>
							<div class="col-md-5"><textarea type="text" class="form-control input-sm"
									placeholder="内容" ng-model="d.new_content"/></div>
							<div class="col-md-1"><input type="text" class="form-control input-sm"
									placeholder="H" ng-model="d.new_worktime"/></div>
							<div class="col-md-1">
							<div class="btn-group">
					              <button data-toggle="dropdown" type="button" class="btn btn-default btn-sm dropdown-toggle">
					              	 {{d.new_workType}}<span class="caret"></span>
					              </button>
					              <ul role="menu" class="dropdown-menu">
					                <li><a href ng-click="choiceType(this,'正常')">正常</a></li>
					                <li><a href ng-click="choiceType(this,'赶工')">赶工</a></li>
					              </ul>
					            </div>
					            </div>
							<div class="col-md-1"><button type="button" class="btn btn-primary btn-xs" ng-click="onAddWorking(this,d.new_time,d.new_content,d.new_worktime)">完成</button></div>
							<div class="col-md-1"><button type="button" class="btn btn-primary btn-xs" ng-click="onShowAddworking(this,false)">取消</button></div>
						</div>
					</div>
					<div class="table-cell2 projectitem" ng-show="d.isopen"
						ng-repeat="item in d.items">
						<div class="row">
							<div class="col-md-offset-1 col-md-2">{{item.createtime}}</div>
							<div class="col-md-7">{{item.content}}</div>
							<div class="col-md-1">{{item.worktime}}</div>
							<div class="col-md-1">{{item.worktype}}</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
