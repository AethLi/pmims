angular.module('mainPageApp', [])
    .controller("exportPartyMemberCtrl", function ($scope, $http) {
        $scope.exportPartyMembers = [];
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/managerCtrl/init.do',
            data: JSON.stringify({
                "desPage": 0,
                "userType": 10,
                "action": "listOfThis"

            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.exportPartyMembers = result.model.users;
                    $scope.$digest();
                }
            }
        });
        $scope.formAction = function (userId, code) {
            $http({
                url: "/partyMember/exportPartyMemberAction.do",
                method: "POST",
                data: {
                    desId: userId,
                    code: code
                }
            }).then(function s(result) {
                alert(result.data.message);
                window.location.reload();
            }, function e(result) {
                alert("网络错误");
            })
        }
    });