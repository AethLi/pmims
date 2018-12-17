angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerU.js onload!");
        $scope.upload1Instruction = "加载失败";
        $scope.upload2Instruction = "加载失败";
        $scope.proposerImageFileChooseList = new Array();
        $scope.proposerImageFileList;
        $scope.proposerWordFileChooseList=new Array();
        $scope.proposerWordFileList;
        $scope.ImageShow = function (whoAction) {

        };
        $scope.proposerImageFileUploadChoose = function () {
            var proposerImageFileUpload = document.getElementById("proposerImageFileUpload").files[0];
            if (proposerImageFileUpload == null)
                return;
            $scope.proposerImageFileChooseList.push(proposerImageFileUpload);
            $scope.$digest();

        };
        $scope.upload=function(fileInfo){
          var uploadForm=new FormData();
          uploadForm.append("fileInfo",fileInfo);
          $.ajax({
              async: true,
              url:'/proposer/fileUpload.do',
              type: 'post',
              contentType: 'multipart/form-data',
              processData:false,
              data: fileInfo,
              success:function (result) {
                  console.log(result);
                  console.log("success");
              }
          })
        };
        $scope.proposerWordFileUploadChoose=function(){
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