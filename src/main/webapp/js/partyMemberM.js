angular.module('managerPageApp', [])
    .controller("partyMemberMCtrl", function ($scope) {
        console.log("partyMemberM.js onload!");

        $scope.partyMembers=[];

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
            }
        })
    });