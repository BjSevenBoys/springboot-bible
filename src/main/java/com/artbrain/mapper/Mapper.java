package com.artbrain.mapper;

import com.artbrain.entity.User;
import com.artbrain.entity.VideoUrl;

import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class Mapper {

  public User mapUser(ResultSet rs, int rowNum) throws SQLException {
    User user = new User();
    user.setUsername(rs.getString("username"));
    user.setPassword(rs.getString("password"));
    user.setRole(rs.getString("role"));
    return user;
  }

  public VideoUrl mapVideoUrl(ResultSet rs, int rowNum) throws SQLException {
	  VideoUrl videoUrl = new VideoUrl();
	  videoUrl.setUrl(rs.getString("url"));
	    return videoUrl;
	  }
}
