package com.my.service;

import com.my.dao.MemberDaoImpl;
import com.my.entity.Member;
import com.my.utils.DbUtils;

import java.util.List;

public class MemberServiceImpl {
    private MemberDaoImpl memberDao = new MemberDaoImpl();

    public boolean insertMember(Member member) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = memberDao.insert(member);
            if(result > 0 ){
                bool = true;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();

        }
        return bool;
    }
    public boolean updateMember(Member member) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = memberDao.update(member);
            if(result > 0 ){
                bool = true;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();

        }
        return bool;
    }

    public boolean deleteMember(String w_name) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = memberDao.delete(w_name);
            if(result > 0 ){
                bool = true;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();

        }
        return bool;
    }

    public Member selectMember(String w_name) {
        Member result = null;
        try {
            DbUtils.begin();
            MemberDaoImpl memberDao = new MemberDaoImpl();
            Member member = memberDao.select(w_name);
            if (member != null){
                result = member;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }

    public List<Member> selectAllMember() {
        List<Member> results = null;
        try {
            DbUtils.begin();
            MemberDaoImpl memberDao = new MemberDaoImpl();
            List<Member> memberList = memberDao.selectAll();
            if (memberList != null){
                results = memberList;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return results;
    }
}
