package com.my.servlet.DonateServlet;

import com.my.entity.Donate;
import com.my.entity.Member;
import com.my.service.DonateServiceImpl;
import com.my.service.MemberServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(value = "/insertDonate")
public class

insertDonate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        DonateServiceImpl donateService = new DonateServiceImpl();
        MemberServiceImpl memberService = new MemberServiceImpl();
        Donate donate = null;
        //1.收参
        String s_no = req.getParameter("s_no");
        String s_name = req.getParameter("s_name");
        String b_quantity = req.getParameter("b_quantity");
        String b_no = req.getParameter("b_no");
        String b_time = req.getParameter("b_time");
        //2.调用方法
        Member member = memberService.selectMember(s_name);
        donate = new Donate(s_no,s_name,b_quantity,b_no,b_time);
        boolean result = donateService.insertDonate(donate);
        //3.返回结果
        PrintWriter out = resp.getWriter();
        if (result && (member == null)){
            Member newmember = new Member(s_name,"","","");
            memberService.insertMember(newmember);
        }
        if(result){
            out.write("200");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
