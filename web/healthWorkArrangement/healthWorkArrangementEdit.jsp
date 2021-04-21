<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.12"></script>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .box {
            position: absolute;
            right: 50%;
            height: 50%;
            transform: translate(50%, 50%);
            text-align: center;
            /* border:1px solid #000 */
        }

        .InputStyle {
            margin-top: 30px;
        }

        .subBtn {
            margin-top: 20px;
        }

        .title {
            font-size: 24px;
        }

        .InputLable {
            display: inline-block;
            text-align: left;
            width: 80px;
        }
    </style>
</head>

<body>
    <div id="app">
        <div class="box">
            <p v-if="addOrEdit === '0'" class="title">卫生工作安排——新增安排</p>
            <p v-if="addOrEdit === '1'" class="title">卫生工作安排——编辑安排</p>
            <p class="InputLable"> 活动名称:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="name" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 地点:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="site" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 内容:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="content" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 人员/单位:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="people" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 负责人:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="principal" placeholder="请输入内容"></el-input><br>
            <el-button @click="add()" v-if="addOrEdit === '0'" class="subBtn" type="primary" @click="sub">确认增加
            </el-button>
            <el-button @click="edit()" v-if="addOrEdit === '1'" class="subBtn" type="primary" @click="sub">确认修改
            </el-button>
        </div>
    </div>
</body>
<script>
    var Main = {
        data() {
            return {
                name: '',
                site: '',
                content: '',
                people: '',
                principal: '',
                addOrEdit: 0
            };
        },
        created() {
            this.initPage();
        },
        methods: {
            // 初始化
            initPage() {
                this.searchQuery('addOrEdit')
                if (this.addOrEdit === '1') {
                    this.searchQuery('site')
                    this.searchQuery('content')
                    this.searchQuery('principal')
                    this.searchQuery('people')
                    this.searchQuery('name')
                }
            },
            searchQuery(qs) {
                let s = location.href;
                s = s.replace("?", "?&").split("&");
                let re = "";
                for (i = 1; i < s.length; i++) {
                    if (s[i].indexOf(qs + "=") == 0) {
                        re = s[i].replace(qs + "=", "");
                    }
                }
                if (qs === 'name') {
                    this.name = decodeURI(re);
                } else if (qs === 'people') {
                    this.people = decodeURI(re);
                } else if (qs === 'site') {
                    this.site = decodeURI(re);
                } else if (qs === 'content') {
                    this.content = decodeURI(re);
                } else if (qs === 'principal') {
                    this.principal = decodeURI(re);
                } else if (qs === 'addOrEdit') {
                    this.addOrEdit = decodeURI(re);
                    console.log(this.addOrEdit, 222)
                }
            },
            sub() {
                let data = {
                    input: this.input,
                    job: this.job,
                    jobType: this.jobType,
                    jobContent: this.jobContent
                }
                console.log(data)
                // $.ajax({
                //     type: 'POST',
                //     url: '${pageContext.request.contextPath}/test',
                //     //取消注释后台获取参数会出现null的问题
                //     //contentType:'application/json;charset=utf-8',
                //     data: {
                //         input: JSON.stringify(this.input)
                //     },
                //     success: function (res) {
                //         console.log(res, 11)
                //     },
                // });
            },
            edit() {

            },
            add() {

            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>