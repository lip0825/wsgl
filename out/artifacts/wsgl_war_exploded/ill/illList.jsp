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
            width: 900px;
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
            <p class="title">常见病防治管理</p>
            <el-button class="add" type="primary" @click="add">添加病种</el-button>
            <el-button class="return" type="primary" @click="returnHomePage">返回首页</el-button>
            <el-table :data="tableData" style="width: 100%">

                <el-table-column label="名称" width="180">
                    <template slot-scope="scope">
                        <el-tag size="medium">{{ scope.row.i_name }}</el-tag>
                        </el-popover>
                    </template>
                </el-table-column>
                <el-table-column label="类型" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.i_type }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="病发表现" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.i_symptom }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="传染性" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.i_chuanran }}</span>
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
                window.location.href = '../../home/index.jsp';
            },
            // 获取成员列表
            getList() {
                let th = this;
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/selectAllIllness',
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
                        th.tableData = JSON.parse(res)
                    },
                });
            },
            handleEdit(index, row) {
                let { tableData } = this
                // 如果addOrEdit是 1 代表编辑   0 代表新增
                url = "illEdit.jsp?name=" + encodeURI(tableData[index].i_name) + "&type=" + encodeURI(tableData[index].i_type) + "&outFace=" + encodeURI(tableData[index].i_symptom)+"&contagious="+encodeURI(tableData[index].i_chuanran) + "&addOrEdit=" + 1;
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
                            url: '${pageContext.request.contextPath}/deleteIllness',
                            data: {
                                i_name:row.i_name
                            },
                            success: function (res) {
                                if(res==='200'){
                                    th.getList()
                                }
                            },
                        });
                        this.$message({
                            type: 'success',
                            message: '删除成功'
                        });
                    }
                });
                console.log(index, row);
            },
            add() {
                url = "illEdit.jsp?addOrEdit=" + 0
                window.location.href = url;
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>