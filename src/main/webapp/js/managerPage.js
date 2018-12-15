angular.module('managerPageApp', ['ui.router', 'oc.lazyLoad'])
    .controller('managerPageCtrl', function ($scope) {
        var eggCount = 0;
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
        } else if (window.location.href.indexOf("userOverview") != -1) {
            $scope.whoIsActive = 0;
        }
        $scope.eggDisplay = function () {
            eggCount++;
            if (eggCount === 5) {
                alert("点这个没用的;");
                eggCount = 0;
            }
        }
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
            .state("proposerM", {
                url: "/proposerM",
                controller: "proposerMCtrl",
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
                controller: "activistMCtrl",
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
                controller: "developmentMCtrl",
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
                controller: "probationaryMCtrl",
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
                controller: "partyMemberMCtrl",
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
    });
