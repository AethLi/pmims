angular.module('mainPageApp', [])
    .controller("partyMemberUCtrl", function ($scope, $http) {
        console.log("partyMemberU.js onload!");
        $scope.partyMemberDays = "";
        $scope.exportPM = function () {
            $http({
                url: "/partyMember/applyForExport.do",
                method: "POST"
            }).then(function s(result) {
                alert(result.data.message);
            }, function e(result) {
                alert("网络错误");
            })
        };
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