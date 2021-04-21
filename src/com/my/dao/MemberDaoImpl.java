package com.my.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.my.entity.Member;
import com.my.utils.DbUtils;

import java.sql.SQLException;
import java.util.List;

public class MemberDaoImpl {
    private QueryRunner queryRunner = new QueryRunner();

    public int insert(Member member) {
        int result = 0;
        try {
            Object[] params = {member.getW_name(),member.getW_job(),member.getW_type(),member.getW_content()};
            result= queryRunner.update(DbUtils.getConnection(),"insert into member(w_name,w_job,w_type,w_content) values (?,?,?,?)",params);
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int delete(String w_name) {
        int result = 0;
        try {
            result = queryRunner.update(DbUtils.getConnection(),"delete from member where w_name=?",w_name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int update(Member member) {
        int result = 0;
        try {
            Object[] params = {member.getW_job(),member.getW_type(),member.getW_content(),member.getW_name()};
            result = queryRunner.update(DbUtils.getConnection(),"update member set w_job=?,w_type=?,w_content=? where w_name=?",params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public Member select(String w_name) {
        try {
            Member member = queryRunner.query(DbUtils.getConnection(),"select * from member where w_name=?",new BeanHandler<Member>(Member.class),w_name);
            return member;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public List<Member> selectAll() {
        try {
            List<Member> adminList = queryRunner.query(DbUtils.getConnection(),"select * from member",new BeanListHandler<Member>(Member.class));
            return adminList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
