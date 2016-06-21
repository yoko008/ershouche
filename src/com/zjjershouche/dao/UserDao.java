package com.zjjershouche.dao;

import java.util.List;

import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.User;

public interface UserDao {

	User login(User user);

	int register(User user);

	User yanzhenUser(User user);

	List<Car> indexCar();

	List<Car> indexCarL();

	List<Car> indexCarS();

	List<Car> indexCarM();
	
	List<Carpinpai> searchCarSelect();

	List<Car> remenCarList();

	List<Car> zuixinCar();

	List<Car> qiugouCar();

	int editUser(User user);

	int editPassword(User user);

}
