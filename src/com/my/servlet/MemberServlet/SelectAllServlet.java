package com.my.servlet.MemberServlet;

import com.my.entity.Member;
import com.my.service.MemberServiceImpl;
import net.sf.json.JSONArray;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(value = "/selectAll")
public class SelectAllServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        MemberServiceImpl memberService = new MemberServiceImpl();
        List<Member> members = memberService.selectAllMember();
        Member[] m = new Member[10];
        PrintWriter out = resp.getWriter();
        int i = 0;
        JSONArray jsonArray = JSONArray.fromObject(members);
        out.write(jsonArray.toString());
        for (Member member:members) {
            m[i] = member;
            i++;
            //System.out.println(member);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
