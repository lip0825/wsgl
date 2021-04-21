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
            width: 1230px;
            position: absolute;
            right: 50%;
            height: 50%;
            transform: translate(50%, 50%);
            text-align: center;
            /* border:1px solid #000 */
        }


        .title {
            font-size: 24px;
            padding-bottom: 20px;
        }

        .add {
            float: right;
        }
        .return{
            float: left;
        }
    </style>
</head>

<body>
    <div id="app">
        <div class="box">
            <p class="title">学生体检管理</p>
            <el-button class="add" type="primary" @click="add">添加成员</el-button>
            <el-button class="return" type="primary" @click="returnHomePage">返回首页</el-button>
            <el-table :data="tableData" style="width: 100%">

                <el-table-column label="姓名" width="180">
                    <template slot-scope="scope">
                        <el-tag size="medium">{{ scope.row.s_name }}</el-tag>
                        </el-popover>
                    </template>
                </el-table-column>
                <el-table-column label="体重" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.s_weight }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="身高" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.s_height }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="血糖" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.s_bloods }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="血压" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.s_bloodp }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="肺活量" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.s_lungc }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="操作">
                    <template slot-scope="scope">
                        <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                        <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
        </div>

    </div>
</body>
<script>
    var Main = {
        data() {
            return {
                tableData: []
            };
        },
        created() {
            this.getList()
        },
        methods: {
            returnHomePage(){
                window.location.href = '../home/index.jsp';
            },
            // 获取成员列表
            getList() {
                let th = this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/selectAllTest',
                    success: function (res) {
                        th.$message({
                            type: 'success',
                            message: '请求数据成功'
                        });
                        th.tableData = JSON.parse(res)
                        console.log(th.tableData)

                    },
                });
            },
            handleEdit(index, row) {
                let { tableData } = this
                // 如果addOrEdit是 1 代表编辑   0 代表新增
                url = "physicalExaminationOfStudentsEdit.jsp?name=" + encodeURI(tableData[index].s_name) + "&weight=" + encodeURI(tableData[index].s_weight) + "&height=" + encodeURI(tableData[index].s_height) + "&bloodSugar=" + encodeURI(tableData[index].s_bloods)+ "&bloodPress=" + encodeURI(tableData[index].s_bloodp)+"&pulmonary=" + encodeURI(tableData[index].s_lungc) + "&addOrEdit=" + 1;
                window.location.href = url;
                console.log(index, row);
            },
            handleDelete(index, row) {
                let th = this;
                this.$alert('是否确定删除', {
                    confirmButtonText: '确定',
                    callback: action => {
                        $.ajax({
                            type: 'POST',
                            data:{
                                s_name:row.s_name
                            },
                            url: '${pageContext.request.contextPath}/deleteTest',
                            success: function (res) {
                               if(res==='200'){
                                   th.$message({
                                       type: 'success',
                                       message: '删除成功'
                                   });
                                   th.getList()
                               }

                            },
                        });
                    }
                });
                console.log(index, row);
            },
            add() {
                url = "physicalExaminationOfStudentsEdit.jsp?addOrEdit=" + 0
                window.location.href = url;
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>