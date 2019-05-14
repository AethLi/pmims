//初始化app和controller
angular.module('mainPageApp', ['ui.router', 'oc.lazyLoad'])
    .controller('mainPageCtrl', function ($scope, $state) {
        //初始化变量的双向绑定
        $scope.userName = "";
        $scope.userPermission = "";
        $scope.whoIsActive = 0;
        $scope.PermissionCode = undefined;
        //切换页面时使上面高亮条也切换
        $scope.iAmActive = function (who) {
            $scope.whoIsActive = who;
        };
        $scope.permissionCheck = function (desPermission) {
            if ($scope.PermissionCode >= 5) {
                return false;
            }
            if ($scope.PermissionCode < desPermission) {
                return false;
            } else
                return true;
        };
        $scope.permissionCheckP = function () {
            if ($scope.PermissionCode == 4 || $scope.PermissionCode == 7 || $scope.PermissionCode == 10) {
                return true;
            } else {
                return false;
            }
        }
        // $scope.importPartyMemberFile = function () {
        //     $state.go("importPartyMemberFile");
        // };
        $scope.logout = function () {
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
        };
        if (window.location.href.indexOf("proposer") != -1) {
            $scope.whoIsActive = 1;
        } else if (window.location.href.indexOf("activist") != -1) {
            $scope.whoIsActive = 2;
        } else if (window.location.href.indexOf("development") != -1) {
            $scope.whoIsActive = 3;
        } else if (window.location.href.indexOf("probationary") != -1) {
            $scope.whoIsActive = 4;
        } else if (window.location.href.indexOf("partyMember") != -1) {
            $scope.whoIsActive = 5;
        } else if (window.location.href.indexOf("userOverview") != -1) {
            $scope.whoIsActive = 0;
        }//判断url，控制前台标签是否高亮

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/user/initPage.do',
            data: JSON.stringify({
                "action": "initPage"
            }),
            success: function (result) {
                if (result.status === 1) {
                    window.location.href = "../index.html";
                } else if (result.status === 0) {
                    try {
                        $scope.userName = result.model.student.name;
                    } catch (e) {

                    }
                    $scope.PermissionCode = result.model.user.userPermission;
                    switch (result.model.user.userPermission) {
                        case 0:
                            $scope.userPermission = "申请人";
                            break;
                        case 1:
                            $scope.userPermission = "积极分子";
                            break;
                        case 2:
                            $scope.userPermission = "发展对象";
                            break;
                        case 3:
                            $scope.userPermission = "预备党员";
                            break;
                        case 4:
                            $scope.userPermission = "党员";
                            break;
                        case 10:
                            $scope.userPermission = "党员";
                            break;
                        case 7:
                            $scope.userPermission = "转入党员";
                            break;
                    }
                }
            }
        })
    })
    .config(function ($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.when("", "userOverview");
        $stateProvider
            .state("userOverview", {
                url: "/userOverview",
                templateUrl: './userOverview.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/userOverview.js']
                        })
                    }]
                }
            })
            .state("proposerU", {
                url: "/proposerU",
                templateUrl: './proposerU.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/proposerU.js']
                        })
                    }]
                }
            })
            .state("activistU", {
                url: "/activistU",
                templateUrl: "./activistU.html",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/activistU.js']
                        })
                    }]
                }
            })
            .state("developmentU", {
                url: "/developmentU",
                templateUrl: "./developmentU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/developmentU.js']
                        })
                    }]
                }
            })
            .state("probationaryU", {
                url: "/probationaryU",
                templateUrl: "./probationaryU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/probationaryU.js']
                        })
                    }]
                }
            })
            .state("partyMemberU", {
                url: "/partyMemberU",
                templateUrl: "./partyMemberU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/partyMemberU.js']
                        })
                    }]
                }
            })
            .state("importPartyMemberFile", {
                url: "/importPartyMemberFile",
                templateUrl: "./importPartyMemberFile.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            files: ['../js/importPartyMemberFile.js']
                        })
                    }]
                }
            })
    });