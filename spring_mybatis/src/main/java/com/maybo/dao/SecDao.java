package com.maybo.dao;
/**
 * 定义一个interface
 */
import java.util.List;

import com.maybo.model.Sec;

public interface SecDao {
	// 通过id获取sec表的信息
	public Sec findSecById(int id);

	// 获取所有信息
	public List<Sec> findAllSec();

	// 通过id删除sec表记录
	public void delSecById(int id);

	// 添加数据到sec
	public void addSec(Sec sec);

	// 修改信息
	public void updateSec(Sec sec);
}
