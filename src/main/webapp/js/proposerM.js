angular.module('managerPageApp', [])
    .controller("proposerMCtrl", function ($scope) {
            console.log("proposerM.js onload!");
            $scope.upload0Instruction = "";
            $scope.upload1Instruction = "";

            $scope.allProposers = [
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
            $scope.proposerCount = "0/0";
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
                    "action":"uploadInstruction"
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
            $scope.tableAction = function (sew) {
                $('#myModal').modal();
            }
        }
    );