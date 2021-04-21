
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <p v-if="addOrEdit === '0'" class="title">卫生工作组成员管理——新增成员</p>
            <p v-if="addOrEdit === '1'" class="title">卫生工作组成员管理——编辑成员</p>
            <p class="InputLable"> 姓名:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="name" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 职务:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="job" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 工作类型:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="jobType" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 工作内容:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="jobContent" placeholder="请输入内容"></el-input><br>
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
                job: '',
                jobType: '',
                jobContent: '',
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
                    this.searchQuery('name')
                    this.searchQuery('job')
                    this.searchQuery('jobContent')
                    this.searchQuery('jobType')
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
                    console.log(this.name)
                } else if (qs === 'job') {
                    this.job = decodeURI(re);
                } else if (qs === 'jobType') {
                    this.jobType = decodeURI(re);
                } else if (qs === 'jobContent') {
                    this.jobContent = decodeURI(re);
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
                let data = {
                    w_name : this.name,
                    w_job :this.job,
                    w_type:this.jobType,
                    w_content:this.jobContent
                }
                let th = this
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/updateMember',
                    //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    data: data,
                    success: function (res) {
                        if(res==='200'){
                            th.$message({
                                type: 'success',
                                message: '更新成功'
                            });
                            window.location.href ='manageMemberList.jsp';
                        }
                    },
                });
            },
            add() {
                let data = {
                    w_name : this.name,
                    w_job :this.job,
                    w_type:this.jobType,
                    w_content:this.jobContent
                }
                console.log(data)
                let th = this
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/insertmember',
                   //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    data: data,
                    success: function (res) {
                        if(res==='200'){
                            th.$message({
                                type: 'success',
                                message: '添加成功'
                            });
                            window.location.href ='manageMemberList.jsp';
                        }
                    },
                 });
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>