package com.biz.ems.service;

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

}
