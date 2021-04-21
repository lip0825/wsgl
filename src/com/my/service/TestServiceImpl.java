package com.my.service;

import com.my.dao.TestDaoImpl;
import com.my.entity.Donate;
import com.my.entity.Test;
import com.my.utils.DbUtils;

import java.util.List;

public class TestServiceImpl {
    private TestDaoImpl testDao = new TestDaoImpl();

    public boolean insertTest(Test test) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = testDao.insert(test);
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

    public boolean updateTest(Test test) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = testDao.update(test);
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

    public boolean deleteTest(String s_name) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = testDao.delete(s_name);
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

    public Test selectTest(String s_name) {
        Test result = null;
        try {
            DbUtils.begin();
            Test test = testDao.select(s_name);
            if (test != null){
                result = test;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }

    public List<Test> selectAllTest() {
        List<Test> results = null;
        try {
            DbUtils.begin();
            List<Test> testList = testDao.selectAll();
            if (testList != null){
                results = testList;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return results;
    }
}
