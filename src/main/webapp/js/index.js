var app = angular.module('loginApp', []);
app.controller('loginCtrl', function($scope,$http) {
    $scope.login=function () {
        $.ajax({
            type:'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url:'AAccount.do',
            data:JSON.stringify({
                "action":"login",
                "account":$scope.inputAccount,
                "pwd":$scope.inputPassword,
                "code":$scope.inputCode
            }),
            success:function (result) {
               alert(result);
            }
        })
    };
    $scope.changeCodeImage=function () {

    }
})