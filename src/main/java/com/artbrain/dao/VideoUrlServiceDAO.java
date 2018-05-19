package com.artbrain.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.artbrain.constants.Queries;
import com.artbrain.entity.User;
import com.artbrain.entity.VideoUrl;
import com.artbrain.mapper.Mapper;
@Service
public class VideoUrlServiceDAO {

  @Autowired
  private JdbcTemplate jdbcTemplate;

  @Autowired
  private Mapper mapper;

  private static final String ROLE_PREFIX = "ROLE_";

  
  public List<VideoUrl> loadAllVidelUrls(String sql) throws Exception {
    return jdbcTemplate.query(sql, mapper::mapVideoUrl);
  }

  public void updateUser(User user) throws Exception {
    jdbcTemplate.update(Queries.UPDATE_USER_BY_USERNAME, user.getPassword(), user.getRole(), user.getUsername());
  }

}
