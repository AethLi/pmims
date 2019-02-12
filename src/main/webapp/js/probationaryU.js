angular.module('mainPageApp', [])
    .controller("probationaryUCtrl", function ($scope) {
        console.log("probationaryU.js onload!");

        $scope.probationary0Instruction = "加载中";
        $scope.probationary1Instruction = "加载中";
        $scope.probationary2Instruction = "加载中";
        $scope.probationary3Instruction = "加载中";
        $scope.file0Name="未选择文件";
        $scope.file1Name="未选择文件";
        $scope.file2Name="未选择文件";
        $scope.file3Name="未选择文件";

        $.ajax()
    });