package com.zjjershouche.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zjjershouche.dao.CarDao;
import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carimg;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Carselect;
import com.zjjershouche.model.Page;
import com.zjjershouche.model.Search;
import com.zjjershouche.model.User;

public class CarService {

	

	public CarDao carDao;

	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	public Car buyCar(Car car) {
		return carDao.buyCar(car);
	}

	public List<Car> buyPageChexi(Car car) {
		return carDao.buyPageChexi(car);
	}

	public List<Car> buyPageJiawei(Car car) {
		return carDao.buyPageJiawei(car);
	}

	public List<Car> searchCar(Search search, Page page) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("search",search);
		paramMap.put("page",page);
		return carDao.searchCar(paramMap);
	}

	public int addCarInfo(Car car) {
		return carDao.addCarInfo(car);
	}

	public Car searchLastCar() {
		return carDao.searchLastCar();
	}

	public int addCarImg(Carimg carimg) {
		return carDao.addCarImg(carimg);
	}

	public List<Carimg> buyCarImg(Car car) {
		return carDao.buyCarImg(car);
	}

	public List<Carselect> searchChexi(Carselect carselect) {
		return carDao.searchChexi(carselect);
	}

	public List<Carpinpai> searchCarSelect() {
		return carDao.searchCarSelect();
	}

	public int liulanjia(Car car) {
		return carDao.liulanjia(car);
	}

	public List<Car> remenCarList() {
		return carDao.remenCarList();
	}

	public int qiugou(Car car) {
		return carDao.qiugou(car);
	}

	public List<Car> buyList(User user) {
		return carDao.buyList(user);
	}

	public  List<Car> sellList(User user) {
		return carDao.sellList(user);
	}

	public int listnum(Search search) {
		return carDao.listnum(search);
	}

	public int carcaozuo(Car car) {
		return carDao.carcaozuo(car);
	}

	public int wcarcaozuo(Car car) {
		return carDao.wcarcaozuo(car);
	}

	public int wantlistnum(Search search) {
		return carDao.wantlistnum(search);
	}

	public List<Car> searchWantCar(Search search, Page page) {
		Map<String, Object> paramMap=new HashMap<String, Object>();
		paramMap.put("search",search);
		paramMap.put("page",page);
		return carDao.searchWantCar(paramMap);
	}
	
	
    
}
