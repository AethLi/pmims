angular.module('managerPageApp', ['ui.router', 'oc.lazyLoad'])
    .controller('managerPageCtrl', function ($scope) {
        var eggCount = 0;
        $scope.userPermission = "";
        $scope.whoIsActive = 0;
        $scope.userName = "";
        $scope.iAmActive = function (who) {
            $scope.whoIsActive = who;
        };
        if (window.location.href.indexOf("proposer") != -1) {
            $scope.whoIsActive = 1;
        } else if (window.location.href.indexOf("activist") != -1) {
            $scope.whoIsActive = 2;
        } else if (window.location.href.indexOf("development") != -1) {
            $scope.whoIsActive = 3;
        } else if (window.location.href.indexOf("probationary") != -1) {
            $scope.whoIsActive = 4;
        } else if (window.location.href.indexOf("userOverview") != -1) {
            $scope.whoIsActive = 0;
        }
        $scope.eggDisplay = function () {
            eggCount++;
            if (eggCount === 5) {
                alert("点这个没用的;");
                eggCount = 0;
            }
        };
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
                    $scope.userName = result.model.user.userId;
                    $scope.PermissionCode = result.model.user.userPermission;
                    switch (result.model.user.userPermission) {
                        case 5:
                            $scope.userPermission = "管理员";
                            break;
                        case 6:
                            $scope.userPermission = "系统管理员";
                            break;
                    }
                }
            }
        });
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
    })
    .config(function ($stateProvider, $urlRouterProvider) {
        $urlRouterProvider.when("", "userManagement");
        $stateProvider
            .state("userOverview", {
                url: "/userOverview",
                templateUrl: './userOverview.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/userOverview.js']
                        })
                    }]
                }
            })
            .state("proposerM", {
                url: "/proposerM",
                templateUrl: './proposerM.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/proposerM.js']
                        })
                    }]
                }
            })
            .state("activistM", {
                url: "/activistM",
                templateUrl: "./activistM.html",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/activistM.js']
                        })
                    }]
                }
            })
            .state("developmentM", {
                url: "/developmentM",
                templateUrl: "./developmentM.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/developmentM.js']
                        })
                    }]
                }
            })
            .state("probationaryM", {
                url: "/probationaryM",
                templateUrl: "./probationaryM.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/probationaryM.js']
                        })
                    }]
                }
            })
            .state("partyMemberM", {
                url: "/partyMemberM",
                templateUrl: "./partyMemberM.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/partyMemberM.js']
                        })
                    }]
                }
            })
            .state("userManagement", {
                url: "/userManagement",
                templateUrl: "./userManagement.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/userManagement.js']
                        })
                    }]
                }
            })
            .state("partyMemberShipDues", {
                url: "/partyMemberShipDues",
                templateUrl: "./partyMemberShipDues.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/partyMemberShipDues.js']
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
                            name: 'managerPageApp',
                            files: ['../js/importPartyMemberFile.js']
                        })
                    }]
                }
            })
            .state("exportPartyMember", {
                url: "/exportPartyMember",
                templateUrl: "./exportPartyMember.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'managerPageApp',
                            files: ['../js/exportPartyMember.js']
                        })
                    }]
                }
            })
    });
