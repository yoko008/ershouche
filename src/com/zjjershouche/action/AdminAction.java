package com.zjjershouche.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.zjjershouche.model.Car;
import com.zjjershouche.model.Carimg;
import com.zjjershouche.model.Carpinpai;
import com.zjjershouche.model.Carselect;
import com.zjjershouche.model.Page;
import com.zjjershouche.model.Search;
import com.zjjershouche.model.User;
import com.zjjershouche.service.AdminService;
import com.zjjershouche.service.CarService;
import com.zjjershouche.service.UserService;

@SuppressWarnings("serial")
public class AdminAction extends ActionSupport  implements SessionAware {
	// 登录功能
	public String login() {
		user = adminService.login(user);
		Search search = new Search();
		//获取IP地址
		String ipAddress = null;   
	     //ipAddress = this.getRequest().getRemoteAddr();   
	     ipAddress = ServletActionContext.getRequest().getHeader("x-forwarded-for");   
	     if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {   
	      ipAddress = ServletActionContext.getRequest().getHeader("Proxy-Client-IP");   
	     }   
	     if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {   
	         ipAddress = ServletActionContext.getRequest().getHeader("WL-Proxy-Client-IP");   
	     }   
	     if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {   
	      ipAddress = ServletActionContext.getRequest().getRemoteAddr();   
	      if(ipAddress.equals("127.0.0.1")){   
	       //根据网卡取本机配置的IP   
	       InetAddress inet=null;   
	    try {   
	     inet = InetAddress.getLocalHost();   
	    } catch (UnknownHostException e) {   
	     e.printStackTrace();   
	    }   
	    ipAddress= inet.getHostAddress();   
	      }   
	            
	     }   
	  
	     //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割   
	     if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15   
	         if(ipAddress.indexOf(",")>0){   
	             ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));   
	         }   
	     }
	     search.setCarpinpai(ipAddress);
		if (user != null) {
			session.put("user", user);
			mark = "登录成功";
			return "loginSuccess";
		} else {
			mark = "您输入的账号或密码错误";
			return "loginFiled"; 
		}
	}
    //查找用户列表
	public String userList() {
		if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
		page.setPagelistnum(5);
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		page.setListnum(adminService.listnum(search));
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		userList = adminService.userList(search,page);
		return "userList";
	}
	//用户列表重置密码操作+设置管理员操作
	//若realname=admin，则为设置管理员操作，懒得再写一个方法了，反正是我自己维护
	public String resetPass() {
		int i  = adminService.resetPass(user);
		return null;
	}
	//用户列表禁用/解禁操作
	public String caozuo(){
		int i = adminService.caozuo(user);
		if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
		page.setPagelistnum(5);
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		page.setListnum(adminService.listnum(search));
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		userList = adminService.userList(search,page);
		return "userList";
	}
	
	//查找车辆列表
	public String carlist(){
		if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
		page.setPagelistnum(5);
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		page.setListnum(adminService.carlistnum(search));
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		carlist = adminService.searchCar(search,page);
 		carSelectList = adminService.searchCarSelect();
		return "carlist";
	}
	
	//车辆列表禁用/解禁操作 
	public String carcaozuo(){
			int i = adminService.carcaozuo(car);
			if(page.getNewpage()!=0){
				page.setCurrpage(page.getNewpage());
			}
			page.setPagelistnum(5);
			page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
			page.setListnum(adminService.carlistnum(search));
			if(page.getListnum()%page.getPagelistnum()!=0){
				page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
			}
			else{
				page.setPagenum(page.getListnum()/page.getPagelistnum());
			}
			carlist = adminService.searchCar(search,page);
	 		carSelectList = adminService.searchCarSelect();
			return "carlist";
	}
	
	public String checkPass(){
		int i = adminService.checkPass(car);
		return null;
	}
		
	public List<User> userList;
	public User user;
	public Car car;
	public Carimg carimg;
	public Search search;
	public Carselect carselect;
	public AdminService adminService = null;
	public List<Car> chexiCarList;
	public List<Car> jiaweiCarList;
	public List<Car> carlist;
	public List<Car> remenList;
	public List<Carimg> carimgList;
	public List<Carselect> CarselectList;
	public String mark;
	public List<Carpinpai> carSelectList;
	private Map<String, Object> session;
	public Page page;
	
	
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public List<Carselect> getCarselectList() {
		return CarselectList;
	}

	public void setCarselectList(List<Carselect> carselectList) {
		CarselectList = carselectList;
	}

	public Carselect getCarselect() {
		return carselect;
	}

	public void setCarselect(Carselect carselect) {
		this.carselect = carselect;
	}

	public List<Carimg> getCarimgList() {
		return carimgList;
	}

	public void setCarimgList(List<Carimg> carimgList) {
		this.carimgList = carimgList;
	}

	public Carimg getCarimg() {
		return carimg;
	}

	public void setCarimg(Carimg carimg) {
		this.carimg = carimg;
	}


	public List<Car> getCarlist() {
		return carlist;
	}

	public void setCarlist(List<Car> carlist) {
		this.carlist = carlist;
	}

	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}

	public List<Car> getChexiCarList() {
		return chexiCarList;
	}

	public void setChexiCarList(List<Car> chexiCarList) {
		this.chexiCarList = chexiCarList;
	}

	public List<Car> getJiaweiCarList() {
		return jiaweiCarList;
	}

	public void setJiaweiCarList(List<Car> jiaweiCarList) {
		this.jiaweiCarList = jiaweiCarList;
	}

	

	public AdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	public void setSession(Map<String, Object> session) {
        this.session = session;
    }
}
