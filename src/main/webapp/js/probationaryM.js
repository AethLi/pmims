angular.module('managerPageApp', [])
    .controller("probationaryMCtrl", function ($scope) {
        console.log("probationaryM.js onload!");
        $scope.upload0Instruction = "";
        $scope.upload1Instruction = "";
        $scope.upload2Instruction = "";
        $scope.upload3Instruction = "";
        $scope.upload4Instruction = "";
        $scope.proposerCount = "0/0";
        $scope.allProbationary = [
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
        $scope.tableAction = function (sew) {
            $('#myModal').modal();
        }
    });