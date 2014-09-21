'use strict';

describe('Controller: TodoCtrl', function () {

  // load the controller's module
  beforeEach(module('ledgerdaryApp'));

  var TodoCtrl, scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    TodoCtrl = $controller('TodoCtrl', {
      $scope: scope
    });
  }));

  it('should have no items to start', function () {
    expect(scope.todos.length).toBe(0);
  });

  it('should add items to the list', function() {
    scope.todo = 'the todo';
    scope.addTodo();
    expect(scope.todos.length).toBe(1);
  });

  it('should add then remove remove items from the list', function () {
    scope.todo = 'the todo';
    scope.addTodo();
    scope.removeTodo(0);
    expect(scope.todos.length).toBe(0);
  });
});
