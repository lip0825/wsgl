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
            width: 1050px;
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
            <p class="title">卫生工作安排</p>
            <el-button class="add" type="primary" @click="add">新增安排</el-button>
            <el-button class="return" type="primary" @click="returnHomePage">返回首页</el-button>
            <el-table :data="tableData" style="width: 100%">

                <el-table-column label="活动名称" width="180">
                    <template slot-scope="scope">
                        <el-tag size="medium">{{ scope.row.name }}</el-tag>
                        </el-popover>
                    </template>
                </el-table-column>
                <el-table-column label="地点" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.site }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="内容" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.content }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="人员/单位" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.people }}</span>
                    </template>
                </el-table-column>
                <el-table-column label="负责人" width="180">
                    <template slot-scope="scope">
                        <span style="margin-left: 10px">{{ scope.row.principal }}</span>
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
                tableData: [{
                    name: '敲代码',
                    site: '太原理工大学',
                    content: '后台大佬',
                    people: '个人',
                    principal: '李鹏'
                }, {
                    name: '敲代码',
                    site: '太原理工大学',
                    content: '后台大佬',
                    people: '个人',
                    principal: '李鹏'
                }, {
                    name: '敲代码',
                    site: '太原理工大学',
                    content: '后台大佬',
                    people: '个人',
                    principal: '李鹏'
                }, {
                    name: '敲代码',
                    site: '太原理工大学',
                    content: '后台大佬',
                    people: '个人',
                    principal: '李鹏'
                },]
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
                $.ajax({
                    type: 'POST',
                    url: 'http://192.168.125.116:8080/wsgl/selectAll',
                    //取消注释后台获取参数会出现null的问题
                    //contentType:'application/json;charset=utf-8',
                    // data: {
                    //     input: JSON.stringify(this.input)
                    // },
                    success: function (res) {
                        console.log(res, 11)
                    },
                });
            },
            handleEdit(index, row) {
                let { tableData } = this
                // 如果addOrEdit是 1 代表编辑   0 代表新增
                url = "healthWorkArrangementEdit.html?name=" + encodeURI(tableData[index].name) + "&site=" + encodeURI(tableData[index].site) + "&content=" + encodeURI(tableData[index].content) + "&people=" + encodeURI(tableData[index].people) + "&principal=" + encodeURI(tableData[index].principal) + "&addOrEdit=" + 1;
                window.location.href = url;
                console.log(index, row);
            },
            handleDelete(index, row) {
                this.$alert('是否确定删除', {
                    confirmButtonText: '确定',
                    callback: action => {
                        // 这里写接口
                        this.$message({
                            type: 'info',
                            message: '删除成功'
                        });
                    }
                });
                console.log(index, row);
            },
            add() {
                url = "healthWorkArrangementEdit.html?addOrEdit=" + 0
                window.location.href = url;
            }
        },
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>

<html>