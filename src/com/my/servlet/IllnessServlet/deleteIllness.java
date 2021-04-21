package com.my.servlet.IllnessServlet;

import com.my.service.IllnessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/deleteIllness")
public class deleteIllness extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        IllnessServiceImpl illnessService = new IllnessServiceImpl();
        //1.收参
        String i_name = req.getParameter("i_name");
        //2.调用方法
        boolean result = illnessService.deleteIllness(i_name);
        //3.返回结果
        PrintWriter out = resp.getWriter();
        if(result){
            out.write("200");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
