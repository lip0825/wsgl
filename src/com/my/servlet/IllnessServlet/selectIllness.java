package com.my.servlet.IllnessServlet;

import com.my.entity.Illness;
import com.my.service.IllnessServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/selectIllness")
public class selectIllness extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");


        IllnessServiceImpl illnessService = new IllnessServiceImpl();
        String i_name = req.getParameter("i_name");
        Illness illness = illnessService.selectIllness(i_name);

        PrintWriter out = resp.getWriter();
        JSONArray json = JSONArray.fromObject(illness);
        out.write(json.toString());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
