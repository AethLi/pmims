angular.module('mainPageApp', [])
    .controller("proposerUCtrl", function ($scope) {
        console.log("proposerU.js onload!");
        $scope.upload1Instruction = "加载失败";
        $scope.upload2Instruction = "加载失败";
        $scope.imageFileChose="未选择文件";
        $scope.imageWordChose="未选择文件";
        $scope.proposerImageFileList;
        $scope.proposerWordFileList;
        $scope.ImageShow = function (whoAction) {

        };
        $scope.proposerImageFileUploadChoose = function () {
            var proposerImageFileUpload = document.getElementById("proposerImageFileChoose").files[0];
            $scope.imageFileChose="已选择："+proposerImageFileUpload.name;
            $scope.$digest();
        };

        $scope.upload=function(uploadId){
        //   $.ajaxFileUpload({
        //       url : '/proposer/fileUpload.do',
        //       contentType: 'json;charset=utf-8',
        //       secureuri : false,
        //       fileElementId : updateId,
        //       dataType : 'json',
        //       data :  JSON.stringify({
        //           "action": "uploadFile",
        //           "index":index
        //       }),
        //       success : function(data, status) {
        //           $scope.fixBugSuccess(data.responseText);
        //       },
        //       error : function(data, status, e) {
        //           $scope.fixBugSuccess(data.responseText);
        //       }
        //   })
        // };
        // $scope.fixBugSuccess=function(data){
        //   if (data.status===0){
        //       alert("上传成功");
        //   }else if (data.status===1){
        //       alert((data.message));
        //   }
            var form=new FormData(document.getElementById(uploadId));
            $.ajax({
                type: 'post',
                url: '/proposer/fileUpload.do',
                data: form,
                contentType: false,
                processData: false,
                success:function (restle) {
                    console.log(restle)
                }
            })
        };
        $scope.proposerWordFileUploadChoose = function () {
            var proposerWordFileUpload = document.getElementById("proposerWordFileChoose").files[0];
            $scope.WordFileChose="已选择："+proposerWordFileUpload.name;
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