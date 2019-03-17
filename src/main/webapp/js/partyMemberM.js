angular.module('managerPageApp', [])
    .controller("partyMemberMCtrl", function ($scope) {
        console.log("partyMemberM.js onload!");

        $scope.partyMembers=[];

        $scope.timeConvert = function (time = +new Date()) {
            var date = new Date(time + 8 * 3600 * 1000);
            return date.toJSON().substr(0, 19).replace('T', ' ').substring(0, 10);
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
                $scope.partyMembers=result.model;
                $scope.$digest();
            }
        })
    });