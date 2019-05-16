angular.module('managerPageApp', [])
    .controller("userOverviewCtrl", function ($scope, $http) {
        console.log("userOverview.js onload!");
        $scope.me = "";
        $scope.sex;
        $scope.oldPassword = "";
        $scope.newPassword0 = "";
        $scope.newPassword1 = "";
        $scope.importMenu = false;
        $scope.fileName = "未选择文件";
        $http({
            url: "/user/getImportedStatus.do"
        }).then(function s(result) {

        });
        $scope.importPartyMemberFile = function () {
            $scope.importMenu = true;
        };
        $scope.ChooseFileChange = function () {
            $scope.fileName = $("#fileSelect")[0].files[0].name;
            $scope.$digest();
        };
        $scope.uploadFile = function () {
            //新建了一个列表form
            let form = new FormData();
            //append是往form添加用户选择的一个文件
            form.append("file", $("#fileSelect")[0].files[0]);
            //发起请求
            $.ajax({
                type: 'post',
                url: '/user/fileUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result.message);
                }
            })
        };
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
                    $scope.sex = $scope.me.sex.toString();
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
                    "sex": $scope.sex
                }),
                success: function (result) {
                    alert(result.message);
                    window.location.reload();
                }
            })
        };
        $scope.uploadHeadImg = function () {
            let form = new FormData();
            form.append("file", $("#headImgSelect")[0].files[0]);
            $.ajax({
                type: 'post',
                url: '/student/headImgUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result.message);
                    window.location.reload();
                }
            })
        };
        $scope.changePassword = function () {
            if ($scope.newPassword0 != $scope.newPassword1) {
                $scope.newPassword0 = "";
                $scope.newPassword1 = "";
                alert("两次密码输入不一致");
                return;
            } else {
                $.ajax({
                    async: true,
                    type: 'post',
                    url: '/user/changePassword.do',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify({
                        "oldPassword": $scope.oldPassword,
                        "newPassword": $scope.newPassword0
                    }),
                    dataType: "json",
                    success: function (result) {
                        alert(result.message);
                        $.ajax({
                            type: 'post',
                            contentType: 'application/json;charset=utf-8',
                            dataType: "json",
                            async: true,
                            url: '/user/logout.do',
                            data: JSON.stringify({
                                "action": "logout"
                            }),
                            success: function (result) {
                                if (result.status === 0)
                                    window.location.href = "../index.html";
                            }
                        })
                    }
                })
            }
        }
    });