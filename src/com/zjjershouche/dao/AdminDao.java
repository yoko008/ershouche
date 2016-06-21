package com.zjjershouche.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Page;
import com.zjjershouche.model.Search;
import com.zjjershouche.model.User;

public interface AdminDao {

	User login(User user);

	List<User> userList(@Param("search")Search search, @Param("page")Page page);

	int resetPass(User user);

	int caozuo(User user);

	int listnum(Search search);

	List<Carpinpai> searchCarSelect();

	List<Car> searchCar(@Param("search")Search search, @Param("page")Page page);

	int carlistnum(Search search);

	int carcaozuo(Car car);

	int checkPass(Car car);

}
