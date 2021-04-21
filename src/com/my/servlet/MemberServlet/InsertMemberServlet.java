package com.my.servlet.MemberServlet;

import com.my.entity.Member;
import com.my.service.MemberServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/insertmember")
public class InsertMemberServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        MemberServiceImpl memberService = new MemberServiceImpl();
        Member member = null;
        //1.收参
        String w_name = req.getParameter("w_name");
        String w_job = req.getParameter("w_job");
        String w_type = req.getParameter("w_type");
        String w_content = req.getParameter("w_content");
        //2.调用方法
        member = new Member(w_name,w_job,w_type,w_content);
        boolean result = memberService.insertMember(member);
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
