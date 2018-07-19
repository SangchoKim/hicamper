package com.hicamper.test.etc.upload.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hicamper.test.etc.upload.upload.service.UploadService;
import com.hicamper.test.web.members.common.LoginController;


@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UploadService uploadservice;
	
	@Autowired
	private Overlapping_upload overlapping_upload; 
	
	@RequestMapping(value="/host/addcamp_9", method = {RequestMethod.GET,RequestMethod.POST })
	public String upload_camp(Model model , HttpServletRequest req, 
			@RequestParam("campsite_thumbnail") MultipartFile[] multipartfile,
			HttpSession httpSession) throws Exception{
			
		String rootpath = req.getSession().getServletContext().getRealPath("/");
		String realFolder = "resources/fileupload/";
		File dir = new File(realFolder);
		System.out.println(rootpath);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
			
		Map files = new HashMap();
		
		String name = null;
		String filename = null;
		long filesize = 0;
		
		
		for(MultipartFile file : multipartfile) {
			
			name = file.getName();
			filename = file.getOriginalFilename();
			filesize = file.getSize();
			
			String ext = filename.substring(filename.lastIndexOf('.'));
			String saveFileName = getUuid() + ext;		
		
			File serverfile = new File(rootpath + realFolder + saveFileName); 
			file.transferTo(serverfile);
		
			
			files.put("filename", filename );
			files.put("saveFileName", saveFileName);
			files.put("filesize", filesize );
		}
			
		System.out.println("File info");
		System.out.println("name : " + name);
		System.out.println("filename : " + filename);
		System.out.println("size : " + filesize);
		System.out.println("--------------------------------------------------");
		
		int count = uploadservice.uploadInsert(files);
		httpSession.setAttribute("fileupload_no", files.get("fileupload_no"));
		
		return overlapping_upload.overlap_1(model, count);	
	}
	
	public static String getUuid() {

		return UUID.randomUUID().toString().replaceAll("-", ""); 
		
	}

	
}
