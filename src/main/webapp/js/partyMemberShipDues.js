angular.module('managerPageApp', [])
    .controller("PartyMemberShipDuesCtrl", function ($scope) {
        console.log("partyMemberShipDues.js  onload!");

        $scope.fileName = "";

        $scope.partyMembers = [];

        $scope.uploadFile = function () {
            let form = new FormData();
            form.append("file", $("#fileSelect")[0].files[0]);
            $.ajax({
                type: 'post',
                url: '/partyMember/fileUpload.do',
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

        $scope.downLoadTemplate = function () {

        };

        $scope.timeConvert = function (time = +new Date()) {
            var date = new Date(time + 8 * 3600 * 1000);
            return date.toJSON().substr(0, 19).replace('T', ' ').substring(0, 10);
        };

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/partyMember/getShipDues.do',
            data: JSON.stringify({}),
            success: function (result) {
                $scope.partyMembers = result.model;
                $scope.$digest();
            }
        })
    });