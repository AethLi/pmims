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
                url: '/managerCtrl/Probationary.do',
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
    });