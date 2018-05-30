package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.PublishingDao;

import entity.Publishing;
import service.PublishingService;
@Service
public class PublishingServiceImpl implements PublishingService{
	@Autowired
	PublishingDao pud;
	public List<Publishing> searchAllPublishing() {
		
		return pud.searchAllPublishing();
	}

}
