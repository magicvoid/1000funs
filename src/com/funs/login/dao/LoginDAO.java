/******************************************************************************
* Copyright (C) 2013 ShenZhen 1000funs Information Technology Co.,Ltd
* All Rights Reserved.
* 本软件为深圳千方百味公司开发研制。
******************************************************************************/
package com.funs.login.dao;

import java.util.List;

import com.funs.core.base.dao.BaseDAO;
import com.funs.packages.model.PackageGroupVO;
import com.funs.packages.model.PackageVO;

/**
 * 套餐DAO
 *
 * @author 黄科林
 * @since jdk6.0
 * @version  2013-1-13 黄科林
 */
public class LoginDAO extends BaseDAO{
	
	public void insertPackage(PackageVO packageVO) {
		this.sqlSessionTemplate.insert("com.funs.package.insertPackage", packageVO);
	}
	
	public int queryIdForPackageVO(PackageVO packageVO) {
		return (Integer)this.sqlSessionTemplate.selectOne("com.funs.package.queryIdForPackageVO", packageVO);
	}
	
	public void insertPackageReShop(PackageVO packageVO){
		this.sqlSessionTemplate.insert("com.funs.package.insertPackageReShop", packageVO);
	}
	
	public void insertPackageGroup(PackageGroupVO packageGroupVO){
		this.sqlSessionTemplate.insert("com.funs.package.insertPackageGroup",packageGroupVO);
	}
	
	public List<PackageVO> queryPackagesByShopId(int shopId){
		List<PackageVO> result =  this.sqlSessionTemplate.selectList("com.funs.package.queryPackagesByShopId", shopId);
		return result;
	}
	
	public int queryCountOfPackage(){
		return (Integer)this.sqlSessionTemplate.selectOne("com.funs.package.queryCountOfPackage");
	}

}
