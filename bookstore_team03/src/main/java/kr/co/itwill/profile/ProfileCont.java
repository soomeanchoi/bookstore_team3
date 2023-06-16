package kr.co.itwill.profile;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/profile")
public class ProfileCont {

	public ProfileCont() {
		System.out.println("-----ProfileCont()객체 생성됨");
	}
	
	@Autowired
	ProfileDTO profileDto;
	
	@Autowired
	ProfileDAO profileDao;
	
	@RequestMapping("/profileForm")
    public String profileForm() {
        return "profile/profileForm";
    }//write() end
	
	
	@RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile profile_imgname
    		          ,HttpServletRequest req
    		          ,HttpSession session) throws Exception{ 
		
		String member_id = (String) session.getAttribute("member_id");
		
		String filename="-";
    	long filesize=0;
    	if(profile_imgname != null && !profile_imgname.isEmpty()) { //파일이 존재한다면
    		filename=profile_imgname.getOriginalFilename();
    		filesize=profile_imgname.getSize();
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			profile_imgname.transferTo(new File(path + "\\" + filename)); //파일저장
    			
    			
    		}catch (Exception e) {
    			e.printStackTrace(); //System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("member_id", member_id);
    	map.put("filename", filename);
    	map.put("filesize", filesize);
    	
    	profileDao.insert(map);
    	
    	return "redirect:/member/myPage";
	}
	
	
	@RequestMapping("/getlist")
	public String list(HttpSession session,
							Model model) throws Exception {
		
		String member_id = (String)session.getAttribute("member_id");
		
		String profile_name = profileDto.getProfile_name();
		if(profile_name != null) {
			model.addAttribute("profile_name", profile_name);
		}
		
		return "redirect:/member/myPage";
	}
	
	

	
}
