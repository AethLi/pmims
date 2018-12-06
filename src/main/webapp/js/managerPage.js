var app = angular.module('managerPageApp', []);
app.controller('managerPageCtrl', ['ngRoute'])
    .config(function ($routeProvider){
        $routeProvider.when("/!proposerM");
    }
