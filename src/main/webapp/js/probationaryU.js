angular.module('mainPageApp', [])
    .controller("probationaryUCtrl", function ($scope) {
        console.log("probationaryU.js onload!");

        $scope.probationary0Instruction = "加载中";
        $scope.probationary1Instruction = "加载中";
        $scope.probationary2Instruction = "加载中";
        $scope.probationary3Instruction = "加载中";
        $scope.file0Name = "未选择文件";
        $scope.file1Name = "未选择文件";
        $scope.file2Name = "未选择文件";
        $scope.file3Name = "未选择文件";
        $scope.fileList0=[];
        $scope.fileList1=[];
        $scope.fileList2=[];
        $scope.fileList3=[];


        $scope.timeConvert = function (time = +new Date()) {
            var date = new Date(time + 8 * 3600 * 1000);
            return date.toJSON().substr(0, 19).replace('T', ' ').substring(0, 10);
        };
        $scope.statusConvert = function (status) {
            if (status === 0) {
                return "未审核";
            } else if (status === 1) {
                return "已通过";
            } else if (status === 2) {
                return "未通过";
            }
        };
        $scope.statusCheck = function (status) {
            if (status === 1) {
                return false;
            }
            return true;
        };
    });