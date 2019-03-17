angular.module('mainPageApp', [])
    .controller("partyMemberUCtrl", function ($scope) {
        console.log("partyMemberU.js onload!");
        $scope.partyMemberDays = "加载中";
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/partyMember/user.do',
            data: JSON.stringify({
                action: "init",
            }),
            success: function (result) {
                $scope.partyMemberDays = result.model;
                $scope.$digest();
            }
        })
    });