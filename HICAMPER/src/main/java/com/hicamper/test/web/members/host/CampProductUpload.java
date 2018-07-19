package com.hicamper.test.web.members.host;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Repository
@Transactional(readOnly=true)
public class CampProductUpload {
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor = Exception.class)
	public Map Upload(MultipartFile[] multipartfile, HttpServletRequest req) throws Exception {
		
		Map files = new HashMap();

		String name = null;
		String filename = null;
		long filesize = 0;
		
		String rootpath = req.getSession().getServletContext().getRealPath("/");
		String realFolder = "resources/campingroom/";
		File dir = new File(realFolder);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		for (MultipartFile file : multipartfile) {

			name = file.getName();
			filename = file.getOriginalFilename();
			filesize = file.getSize();

			String ext = filename.substring(filename.lastIndexOf('.'));
			String saveFileName = getUuid() + ext;

			File serverfile = new File(rootpath + realFolder + saveFileName);
			System.out.println(serverfile);
			file.transferTo(serverfile);

			files.put("filename", filename);
			files.put("saveFileName", saveFileName);
			files.put("filesize", filesize);
		}

		System.out.println("File info");
		System.out.println("name : " + name);
		System.out.println("filename : " + filename);
		System.out.println("size : " + filesize);
		System.out.println("--------------------------------------------------");

		
		// 다음주 월요일 여기서 시작 
		return files;

	}

	public static String getUuid() {

		return UUID.randomUUID().toString().replaceAll("-", "");

	}
}