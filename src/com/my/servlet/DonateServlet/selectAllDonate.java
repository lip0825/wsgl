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
import java.util.List;

@WebServlet(value = "/selectAllDonate")
public class selectAllDonate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        DonateServiceImpl donateService = new DonateServiceImpl();
        List<Donate> donates = donateService.selectAllDonate();
        //Donate[] m = new Donate[10];
        PrintWriter out = resp.getWriter();
        //int i = 0;
        JSONArray jsonArray = JSONArray.fromObject(donates);
        out.write(jsonArray.toString());
        //for (Member member:members) {
            //m[i] = member;
            //i++;
            //System.out.println(member);
        //}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
