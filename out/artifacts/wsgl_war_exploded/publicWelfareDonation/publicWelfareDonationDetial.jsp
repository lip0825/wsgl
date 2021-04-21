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
            <p v-if="addOrEdit === '0'" class="title">公益献血管理——新增成员</p>
            <p v-if="addOrEdit === '1'" class="title">公益献血管理——编辑成员</p>
            <p class="InputLable"> 姓名:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="name" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 学号:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="s_no" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 献血ID:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="id" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 献血量:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="ml" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 献血时间:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="data" placeholder="请输入内容"></el-input><br>
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
                id: '',
                ml: '',
                data: '',
                addOrEdit: 0,
                s_no:''
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
                    this.searchQuery('id')
                    this.searchQuery('ml')
                    this.searchQuery('data')
                    this.searchQuery('s_no')
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
                } else if (qs === 'id') {
                    this.id = decodeURI(re);
                } else if (qs === 'ml') {
                    this.ml = decodeURI(re);
                } else if (qs === 'data') {
                    this.data = decodeURI(re);
                } else if (qs === 'addOrEdit') {
                    this.addOrEdit = decodeURI(re);
                }else if (qs === 's_no') {
                    this.s_no = decodeURI(re);
                }
            },
            edit() {
                let data = {
                    s_name: this.name,
                    b_quantity: this.ml,
                    b_no: this.id,
                    b_time: this.data,
                    s_no:this.s_no
                }
                // console.log(data)
                let th =this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/updateDonate',
                   //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    data: data,
                    success: function (res) {
                        if(res==='200'){
                            th.$message({
                                message: '修改成功',
                                type: 'success'
                            });
                            window.location.href = "publicWelfareDonationList.jsp";
                        }
                    },
                 });
            },
            add() {
                let data = {
                    s_name: this.name,
                    b_quantity: this.ml,
                    b_no: this.id,
                    b_time: this.data,
                    s_no:this.s_no
                }
                let th =this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/insertDonate',
                    //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    data: data,
                    success: function (res) {
                        if(res==='200'){
                            th.$message({
                                message: '添加成功',
                                type: 'success'
                            });
                            window.location.href = "publicWelfareDonationList.jsp";
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