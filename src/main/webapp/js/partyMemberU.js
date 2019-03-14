angular.module('mainPageApp', [])
    .controller("partyMemberUCtrl", function ($scope) {
        console.log("partyMemberU.js onload!");
        $scope.partyMemberDays = "加载中";
    });