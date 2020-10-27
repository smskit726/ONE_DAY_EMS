package com.biz.ems.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.ems.model.EmsVO;

public interface EmsService {

	public List<EmsVO> selectAll();
	
	public void insert(EmsVO emsVO, MultipartFile s_file1, MultipartFile s_file2);
	
	public EmsVO findBySeq(long long_seq);

	public int delete(long long_seq);
	
	public int update(EmsVO emsVO, MultipartFile s_file1, MultipartFile s_file2);
	
	public EmsVO localDateTime(EmsVO emsVO);

}
