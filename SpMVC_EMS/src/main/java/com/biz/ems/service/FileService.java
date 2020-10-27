package com.biz.ems.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	public String fileUp(MultipartFile file);
	
	public boolean fileDelete(String fileName);
}
