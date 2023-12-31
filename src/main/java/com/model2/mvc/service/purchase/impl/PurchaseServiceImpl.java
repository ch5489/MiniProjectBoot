package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.purchase.dao.PurchaseDAO;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDAO")
	private PurchaseDAO purchaseDao;
	
	public void setPurchaseDao(PurchaseDAO purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	public PurchaseServiceImpl() {
		System.err.println(this.getClass());
	}
	@Override
	public void addPurchase(Purchase purchase) throws Exception{
		purchaseDao.addPurchase(purchase);
	}
	
	@Override
	public Map<String , Object> getPurchaseList(Search search) throws Exception{
		List<Purchase> list = purchaseDao.getPurchaseList(search);
		int totalCount = purchaseDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public Purchase getPurchase(int tranNo) throws Exception{
		
		return purchaseDao.getPurchase(tranNo);
		
	}

	public Purchase getPurchaseProd(int prodNo) throws Exception {
		System.out.println(";;;;;;getPurchaseProd;;;;;;;");
		return purchaseDao.getPurchaseProd(prodNo);

	}
	
	public void updatePurchase(Purchase purchase) throws Exception{
		
		purchaseDao.updatePurchase(purchase);
	}
	
	public void updateTranCode(Purchase purchase) throws Exception{
		System.out.println(";;;;;;updateTranCode;;;;;;;");
		purchaseDao.updateTranCode(purchase);
	}
}

//getPurchase
//geetPurchaseList
//getSaleList
//addPurchase
//updatePurchase
//updateTranCode