package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseService")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("${pageUnit}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("${pageSize}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value = "addPurchase", method = RequestMethod.GET)
	public ModelAndView addPurchase(@RequestParam("prodNo") int prodNo, HttpSession session) throws Exception{
		
		System.out.println("/purchase/addPurchase : GET");
		String viewName = "/purchase/addPurchaseView.jsp";
		
		
		Product product = productService.getProduct(prodNo);
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("user",session.getAttribute("user"));
		
		modelAndView.addObject("product", product);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "addPurchase", method = RequestMethod.POST)
	public ModelAndView addPurchase( @ModelAttribute Purchase purchase, @RequestParam("prodNo") int prodNo, HttpSession session) throws Exception{
		
		System.out.println("/purchase/addPurchase : POST");
		
		String viewName = "/purchase/readPurchase.jsp";
		
		Product product = productService.getProduct(prodNo);
		purchase.setPurchaseProd(product);
		purchase.setBuyer((User)session.getAttribute("user"));
		
		purchaseService.addPurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("purchase",purchase);
		
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "getPurchase")
	public ModelAndView getPurchase(@RequestParam("tranNo") int tranNo, Purchase purchase) throws Exception{
		
		System.out.println("/purchase/getPurchase : GET");
		String viewName = "/purchase/getPurchase.jsp";
		
		purchase = purchaseService.getPurchase(tranNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("purchase",purchase);
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public ModelAndView updatePurchase(@RequestParam("tranNo") int tranNo, Purchase purchase) throws Exception{
		
		System.out.println("/purchase/updatePurchase : GET");
		String viewName = "/purchase/updatePurchaseView.jsp";
		
		purchase = purchaseService.getPurchase(tranNo);
		purchase.setDlvyDate(purchase.getDlvyDate().replaceAll("-", ""));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("purchase",purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public ModelAndView updatePurchase( @ModelAttribute("purchase") Purchase purchase ,  @RequestParam("tranNo") int tranNo) throws Exception{
		
		System.out.println("/purchase/updatePurchase : POST");
		String viewName = "/purchase/getPurchase?tranNo="+tranNo+"&menu=ok";
		
		String date = purchase.getDlvyDate();
		if(date.length() == 8) {
			String date1 = date.substring(0, 4);
			String date2 = date.substring(4, 6);
			String date3 = date.substring(6);
			System.out.println(date1+"-"+date2+"-"+date3);
			purchase.setDlvyDate(date1+"-"+date2+"-"+date3);
		}
		
		purchaseService.updatePurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		
		return modelAndView;
	}
	@RequestMapping(value = "listPurchase")
	public ModelAndView listPurchase( @ModelAttribute("search") Search search, HttpSession session) throws Exception{
		
		System.out.println("/purchase/listPurchase : GET / POST");
		String viewName = "/purchase/listPurchase.jsp";
		
		//System.out.println(search);
		//System.out.println(session);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		User user = (User)session.getAttribute("user");
		
		search.setBuyerId(user.getUserId());
		
		//System.out.println(";;;;;;;;;;;;;;;;;;;;"+search);
		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		System.out.println(map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(viewName);
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		
		//model.addAttribute("search", search);

		
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public ModelAndView updateTranCode(@RequestParam("prodNo") int prodNo, @RequestParam("tranCode") String tranCode, Purchase purchase, Search search, String menu, HttpSession session) throws Exception{
		
		System.out.println("/purchase/updateTranCode : GET");
		
		System.out.println(";;;;search_전;;;;"+search);
		//search.setCurrentPage(currentPage);
		System.out.println(";;;;search_후;;;;"+search);
//		if(tranCode.equals("1")) {
//			tranCode = "2";
//		}else if(tranCode.equals("2")) {
//			tranCode = "3";
//		}
		System.out.println(";;;;전;;;;"+purchase);
		
		purchase.setTranCode(tranCode);
		purchase.setPurchaseProd(productService.getProduct(prodNo));
		
		System.out.println(";;;;후;;;;"+purchase);
		
		purchaseService.updateTranCode(purchase);
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		ModelAndView modelAndView = new ModelAndView();
		
		if(menu.equals("search")) {
			String viewName = "/purchase/listPurchase.jsp";
			User user = (User)session.getAttribute("user");
			
			search.setBuyerId(user.getUserId());
			
			//System.out.println(";;;;;;;;;;;;;;;;;;;;"+search);
			
			// Business logic 수행
			Map<String , Object> map=purchaseService.getPurchaseList(search);
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			
			System.out.println(resultPage);
			System.out.println(map);
			
			modelAndView.setViewName(viewName);
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			
		}else if(menu.equals("manage")) {
			Map<String , Object> map=productService.getProductList(search);
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			//System.out.println(search);
			
			String viewName = "/product/listProduct.jsp";
			// Model 과 View 연결
			
			modelAndView.setViewName(viewName);
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
		}
		// Business logic 수행
		
		
		return modelAndView;
		
		
	}
	
}
