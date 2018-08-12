package global.sesoc.lunch;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.lunch.dao.ReplyRepository;
import global.sesoc.lunch.dto.Reply;
import global.sesoc.lunch.util.FileService;

@Controller
public class ReplyController {
	@Autowired
	ReplyRepository repository;

	final String uploadPath = "/lyr/Project_Image/review";

	
	
	@RequestMapping(value = "writeReview", method = RequestMethod.POST)
	public@ResponseBody String writeReview(Reply reply) {
		repository.insertReply(reply);
		return null;  //등록만하고 끝
	}

	//메뉴에 맞는 리플 리스트 호출
	@RequestMapping(value = "getReviewList", method = RequestMethod.GET)
	public @ResponseBody List<Reply> getReviewList(int menu_id) {
		List<Reply> list = repository.getReplylist(menu_id);
		return list;
	}

	//이미지가 존재할경우 삭제하는 부분을 주석처리
	@RequestMapping(value = "deleteReview", method = RequestMethod.GET)
	public @ResponseBody String deleteReview(int reply_id) {
		/*
		String image =repository.getImageName(reply_id);
		String fullPath = uploadPath + "/" +image;
		File file = new File(fullPath);
		if(file.exists()) {
			FileService.deleteFile(fullPath);
		}
		*/
		repository.deleteReply(reply_id);

		return null;
	}
	
	
	//리플을 따로다는 폼을 현재 사용하지 않고 있으므로 주석처리
		/*
		@RequestMapping(value = "writeReview", method = RequestMethod.GET)
		public String writeReview(Model model, int menu_id, String menu_name) {
			model.addAttribute("menu_id", menu_id);
			model.addAttribute("menu_name", menu_name);

			return "Review/writeReview";
		}
		*/
	/*
		@RequestMapping(value = "writeReview", method = RequestMethod.POST)
		public String writeReview(RedirectAttributes rttr, Reply reply, MultipartFile uplaod_image) {
			String imageName = FileService.saveFile(uplaod_image, uploadPath);
			reply.setImage(imageName);
			repository.insertReply(reply);
			rttr.addAttribute("menu_id", reply.getMenu_id());
			return "redirect:detailMenu";
		}
		*/  //리뷰에 사진 업로드기능 삭제하므로 메소드 주석처리

}
