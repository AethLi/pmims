var app = angular.module('managerPageApp', []);
app.controller('managerPageCtrl', ['ngRoute'])
    .controller('HomeController', function ($scope, $route) { $scope.$route = $route;})
    .controller('AboutController', function ($scope, $route) { $scope.$route = $route;})
    .config(function ($routeProvider)
