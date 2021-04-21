package com.my.dao;


import com.my.entity.Donate;
import com.my.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class DonateDaoImpl {
    private QueryRunner queryRunner = new QueryRunner();

    public int insert(Donate donate) {
        int result = 0;
        try {
            Object[] params = {donate.getS_no(),donate.getS_name(),donate.getB_quantity(),donate.getB_no(),donate.getB_time()};
            result= queryRunner.update(DbUtils.getConnection(),"insert into donate_blood(s_no,s_name,b_quantity,b_no,b_time) values (?,?,?,?,?)",params);
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int delete(String s_no) {
        int result = 0;
        try {
            result = queryRunner.update(DbUtils.getConnection(),"delete from donate_blood where s_no=?",s_no);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int update(Donate donate) {
        int result = 0;
        try {
            Object[] params = {donate.getS_name(),donate.getB_quantity(),donate.getB_no(),donate.getB_time(),donate.getS_no()};
            result = queryRunner.update(DbUtils.getConnection(),"update donate_blood set s_name=?,b_quantity=?,b_no=?,b_time=? where s_no=?",params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public Donate select(String s_no) {
        try {
            Donate donate = queryRunner.query(DbUtils.getConnection(),"select * from donate_blood where s_no=?",new BeanHandler<Donate>(Donate.class),s_no);
            return donate;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public List<Donate> selectAll() {
        try {
            List<Donate> donateList = queryRunner.query(DbUtils.getConnection(),"select * from donate_blood",new BeanListHandler<Donate>(Donate.class));
            return donateList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
