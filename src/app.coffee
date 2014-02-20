app = angular.module 'app', ['ngRoute']

app.config ($routeProvider, $locationProvider, $sceDelegateProvider) ->
  $routeProvider
    .when('/radio', {
      templateUrl:    'partials/radio.html',
      controller:     'RadioCtrl'
    })
    # .otherwise({
    #   redirectTo: '/radio'
    # })

  $locationProvider.html5Mode false

  $sceDelegateProvider.resourceUrlWhitelist [
    'self'
    'http://*.youtube.com/**'
    ]


app.controller 'RadioCtrl', ($scope, $http) ->

  $http
    .get('http://localhost:8000')
    .then(
      (result) ->
        $scope.messages = result.data.data
        $scope.next = result.data.paging.next
        $scope.prev = result.data.paging.previous
      (error) -> $scope.error = error
    )
