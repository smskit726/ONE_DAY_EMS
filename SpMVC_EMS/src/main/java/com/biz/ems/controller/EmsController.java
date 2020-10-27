package com.biz.ems.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.biz.ems.model.EmsVO;
import com.biz.ems.service.EmsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/ems")
public class EmsController {

	@Qualifier("emsServiceV1")
	@Autowired
	private EmsService emsService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		List<EmsVO> emsList = emsService.selectAll();

		model.addAttribute("EMS_LIST", emsList);
		return "/ems/list";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(@ModelAttribute("EMSVO") EmsVO emsVO, Model model) {
		
		emsService.localDateTime(emsVO);
		model.addAttribute("EMSVO", emsVO);
		return "/ems/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(EmsVO emsVO,
						@RequestParam(name="file1", required = false) MultipartFile s_file1,
						@RequestParam(name="file2", required = false) MultipartFile s_file2) {
		
		log.debug(emsVO.toString());
		emsService.insert(emsVO,s_file1,s_file2);
		return "redirect:/ems/list";
	}
	
	@RequestMapping(value = "/detail/{seq}", method = RequestMethod.GET)
	public String detail(@PathVariable("seq")String seq, Model model) {
		long long_seq = Long.valueOf(seq);
		EmsVO emsVO = emsService.findBySeq(long_seq);
		model.addAttribute("EMSVO", emsVO);
		return "/ems/detail";
	}
	
	/*
	 * detail view에서 수정 or 삭제 버튼 클릭시 controller에서 받는 부분
	 */
	@RequestMapping(value = "/{seq}/{url}", method = RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, @PathVariable("url") String url, Model model) {
		long long_seq = Long.valueOf(seq);
		String ret_url = "redirect:/ems/list";
		
		if(url.equalsIgnoreCase("DELETE")) {
			emsService.delete(long_seq);
		} else if(url.equalsIgnoreCase("UPDATE")) {
			model.addAttribute("EMSVO",emsService.findBySeq(long_seq));
			ret_url = "/ems/write";
		}
		
		return ret_url;
	}
	
	@RequestMapping(value = "/{seq}/update", method = RequestMethod.POST)
	public String update(@PathVariable("seq") String seq, @ModelAttribute("EMSVO")EmsVO emsVO,
						@RequestParam(name="file1", required = false) MultipartFile s_file1,
						@RequestParam(name="file2", required = false) MultipartFile s_file2) {
		
		emsService.update(emsVO, s_file1, s_file2);
		return "redirect:/ems/list";
	}
}
