angular.module('mainPageApp', [])
    .controller("activistUCtrl", function ($scope) {
        console.log("activistU.js onload!");

        $scope.linkman1 = "加载中";
        $scope.phoneNumber1 = "加载中";
        $scope.linkman2 = "加载中";
        $scope.phoneNumber2 = "加载中";
        $scope.upload0Instruction = "";
        $scope.upload1Instruction = "";
        $scope.upload2Instruction = "";
        $scope.upload3Instruction = "";
        $scope.upload4Instruction = "";
        $scope.upload5Instruction = "";
        $scope.upload6Instruction = "";
        $scope.upload7Instruction = "";
        $scope.file0Name = "未选择文件";
        $scope.file1Name = "未选择文件";
        $scope.file2Name = "未选择文件";
        $scope.file3Name = "未选择文件";
        $scope.file4Name = "未选择文件";
        $scope.file5Name = "未选择文件";
        $scope.file6Name = "未选择文件";
        $scope.file7Name = "未选择文件";
        $scope.fileList0 = [];
        $scope.fileList1 = [];
        $scope.fileList2 = [];
        $scope.fileList3 = [];
        $scope.fileList4 = [];
        $scope.fileList5 = [];
        $scope.fileList6 = [];
        $scope.fileList7 = [];

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
                    alert(result.message);
                    $.ajax({
                        type: 'post',
                        contentType: 'application/json;charset=utf-8',
                        dataType: "json",
                        async: true,
                        url: '/activist/user.do',
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
        $scope.refreshTable = function (currentActivists) {
            console.log("refresh proposer tables");
            $scope.fileList0 = [];
            $scope.fileList1 = [];
            $scope.fileList2 = [];
            $scope.fileList3 = [];
            $scope.fileList4 = [];
            $scope.fileList5 = [];
            $scope.fileList6 = [];
            $scope.fileList7 = [];
            for (var activist of currentActivists) {
                if (activist.index === 0) {
                    $scope.fileList0.push(activist)
                } else if (activist.index === 1) {
                    $scope.fileList1.push(activist)
                } else if (activist.index === 2) {
                    $scope.fileList2.push(activist)
                } else if (activist.index === 3) {
                    $scope.fileList3.push(activist)
                } else if (activist.index === 4) {
                    $scope.fileList4.push(activist)
                } else if (activist.index === 5) {
                    $scope.fileList5.push(activist)
                } else if (activist.index === 6) {
                    $scope.fileList6.push(activist)
                } else if (activist.index === 7) {
                    $scope.fileList7.push(activist)
                }
            }
            $scope.$digest();
        };
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/activist/user.do',
            data: JSON.stringify({
                "action": "initActivistUserPage"
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
                    } else if (uploadInstruction.index === 4) {
                        $scope.upload4Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 5) {
                        $scope.upload5Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 6) {
                        $scope.upload6Instruction = uploadInstruction.instruction;
                    } else if (uploadInstruction.index === 7) {
                        $scope.upload7Instruction = uploadInstruction.instruction;
                    }
                    $scope.refreshTable(result.model.currentActivist);
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