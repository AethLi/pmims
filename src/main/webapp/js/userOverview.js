angular.module('managerPageApp', [])
    .controller("userOverviewCtrl", function ($scope) {
        console.log("userOverview.js onload!");
        $scope.me = undefined;

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/student/studentInfo.do',
            data: JSON.stringify({
                "action": "initPage"
            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.me = result.model;
                }
                $scope.$digest();
            }
        });
        $scope.souStudentInfo = function () {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/student/saveOrUpdateStudentInfo.do',
                data: JSON.stringify({
                    "action": "sou",
                    "name": $scope.me.name,
                    "classInfo": $scope.me.classInfo,
                    "IDcardNum": $scope.me.IDcardNum,
                    "position": $scope.me.position,
                    "homeAddress": $scope.me.homeAddress,

                }),
                success: function (result) {
                    alert(result.message);
                }
            })
        };
        $scope.uploadHeadImg=function () {
            var form = new FormData(document.getElementById("headImgForm"));
            $.ajax({
                type: 'post',
                url: '/student/headImgUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result.message);
                }
            })
        }
    });