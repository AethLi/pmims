angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerMU.js onload!");
        $scope.upload1Instruction = "加载失败";
        $scope.upload2Instruction = "加载失败";
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/proposer/user.do',
            data: JSON.stringify({
                "action": "initProposerUserPage"
            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.upload1Instruction = result.model.update1Instruction;
                    $scope.upload2Instruction = result.model.update2Instruction;
                }
            }
        });
    });