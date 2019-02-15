angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerU.js onload!");
        $scope.upload1Instruction = "加载失败";
        $scope.upload2Instruction = "加载失败";
        $scope.imageFileChose = "未选择文件";
        $scope.wordFileChose = "未选择文件";
        $scope.proposerImageFileList = [];
        $scope.proposerWordFileList = [];

        $scope.ImageShow = function (whoAction) {

        };

        $scope.proposerImageFileUploadChoose = function () {
            var proposerImageFileUpload = document.getElementById("proposerImageFileChoose").files[0];
            $scope.imageFileChose = "已选择：" + proposerImageFileUpload.name;
            $scope.$digest();
        };

        $scope.proposerWordFileUploadChoose = function () {
            var proposerWordFileUpload = document.getElementById("proposerWordFileChoose").files[0];
            $scope.wordFileChose = "已选择：" + proposerWordFileUpload.name;
            $scope.$digest();
        };

        $scope.refreshTable = function (currentProposer) {
            console.log("refresh proposer tables");
            $scope.proposerImageFileList = [];
            $scope.proposerWordFileList = [];
            for (var proposer of currentProposer) {
                if (proposer.index === 0) {
                    $scope.proposerImageFileList.push(proposer)
                } else if (proposer.index === 1) {
                    $scope.proposerWordFileList.push(proposer)
                }
            }
            $scope.$digest();
        };

        $scope.upload = function (uploadId) {
            var form = new FormData(document.getElementById(uploadId));
            $.ajax({
                type: 'post',
                url: '/proposer/fileUpload.do',
                data: form,
                dataType: "json",
                contentType: false,
                processData: false,
                success: function (result) {
                    alert(result.message);
                    $.ajax({
                        type: 'post',
                        contentType: 'application/json;charset=utf-8',
                        dataType: "json",
                        async: true,
                        url: '/proposer/user.do',
                        data: JSON.stringify({
                            "action": "getFileList"
                        }),
                        success: function (result) {
                            $scope.refreshTable(result.model);
                        }
                    })
                }
            })
        };

        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            url: '/proposer/user.do',
            data: JSON.stringify({
                "action": "initProposerUserPage"
            }),
            success: function (result) {
                if (result.status === 0) {
                    for (var uploadInstruction of result.model.uploadInstructions) {
                        if (uploadInstruction.index === 1) {
                            $scope.upload1Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 2) {
                            $scope.upload2Instruction = uploadInstruction.instruction;
                        }
                    }
                    $scope.refreshTable(result.model.currentProposer);
                }
            }
        });

        $scope.delete = function (fileId) {
            $.ajax({
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: "json",
                async: true,
                url: '/proposer/fileDelete.do',
                data: JSON.stringify({
                    "desId": fileId
                }),
                success: function (result) {
                    $scope.refreshTable(result.model);
                }
            })
        };

        $scope.timestampToTime = function (timestamp) {
            // var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            var D = date.getDate() + ' ';
            var h = date.getHours() + ':';
            var m = date.getMinutes() + ':';
            var s = date.getSeconds();
            return Y + M + D + h + m + s;
        };
    });