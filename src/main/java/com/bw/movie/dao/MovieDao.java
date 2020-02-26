package com.bw.movie.dao;

import java.util.List;

import com.bw.movie.domain.Movie;
import com.bw.movie.vo.MovieVO;

public interface MovieDao {

	List<Movie> selects(MovieVO mVo);

	int del(Integer[] ids);

}
