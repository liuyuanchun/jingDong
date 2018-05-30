package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import entity.BigType;
import entity.Product;
import entity.Publishing;
import entity.SmallType;

import service.ProductService;
import service.PublishingService;
import service.TypeService;
@Controller
public class ProductController {
	@Autowired
	ProductService ps ;
	@Autowired
	TypeService ts;
	@Autowired
	PublishingService pus;
	/**
	 * 根据商品id重定向到商品详情页
	 * @param proId
	 * @return
	 */
	@RequestMapping(value="showBook",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView show(Integer proId ){
		ModelAndView mv = new  ModelAndView("book/bookOfJingDong");	
		if(proId!=null){
		Product bookxq = ps.searchById(proId);
		mv.addObject("proxq", bookxq);
		}
		return mv;
	}
	/**
	 * 根据大分类或小分类重定向到商品列表页
	 * @param sId
	 * @param bId
	 * @return
	 */
	@RequestMapping(value="list",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView list(HttpServletRequest request,Integer sId,Integer bId,Integer page){
		ModelAndView mv = new  ModelAndView("book/booklb");
		List<Product> booklist = null;
		if(sId != null && sId != -1){
			booklist = ps.searchAllBysId(sId);
		}else if(bId != null && bId != -1){
			booklist = ps.searchAllBybId(bId);
		}else{
			booklist= ps.searchAll();
		}
		int count = booklist.size();
		int maxPage = (count-1)/10+1;
		if(page ==null){
			page = 1;
		}else{
			if(page<=0){
				page=1;
			}
			if(page>=maxPage){
				page=maxPage;
			}
		}
		Integer page1 = (page - 1) * 10;
		List<Product> booklists = null;
		if(sId != null  && sId != -1){
			booklists = ps.searchBysId(sId,page1);
		}else if(bId != null && bId != -1){
			booklists = ps.searchBybId(sId,page1);
		}else{
			booklists= ps.searchPage(page1);
		}
		mv.addObject("booklist", booklists);
		mv.addObject("page", page);
		mv.addObject("maxPage", maxPage);
		mv.addObject("sId", sId);
		mv.addObject("bId", bId);
		return mv;
	}
	
	/**
	 * 重定向到添加商品的页面
	 * @return
	 */
	@RequestMapping(value="showMAddProduct",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView showMAddProduct(){
		ModelAndView mv = new  ModelAndView("manage/product/addProduct");	
		List<Publishing> publist = pus.searchAllPublishing();
		List<BigType> bAndSType = ts.searchAllType();
		mv.addObject("allType", bAndSType);
		mv.addObject("publist", publist);
		return mv;
	}
	/**
	 * 添加商品信息
	 * @param request
	 * @param product
	 * @param myfiles
	 * @return
	 */
	@RequestMapping(value="AddMProduct",method={RequestMethod.POST,RequestMethod.GET})
	public String showMAddProduct(HttpServletRequest request,Product product,
			@RequestParam(value="mypicture")  MultipartFile[] myfiles ){
		String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/managePicture";
		//String[] bendi = uploadPath.split("\\\\");
		//String bendi1 = "";
		/*for(int i =0 ; i < 3;i++){
			bendi1 += bendi[i] + "\\";
		}	*/
		//String url = bendi1 + "MyEclipse\\workspace\\jingDong\\jingDong\\WebRoot" + "/managePicture";
		//for(MultipartFile file: myfiles){
		MultipartFile picture = myfiles[0];
	//	MultipartFile picture1 = picture;
	//	MultipartFile picture2 = picture;
		String newName = "";
		if(!picture.isEmpty()){
			String oldName = picture.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			newName = uuid.toString()+oldName.substring(oldName.lastIndexOf("."));
			try {
			//	picture1.transferTo(new File(url +"/" +newName));
				picture.transferTo(new File(uploadPath +"/" +newName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		//}
		product.setPicture(newName);
		boolean flag =  ps.addProduct(product);
		if(flag){
			return "redirect:showMProduct";
		}else{
			return "redirect:showMAddProduct";
		}
	}
	/**
	 * 重定向到商品后台管理的商品信息页
	 * @return
	 */
	@RequestMapping(value="showMProduct")
	public ModelAndView showMProduct(Product condition,Integer page){
		ModelAndView mv = new ModelAndView("manage/product/showProduct");
		if(condition.getName()==null){
			condition.setName("");
		}
		if(condition.getPrice() ==null){
			condition.setPrice(-1.00);
		}
		if(condition.getSmallType()==null){
			SmallType smallType = new SmallType();
			smallType.setName("");
			condition.setSmallType(smallType);
		}
		if(condition.getSmallType()!=null&&condition.getSmallType().getName() ==null){
			condition.getSmallType().setName("");
		}
		int count = ps.searchCountByCondition(condition);
		int maxPage = (count-1)/8 +1;
		int page1 = 1;
		if(page == null){
			page = 1;
		}else if(page < 1){
			page = 1;
		}else if(page > maxPage){
			page = maxPage;
		}
		page1  =(page - 1) * 8;
		List<Product> booklist = ps.searchByCondition(condition, page1);
		mv.addObject("booklist", booklist);
		mv.addObject("maxPage", maxPage);
		mv.addObject("page", page);
		mv.addObject("condition",condition);
		return mv;
	}
	/**
	 * 删除选中的商品
	 * @param proId
	 * @param response
	 */
	@RequestMapping(value="deleteMProduct")
	public void deleteMProduct(int proId,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			boolean flag = ps.deleteProductByproId(proId);
			if(flag){
				out.print("success");
			}else{
				out.print("删除失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 到修改商品的页面
	 * @param proId
	 * @param response
	 */
	@RequestMapping(value="showModifyMProduct")
	public ModelAndView showModifyMProduct(int proId){
		ModelAndView mv = new ModelAndView("manage/product/modifyProduct");
		List<Publishing> publist = pus.searchAllPublishing();
		List<BigType> bAndSType = ts.searchAllType();
		Product product = ps.searchById(proId);
		mv.addObject("allType", bAndSType);
		mv.addObject("publist", publist);
		mv.addObject("product", product);
		return mv;
	}
	/**
	 * 修改商品的信息
	 * @param product
	 * @param request
	 * @param files
	 */
	@RequestMapping(value="ModifyMProduct")
	public ModelAndView ModifyMProduct(Product product,HttpServletRequest request,
			@RequestParam(value="mypicture") MultipartFile[] files){
		ModelAndView mv = new ModelAndView();
			String uploadPath = request.getSession().getServletContext().getRealPath("/") + "/managePicture";
			MultipartFile picture = files[0];
			String newName = "";
			if(!picture.isEmpty()){
				String oldName = picture.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				newName = uuid.toString()+oldName.substring(oldName.lastIndexOf("."));
				try {
					picture.transferTo(new File(uploadPath +"/" +newName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				product.setPicture(newName);
			}else{
				product.setPicture(ps.searchById(product.getId()).getPicture());
			}
			//}
			
		boolean flag =ps.updateProduct(product);
		if(flag){
		mv.setViewName("redirect:showMProduct");
		}else{
			mv.setViewName("redirect:showModifyMProduct?proId="+product.getId());
		}
		return mv;
	}
}
