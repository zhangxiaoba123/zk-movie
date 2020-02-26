package com.bw.movie.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.movie.domain.Movie;
import com.bw.movie.service.MovieService;
import com.bw.movie.vo.MovieVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
public class MovieController {

	@Resource
	private MovieService service;
	
	@RequestMapping("selects")
	public String list(MovieVO mVo,Model model) {
		
		if (mVo.getPageNum()==null) {
			mVo.setPageNum(1);
		}
		
		PageHelper.startPage(mVo.getPageNum(), 3);
		List<Movie> list=service.selects(mVo);
		
		PageInfo<Movie> page=new PageInfo<Movie>(list);
	
		model.addAttribute("page", page);
		model.addAttribute("mVo", mVo);
		return "list";
		
	}
	
	@ResponseBody
	@RequestMapping("del")
	public Object del(Integer[] ids) {
		
		boolean flag=service.del(ids);
		return flag;
		
	}
}
