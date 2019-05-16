/**
 * 初始化angular的APP （angular是页面应用，app范围内都是angular的编译区块）
 * app.controller 会将此controller定义为一个作用域
 * app.controller中的两个参数，第一个是依赖注入，第二个是此controller的主方法
 * 进入页面后会执行controller中的主方法
 */
var app = angular.module('loginApp', []);
app.controller('loginCtrl', function ($scope) {
    //所有JS前段的$scope为初始化页面的所有需要双向绑定的量
    $scope.code = "";
    // 所有事件绑定的方法都有$scope，login（）->$scope.login=function();
    $scope.login = function () {
        if ($scope.userId == null && $scope.userPwd == null && $scope.code == null) {
            //判断用户名，密码，验证码是否为空，为空时不允许登录，直接返回，不执行后续操作
            alert("用户名，密码，验证码不能为空");
            return;
        }
        // json
        // {
        //     变量名1:值1,
        //     变量名2:值2
        // }
        //$.ajax()是一个http请求
        //url后面是接口地址
        //contentType是发送数据类型 JSON，charset字符编码为UTF-8
        //dataType是接收数据类型 JSON
        //data是要发送的数据包
        //type是请求类型，分为POST和GET，此处采用POST   https://www.runoob.com/tags/html-httpmethods.html
        // GET - 从指定的资源请求数据。
        // POST - 向指定的资源提交要被处理的数据。
        //async，true是异步，false是同步
        //同步是指：发送方发出数据后，等接收方发回响应以后才发下一个数据包的通讯方式。
        //异步是指：发送方发出数据后，不等接收方发回响应，接着发送下个数据包的通讯方式。
        //success是一个回调函数，请求成果时，会接受一个result，
        $.ajax({
            type: 'post',
            contentType: 'application/json;charset=utf-8',
            dataType: "json",
            async: true,
            //连接后端
            url: '/user/AAccount.do',
            //JSON.stringify()方法将JSON格式的变量转化为字符串
            data: JSON.stringify({
                "action": "login",
                "userId": $scope.userId,
                "userPwd": hex_md5(hex_md5($scope.userPwd) + $scope.code.toLowerCase()),
                "code": $scope.code
            }),
            success: function (result) {
                if (result.status === 0)
                    //校验身份，返回一个结果，再做一个重定向
                    window.location.href = result.message;
                else if (result.status === 1) {
                    alert(result.message);
                    $scope.changeCodeImage();
                    $scope.code = "";
                }
            }
        })
    };

    /**
     * 重新请求验证码
     */
    $scope.changeCodeImage = function () {
        document.getElementById("img").src = "ACAPTCHA.do?" + Math.random();
    };
    /**
     * 跳转到注册页，未启用
     */
    $scope.jump2Register = function () {
        window.location.href = "./html/register.html";
    }
});