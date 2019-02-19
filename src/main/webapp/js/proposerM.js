angular.module('managerPageApp', [])
    .controller("proposerMCtrl", function ($scope) {
            console.log("proposerM.js onload!");
            $scope.upload0Instruction = "";
            $scope.upload1Instruction = "";

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
                    "userType":0,
                    "action":"listOfThis"

                }),
                success: function (result) {
                    if (result.status===0){
                        $scope.allProposers=result.model.users;
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
                        "desId":userId
                    }),
                    success:function (result) {
                        $scope.model=result.model;
                    }
                });
                $('#myModal').modal();
            };
            $scope.clearProposerModel=function () {
                $scope.model=undefined;
            }
        }
    );