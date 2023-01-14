package com.LinkT.MH.Mapper;

import com.LinkT.MH.entity.JoinVO;
import com.LinkT.MH.entity.UserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface userMapper {
    public UserVO LoginCheck(UserVO vo);
    public void Join(JoinVO vo);
    public void Update(UserVO vo);
    public UserVO LoadUser(UserVO vo);
}

