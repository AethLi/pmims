angular.module('mainPageApp', ['ui.router', 'oc.lazyLoad'])
    .controller('mainPageCtrl', function ($scope) {
        $scope.userName = "加载中";
        $scope.userPermission = "加载中";
        $scope.whoIsActive = 0;
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
                    $scope.userName = result.model.student.name;
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
                controller: "userOverviewCtrl",
                templateUrl: './userOverview.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/userOverview.js']
                        })
                    }]
                }
            })
            .state("proposerU", {
                url: "/proposerU",
                controller: "proposerUCtrl",
                templateUrl: './proposerU.html',
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/proposerU.js']
                        })
                    }]
                }
            })
            .state("activistU", {
                url: "/activistU",
                controller: "activistUCtrl",
                templateUrl: "./activistU.html",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/activistU.js']
                        })
                    }]
                }
            })
            .state("developmentU", {
                url: "/developmentU",
                controller: "developmentUCtrl",
                templateUrl: "./developmentU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/developmentU.js']
                        })
                    }]
                }
            })
            .state("probationaryU", {
                url: "/probationaryU",
                controller: "probationaryUCtrl",
                templateUrl: "./probationaryU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/probationaryU.js']
                        })
                    }]
                }
            })
            .state("partyMemberU", {
                url: "/partyMemberU",
                controller: "partyMemberUCtrl",
                templateUrl: "./partyMemberU.html",
                resolve: {
                    loadMyCtrl: ["$ocLazyLoad", function ($ocLazyLoad) {
                        return $ocLazyLoad.load({
                            name: 'mainPageApp',
                            files: ['../js/partyMemberU.js']
                        })
                    }]
                }
            })
    });