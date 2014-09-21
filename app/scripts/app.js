'use strict';

angular
  .module('ledgerdaryApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'ui.sortable',
    'LocalStorageModule'
  ])
  .config(['localStorageServiceProvider', function (localStorageServiceProvider) {
    localStorageServiceProvider.setPrefix('ls');
  }])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/todo', {
        templateUrl: 'views/todo.html',
        controller: 'TodoCtrl'
      })
      .otherwise({
        redirectTo: '/todo'
      });
  });
