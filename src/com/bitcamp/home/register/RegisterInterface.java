package com.bitcamp.home.register;

public interface RegisterInterface {
	//로그인
	public RegisterVO loginCheck(RegisterVO vo);
	//회원가입
	public int registerInsert(RegisterVO vo);
	//회원정보 수정
	public void registerSelect(RegisterVO vo);
}
