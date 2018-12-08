var app = angular.module('loginApp', []);
app.controller('loginCtrl', function($scope) {
    $scope.login=function () {
        if($scope.userId==null&&$scope.userPwd==null&&$scope.code==null){
            //return;
        }
        $.ajax({
            type:'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url:'/AAccount.do',
            data:JSON.stringify({
                "action":"login",
                "userId":$scope.userId,
                "userPwd":hex_md5(hex_md5($scope.userPwd)+$scope.code.toLowerCase()),
                "code":$scope.code
            }),
            success:function (result) {
               if (result.status===0)
                   window.location.href=result.message;
               else if (result.status===1){
                   alert(result.message);
                   $scope.changeCodeImage();
               }
            }
        })
    };
    $scope.changeCodeImage=function () {
        document.getElementById("img").src="ACAPTCHA.do?"+Math.random();
    }
    $scope.jump2Register=function () {
        window.location.href = "./html/register.html";
    }
})