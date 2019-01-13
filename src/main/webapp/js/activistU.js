angular.module('mainPageApp', [])
    .controller("activistUCtrl", function ($scope) {
        console.log("activistU.js onload!");

        $scope.linkman1="加载中";
        $scope.phoneNumber1="加载中";
        $scope.linkman2="加载中";
        $scope.phoneNumber2="加载中";
        $scope.activistU0Instruction="加载中";
        $scope.activistU1Instruction="加载中";
        $scope.activistU2Instruction="加载中";
        $scope.activistU3Instruction="加载中";
        $scope.activistU4Instruction="加载中";
        $scope.activistU5Instruction="加载中";
        $scope.activistU6Instruction="加载中";
        $scope.activistU7Instruction="加载中";
        $scope.file0Name="未选择文件";

        $scope.ChooseFileChange=function (id) {
            var file=document.getElementById(id).files[0];
            $scope.file0Name=file.name;
            $scope.$digest();
        }
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/activist/user.do',
            data: JSON.stringify({
                "action": "init"
            }),
            success:function (result) {

            }
        })
    });