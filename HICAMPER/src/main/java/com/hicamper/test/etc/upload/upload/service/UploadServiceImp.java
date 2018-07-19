package com.hicamper.test.etc.upload.upload.service;

import java.util.Map;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hicamper.test.etc.upload.upload.Overlapping_upload;
import com.hicamper.test.etc.upload.upload.dao.UploadDao;

@Transactional(readOnly = true)
@Service
public class UploadServiceImp implements UploadService {

	private static final Logger logger = LoggerFactory.getLogger(UploadServiceImp.class);
	
	@Autowired
	private UploadDao uploaddao;
	
	@Autowired
	private Overlapping_upload overlapping_upload;
		
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int uploadInsert(Map files) throws Exception {
		int count = uploaddao.uploadInsert(files);
		return overlapping_upload.overlap_2(count);
	}

}
