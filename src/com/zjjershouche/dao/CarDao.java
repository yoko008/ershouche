package com.zjjershouche.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carimg;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Carselect;
import com.zjjershouche.model.Page;
import com.zjjershouche.model.Search;
import com.zjjershouche.model.User;

public interface CarDao {
	Car buyCar(Car car);

	List<Car> buyPageChexi(Car car);

	List<Car> buyPageJiawei(Car car);

	List<Car> searchCar(Map<String, Object> paramMap);
//	List<Car> searchCar(@Param("search")Search search, @Param("page")Page page);

	int addCarInfo(Car car);

	Car searchLastCar();

	int addCarImg(Carimg carimg);

	List<Carimg> buyCarImg(Car car);

	List<Carselect> searchChexi(Carselect carselect);

	List<Carpinpai> searchCarSelect();

	int liulanjia(Car car);

	List<Car> remenCarList();

	int qiugou(Car car);

	List<Car> buyList(User user);

	List<Car> sellList(User user);

	int listnum(Search search);

	int carcaozuo(Car car);

	int wcarcaozuo(Car car);

	int wantlistnum(Search search);

	List<Car> searchWantCar(Map<String, Object> paramMap);

	


}
