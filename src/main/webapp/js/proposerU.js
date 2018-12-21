angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerU.js onload!");
        $scope.upload1Instruction = "加载失败";
        $scope.upload2Instruction = "加载失败";
        $scope.imageFileActionHint="选择文件";
        $scope.imageFileChose="未选择文件";
        // $scope.proposerImageFileChooseList = new Array();
        $scope.proposerImageFileList;
        $scope.proposerWordFileChooseList = new Array();
        $scope.proposerWordFileList;
        $scope.ImageShow = function (whoAction) {

        };
        $scope.proposerImageFileUploadChoose = function () {
            var proposerImageFileUpload = document.getElementById("proposerImageFileChoose").files[0];
            // if (proposerImageFileUpload == null)
            //     return;
            // $scope.proposerImageFileChooseList.push(proposerImageFileUpload);
            $scope.imageFileChose="已选择："+proposerImageFileUpload.name;
            $scope.$digest();
        };

        $scope.upload=function(updateId){
          $.ajaxFileUpload({
              url : '/proposer/fileUpload.do',
              secureuri : false,
              fileElementId : updateId,
              dataType : 'json',
              data : "",
              success : function(data, status) {
              },
              error : function(data, status, e) {
                  alert('上传出错');
              }
          })
        };

        $scope.uploadFile = function (formId) {
            var formData = new FormData($(formId));
            $.ajax({
                url: '/proposer/fileUpload.do',
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (returndata) {
                    alert(returndata);
                },
                error: function (returndata) {
                    alert(returndata);
                }
            })
        };
        $scope.proposerWordFileUploadChoose = function () {
            var proposerWordFileUpload = document.getElementById("proposerWordFileUpload").files[0];
            if (proposerWordFileUpload == null)
                return;
            $scope.proposerWordFileChooseList.push(proposerWordFileUpload);
            $scope.$digest();
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
                    $scope.$digest();
                }
            }
        });
    });