package com.maybo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.maybo.dao.SecDao;
import com.maybo.model.Sec;
import com.maybo.service.ISecService;

public class SecServiceImpl implements ISecService {
	@Autowired
	private SecDao secDao;

	/**
	 * 根据id来查找数据
	 */
	public Sec findById(int id) {
		Sec sec = null;
		try {
			sec = secDao.findSecById(id);
		} catch (Exception e) {
			sec = null;
		}
		return sec;
	}

	/**
	 * 添加证券数据
	 */
	@Transactional
	public void addSec(Sec sec) {
		secDao.addSec(sec);

	}

	/**
	 * 根据id删除证券数据
	 */
	@Transactional
	public void deById(int id) {
		secDao.delSecById(id);
	}

	/**
	 * 更新证券数据
	 */
	@Transactional
	public void updateSec(Sec sec) {
		secDao.updateSec(sec);
	}

	/**
	 * 查找所有的证券数据
	 */
	public List<Sec> findAllSec() {
		List<Sec> secs = null;
		try {
			secs = secDao.findAllSec();
		} catch (Exception e) {
			secs = null;
		}
		return secs;
	}
}
