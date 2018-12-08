var app = angular.module('registerApp', []);
app.controller('registerCtrl', function ($scope) {
    $scope.messageArea = null;
    $scope.registerSubmit = function () {
        if ($scope.userId == null && $scope.userName == null && $scope.userPwd1 == null && $scope.userPwd2 == null) {
            //return;
        }
        if ($scope.userPwd1 != $scope.userPwd2) {
            $scope.messageArea = "两次密码不一致";
            // return;
        }
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/AAccount.do',
            data: JSON.stringify({
                "action": "register",
                "userId": $scope.userId,
                "userPwd": $scope.userPwd1,
                "userName": $scope.userName
            }),
            success: function (result) {
                alert(result.message);
                window.location.href="/index.html";
            }
        })
    }
});
