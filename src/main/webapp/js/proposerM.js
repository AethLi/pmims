angular.module('managerPageApp', [])
    .controller("proposerMCtrl", function ($scope) {
        console.log("proposerM.js onload!");
        $scope.allProposers = [
            {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            }, {
                name: "阿瑟东",
                userId: 201510,
                count: 20,
                countN: 5
            },
        ];
        $scope.proposerCount = "0/0";

        $.ajax({
            type: 'post',
            url: '/manager/init.do',
            data: JSON.stringify({
                code:"0"
            }),
            dataType: "json",
            contentType: false,
            processData: false,
            success: function (result) {

            }
        })
    })
;