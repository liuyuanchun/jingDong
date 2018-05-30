package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MainDao;

import service.MainService;
@Service
public class MainServletImpl implements MainService{
	@Autowired
	MainDao md;
	public List<String> searchReCi(String text) {
		return md.searchReCi(text);
	}
	
}
