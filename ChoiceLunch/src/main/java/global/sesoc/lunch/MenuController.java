package global.sesoc.lunch;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
//import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.lunch.dao.MenuRepository;
import global.sesoc.lunch.dao.ReplyRepository;
import global.sesoc.lunch.dto.Menu;
import global.sesoc.lunch.dto.Reply;
import global.sesoc.lunch.util.FileService;

@Controller
public class MenuController {
	@Autowired
	MenuRepository repository;
	@Autowired
	ReplyRepository repository2;

	//project_Image 앞 부분은 서버 설정에 따라 수정
	final String uploadPath = "/lyr/Project_Image/m";
	

	// 메뉴추가 화면 띄우기
	@RequestMapping(value = "addMenu", method = RequestMethod.GET)
	public String addMenu(Model model, int restaurant_id, String restaurant_name, HttpServletRequest request) {
		model.addAttribute("restaurant_id", restaurant_id);
		model.addAttribute("restaurant_name", restaurant_name);

		return "MandR/addMenu";
	}

	// 메뉴추가(사진1장 포함)
	@RequestMapping(value = "addMenu", method = RequestMethod.POST)
	public String addMenu(Model model, Menu menu, MultipartFile menu_upload, RedirectAttributes rttr) {
		String imageName = FileService.saveFile(menu_upload, uploadPath);
		menu.setImage(imageName);
		repository.insertMenu(menu);
		// 메뉴정보 등록시 여러개 등록해야하는 경우가 많으므로 편리하게 등록할 수 있도록 바로 다시 등록창을 띄워줌
		rttr.addAttribute("restaurant_id", menu.getRestaurant_id());
		rttr.addAttribute("restaurant_name", menu.getRestaurant_name());

		return "redirect:addMenu"; // 메뉴 여러개 추가할 경우 편하게 추가할 수 있도록
	}	

	// 메뉴 리스트 호출
	@RequestMapping(value = "menuList", method = RequestMethod.GET)
	public String menuList(Model model, int restaurant_id) {
		List<Menu> menulist = repository.getMenulist(restaurant_id);
		
		model.addAttribute("mlist", menulist);
		return "MandR/MenuList";

	}

	// 단일 메뉴에 대한 세부정보 호출
	@RequestMapping(value = "detailMenu", method = RequestMethod.GET)
	public String detailMenu(Model model, int menu_id) {
		Menu menu = repository.getMenu(menu_id);
		/*
		 * List<Reply> rlist=repository2.getReplylist(menu_id);
		 * model.addAttribute("rvl",rlist); //현재 ajax로 리플을 불러오므로 필요x
		 */
		model.addAttribute("m", menu);

		return "MandR/detailMenu";
	}

	// 메뉴 사진 호출
	@RequestMapping(value = "imagedownload2", method = RequestMethod.GET)
	public String imagedownload(int menu_id, HttpServletResponse response) {
		Menu menu = repository.getMenu(menu_id);
		String image = menu.getImage();
		String fullPath = uploadPath + "/" + image;

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

	@RequestMapping(value = "Random", method = RequestMethod.GET)
	public String Random() {

		return "MandR/RandomChoice";
	}

	//업데이트 하려는 메뉴에 대한 정보를 담아 업데이트 페이지 오픈
	@RequestMapping(value = "UpdateMenu", method = RequestMethod.GET)
	public String UpdateMenu(Model model, int menu_id) {
		Menu menu = repository.getMenu(menu_id);
		model.addAttribute("m", menu);
		return "MandR/UpdateMenu";
	}

	@RequestMapping(value = "UpdateMenu", method = RequestMethod.POST)
	public String UpdateMenu(Menu menu, MultipartFile menu_upload, RedirectAttributes rttr) {
		if(menu_upload.getSize()!=0) { //사이즈가 0 : 갱신된 파일이 없다.
			String imageName = FileService.saveFile(menu_upload, uploadPath);
			FileService.deleteFile(uploadPath+"/"+menu.getImage());
			menu.setImage(imageName);
		}
		repository.updateMenu(menu);
		rttr.addAttribute("menu_id", menu.getMenu_id());
		return "redirect:detailMenu";
	}
	
	
	//메뉴 정보 삭제
	@RequestMapping(value="DeleteMenu", method=RequestMethod.GET)
	public String DeleteMenu(int menu_id,RedirectAttributes rttr) {
		Menu menu = repository.getMenu(menu_id);
	    String deletefileName=uploadPath+"/"+menu.getImage();
	    FileService.deleteFile(deletefileName);
		rttr.addAttribute("restaurant_id", menu.getRestaurant_id());
		repository.deleteMenu(menu_id);
		
		return "redirect:detailRestaurant";
	}
	
	// 추천 순위 1~9위 리스트 출력
	@RequestMapping(value="recommendMenu",method=RequestMethod.GET)
	public String recommendMenu(Model model) {
		List<Menu>mlist=repository.getBestMenu();
		model.addAttribute("mlist",mlist);
		return "MandR/recommendMenu";
	}

}
