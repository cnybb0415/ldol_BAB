package kr.co.gudi.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import kr.co.gudi.dao.AdminDAO;
import kr.co.gudi.dto.EatDTO;
import kr.co.gudi.dto.IdolDTO;

@Service
public class AdminEatService {

	@Autowired AdminDAO dao;
	Logger logger = LoggerFactory.getLogger(getClass());
	@Value("${file.location}") private String root;
	public ArrayList<EatDTO> eatList() {
		
		return dao.eatList();
	}
	public HashMap<String, Object> adminEatDetail(String eat_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		EatDTO eatUser = dao.eatUser(eat_idx);
		EatDTO eatData = dao.eatData(eat_idx);
		map.put("eatUser", eatUser);	
		map.put("eatData", eatData);	
		
		return map;
	}

	

}
