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
        $scope.linkMan0 = "";
        $scope.linkMan1 = "";
        $scope.linkNumber0 = "";
        $scope.linkNumber1 = "";
        $scope.allActivists = [];

        $scope.isSuperAdmin = false;

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
                    for (activist of $scope.model.activists) {
                        if (activist.index === 0) {
                            $scope.activistFile0.push(activist);
                        } else if (activist.index === 1) {
                            $scope.activistFile1.push(activist);
                        }
                    }
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
    });