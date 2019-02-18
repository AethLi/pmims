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
        $scope.allDevelpment = [
            {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            },
        ];
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
                "action":"uploadInstruction"
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
        $scope.tableAction = function (sew) {
            $('#myModal').modal();
        }
    });