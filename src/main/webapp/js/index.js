
var app = angular.module('loginApp', []);
app.controller('loginCtrl', function($scope,$http) {
    $scope.login=function () {
        $.ajax({
            method:'post',
            contentType: 'application/json',
            dataType: "json",
            url:'/AAccount.do ',
            data:JSON.stringify({
                "action":"login",
                "account":$scope.inputAccount,
                "pwd":$scope.inputPassword,
                "code":$scope.inputCode
            }),
            success:function (result) {
                //todo success function
            }
        })
    };
    $scope.changeCodeImage=function () {

    }
})