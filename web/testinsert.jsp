<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/3/16
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/insertmember" method="post">
        姓名<input type="text" name="w_name"><br>
        职务<input type="text" name="w_job"><br>
        工作类型<input type="text" name="w_type"><br>
        工作内容<input type="text" name="w_content">
        <input type="submit" name="submit" value="提交">
    </form>
</body>
</html>
