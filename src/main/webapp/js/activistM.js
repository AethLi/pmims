angular.module('managerPageApp', [])
    .controller("activistMCtrl", function ($scope) {
        console.log("activistM.js onload!");
        $scope.upload0Instruction = "";
        $scope.upload1Instruction = "";
        $scope.upload2Instruction = "";
        $scope.upload3Instruction = "";
        $scope.upload4Instruction = "";
        $scope.upload5Instruction = "";
        $scope.upload6Instruction = "";
        $scope.upload7Instruction = "";

        $scope.activistFile0 = [];
        $scope.activistFile1 = [];
        $scope.activistFile2 = [];
        $scope.activistFile3 = [];
        $scope.activistFile4 = [];
        $scope.activistFile5 = [];
        $scope.activistFile6 = [];
        $scope.activistFile7 = [];

        $scope.activistCount = "0/0";
        $scope.name0 = "";
        $scope.name1 = "";
        $scope.phoneNum0 = "";
        $scope.phoneNum1 = "";
        $scope.allActivists = [];

        $scope.isSuperAdmin = false;
        $scope.model;

        $scope.fileAction = function (index, desId) {
            if (index === 0) {
                window.open("/html/imageShow.html?desId=" + desId + "&type=activist");
            }
            else if (index === 1) {
                window.open("/file/fileDownload.do?desId=" + desId + "&type=activist");
            }
        };
        $scope.saveUploadInstruction = function (index) {
            var uploadInstruction = "";
            if (index === 0) {
                uploadInstruction = $scope.upload0Instruction;
            } else if (index === 1) {
                uploadInstruction = $scope.upload1Instruction;
            } else if (index === 2) {
                uploadInstruction = $scope.upload2Instruction;
            } else if (index === 3) {
                uploadInstruction = $scope.upload3Instruction;
            } else if (index === 4) {
                uploadInstruction = $scope.upload4Instruction;
            } else if (index === 5) {
                uploadInstruction = $scope.upload5Instruction;
            } else if (index === 6) {
                uploadInstruction = $scope.upload6Instruction;
            } else if (index === 7) {
                uploadInstruction = $scope.upload7Instruction;
            }
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/saveUploadInstruction.do',
                data: JSON.stringify({
                    "index": index,
                    "position": 1,
                    "instruction": uploadInstruction
                }),
                success: function (result) {
                    alert(result.message);
                }
            });
        };
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/managerCtrl/init.do',
            data: JSON.stringify({
                "code": "1",
                "action": "uploadInstruction"
            }),
            success: function (result) {
                for (uploadInstruction of result.model) {
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
                    $scope.$digest();
                }
            }
        });
        $scope.clearActivistModel = function () {
            $scope.activistFile0 = [];
            $scope.activistFile1 = [];
            $scope.activistFile2 = [];
            $scope.activistFile3 = [];
            $scope.activistFile4 = [];
            $scope.activistFile5 = [];
            $scope.activistFile6 = [];
            $scope.activistFile7 = [];
        };
        $scope.tableAction = function (userId) {
            $scope.clearActivistModel();
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/activist.do',
                data: JSON.stringify({
                    "action": "modal",
                    "desId": userId
                }),
                success: function (result) {
                    $scope.model = result.model;
                    for (let activist of $scope.model.activists) {
                        if (activist.index === 0) {
                            $scope.activistFile0.push(activist);
                        } else if (activist.index === 1) {
                            $scope.activistFile1.push(activist);
                        } else if (activist.index === 2) {
                            $scope.activistFile2.push(activist);
                        } else if (activist.index === 3) {
                            $scope.activistFile3.push(activist);
                        } else if (activist.index === 4) {
                            $scope.activistFile4.push(activist);
                        } else if (activist.index === 5) {
                            $scope.activistFile5.push(activist);
                        } else if (activist.index === 6) {
                            $scope.activistFile6.push(activist);
                        } else if (activist.index === 7) {
                            $scope.activistFile7.push(activist);
                        }
                    }
                    // $scope.name0 = result.model.activistHelper.name0;
                    // $scope.name1 = result.model.activistHelper.name1;
                    // $scope.phoneNum0 = result.model.activistHelper.phoneNum0;
                    // $scope.phoneNum1 = result.model.activistHelper.phoneNum1;
                    $scope.$digest();
                    $('#myModal').modal();
                }
            });
        };
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/managerCtrl/init.do',
            data: JSON.stringify({
                "desPage": 0,
                "userType": 1,
                "action": "listOfThis"

            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.allActivists = result.model.users;
                    $scope.isSuperAdmin = result.model.isSuperAdmin;
                    $scope.$digest();
                }
            }
        });
        $scope.accept = function (desId) {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/activist.do',
                data: JSON.stringify({
                    "action": "accept",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status === 0) {
                        alert(result.message);
                    }
                }
            })
        };
        $scope.disAccept = function (desId) {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/activist.do',
                data: JSON.stringify({
                    "action": "disAccept",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status === 0) {
                        alert(result.message);
                    }
                }
            })
        };
        $scope.deleteItem = function (desId) {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/activist.do',
                data: JSON.stringify({
                    "action": "delete",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status === 0) {
                        alert(result.message);
                    }
                }
            })
        };
        $scope.userAction = function (action, userId) {
            if (action === 0) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/user.do',
                    data: JSON.stringify({
                        "action": "accept",
                        "desId": userId,
                        code: 2
                    }),
                    success: function (result) {
                        if (result.status === 0) {
                            alert(result.message);
                        }
                    }
                })
            } else if (action == 2) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/user/deleteById.do',
                    data: JSON.stringify({
                        "desId": userId,
                    }),
                    success: function (result) {
                        if (result.status === 0) {
                            alert(result.message);
                        }
                    }
                })
            }
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
    });