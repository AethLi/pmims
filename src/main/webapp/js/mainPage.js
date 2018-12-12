angular.module('mainPageApp', ['ui.router', 'oc.lazyLoad'])
    .controller('mainPageCtrl', function ($scope) {
        $scope.whoIsActive = 0;
        $scope.iAmActive = function (who) {
            $scope.whoIsActive = who;
        };
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
                            name: 'managerPageApp',
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
                            name: 'managerPageApp',
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
                            name: 'managerPageApp',
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
                            name: 'managerPageApp',
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
                            name: 'managerPageApp',
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
                            name: 'managerPageApp',
                            files: ['../js/partyMemberU.js']
                        })
                    }]
                }
            })
    });