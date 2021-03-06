angular.module('mainPageApp', [])
    .controller("userManagementCtrl", function ($scope) {
        console.log("userManagementCtrl.js onload!");
        $scope.students = [];
        $scope.admins = [];
        $scope.adminActionFlag = 0;
        $scope.addAdminUserId = "";
        $scope.addAdminStatus = 0;

        $scope.uploadFile = function () {
            let form = new FormData();
            form.append("file", $("#fileSelect")[0].files[0]);
            $.ajax({
                type: 'post',
                url: '/user/importNewUsers.do',
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
        $scope.ChooseFileChange = function () {
            $scope.fileName = $("#fileSelect")[0].files[0].name;
            $scope.$digest();
        };

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
        $scope.detailForStudent = function (userId) {
            console.log("click on " + userId);
        };
        $scope.addAdmin = function () {
            //$('')是一个jQuery的选择器，#表示ID选择器，.是class选择器
            //.modal('show')是调用bootstrap的模态框展示
            $('#addAdminModal').modal("show");
        };
        $scope.addAdminSave = function () {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/user/addAdmin.do',
                data: JSON.stringify({
                    desId: $scope.addAdminUserId,
                    code: $scope.addAdminStatus
                }),
                success: function (result) {
                    alert(result.message);
                    window.location.reload();//刷新页面
                }
            });
        };
        //修改管理员的状态：启用0   停用1   删除2
        $scope.actionAdminUsers = function (userId, code) {
            if (code === 0) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/admin.do',
                    data: JSON.stringify({
                        action: "update",
                        desId: userId,
                        code: 0
                    }),
                    success: function (result) {
                        alert(result.message);
                        window.location.reload();
                    }
                });
            } else if (code === 1) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/admin.do',
                    data: JSON.stringify({
                        action: "update",
                        desId: userId,
                        code: 1
                    }),
                    success: function (result) {
                        alert(result.message);
                        window.location.reload();
                    }
                });
            } else if (code === 2) {
                $.ajax({
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: "json",
                    async: true,
                    url: '/managerCtrl/admin.do',
                    data: JSON.stringify({
                        action: "delete",
                        desId: userId,
                    }),
                    success: function (result) {
                        alert(result.message);
                        window.location.reload();
                    }
                });
            }

        }
    });