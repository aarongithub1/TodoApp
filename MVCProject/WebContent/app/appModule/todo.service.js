angular.module('appModule')
.factory('todoService', function($http){
	var service = {};
	
	// public
	service.index = function() {
		return $http({
			method : 'GET',
			url : 'rest/user/1/todo'
		})
//		return todos;
	};
	
	service.create = function(todo) {
		return $http({
			method : 'POST',
			url : 'rest/user/1/todo',
			headers : {
		        'Content-Type' : 'application/json'
		      },
		      data : todo
		})
	};
	
	service.update = function(edit){
		console.log(edit);
		return $http({
			method : 'PUT',
			url : 'rest/user/1/todo/' + edit.id,
			headers : {
				'Content-Type' : 'application/json'
			},
			data : edit
		})
	};
	
	service.destroy = function(id) {
		return $http({
			method : 'DELETE',
			url : 'rest/user/1/todo/' + id
		})
			
	};
	
	return service;
	
})