package com.test6.repository;

import org.apache.ibatis.annotations.Mapper;

import com.test6.vo.Member;

@Mapper
public interface MemberRepository {

	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);
	
	public Member getMemberById(int id);

	public int getLastInsertId();

	public Member getMemberByLoginId(String loginId);
	
	public Member getMemberByEmail(String email);

}
