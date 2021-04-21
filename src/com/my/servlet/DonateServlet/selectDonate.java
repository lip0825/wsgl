package com.my.servlet.DonateServlet;

import com.my.entity.Donate;
import com.my.service.DonateServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/selectDonate")
public class selectDonate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");


        DonateServiceImpl donateService = new DonateServiceImpl();
        String s_no = req.getParameter("s_no");
        Donate donate = donateService.selectDonate(s_no);

        PrintWriter out = resp.getWriter();
        JSONArray json = JSONArray.fromObject(donate);
        out.write(json.toString());

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

}
