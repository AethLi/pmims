angular.module('managerPageApp', [])
    .controller("developmentMCtrl", function ($scope) {
        console.log("developmentM.js onload!");
        $scope.upload0Instruction = "";
        $scope.upload1Instruction = "";
        $scope.upload2Instruction = "";
        $scope.upload3Instruction = "";
        $scope.upload4Instruction = "";
        $scope.upload5Instruction = "";
        $scope.upload6Instruction = "";
        $scope.upload7Instruction = "";
        $scope.upload8Instruction = "";
        $scope.upload9Instruction = "";
        $scope.upload10Instruction = "";
        $scope.upload11Instruction = "";
        $scope.upload12Instruction = "";
        $scope.upload13Instruction = "";
        $scope.upload14Instruction = "";
        $scope.upload15Instruction = "";
        $scope.proposerCount = "0/0";
        $scope.allDevelpment = [];
        $scope.isSuperAdmin = false;

        $scope.developmentFile0 = [];
        $scope.developmentFile1 = [];
        $scope.developmentFile2 = [];
        $scope.developmentFile3 = [];
        $scope.developmentFile4 = [];
        $scope.developmentFile5 = [];
        $scope.developmentFile6 = [];
        $scope.developmentFile7 = [];
        $scope.developmentFile8 = [];
        $scope.developmentFile9 = [];
        $scope.developmentFile10 = [];
        $scope.developmentFile11 = [];
        $scope.developmentFile12 = [];
        $scope.developmentFile13 = [];
        $scope.developmentFile14 = [];
        $scope.developmentFile15 = [];

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
            } else if (index === 5) {
                uploadInstruction = $scope.upload5Instruction;
            } else if (index === 6) {
                uploadInstruction = $scope.upload6Instruction;
            } else if (index === 7) {
                uploadInstruction = $scope.upload7Instruction;
            } else if (index === 8) {
                uploadInstruction = $scope.upload8Instruction;
            } else if (index === 9) {
                uploadInstruction = $scope.upload9Instruction;
            } else if (index === 10) {
                uploadInstruction = $scope.upload10Instruction;
            } else if (index === 11) {
                uploadInstruction = $scope.upload11Instruction;
            } else if (index === 12) {
                uploadInstruction = $scope.upload12Instruction;
            } else if (index === 13) {
                uploadInstruction = $scope.upload13Instruction;
            } else if (index === 14) {
                uploadInstruction = $scope.upload14Instruction;
            } else if (index === 15) {
                uploadInstruction = $scope.upload15Instruction;
            }
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/saveUploadInstruction.do',
                data: JSON.stringify({
                    "index": index,
                    "position": 2,
                    "instruction": uploadInstruction
                }),
                success: function (result) {
                    console.log(result);
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
                "code": "2",
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
                    $scope.$digest();
                }
            }
        });
        $scope.clearDevelopmentModel = function () {
            $scope.developmentFile0 = [];
            $scope.developmentFile1 = [];
            $scope.developmentFile2 = [];
            $scope.developmentFile3 = [];
            $scope.developmentFile4 = [];
            $scope.developmentFile5 = [];
            $scope.developmentFile6 = [];
            $scope.developmentFile7 = [];
            $scope.developmentFile8 = [];
            $scope.developmentFile9 = [];
            $scope.developmentFile10 = [];
            $scope.developmentFile11 = [];
            $scope.developmentFile12 = [];
            $scope.developmentFile13 = [];
            $scope.developmentFile14 = [];
            $scope.developmentFile15 = [];
        };
        $scope.tableAction = function (userId) {
            $scope.clearDevelopmentModel();
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/development.do',
                data: JSON.stringify({
                    "action": "modal",
                    "desId": userId
                }),
                success: function (result) {
                    $scope.model = result.model;
                    for (development of $scope.model.developments) {
                        if (development.index === 0) {
                            $scope.developmentFile0.push(development);
                        } else if (development.index === 1) {
                            $scope.developmentFile1.push(development);
                        } else if (development.index === 2) {
                            $scope.developmentFile2.push(development);
                        } else if (development.index === 3) {
                            $scope.developmentFile3.push(development);
                        } else if (development.index === 4) {
                            $scope.developmentFile4.push(development);
                        } else if (development.index === 5) {
                            $scope.developmentFile5.push(development);
                        } else if (development.index === 6) {
                            $scope.developmentFile6.push(development);
                        } else if (development.index === 7) {
                            $scope.developmentFile7.push(development);
                        } else if (development.index === 8) {
                            $scope.developmentFile8.push(development);
                        } else if (development.index === 9) {
                            $scope.developmentFile9.push(development);
                        } else if (development.index === 10) {
                            $scope.developmentFile10.push(development);
                        } else if (development.index === 11) {
                            $scope.developmentFile11.push(development);
                        } else if (development.index === 12) {
                            $scope.developmentFile12.push(development);
                        } else if (development.index === 13) {
                            $scope.developmentFile13.push(development);
                        } else if (development.index === 14) {
                            $scope.developmentFile14.push(development);
                        } else if (development.index === 15) {
                            $scope.developmentFile15.push(development);
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
                "userType": 2,
                "action": "listOfThis"
            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.allDevelpment = result.model.users;
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
                url: '/managerCtrl/development.do',
                data: JSON.stringify({
                    "action": "accept",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status===0){
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
                url: '/managerCtrl/development.do',
                data: JSON.stringify({
                    "action": "disAccept",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status===0){
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
                url: '/managerCtrl/development.do',
                data: JSON.stringify({
                    "action": "delete",
                    "desId": desId,
                }),
                success: function (result) {
                    if (result.status===0){
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
                        code: 3
                    }),
                    success: function (result) {
                        if (result.status === 0) {
                            alert(result.message);
                        }
                    }
                })
            }
        };
    });