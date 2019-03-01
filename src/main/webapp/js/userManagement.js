angular.module('mainPageApp', [])
    .controller("userManagementCtrl", function ($scope) {
        console.log("userManagementCtrl.js onload!");
        $scope.students = [];
        $scope.admins = [];

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/student/studentInfo.do',
            data: JSON.stringify({
                "action": "getAllStudentInfo",
            }),
            success: function (result) {
                $scope.students = result.model;
                $scope.$digest();
            }
        });
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/student/studentInfo.do',
            data: JSON.stringify({
                "action": "getAllAdminInfo",
            }),
            success: function (result) {
                if (result.status === 0) {
                    $scope.admins = result.model;
                    $scope.$digest();
                } else {
                    $(".adminList").css("display", "none");
                }
            }
        });
        $scope.permissionConvert = function (userPermission) {
            if (userPermission === 0) {
                return "申请人";
            } else if (userPermission === 1) {
                return "积极分子";
            } else if (userPermission === 2) {
                return "发展对象";
            } else if (userPermission === 3) {
                return "预备党员";
            } else if (userPermission === 4) {
                return "党员";
            }
        };
        $scope.adminStatusConvert = function (status) {
            if (status === 0) {
                return "已启用";
            } else if (status === 1) {
                return "已停用";
            }
        };
        $scope.sexConvert = function (sex) {
            if (sex === 0) {
                return "男";
            } else if (sex === 1) {
                return "女";
            } else {
                return "未填写";
            }
        };
        $scope.detailForStudent=function (userId) {
            console.log("click on "+userId);
        }
    });