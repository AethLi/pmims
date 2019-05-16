angular.module('managerPageApp', [])
    .controller("proposerMCtrl", function ($scope) {
            console.log("proposerM.js onload!");
            $scope.upload0Instruction = "";
            $scope.upload1Instruction = "";

            $scope.proposerFile0 = [];
            $scope.proposerFile1 = [];

            $scope.isSuperAdmin = false;

            $scope.allProposers;
            $scope.proposerCount = "0/0";
            $scope.model;
            $scope.saveUploadInstruction = function (index) {
                var uploadInstruction = "";
                if (index === 0) {
                    uploadInstruction = $scope.upload0Instruction;
                } else if (index === 1) {
                    uploadInstruction = $scope.upload1Instruction;
                }
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/saveUploadInstruction.do',
                    data: JSON.stringify({
                        "index": index,
                        "position": 0,
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
                    "code": "0",
                    "action": "uploadInstruction"
                }),
                success: function (result) {
                    for (uploadInstruction of result.model) {
                        if (uploadInstruction.index === 0) {
                            $scope.upload0Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 1) {
                            $scope.upload1Instruction = uploadInstruction.instruction;
                        }
                        $scope.$digest();
                    }
                }
            });
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/managerCtrl/init.do',
                data: JSON.stringify({
                    "desPage": 0,
                    "userType": 0,
                    "action": "listOfThis"

                }),
                success: function (result) {
                    if (result.status === 0) {
                        $scope.allProposers = result.model.users;
                        $scope.isSuperAdmin = result.model.isSuperAdmin;
                        $scope.$digest();
                    }
                }
            });
            $scope.tableAction = function (userId) {
                $scope.clearProposerModel();
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/proposer.do',
                    data: JSON.stringify({
                        "desId": userId,
                        "action": "modal"
                    }),
                    success: function (result) {
                        $scope.model = result.model;
                        for (proposer of $scope.model.proposers) {
                            if (proposer.index === 0) {
                                $scope.proposerFile0.push(proposer);
                            } else if (proposer.index === 1) {
                                $scope.proposerFile1.push(proposer);
                            }
                        }
                        $scope.$digest();
                        $('#myModal').modal();
                    }
                });
            };
            $scope.clearProposerModel = function () {
                $scope.model = undefined;
                $scope.proposerFile0 = [];
                $scope.proposerFile1 = [];
            };
            $scope.accept = function (desId) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/proposer.do',
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
                    url: '/managerCtrl/proposer.do',
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
                    url: '/managerCtrl/proposer.do',
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
                            code: 1
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
            $scope.fileAction = function (index, desId) {
                if (index === 0) {
                    window.open("/html/imageShow.html?desId=" + desId + "&type=proposer");
                }
                else if (index === 1) {
                    window.open("/file/fileDownload.do?desId=" + desId + "&type=proposer");
                }
            }
        }
    );