package com.zjjershouche.service;

import java.util.List;

import com.zjjershouche.dao.UserDao;
import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.User;

public class UserService {

	public User login(User user){
		return   userDao.login(user);
	}
	public int register(User user) {
		return  userDao.register(user);
	}
	public User yanzhenUser(User user) {
		return userDao.yanzhenUser(user);
	}
	public List<Car> indexCar() {
		return userDao.indexCar();
	}
	public List<Car> indexCarL() {
		return userDao.indexCarL();
	}
	public List<Car> indexCarM() {
		return userDao.indexCarM();
	}
	public List<Car> indexCarS() {
		return userDao.indexCarS();
	}
	
	
    public UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public List<Carpinpai> searchCarSelect() {
		return userDao.searchCarSelect();
	}
	public List<Car> remenCarList() {
		return userDao.remenCarList();
	}
	public List<Car> zuixinCar() {
		return userDao.zuixinCar();
	}
	public List<Car> qiugouCar() {
		return userDao.qiugouCar();
	}
	public int editUser(User user) {
		return userDao.editUser(user);
	}
	public int editPassword(User user) {
		return userDao.editPassword(user);
	}
	
	

	
    
}
