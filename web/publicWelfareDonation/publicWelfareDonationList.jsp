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
            width: 880px;
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

<body">
    <div id="app">
        <div class="box">
            <p class="title">公益献血管理</p>
            <el-button class="return" type="primary" @click="returnHomePage">返回首页</el-button>
            <el-button class="add" type="primary" @click="add">添加成员</el-button>
            <el-table :data="tableData" style="width: 100%">

                <el-table-column label="姓名" width="180">
                    <template slot-scope="scope">
                        <el-tag size="medium">{{ scope.row.s_name }}</el-tag>
                        </el-popover>
                    </template>
                </el-table-column>
                <el-table-column label="献血证号" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.b_no }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="献血时间" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.b_time }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="献血量" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.b_quantity }}</span>
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
                    name: '',
                    job: '',
                    jobType: '',
                    jobContent: '',
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

                // 获取列表
                getList() {
                    let th = this;
                    $.ajax({
                        type: 'POST',
                        url: '${pageContext.request.contextPath}/selectAllDonate',
                        success: function (res) {
                            th.$message({
                                message: '添加成功',
                                type: 'success'
                            });
                            th.tableData = JSON.parse(res)
                        },
                    });
                },
                // 编辑
                handleEdit(index, row) {
                    let { tableData } = this
                    // 如果addOrEdit是 1 代表编辑   0 代表新增
                    url = "publicWelfareDonationDetial.jsp?name=" + encodeURI(tableData[index].s_name) + "&id=" + encodeURI(tableData[index].b_no) + "&ml=" + encodeURI(tableData[index].b_quantity) + "&data=" + encodeURI(tableData[index].b_time) +"&s_no=" + encodeURI(tableData[index].s_no)+ "&addOrEdit=" + 1;
                    window.location.href = url;
                    console.log(index, row);
                },
                // 删除
                handleDelete(index, row) {
                    let th = this;
                    this.$alert('是否确定删除', {
                        confirmButtonText: '确定',
                        callback: action => {
                            let th =this;
                            $.ajax({
                                type: 'POST',
                                url: '${pageContext.request.contextPath}/deleteDonate',
                                //取消注释后台获取参数会出现null的问题
                                //contentType:'application/json;charset=utf-8',
                                data: {
                                    s_no:row.s_no
                                },
                                success: function (res) {
                                    if(res==='200'){
                                        window.location.href = "publicWelfareDonationList.jsp";
                                        th.getList();
                                    }
                                },
                            });
                            th.$message({
                                type: 'success',
                                message: '删除成功'
                            });
                        }
                    });
                    console.log(index, row);
                },
                add() {
                    url = "publicWelfareDonationDetial.jsp?addOrEdit=" + 0
                    window.location.href = url;
                }
            },
        };
        var Ctor = Vue.extend(Main)
        new Ctor().$mount('#app')
    </script>

    <html>