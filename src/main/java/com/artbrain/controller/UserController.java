package com.artbrain.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.artbrain.dao.UserDetailsServiceDAO;
import com.artbrain.dao.VideoUrlServiceDAO;
import com.artbrain.entity.User;
import com.artbrain.entity.VideoUrl;

@Controller
public class UserController {

  @Autowired
  private UserDetailsServiceDAO userDetailsServiceDAO;
  @Autowired
  private VideoUrlServiceDAO videoUrlServiceDAO;
 // @PreAuthorize("isAnonymous()")
//  @RequestMapping(value = "/registration", method = RequestMethod.GET)
  public String registration(User newUser) {
    try {
      if (userDetailsServiceDAO.loadUserEntityByUsername(newUser.getUsername()) != null) {
        return "redirect:" + "/login?registration&error";
      } else {
        userDetailsServiceDAO.saveUser(newUser);
        return "redirect:" + "/login?registration&success";
      }
    } catch (Exception e) {
      e.printStackTrace();
      return "redirect:" + "/login?registration&errorServer";
    }
  }

 // @PreAuthorize("isAnonymous()")
//  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String loginPage() {
    return "bible";
  }
  //@PreAuthorize("isAnonymous()")
  @RequestMapping(value = "/bible", method = RequestMethod.GET)
  public String bible() {
    return "bible";
  }
  @ResponseBody
  @RequestMapping(value = "/findVideoUrlByMethodId")
  public List<VideoUrl> findVideoUrlByMethodId(HttpServletRequest request) throws Exception {
	  List<VideoUrl> list = videoUrlServiceDAO.loadAllVidelUrls();
    return list;
  }
  //@RequestMapping(value = "/forWardToVideo")
  public String forWardToVideo(HttpServletRequest request) throws Exception {
	  String url = request.getParameter("url");
	//  model.addAttribute("url", url);
	  request.setAttribute("url", url);
   // return "video";
	// return redirect("/index.html");
	  return "video";
  }
  /**
   * FreeMaker版本
   */
//freemarker取值，插值
  @RequestMapping(value = "/forWardToVideo")
	public String free1(HttpServletRequest request,ModelMap model) throws Exception {
	  String pageNumber = request.getParameter("pageNumber");
	  String sign = request.getParameter("url");
	  String timestamp=request.getParameter("timestamp");
	  String masterWeb="device=masterWeb";
	  String url=sign+"&timestamp="+timestamp+"&"+masterWeb;
	  byte[] b = url.getBytes("utf-8");//编码  
	  model.addAttribute("VideoUrl",url);
	 //有效的地址 String realUrl="http://xyjs.mov.cnfuyin.com/cdn/08福音影视/福音电影/埃及王（中文字幕）/埃及王.mp4?sign=78cb4463b749588e6e3c53387dd0774b&timestamp=1526628848&device=masterWeb";
	return "video";
		
	}
}
