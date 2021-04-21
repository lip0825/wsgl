package com.my.service;

import com.my.dao.IllnessDaoImpl;
import com.my.entity.Illness;
import com.my.utils.DbUtils;

import java.util.List;

public class IllnessServiceImpl {

    private IllnessDaoImpl illnessDao = new IllnessDaoImpl();

    public boolean insertIllness(Illness illness) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = illnessDao.insert(illness);
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
    public boolean updateIllness(Illness illness) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = illnessDao.update(illness);
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

    public boolean deleteIllness(String s_no) {
        boolean bool= false;
        try {
            DbUtils.begin();
            int result = illnessDao.delete(s_no);
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

    public Illness selectIllness(String s_no) {
        Illness result = null;
        try {
            DbUtils.begin();
            Illness illness = illnessDao.select(s_no);
            if (illness != null){
                result = illness;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return result;
    }

    public List<Illness> selectAllIllness() {
        List<Illness> results = null;
        try {
            DbUtils.begin();
            List<Illness> illnessList = illnessDao.selectAll();
            if (illnessList != null){
                results = illnessList;
            }
            DbUtils.commit();
        } catch (Exception e) {
            DbUtils.rollback();
            e.printStackTrace();
        }
        return results;
    }
}
