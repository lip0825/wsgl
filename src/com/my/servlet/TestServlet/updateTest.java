package com.my.servlet.TestServlet;

import com.my.entity.Donate;
import com.my.entity.Test;
import com.my.service.TestServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/updateTest")
public class updateTest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        TestServiceImpl testService = new TestServiceImpl();
        Test test = null;
        //1.收参
        String s_name = req.getParameter("s_name");
        String s_height = req.getParameter("s_height");
        String s_weight = req.getParameter("s_weight");
        String s_bloods = req.getParameter("s_bloods");
        String s_bloodp = req.getParameter("s_bloodp");
        String s_lungc = req.getParameter("s_lungc");
        //2.调用方法
        test = new Test(s_name,s_height,s_weight,s_bloods,s_bloodp,s_lungc);
        boolean result = testService.updateTest(test);
        //3.返回结果
        PrintWriter out = resp.getWriter();
        if(result){
            out.write("200");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
