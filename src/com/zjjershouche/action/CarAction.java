package com.zjjershouche.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
import com.zjjershouche.service.CarService;
import com.zjjershouche.service.UserService;

@SuppressWarnings("serial")
public class CarAction extends ActionSupport   implements SessionAware {
	// 进入车辆详细页面
	public String buyCar() {
		car = carService.buyCar(car);
		carimgList = carService.buyCarImg(car);
		chexiCarList = carService.buyPageChexi(car);
		jiaweiCarList = carService.buyPageJiawei(car);
		int i =carService.liulanjia(car);
		return "buyPageSuccess";
	}

	// 车辆条件搜索
	public String searchCar() {
		if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
		if(page.getPagelistnum()==0){
			page.setPagelistnum(15);
		}
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		page.setListnum(carService.listnum(search));
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		if(page.getPagenum()==0){
			page.setCurrpage(0);
		}
 		carlist = carService.searchCar(search,page);
 		carSelectList = carService.searchCarSelect();
 		remenList = carService.remenCarList();
		return "searchSuccess";
	}

	// 发布卖车信息
	public String sellCar() throws Exception {
		// 插入新的车辆信息
		car.setTitle(car.getCarpinpai()+" , "+car.getChexi());
		//获取当前时间
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		car.setFabudate(time);
		user = (User)session.get("user");
		car.setUsername(user.getUsername());
		int addNum = carService.addCarInfo(car);
		int addImgNum = 0;
		if (addNum > 0) {
			Carimg carimg = new Carimg();
			// 查找新插入车辆信息的id，set给carimg.carid
			carimg.setCarid(carService.searchLastCar().getId());
			InputStream fis = null;
			OutputStream os = null;
//			String realpath = "F:/实训/eclipse/workspace/zjjershouche/WebContent/carimg";
//			String realpath = "D:/GWTWorkSpace/zjjershouche/WebContent/carimg";
			String realpath = ServletActionContext.getServletContext().getRealPath("/carimg");
			try {
				for (int i = 0; i < file.length; i++) {

					fis = new FileInputStream(this.file[i]);
					// 防止重名
					this.fileFileName[i] = System.currentTimeMillis()
							+ this.fileFileName[i];
					// 将图片地址set给carimg.carimgurl
					carimg.setCarimgurl(this.fileFileName[i]);
					File tagfile = new File(realpath, this.fileFileName[i]);
					os = new FileOutputStream(tagfile);
					byte[] b = new byte[1024];
					int count;
					while ((count = fis.read(b)) > 0) {
						os.write(b, 0, count);
					}
					carimg.setFengmian(i);
					addImgNum = carService.addCarImg(carimg) + addImgNum;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				os.close();
				fis.close();
			}
		}
		if (addImgNum > 0) {
			return "fabuSuccess";
		} else {
			return "fabuFiled";
		}
	}
    //车辆品牌和车系二级联动
	public String carLiandong(){
		CarselectList =  carService.searchChexi(carselect);
		JSONArray json = JSONArray.fromObject(CarselectList);
		mark = json.toString();
		return "liandongSuccess";
	}
	//进入卖车页面，获取车辆品牌信息用于下拉框
	//额。。。加了个求购页面，求购也要
	public String sellCarSelect(){
		carSelectList = carService.searchCarSelect();
		if("qiugou".equals(mark)){
			return "qiugou";
		}
		else{
			return "sellCar";
		}
	}
	//发布求购信息
	public String qiugou(){
		user = (User)session.get("user");
		car.setUsername(user.getUsername());
		int i = carService.qiugou(car);
		return "qiugouSuccess";
	}
	//查看已发布的信息
	public String userFabu(){
		carlist = carService.buyList(user);
		remenList = carService.sellList(user);
		return "userfabu";
	}
	//给发布的信息下架
	public String carcaozuo(){
		if("car".equals(mark)){
			int i = carService.carcaozuo(car);
		}
		if("wcar".equals(mark)){
			int i = carService.wcarcaozuo(car);
		}
		carlist = carService.buyList(user);
		remenList = carService.sellList(user);
		car=null;
		return "userfabu";
	}
	//查找发布的求购信息
	public String wantcarlist(){
		if(page.getNewpage()!=0){
			page.setCurrpage(page.getNewpage());
		}
		if(page.getPagelistnum()==0){
			page.setPagelistnum(15);
		}
		page.setStartnum((page.getCurrpage()-1)*page.getPagelistnum());
		page.setListnum(carService.wantlistnum(search));
		if(page.getListnum()%page.getPagelistnum()!=0){
			page.setPagenum(page.getListnum()/page.getPagelistnum()+1);
		}
		else{
			page.setPagenum(page.getListnum()/page.getPagelistnum());
		}
		if(page.getPagenum()==0){
			page.setCurrpage(0);
		}
		carlist = carService.searchWantCar(search,page);
		return "wantCarList";
	}
	public Page page;
	public User user;
	public Car car;
	public Carimg carimg;
	public Search search;
	public Carselect carselect;
	public CarService carService = null;
	public List<Car> chexiCarList;
	public List<Car> jiaweiCarList;
	public List<Car> carlist;
	public List<Car> remenList;
	public List<Carimg> carimgList;
	public List<Carselect> CarselectList;
	public File[] file;// 得到上传的文件
	public String[] fileFileName;// 得到文件的类型
	public String[] fileContentType;// 得到文件的名称
	public String mark;
	public List<Carpinpai> carSelectList;
	private Map<String, Object> session;
	

	
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

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
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

	public CarService getCarService() {
		return carService;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
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
