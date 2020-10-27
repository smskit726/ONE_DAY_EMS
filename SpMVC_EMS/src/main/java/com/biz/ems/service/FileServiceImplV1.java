package com.biz.ems.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("fileServiceV1")
public class FileServiceImplV1 implements FileService{

	protected final String rootFolder;
	public FileServiceImplV1() {
		rootFolder = "C:/bizwork/workspace/upload";
	}
	
	@Override
	public String fileUp(MultipartFile file) {
		if(file.getOriginalFilename().isEmpty()) {
			return null;
		}
	
		File dir = new File(rootFolder);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String originalFileName = file.getOriginalFilename();
		String strUUID = UUID.randomUUID().toString();
		String saveFileName = strUUID + originalFileName;
		
		File saveFile = new File(rootFolder, saveFileName);
		
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			log.debug("파일 처리 중 ERROR 발생 (적합한 상태가 아닙니다.)");
		} catch (IOException e) {
			log.debug("파일 변환 중 ERROR 발생 :(");
		}
		
		return saveFileName;
	}

	@Override
	public boolean fileDelete(String fileName) {
		boolean ret = false;
		File deleteFile = new File(rootFolder, fileName);
		if(deleteFile.exists()) {
			ret = deleteFile.delete();
		}
		return ret;
	}

}
