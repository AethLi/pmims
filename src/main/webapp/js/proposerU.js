angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerU.js onload!");
        $scope.upload0Instruction = "加载失败";
        $scope.upload1Instruction = "加载失败";
        $scope.imageFileChose = "未选择文件";
        $scope.wordFileChose = "未选择文件";
        $scope.proposerImageFileList = [];
        $scope.proposerWordFileList = [];

        $scope.ImageShow = function (desId) {
            window.open("/html/imageShow.html?desId=" + desId + "&type=proposer");
        };
        $scope.fileDownload = function (desId) {
            window.open("/file/fileDownload.do?desId=" + desId + "&type=proposer");
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


        /**
         * 上传文件
         * 根据id来获得上传的是哪个文件，再将其打包为一个form表单，通过json的格式进行提交
         * @param uploadId
         */
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

        /**
         * 请求当前页已上传的数据和说明数据
         */
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
                        if (uploadInstruction.index === 0) {
                            $scope.upload0Instruction = uploadInstruction.instruction;
                        } else if (uploadInstruction.index === 1) {
                            $scope.upload1Instruction = uploadInstruction.instruction;
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

        $scope.timeConvert = function (time = +new Date()) {
            var date = new Date(time + 8 * 3600 * 1000);
            return date.toJSON().substr(0, 19).replace('T', ' ').substring(0, 10);
        };
        $scope.statusConvert = function (status) {
            if (status === 0) {
                return "未审核";
            } else if (status === 1) {
                return "已通过";
            } else if (status === 2) {
                return "未通过";
            }
        };
        $scope.statusCheck = function (status) {
            if (status === 1) {
                return false;
            }
            return true;
        };
    });