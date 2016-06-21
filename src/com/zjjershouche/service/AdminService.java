package com.zjjershouche.service;


import java.util.List;

import com.zjjershouche.dao.AdminDao;
import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Page;
import com.zjjershouche.model.Search;
import com.zjjershouche.model.User;

public class AdminService {

	

	public AdminDao adminDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public User login(User user) {
		return adminDao.login(user);
	}

	public List<User> userList(Search search, Page page) {
		return adminDao.userList(search,page);
	}

	public int resetPass(User user) {
		return adminDao.resetPass(user);
	}

	public int caozuo(User user) {
		return adminDao.caozuo(user);
	}

	public int listnum(Search search) {
		return adminDao.listnum(search);
	}

	public List<Carpinpai> searchCarSelect() {
		return adminDao.searchCarSelect();
	}

	public List<Car> searchCar(Search search, Page page) {
		return adminDao.searchCar(search,page);
	}

	public int carlistnum(Search search) {
		return adminDao.carlistnum(search);
	}

	public int carcaozuo(Car car) {
		return adminDao.carcaozuo(car);
	}

	public int checkPass(Car car) {
		return adminDao.checkPass(car);
	}

	
	
	
    
}
