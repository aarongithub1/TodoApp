angular.module('appModule')
.factory('todoService', function(){
	var service = {};
	
	var todos = [
	      {
		        id : 1,
		        task : 'Go round mums',
		        description : '',
		        completed : false
		      },
		      {
		        id : 2,
		        task : 'Get Liz back',
		        description : '',
		        completed : false
		      },
		      {
		        id : 3,
		        task : 'Sort life out',
		        description : '',
		       completed :  false
		      }
		    ];
	
	// public
	service.index = function() {
		return todos;
	};
	
	var generateId = function() {
		  return todos[todos.length-1].id + 1;
	}
		
	service.create = function(todo) {
		var copy = angular.copy(todo);
		copy.id = generateId();
		copy.completed = 'false';
		copy.description = '';
//		vm.todos.push(copy);
		
		todos.push(copy);
	};
	
	service.update = function(edit){
		todos.forEach(function(todo, idx, array){
			if(todo.id === edit.id) {
//				todo.task = edit.task;
//				todo.description = edit.description;
//				todo.completed = edit.completed;
				array.splice(idx, 1, edit);
//				vm.editTodo = null;
			}
		})
	};
	
	service.destroy = function(id) {
		todos.forEach(function(todo, idx, arr){
			if (todo.id === id) {
                todos.splice(idx, 1);
            }
			
		})
		
	}
	
//	vm.updateTodo = function(todo) {
//		vm.todos.forEach(function(edit){
//			if(todo.id === edit.id) {
//				edit.task = todo.task;
//				edit.description = todo.description;
//				edit.completed = todo.completed;
//				vm.editTodo = null;
//			}
//			
//			
//		})
//	}
	
	
	return service;
	
	
})