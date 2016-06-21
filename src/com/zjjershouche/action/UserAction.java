package com.zjjershouche.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Carselect;
import com.zjjershouche.model.User;
import com.zjjershouche.service.UserService;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements SessionAware {
    //登录功能
	public String login(){
		user = userService.login(user);
		if(user!=null){
			if("editPass".equals(mark)){
				return "editpass";
			}
			else{
				session.put("user", user);
				mark = "登录成功";
				//登录成功后获取主页需要显示的信息
				carlist = userService.indexCar();
				carlistL = userService.indexCarL();
				carlistM = userService.indexCarM();
				carlistS = userService.indexCarS();
				carSelectList = userService.searchCarSelect();
				remenList = userService.remenCarList();
				zuixinList = userService.zuixinCar();
				qiugouList = userService.qiugouCar();
				return "loginSuccess";
			}
		}else{
			if("editPass".equals(mark)){
				mark="密码错误";
				return "editpassF";
			}
			else{
				mark="您输入的账号或密码错误";
				return "loginFiled";
			}
		}
	}
	
	//注册功能
	public String register(){
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		user.setReqdate(time);
		int bool = userService.register(user);
		if(bool>0){
			mark = "恭喜，注册成功，登录账号吧";
			return "registerSuccess";
		}else{
			mark = "注册失败";
			return "registerFiled";
		}
	}
	//ajax验证用户名是否重复
	public String yanzhenUser(){
		user = userService.yanzhenUser(user);
		if(user!=null){
			mark = "n";
		}
		else{
			mark = "y";
		}
		return "yanzhenSuccess";
	}
	//显示首页信息,因为获取主页数据的方法都在这里，所以放在这个类
	public String index(){
		carlist = userService.indexCar();
		carlistL = userService.indexCarL();
		carlistM = userService.indexCarM();
		carlistS = userService.indexCarS();
		carSelectList = userService.searchCarSelect();
		remenList = userService.remenCarList();
		zuixinList = userService.zuixinCar();
		qiugouList = userService.qiugouCar();
		return "loginSuccess";
	}
	//用户修改个人信息
	public String editUser(){
		int i = userService.editUser(user);
		return "user";
	}
	//修改密码
	public String editPassword(){
		int i = userService.editPassword(user);
		return "user";
	}
	
	public User user;
	public List<User> userList;
	public List<Car> carlist;
	public List<Car> carlistL;
	public List<Car> carlistM;
	public List<Car> carlistS;
	public List<Car> remenList;
	public List<Car> zuixinList;
	public List<Car> qiugouList;
	public List<Carpinpai> carSelectList;
	private Map<String, Object> session;
	public UserService userService=null;
	public String mark;
	
	
	public List<Car> getZuixinList() {
		return zuixinList;
	}

	public void setZuixinList(List<Car> zuixinList) {
		this.zuixinList = zuixinList;
	}

	public List<Car> getRemenList() {
		return remenList;
	}
	public void setRemenList(List<Car> remenList) {
		this.remenList = remenList;
	}
	public List<Carpinpai> getCarSelectList() {
		return carSelectList;
	}
	public void setCarSelectList(List<Carpinpai> carSelectList) {
		this.carSelectList = carSelectList;
	}
	public List<Car> getCarlistL() {
		return carlistL;
	}
	public void setCarlistL(List<Car> carlistL) {
		this.carlistL = carlistL;
	}
	public List<Car> getCarlistM() {
		return carlistM;
	}
	public void setCarlistM(List<Car> carlistM) {
		this.carlistM = carlistM;
	}
	public List<Car> getCarlistS() {
		return carlistS;
	}
	public void setCarlistS(List<Car> carlistS) {
		this.carlistS = carlistS;
	}
	public List<Car> getCarlist() {
		return carlist;
	}
	public void setCarlist(List<Car> carlist) {
		this.carlist = carlist;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public void setSession(Map<String, Object> session) {
        this.session = session;
    }
	
}
