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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.itwill.review.ReviewDTO;



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
	
	@RequestMapping("/profileModify")
    public String profileModify() {
        return "profile/profileModify";
    }//write() end
	
	
	@RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
    		          ,@RequestParam MultipartFile profile_img
    		          ,HttpServletRequest req
    		          ,HttpSession session) throws Exception{ 
		
		String member_id = (String) session.getAttribute("member_id");
		
		String profile_imgname="-";
    	long profile_imgsize=0;
    	if(profile_img != null && !profile_img.isEmpty()) { //파일이 존재한다면
    		profile_imgname=profile_img.getOriginalFilename();
    		profile_imgsize=profile_img.getSize();
    		try {
    			
    			ServletContext application=req.getSession().getServletContext();
    			String path=application.getRealPath("/storage");  //실제 물리적인 경로
    			profile_img.transferTo(new File(path + "\\" + profile_imgname)); //파일저장
    			
    			
    		}catch (Exception e) {
    			e.printStackTrace(); System.out.println(e);
			}//try end    		
    	}//if end
    	
    	map.put("member_id", member_id);
    	map.put("profile_imgname", profile_imgname);
    	map.put("profile_imgsize", profile_imgsize);
    	
    	profileDao.insert(map);
    	
    	return "redirect:/member/myPage";
	}
	
	
	@RequestMapping("/list")
	public String list(HttpSession session,
							Model model) throws Exception {
		
		String member_id = (String)session.getAttribute("member_id");
		
		String profile_name = profileDto.getProfile_name();
		if(profile_name != null) {
			model.addAttribute("profile_name", profile_name);
		}
		return "redirect:/member/myPage";
	}
	
	@RequestMapping("/detail/{profile_no}")
    public ModelAndView detail(@PathVariable int profile_no, @ModelAttribute ProfileDTO dto) {
        ModelAndView mav = new ModelAndView();
        
        
        
        List<Map<String, Object>> profileData = profileDao.detail(profile_no);
        mav.addObject("profile", profileData);
        
        //ProfileDTO profileDto=new ProfileDTO();
        mav.setViewName("profile/detail");
        //mav.addObject("profile", profileDao.detail(profile_no));
        
        
        
        
        return mav;
    }//detail() end

	@RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String member_id) {
        ModelAndView mav=new ModelAndView();
        mav.setViewName("book/detail/{member_id}");
        mav.addObject("list", profileDao.search(member_id));
        mav.addObject("member_id", member_id); //검색어
        return mav;
    }//search() end
	
	
	@RequestMapping("/delete")
    public String delete(String member_id, HttpServletRequest req) {
        System.out.println("member_id = " + member_id);
        //삭제하고자 하는 파일명
        String filename=profileDao.filename(member_id);

        //첨부된 파일 삭제하기
        if(filename != null && !filename.equals("-")) {
            ServletContext application=req.getSession().getServletContext();
            String path=application.getRealPath("/storage");
            File file=new File(path + "\\" + filename);
            if(file.exists()) {
                file.delete();
            }//if end
        }//if end

        profileDao.delete(member_id);

        return "redirect:/member/myPage";

    }//delete() end
	
	
	@RequestMapping("/update")
	 public String update(@RequestParam Map<String, Object> map
				          ,@RequestParam MultipartFile profile_img
				          ,HttpServletRequest req
				          ,HttpSession session) throws Exception{ 
			
			String member_id = (String) session.getAttribute("member_id");
			
			String profile_imgname="-";
			long profile_imgsize=0;
			if(profile_img != null && !profile_img.isEmpty()) { //파일이 존재한다면
				profile_imgname=profile_img.getOriginalFilename();
				profile_imgsize=profile_img.getSize();
				try {
					
					ServletContext application=req.getSession().getServletContext();
					String path=application.getRealPath("/storage");  //실제 물리적인 경로
					profile_img.transferTo(new File(path + "\\" + profile_imgname)); //파일저장
					
					
				}catch (Exception e) {
					e.printStackTrace(); System.out.println(e);
				}//try end    		
			}//if end
			
			map.put("member_id", member_id);
			map.put("profile_imgname", profile_imgname);
			map.put("profile_imgsize", profile_imgsize);
			
			profileDao.update(map);
			
			return "redirect:/member/myPage";

        }//update() end
	
}
