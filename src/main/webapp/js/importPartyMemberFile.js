angular.module('mainPageApp', [])
    .controller("importPartyMemberFileCtrl", function ($scope, $http) {
        console.log("importPartyMemberFile.js onload!");

        $scope.importPartyMembers = [];

        $http({
            url: "/partyMember/getImportPartyMember.do",
            method: "POST"
        }).then(function s(result) {
            for (a of result.data.model) {
                $scope.importPartyMembers.push(a);
            }
        }, function e(result) {

        });
        $scope.timeConvert = function (time = +new Date()) {
            var date = new Date(time + 8 * 3600 * 1000);
            return date.toJSON().substr(0, 19).replace('T', ' ').substring(0, 10);
        };
        $scope.formAction = function (userId, desCode) {
            if (desCode === 0) {
                $http({
                    url: "/partyMember/acceptImportPartyMember.do",
                    method:"POST",
                    data: {
                        "desId": userId
                    }
                }).then(function s(result) {
                    alert(result.data.message);
                }, function e(result) {
                    alert("网络错误");
                })
            } else if (desCode === 1) {
                $http({
                    url: "/partyMember/disAcceptImportPartyMember.do",
                    method:"POST",
                    data: {
                        "desId": userId
                    }
                }).then(function s(result) {
                    alert(result.data.message);
                }, function e(result) {
                    alert("网络错误");
                })
            }
        }
    });