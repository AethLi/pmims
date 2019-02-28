angular.module('mainPageApp', [])
    .controller("probationaryUCtrl", function ($scope) {
        console.log("probationaryU.js onload!");

        $scope.upload0Instruction = "加载中";
        $scope.upload1Instruction = "加载中";
        $scope.upload2Instruction = "加载中";
        $scope.upload3Instruction = "加载中";
        $scope.file0Name = "未选择文件";
        $scope.file1Name = "未选择文件";
        $scope.file2Name = "未选择文件";
        $scope.file3Name = "未选择文件";
        $scope.fileList0 = [];
        $scope.fileList1 = [];
        $scope.fileList2 = [];
        $scope.fileList3 = [];
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
            }
            $scope.$digest();
        };
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/probationary/user.do',
            data: JSON.stringify({
                "action": "initProbationaryUserPage"
            }),
            success: function (result) {
                for (var uploadInstruction of result.model.uploadInstructions) {
                    if (uploadInstruction.index === 0) {
                        $scope.upload0Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 1) {
                        $scope.upload1Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 2) {
                        $scope.upload2Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 3) {
                        $scope.upload3Instruction = uploadInstruction.instruction;
                    }
                    $scope.refreshTable(result.model.currentProbationary);
                    $scope.$digest();
                }
            }
        });
        $scope.refreshTable = function (currentActivists) {
            console.log("refresh proposer tables");
            $scope.fileList0 = [];
            $scope.fileList1 = [];
            $scope.fileList2 = [];
            $scope.fileList3 = [];
            for (var activist of currentActivists) {
                if (activist.index === 0) {
                    $scope.fileList0.push(activist)
                } else if (activist.index === 1) {
                    $scope.fileList1.push(activist)
                } else if (activist.index === 2) {
                    $scope.fileList2.push(activist)
                } else if (activist.index === 3) {
                    $scope.fileList3.push(activist)
                }
            }
            $scope.$digest();
        };
        $scope.upload = function (uploadId) {
            var form = new FormData(document.getElementById(uploadId));
            $.ajax({
                type: 'post',
                url: '/probationary/fileUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result.message);
                    $.ajax({
                        type: 'post',
                        contentType: 'application/json;charset=utf-8',
                        dataType: "json",
                        async: true,
                        url: '/probationary/user.do',
                        data: JSON.stringify({
                            "action": "getFileList"
                        }),
                        success: function (result) {
                            $scope.refreshTable(result.model);
                        }
                    })
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