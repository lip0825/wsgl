package com.my.servlet.DonateServlet;

import com.my.service.DonateServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/deleteDonate")
public class deleteDonate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        DonateServiceImpl donateService = new DonateServiceImpl();
        //1.收参
        String s_no = req.getParameter("s_no");
        //2.调用方法
        boolean result = donateService.deleteDonate(s_no);
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
