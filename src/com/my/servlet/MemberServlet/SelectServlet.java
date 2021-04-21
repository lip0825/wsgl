package com.my.servlet.MemberServlet;

import com.my.entity.Member;
import com.my.service.MemberServiceImpl;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/selectMember")
public class SelectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");


        MemberServiceImpl memberService = new MemberServiceImpl();
        String w_name = req.getParameter("w_name");
        Member member = memberService.selectMember(w_name);

        PrintWriter out = resp.getWriter();
        JSONArray json = JSONArray.fromObject(member);
        out.write(json.toString());

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
