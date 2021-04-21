package com.my.service;

import com.my.dao.DonateDaoImpl;
import com.my.entity.Donate;
import com.my.utils.DbUtils;

import java.util.List;

public class DonateServiceImpl {
    private DonateDaoImpl donateDao = new DonateDaoImpl();

    public boolean insertDonate(Donate donate) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = donateDao.insert(donate);
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
    public boolean updateDonate(Donate donate) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = donateDao.update(donate);
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

    public boolean deleteDonate(String s_no) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = donateDao.delete(s_no);
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

    public Donate selectDonate(String s_no) {
        Donate result = null;
        try {
            DbUtils.begin();
            Donate donate = donateDao.select(s_no);
            if (donate != null){
                result = donate;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }

    public List<Donate> selectAllDonate() {
        List<Donate> results = null;
        try {
            DbUtils.begin();
            List<Donate> donateList = donateDao.selectAll();
            if (donateList != null){
                results = donateList;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return results;
    }
}
