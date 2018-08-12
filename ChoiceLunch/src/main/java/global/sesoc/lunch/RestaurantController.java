package global.sesoc.lunch;

import java.io.FileInputStream;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.lunch.util.FileService;
import global.sesoc.lunch.dao.RestaurantRepository;
import global.sesoc.lunch.dto.Restaurant;

@Controller
public class RestaurantController {
	@Autowired
	RestaurantRepository repository;

	//project_Image 앞 부분은 서버 설정에 따라 수정
	final String uploadPath = "/lyr/Project_Image/r";

	@RequestMapping(value = "addRestaurant", method = RequestMethod.GET)
	public String addRestaurant() {
		return "MandR/addRestaurant";
	}

	//레스토랑 정보 추가, 이미지 2개
	@RequestMapping(value = "addRestaurant", method = RequestMethod.POST)
	public String addRestaurant(Restaurant restaurant, MultipartFile image_upload, MultipartFile mapimage_upload) {
		String imageName1 = FileService.saveFile(image_upload, uploadPath);
		String imageName2 = FileService.saveFile(mapimage_upload, uploadPath);

		restaurant.setImage(imageName1); //레스토랑 기본사진
		restaurant.setMapimage(imageName2); //레스토랑 지도 사진

		repository.insertRestaurant(restaurant);
		return "redirect:addRestaurant";
	}

	//레스토랑 리스트호출, rtpye이 존재하면 그 타입에 맞춰서 
	@RequestMapping(value = "RestaurantList", method = RequestMethod.GET)
	public String RestaurantList(Model model, String rtype) {
		List<Restaurant> rlist=null;
		if(rtype==null) {
		rlist = repository.RestaurantList();
		}else {
			rlist=repository.rcategoryRestaurantList(rtype);
		}
		Collections.shuffle(rlist); //매번 같은 식당이 첫줄에 들어가지 않도록 mixing
		model.addAttribute("rlist", rlist);
		
		return "MandR/RestaurantList";
	}

	//1개 식당 자세한 식당정보
	@RequestMapping(value = "detailRestaurant", method = RequestMethod.GET)
	public String detailRestaurant(Model model, int restaurant_id) {
		Restaurant restaurant = repository.getRestaurant(restaurant_id);
		model.addAttribute("r", restaurant);
		return "MandR/detailRestaurant";
	}
	
	//식당 이미지 가져오기 String type 변수로 어떤 종류 이미지인지 구분
	@RequestMapping(value="imagedownload",method= RequestMethod.GET)
	public String imagedownload(int restaurant_id,HttpServletResponse response,String type) {
		Restaurant restaurant = repository.getRestaurant(restaurant_id);
		String imagetype="";
		if(type.equals("main"))
			imagetype=restaurant.getImage();
		else if(type.equals("map"))
			imagetype=restaurant.getMapimage();
	
		
		
		String fullPath = uploadPath + "/" + imagetype;

		FileInputStream fis = null;
		ServletOutputStream fout = null;

		try {
			fout = response.getOutputStream();
			fis = new FileInputStream(fullPath);
			FileCopyUtils.copy(fis, fout);

		} catch (Exception e) {

		} finally {
			try {
				if (fis != null)
					fis.close();
				if (fout != null)
					fout.close();
			} catch (Exception e) {

			}

		}
		
		return null;
	}
}
