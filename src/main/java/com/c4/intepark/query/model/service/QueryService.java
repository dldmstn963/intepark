package com.c4.intepark.query.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.c4.intepark.query.model.vo.Query;

public interface QueryService {

	ArrayList<Query> selectAll();

	Query selectOne(int queryno);

	ArrayList<Query> querySearch(String search);

	int queryinsert(Query query);

	Query queryUpdate(int idx);

	int queryDelete(int queryno);

	int insertqueryreply(Query query);

}
