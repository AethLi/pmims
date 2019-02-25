angular.module('mainPageApp', [])
    .controller("developmentUCtrl", function ($scope) {
        console.log("developmentU.js onload!");
        $scope.development0Instruction = "加载中";
        $scope.development1Instruction = "加载中";
        $scope.development2Instruction = "加载中";
        $scope.development3Instruction = "加载中";
        $scope.development4Instruction = "加载中";
        $scope.development5Instruction = "加载中";
        $scope.development6Instruction = "加载中";
        $scope.development7Instruction = "加载中";
        $scope.development8Instruction = "加载中";
        $scope.development9Instruction = "加载中";
        $scope.development10Instruction = "加载中";
        $scope.development11Instruction = "加载中";
        $scope.development12Instruction = "加载中";
        $scope.development13Instruction = "加载中";
        $scope.development14Instruction = "加载中";
        $scope.development15Instruction = "加载中";
        $scope.file0Name = "未选择文件";
        $scope.file1Name = "未选择文件";
        $scope.file2Name = "未选择文件";
        $scope.file3Name = "未选择文件";
        $scope.file4Name = "未选择文件";
        $scope.file5Name = "未选择文件";
        $scope.file6Name = "未选择文件";
        $scope.file7Name = "未选择文件";
        $scope.file8Name = "未选择文件";
        $scope.file9Name = "未选择文件";
        $scope.file10Name = "未选择文件";
        $scope.file11Name = "未选择文件";
        $scope.file12Name = "未选择文件";
        $scope.file13Name = "未选择文件";
        $scope.file14Name = "未选择文件";
        $scope.file15Name = "未选择文件";

        $scope.ChooseFileChange = function (id, index) {
            var file = document.getElementById(id).files[0];
            if (index === 0) {
                $scope.file0Name = file.name;
            } else if (index === 1) {
                $scope.file1Name = file.name;
            } else if (index === 2) {
                $scope.file2Name = file.name;
            } else if (index === 3) {
                $scope.file3Name = file.name;
            } else if (index === 4) {
                $scope.file4Name = file.name;
            } else if (index === 5) {
                $scope.file5Name = file.name;
            } else if (index === 6) {
                $scope.file6Name = file.name;
            } else if (index === 7) {
                $scope.file7Name = file.name;
            } else if (index === 8) {
                $scope.file8Name = file.name;
            } else if (index === 9) {
                $scope.file9Name = file.name;
            } else if (index === 10) {
                $scope.file10Name = file.name;
            } else if (index === 11) {
                $scope.file11Name = file.name;
            } else if (index === 12) {
                $scope.file12Name = file.name;
            } else if (index === 13) {
                $scope.file13Name = file.name;
            } else if (index === 14) {
                $scope.file14Name = file.name;
            } else if (index === 15) {
                $scope.file15Name = file.name;
            }
            $scope.$digest();
        };

        $scope.upload = function (uploadId) {
            var form = new FormData(document.getElementById(uploadId));
            $.ajax({
                type: 'post',
                url: '/development/fileUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {

                }
            })
        };


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