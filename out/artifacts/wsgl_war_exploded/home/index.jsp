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
            height: 200px;
            position: absolute;
            top: 50%;
            right: 50%;
            width: 200px;
            transform: translate(50%, -50%);
            text-align: center;
        }
        body{
            background: url("../img/bg.jpg") no-repeat;
            height:100%;
            width:100%;
            overflow: hidden;
            background-size:cover;
        }
        .but{
            width: 220px;
            margin-top: 10px;
margin-left: 0;
        }
        .el-button+.el-button{
            margin-left: 0;
        }
    </style>
</head>

<body style="background-image: url('../img/bg.jpg') no-repeat;">
    <div id="app">
        <div class="box">
            <el-button class="but" type="primary" @click="go1">卫生组成员管理</el-button>
            <br>
            <el-button class="but" type="primary" @click="go2">公益献血管理</el-button>
            <el-button class="but" type="primary" @click="go3">常见病防治管理</el-button>
            <el-button class="but" type="primary" @click="go4">学生体检管理</el-button>
        </div>

    </div>
</body>
<script>
    var Main = {
        data() {
            return {
            };
        },
        created() {
        },
        methods: {
            go1(){
                window.location.href = '../manageMember/manageMemberList.jsp';
            },
            go2(){
                window.location.href ='../publicWelfareDonation/publicWelfareDonationList.jsp'
            },
            go3(){
                window.location.href ='../ill//illList.jsp'
            },
            go4(){
                window.location.href ='../physicalExaminationOfStudents/physicalExaminationOfStudentsList.jsp'
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>