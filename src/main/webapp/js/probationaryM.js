angular.module('managerPageApp', [])
    .controller("probationaryMCtrl", function ($scope) {
        console.log("probationaryM.js onload!");
        $scope.upload0Instruction = "";
        $scope.upload1Instruction = "";
        $scope.upload2Instruction = "";
        $scope.upload3Instruction = "";
        $scope.upload4Instruction = "";
        $scope.proposerCount = "0/0";
        $scope.allProbationary = [];
        $scope.isSuperAdmin = false;

        $scope.probationaryFile0 = [];
        $scope.probationaryFile1 = [];
        $scope.probationaryFile2 = [];
        $scope.probationaryFile3 = [];
        $scope.probationaryFile4 = [];

        $scope.model;
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
            }
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/saveUploadInstruction.do',
                data: JSON.stringify({
                    "index": index,
                    "position": 3,
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
                "code": "3",
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
                    }
                    $scope.$digest();
                }
            }
        });

        $scope.clearProbationaryModel = function () {
            $scope.probationaryFile0 = [];
            $scope.probationaryFile1 = [];
            $scope.probationaryFile2 = [];
            $scope.probationaryFile3 = [];
            $scope.probationaryFile4 = [];
        };
        $scope.tableAction = function (userId) {
            $scope.clearProbationaryModel();
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/probationary.do',
                data: JSON.stringify({
                    "action": "modal",
                    "desId": userId
                }),
                success: function (result) {
                    $scope.model = result.model;
                    for (probationary of $scope.model.probationaries) {
                        if (probationary.index === 0) {
                            $scope.probationaryFile0.push(probationary);
                        } else if (probationary.index === 1) {
                            $scope.probationaryFile1.push(probationary);
                        } else if (probationary.index === 2) {
                            $scope.probationaryFile2.push(probationary);
                        } else if (probationary.index === 3) {
                            $scope.probationaryFile3.push(probationary);
                        } else if (probationary.index === 4) {
                            $scope.probationaryFile4.push(probationary);
                        }
                    }
                    $scope.$digest();
                    $('#myModal').modal();
                }
            });
            $('#myModal').modal();
        };
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/managerCtrl/init.do',
            data: JSON.stringify({
                "desPage": 0,
                "userType": 3,
                "action": "listOfThis"

            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.allProbationary = result.model.users;
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
                url: '/managerCtrl/probationary.do',
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
                url: '/managerCtrl/probationary.do',
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
                url: '/managerCtrl/probationary.do',
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
                        code: 4
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
        $scope.fileAction = function (index, desId) {
            if (index === 0) {
                window.open("/html/imageShow.html?desId=" + desId + "&type=probationary");
            }
            else if (index === 1) {
                window.open("/file/fileDownload.do?desId=" + desId + "&type=probationary");
            }
        }
    });