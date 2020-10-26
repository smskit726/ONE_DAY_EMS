package com.biz.ems.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.ems.mapper.EmsDao;
import com.biz.ems.model.EmsVO;

@Service("emsServiceV1")
public class EmsServiceImplV1 implements EmsService{

	@Autowired
	protected EmsDao emsDao; 
	
	@Override
	public List<EmsVO> selectAll() {
		return emsDao.selectAll();
	}

	@Override
	public void insert(EmsVO emsVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(EmsVO emsVO, MultipartFile file) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<String> insert(EmsVO emsVO, MultipartHttpServletRequest files) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmsVO findBySeq(long long_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(long long_seq) {
		// TODO Auto-generated method stub
		return 0;
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

}
