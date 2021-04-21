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
            <p v-if="addOrEdit === '0'" class="title">学生体检管理——新增信息</p>
            <p v-if="addOrEdit === '1'" class="title">学生体检管理——修改信息</p>
            <p class="InputLable"> 姓名:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="name" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 体重:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="weight" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 身高:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="height" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 血糖:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="bloodSugar" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 血压:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="bloodPress" placeholder="请输入内容"></el-input><br>
            <p class="InputLable"> 肺活量:</p>
            <el-input class="InputStyle" style="width: 300px;" v-model="pulmonary" placeholder="请输入内容"></el-input><br>
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
                weight: '',
                height: '',
                bloodSugar: '',
                bloodPress: '',
                // 肺活量
                pulmonary: '',
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
                    this.searchQuery('weight')
                    this.searchQuery('height')
                    this.searchQuery('bloodSugar')
                    this.searchQuery('bloodPress')
                    this.searchQuery('pulmonary')
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
                } else if (qs === 'weight') {
                    this.weight = decodeURI(re);
                } else if (qs === 'height') {
                    this.height = decodeURI(re);
                } else if (qs === 'bloodSugar') {
                    this.bloodSugar = decodeURI(re);
                } else if (qs === 'bloodPress') {
                    this.bloodPress = decodeURI(re);
                } else if (qs === 'pulmonary') {
                    this.pulmonary = decodeURI(re);
                } else if (qs === 'addOrEdit') {
                    this.addOrEdit = decodeURI(re);
                }
            },
            sub() {

            },
            edit() {
                let data = {
                    s_bloodp: this.bloodPress,
                    s_bloods: this.bloodSugar,
                    s_height: this.height,
                    s_lungc: this.pulmonary,
                    s_name:this.name,
                    s_weight:this.weight,
                }
                console.log(data)
                let th=this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/updateTest',
                    data: data,
                    success: function (res) {
                        console.log(res,22)
                        if(res==='200'){
                            th.$message({
                                message: '修改成功',
                                type: 'success'
                            });
                            window.location.href ='physicalExaminationOfStudentsList.jsp';
                        }
                    },
                });
            },
            add() {
                let data = {
                    s_bloodp: this.bloodPress,
                    s_bloods: this.bloodSugar,
                    s_height: this.height,
                    s_lungc: this.pulmonary,
                    s_name:this.name,
                    s_weight:this.weight,
                }
                console.log(data)
                let th=this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/insertTest',
                    data: data,
                    success: function (res) {
                        console.log(res,22)
                        if(res==='200'){
                            th.$message({
                                message: '添加成功',
                                type: 'success'
                            });
                            window.location.href ='physicalExaminationOfStudentsList.jsp';
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