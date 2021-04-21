package com.my.dao;

import com.my.entity.Test;
import com.my.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class TestDaoImpl {
    private QueryRunner queryRunner = new QueryRunner();

    public int insert(Test test) {
        int result = 0;
        try {
            Object[] params = {test.getS_name(),test.getS_height(),test.getS_weight(),test.getS_bloods(),test.getS_bloodp(),test.getS_lungc()};
            result= queryRunner.update(DbUtils.getConnection(),"insert into test(s_name,s_height,s_weight,s_bloods,s_bloodp,s_lungc) values (?,?,?,?,?,?)",params);
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int delete(String s_name) {
        int result = 0;
        try {
            result = queryRunner.update(DbUtils.getConnection(),"delete from test where s_name=?",s_name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int update(Test test) {
        int result = 0;
        try {
            Object[] params = {test.getS_height(),test.getS_weight(),test.getS_bloods(),test.getS_bloodp(),test.getS_lungc(),test.getS_name()};
            result = queryRunner.update(DbUtils.getConnection(),"update test set s_height=?,s_weight=?,s_bloods=?,s_bloodp=?,s_lungc=? where s_name=?",params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public Test select(String s_name) {
        try {
            Test test = queryRunner.query(DbUtils.getConnection(),"select * from test where s_name=?",new BeanHandler<Test>(Test.class),s_name);
            return test;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public List<Test> selectAll() {
        try {
            List<Test> testList = queryRunner.query(DbUtils.getConnection(),"select * from test",new BeanListHandler<Test>(Test.class));
            return testList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
