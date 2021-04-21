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

<body>
    <div id="app">
        <div class="box">
            <p class="title">卫生工作组成员管理</p>
            <el-button class="add" type="primary" @click="add">添加成员</el-button>
            <el-button class="return" type="primary" @click="returnHomePage">返回首页</el-button>
            <el-table :data="tableData" style="width: 100%">

                <el-table-column label="姓名" width="180">
                    <template slot-scope="scope">
                        <el-tag size="medium">{{ scope.row.w_name }}</el-tag>
                        </el-popover>
                    </template>
                </el-table-column>
                <el-table-column label="职务" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.w_job }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="工作类型" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.w_type }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="工作内容" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.w_content }}</span>
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
                tableData: [],
            };
        },
        created() {
            this.getMenberList()
        },
        methods: {
            returnHomePage(){
                window.location.href = '../home/index.jsp';
            },
            // 获取成员列表
            getMenberList() {
                let th = this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/selectAll',
                    //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    // data: {
                    //     input: JSON.stringify(this.input)
                    // },
                    success: function (res) {
                        th.$message({
                            type: 'success',
                            message: '请求数据成功'
                        });
                        th.tableData = JSON.parse(res);
                    }
                })
            },
            handleEdit(index, row) {
                let { tableData } = this
                // 如果addOrEdit是 1 代表编辑   0 代表新增
                url = "manageMemberAdd.jsp?name=" + encodeURI(tableData[index].w_name) + "&job=" + encodeURI(tableData[index].w_job) + "&jobContent=" + encodeURI(tableData[index].w_content) + "&jobType=" + encodeURI(tableData[index].w_type) + "&addOrEdit=" + 1;
                window.location.href = url;
            },
            handleDelete(index, row) {
                    let th = this;
                this.$alert('是否确定删除', {
                    confirmButtonText: '确定',
                    callback: action => {
                        // 这里写接口
                        $.ajax({
                            type: 'POST',
                            url: '${pageContext.request.contextPath}/deleteMember',
                            data: {
                                w_name: row.w_name
                            },
                            success: function (res) {
                                if(res==='200'){
                                    th.getMenberList();
                                }
                            }
                        })
                        th.$message({
                            type: 'success',
                            message: '删除成功'
                        });
                    }
                });
            },
            add() {
                url = "manageMemberAdd.jsp?addOrEdit=" + 0
                window.location.href = url;
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>