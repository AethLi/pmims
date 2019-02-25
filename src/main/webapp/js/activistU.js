angular.module('mainPageApp', [])
    .controller("activistUCtrl", function ($scope) {
        console.log("activistU.js onload!");

        $scope.linkman1 = "加载中";
        $scope.phoneNumber1 = "加载中";
        $scope.linkman2 = "加载中";
        $scope.phoneNumber2 = "加载中";
        $scope.activistU0Instruction = "加载中";
        $scope.activistU1Instruction = "加载中";
        $scope.activistU2Instruction = "加载中";
        $scope.activistU3Instruction = "加载中";
        $scope.activistU4Instruction = "加载中";
        $scope.activistU5Instruction = "加载中";
        $scope.activistU6Instruction = "加载中";
        $scope.activistU7Instruction = "加载中";
        $scope.file0Name = "未选择文件";
        $scope.file1Name = "未选择文件";
        $scope.file2Name = "未选择文件";
        $scope.file3Name = "未选择文件";
        $scope.file4Name = "未选择文件";
        $scope.file5Name = "未选择文件";
        $scope.file6Name = "未选择文件";
        $scope.file7Name = "未选择文件";

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
            }
            $scope.$digest();
        };

        $scope.upload = function (uploadId) {
            var form = new FormData(document.getElementById(uploadId));
            $.ajax({
                type: 'post',
                url: '/activist/fileUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {

                }
            })
        };

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/activist/user.do',
            data: JSON.stringify({
                "action": "init"
            }),
            success: function (result) {
                for (var uploadInstruction of result.model.uploadInstructions) {
                    if (uploadInstruction.index === 0) {
                        $scope.activistU0Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 1) {
                        $scope.activistU1Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 2) {
                        $scope.activistU2Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 3) {
                        $scope.activistU3Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 4) {
                        $scope.activistU4Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 5) {
                        $scope.activistU5Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 6) {
                        $scope.activistU6Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 7) {
                        $scope.activistU7Instruction = uploadInstruction.instruction;
                    }
                    $scope.$digest();
                }
            }
        });


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