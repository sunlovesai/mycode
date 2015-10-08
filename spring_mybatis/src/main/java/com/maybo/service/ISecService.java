package com.maybo.service;

import java.util.List;

import com.maybo.model.Sec;

public interface ISecService {
	public abstract List<Sec> findAllSec();

	public abstract Sec findById(int id);

	public abstract void addSec(Sec sec);

	public abstract void deById(int id);

	public abstract void updateSec(Sec sec);

}