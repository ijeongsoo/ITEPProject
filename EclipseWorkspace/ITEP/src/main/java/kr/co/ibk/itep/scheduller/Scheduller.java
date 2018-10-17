package kr.co.ibk.itep.scheduller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.ibk.itep.dto.EmpJoinedDep;
import kr.co.ibk.itep.service.Service;



@Component
public class Scheduller {
	private static final Logger logger = LoggerFactory.getLogger(Scheduller.class);
	
	@Autowired
	private Service service;
	
	@Autowired
	private ServletContext servletContext;
	
	//@Scheduled(cron="0 0 20 * * * ")
	@Scheduled(cron="*/10 * * * * *")
	public void empFileUploader(){

		logger.info(servletContext.getRealPath("/"));
				//String filePath = servletContext.getRealPath("/");
		String originPath = "/Users/ijeongsu/Desktop/emptest.dat";
				
		long firstSize =0;
		long secondSize =0;
		File f = null;
		
		int index =originPath.lastIndexOf("/");
		String temp = originPath.substring(0, index); 
	    String newPath = temp+"/backup/"+originPath.substring(index);
	    
	    int count =0 ;
	    
		while(true){
			f = new File(originPath);
			if(f.exists()){
				firstSize =f.length();
				try {
					Thread.sleep(10*1000);
				} catch (InterruptedException e) {
							// TODO Auto-generated catch block
					e.printStackTrace();
				}
				f = new File(originPath);
				secondSize = f.length();
				if(firstSize == secondSize){
					service.empFileUploader(originPath, newPath);
					break;
				}
				if(count==10){
					break;
				}
			}
			try {
				Thread.sleep(30*60*1000);
				count++;
			} catch (InterruptedException e) {
						// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}


	}
	
	@Scheduled(cron="*/10 * * * * *")
	public void briFileUploader(){

		logger.info(servletContext.getRealPath("/"));
				//String filePath = servletContext.getRealPath("/");
		String originPath = "/Users/ijeongsu/Desktop/britest.dat";
				
		long firstSize =0;
		long secondSize =0;
		File f = null;
		
		int index =originPath.lastIndexOf("/");
		String temp = originPath.substring(0, index); 
	    String newPath = temp+"/backup/"+originPath.substring(index);
	    
	    int count =0 ;
	    
		while(true){
			f = new File(originPath);
			if(f.exists()){
				firstSize =f.length();
				try {
					Thread.sleep(10*1000);
				} catch (InterruptedException e) {
							// TODO Auto-generated catch block
					e.printStackTrace();
				}
				f = new File(originPath);
				secondSize = f.length();
				if(firstSize == secondSize){
					service.briFileUploader(originPath, newPath);
					break;
				}
				if(count==10){
					break;
				}
			}
			try {
				Thread.sleep(30*60*1000);
				count++;
			} catch (InterruptedException e) {
						// TODO Auto-generated catch block
				e.printStackTrace();
			}
					
		}


	}

	
	
}
