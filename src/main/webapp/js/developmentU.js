angular.module('mainPageApp', [])
    .controller("developmentUCtrl", function ($scope) {
        console.log("developmentU.js onload!");
        $scope.upload0Instruction = "加载中";
        $scope.upload1Instruction = "加载中";
        $scope.upload2Instruction = "加载中";
        $scope.upload3Instruction = "加载中";
        $scope.upload4Instruction = "加载中";
        $scope.upload5Instruction = "加载中";
        $scope.upload6Instruction = "加载中";
        $scope.upload7Instruction = "加载中";
        $scope.upload8Instruction = "加载中";
        $scope.upload9Instruction = "加载中";
        $scope.upload10Instruction = "加载中";
        $scope.upload11Instruction = "加载中";
        $scope.upload12Instruction = "加载中";
        $scope.upload13Instruction = "加载中";
        $scope.upload14Instruction = "加载中";
        $scope.upload15Instruction = "加载中";
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
        $scope.fileList0 = [];
        $scope.fileList1 = [];
        $scope.fileList2 = [];
        $scope.fileList3 = [];
        $scope.fileList4 = [];
        $scope.fileList5 = [];
        $scope.fileList6 = [];
        $scope.fileList7 = [];
        $scope.fileList8 = [];
        $scope.fileList9 = [];
        $scope.fileList10 = [];
        $scope.fileList11 = [];
        $scope.fileList12 = [];
        $scope.fileList13 = [];
        $scope.fileList14 = [];
        $scope.fileList15 = [];


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
                    alert(result.message);
                    $.ajax({
                        type: 'post',
                        contentType: 'application/json;charset=utf-8',
                        dataType: "json",
                        async: true,
                        url: '/development/user.do',
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

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/development/user.do',
            data: JSON.stringify({
                "action": "initDevelopmentUserPage"
            }),
            success: function (result) {
                if (result.status === 0) {
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
                        } else if (uploadInstruction.index === 8) {
                            $scope.upload8Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 9) {
                            $scope.upload9Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 10) {
                            $scope.upload10Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 11) {
                            $scope.upload11Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 12) {
                            $scope.upload12Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 13) {
                            $scope.upload13Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 14) {
                            $scope.upload14Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 15) {
                            $scope.upload15Instruction = uploadInstruction.instruction;
                        }
                    }
                    $scope.refreshTable(result.model.currentDevelopment);
                }
            }
        });
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
            $scope.fileList8 = [];
            $scope.fileList9 = [];
            $scope.fileList10 = [];
            $scope.fileList11 = [];
            $scope.fileList12 = [];
            $scope.fileList13 = [];
            $scope.fileList14 = [];
            $scope.fileList15 = [];
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
                } else if (activist.index === 7) {
                    $scope.fileList7.push(activist)
                } else if (activist.index === 8) {
                    $scope.fileList8.push(activist)
                } else if (activist.index === 9) {
                    $scope.fileList9.push(activist)
                } else if (activist.index === 10) {
                    $scope.fileList10.push(activist)
                } else if (activist.index === 11) {
                    $scope.fileList11.push(activist)
                } else if (activist.index === 12) {
                    $scope.fileList12.push(activist)
                } else if (activist.index === 13) {
                    $scope.fileList13.push(activist)
                } else if (activist.index === 14) {
                    $scope.fileList14.push(activist)
                } else if (activist.index === 15) {
                    $scope.fileList15.push(activist)
                }
            }
            $scope.$digest();
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