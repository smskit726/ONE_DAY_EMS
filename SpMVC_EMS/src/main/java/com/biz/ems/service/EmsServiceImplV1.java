package com.biz.ems.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.ems.mapper.EmsDao;
import com.biz.ems.model.EmsVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("emsServiceV1")
public class EmsServiceImplV1 implements EmsService{

	@Autowired
	protected EmsDao emsDao; 
	
	@Qualifier("fileServiceV1")
	@Autowired
	protected FileService fileService;
	
	@Override
	public List<EmsVO> selectAll() {
		return emsDao.selectAll();
	}

	@Override
	public void insert(EmsVO emsVO, MultipartFile s_file1, MultipartFile s_file2) {
		String s_fileName1 = fileService.fileUp(s_file1);
		String s_fileName2 = fileService.fileUp(s_file2);
		
		emsVO.setS_file1(s_fileName1);
		emsVO.setS_file2(s_fileName2);
		
		emsDao.insert(emsVO);
	}

	@Override
	public EmsVO findBySeq(long long_seq) {
		EmsVO emsVO = emsDao.findBySeq(long_seq);
		return emsVO;
	}

	@Override
	public int delete(long long_seq) {
		EmsVO emsVO = emsDao.findBySeq(long_seq);
		String s_file1 = emsVO.getS_file1();
		String s_file2 = emsVO.getS_file2();
		
		if(s_file1 != null) {
			fileService.fileDelete(s_file1);			
		}
		
		if(s_file2 != null) {			
			fileService.fileDelete(s_file2);
		}
		
		return emsDao.delete(long_seq);
	}

	@Override
	public EmsVO localDateTime(EmsVO emsVO) {
		LocalDateTime lDateTime = LocalDateTime.now();
		String lDate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(lDateTime);
		String lTime = DateTimeFormatter.ofPattern("HH:mm:SS").format(lDateTime);
		
		emsVO.setS_date(lDate);
		emsVO.setS_time(lTime);
		
		return emsVO;
	}

	@Override
	public int update(EmsVO emsVO, MultipartFile s_file1, MultipartFile s_file2) {
		
		if(emsVO.getS_file1() != null) {
			fileService.fileDelete(emsVO.getS_file1());
		}
		
		if(emsVO.getS_file2() != null) {			
			fileService.fileDelete(emsVO.getS_file2());
		}
		
		String s_fileName1 = fileService.fileUp(s_file1);
		String s_fileName2 = fileService.fileUp(s_file2);
		
		emsVO.setS_file1(s_fileName1);
		emsVO.setS_file2(s_fileName2);
		
		log.debug(emsVO.toString());
		return emsDao.update(emsVO);
	}

}
