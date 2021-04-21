package com.my.servlet.TestServlet;


import com.my.entity.Test;

import com.my.service.TestServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/selectTest")
public class selectTest extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");


        TestServiceImpl testService = new TestServiceImpl();
        String s_name = req.getParameter("s_name");
        Test test = testService.selectTest(s_name);

        PrintWriter out = resp.getWriter();
        JSONArray json = JSONArray.fromObject(test);
        out.write(json.toString());

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
