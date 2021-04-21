package com.my.servlet.IllnessServlet;

import com.my.entity.Illness;
import com.my.service.IllnessServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/insertIllness")
public class insertIllness extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        IllnessServiceImpl illnessService = new IllnessServiceImpl();
        Illness illness = null;

        String i_name = req.getParameter("i_name");
        String i_type = req.getParameter("i_type");
        String i_chuanran = req.getParameter("i_chuanran");
        String i_symptom = req.getParameter("i_symptom");

        illness = new Illness(i_name, i_type, i_chuanran, i_symptom);
        boolean result = illnessService.insertIllness(illness);
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
