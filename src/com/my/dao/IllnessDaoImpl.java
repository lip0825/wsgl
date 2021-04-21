package com.my.dao;

import com.my.entity.Illness;
import com.my.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class IllnessDaoImpl {

    private QueryRunner queryRunner = new QueryRunner();

    public int insert(Illness illness) {
        int result = 0;
        try {
            Object[] params = {illness.getI_name(),illness.getI_type(),illness.getI_chuanran(),illness.getI_symptom()};
            result= queryRunner.update(DbUtils.getConnection(),"insert into illness(i_name, i_type, i_chuanran, i_symptom) values (?,?,?,?)",params);
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int delete(String i_name) {
        int result = 0;
        try {
            result = queryRunner.update(DbUtils.getConnection(),"delete from illness where i_name=?",i_name);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public int update(Illness illness) {
        int result = 0;
        try {
            Object[] params = {illness.getI_type(),illness.getI_chuanran(),illness.getI_symptom(), illness.getI_name()};
            result = queryRunner.update(DbUtils.getConnection(),"update illness set i_type=?,i_chuanran=?,i_symptom=? where i_name=?",params);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return result;
    }


    public Illness select(String i_name) {
        try {
            Illness illness = queryRunner.query(DbUtils.getConnection(),"select * from illness where i_name=?",new BeanHandler<Illness>(Illness.class),i_name);
            return illness;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }


    public List<Illness> selectAll() {
        try {
            List<Illness> illness = queryRunner.query(DbUtils.getConnection(),"select * from illness",new BeanListHandler<Illness>(Illness.class));
            return illness;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
