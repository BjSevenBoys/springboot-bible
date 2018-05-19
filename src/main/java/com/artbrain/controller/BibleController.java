package com.artbrain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artbrain.constants.Queries;
import com.artbrain.dao.VideoUrlServiceDAO;
import com.artbrain.entity.VideoUrl;
/**
 * 
 * @author qiu_mingyuan
 *
 */
@Controller
public class BibleController {

  @Autowired
  private VideoUrlServiceDAO videoUrlServiceDAO;
  @RequestMapping(value = "/bible", method = RequestMethod.GET)
  public String bible() {
    return "bible";
  }
  @ResponseBody
  @RequestMapping(value = "/findVideoUrlByMethodId")
  public Map<String, Object> findVideoUrlByMethodId(HttpServletRequest request) throws Exception {
	  String pageNumber = request.getParameter("page");
	  String pageSize = request.getParameter("rows");
	  if(pageSize==null){
		  pageSize="20";
	  }
	  if(pageNumber==null || "0".equalsIgnoreCase(pageNumber)){
		  pageNumber="1";
	  }
	  int pageNumber_ = Integer.parseInt(pageNumber)-1;
	  int pageSize_ = Integer.parseInt(pageSize);
	  String beginNumber=(pageNumber_*pageSize_)+"";
	  String sql=" limit"+" "+beginNumber+","+pageSize;
	  sql=Queries.LOAD_ALL_VIDEOURL+sql;
	  List<VideoUrl> list = videoUrlServiceDAO.loadAllVidelUrls(sql);
	  Map<String, Object> map = new HashMap<String, Object>(); 
	  if(list != null) { 
	  map.put("total", list.size()); 
	  map.put("rows", list); 
	  }
	  return map; 
  }
  public String forWardToVideo(HttpServletRequest request) throws Exception {
	  String url = request.getParameter("url");
	  request.setAttribute("url", url);
	  return "video";
  }
  /**
   * FreeMaker版本
   */
  @RequestMapping(value = "/forWardToVideo")
	public String free1(HttpServletRequest request,ModelMap model) throws Exception {
	  String sign = request.getParameter("url");
	  String timestamp=request.getParameter("timestamp");
	  String masterWeb="device=masterWeb";
	  String url=sign+"&timestamp="+timestamp+"&"+masterWeb;
	  model.addAttribute("VideoUrl",url);
	return "video";
		
	}
}
