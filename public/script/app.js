// Generated by CoffeeScript 1.7.1
(function() {
  var app;

  app = angular.module('app', ['ngRoute']);

  app.config(function($routeProvider, $locationProvider) {
    $routeProvider.when('/radio', {
      templateUrl: 'partials/radio.html',
      controller: 'RadioCtrl'
    });
    return $locationProvider.html5Mode(false);
  });

  app.controller('RadioCtrl', function($scope, $http) {
    return $http.get('http://localhost:8000').then(function(result) {
      $scope.messages = result.data.data;
      $scope.next = result.data.paging.next;
      return $scope.prev = result.data.paging.previous;
    }, function(error) {
      return $scope.error = error;
    });
  });

}).call(this);
