function jumpUrl(url) {
	window.location.href = url;
}
function registerCheck(form) {
    if (form.id.value == "" && form.password.value == ""
        && form.password_2.value == "") {
        alert("请输入完整");
        return false;
    }
    if (form.password.value != form.password_2.value) {
        alert("两次密码不一致");
        return false;
    }
    return true;
}
function loginCheck(form) {
    var id = form.id.value;
    var pwd = form.password.value;
    var cap = form.cap.value;
    if (id == "") {
        alert("请输入管理员账户!");

    } else if (pwd == "") {
        alert("请输入密码!");

    } else if (cap == "") {
        alert("验证码");

    } else {
        pwd = hex_md5(hex_md5(pwd) + cap);
        $.ajax({
            type: "POST",
            contentType: 'application/json;charset=utf-8',
            url: "Auser.do",
            data: '{"action":"login","id":"' + id + '","cap":"' + cap + '","password":"' + hex_md5(pwd) + '"}',
            dataType: "json",
            async: true,
            success: loginResult
        });
    }
}