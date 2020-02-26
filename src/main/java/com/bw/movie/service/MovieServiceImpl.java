package com.bw.movie.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.movie.dao.MovieDao;
import com.bw.movie.domain.Movie;
import com.bw.movie.vo.MovieVO;

@Service
public class MovieServiceImpl implements MovieService{

	@Resource
	private MovieDao dao;

	@Override
	public List<Movie> selects(MovieVO mVo) {
		// TODO Auto-generated method stub
		return dao.selects(mVo);
	}

	@Override
	public boolean del(Integer[] ids) {
		int i=dao.del(ids);
		
		return i>0;
	}
}
