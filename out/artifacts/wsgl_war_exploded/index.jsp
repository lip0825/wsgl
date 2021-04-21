<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <title>首页</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .box {
            width: 350px;
            height: 280px;
            background-color: #fff;
            border-radius: 1%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 26px 0 26px 0;
            text-align: center;
            /* border:1px solid #000 */
        }

        .title {
            font-size: 26px;
            margin-top: 20px;
        }

        .input1 {
            margin-top: 10px;
            width: 220px;
        }

        .submit {
            margin-top: 30px;
        }

        .input2 {
            margin-top: 20px;
            width: 220px;
        }
    </style>
</head>

<body style="background-color: rgb(50,64,87);">
    <div id="app">
        <div class="box">
            <p class="title">登陆</p><br>
            <span>账号: </span>
            <el-input class="input1" v-model="number" placeholder="请输入账号"></el-input><br>
            <span>密码: </span>
            <el-input class="input2" v-model="password" placeholder="请输入密码" show-password @keyup.enter.native="login()"></el-input><br>
            <el-button @click="login()" class="submit" type="primary">确认登陆</el-button>
        </div>

    </div>
</body>
<script>
    var Main = {
        data() {
            return {
                number: '',
                password: ''
            };
        },
        created() {
        },
        methods: {
            login() {
                if (this.number === 'admin' && this.password === '123') {
                    this.$message({
                        message: '登陆成功',
                        type: 'success'
                    });
                    setTimeout(() => {
                        url = "home/index.jsp"
                        window.location.href = url;
                    }, 1000);
                } else {
                    alert("账号或密码错误")
                }
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>