package com.niit.dao;

import java.util.List;

import com.niit.model.Supplier;

public interface SupplierDao {
	
	
public List<Supplier> listSupplier();
	
	public void addSupplier(Supplier supplier);
	
	public Supplier getSupplierById(int id);
	
	public void deleteSupplie(int id);
	
	public void updateSupplier(Supplier supplier);

}
