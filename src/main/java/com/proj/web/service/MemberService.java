package com.proj.web.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.web.dao.MemberDAO;
import com.proj.web.vo.MemberVO;
import com.proj.web.vo.ReplyVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private HttpSession session;
	
	
	public String memberJoin(MemberVO member) throws Exception {
		dao.memberJoin(member);
		return "redirect:/";
	}
	
	public int idCheck(String member_id) {
		int cnt = dao.memberSelectOneId(member_id);
		return cnt;
	}

	public int emailCheck(String member_email) {
		int cnt = dao.memberSelectOneEm(member_email);
		return cnt;
	}

	public String memberLogin(MemberVO member) {
		MemberVO loginCheck = dao.memberSelectOne(member.getMember_id());
		String page = "";
		if(loginCheck != null && member.getMember_pw().equals(loginCheck.getMember_pw())){
			session.setAttribute("loginNickName", loginCheck.getMember_nickname());
			session.setAttribute("loginID", loginCheck.getMember_id());
			page = "redirect:/";
		}else {
			page = "redirect:/member/memberLoginPage";
		}
		return page;
	}
	
	public boolean loginCheck(String id, String pw) {
		
		System.out.println("login체크들어옴");
		
		MemberVO loginCheck = dao.memberSelectOne(id);
		boolean flag = false;
		
		if(loginCheck != null && pw.equals(loginCheck.getMember_pw())){
			System.out.println("로그인 성공");
			flag = true;
		}
		
		if(!flag) {
			System.out.println("로그인 실패");
		}
		
		return flag;
	}

	public int nicknameCheck(String member_nickname) {
		int cnt = dao.memberSelectOneNickname(member_nickname);
		return cnt;
	}

	public String memberFind(MemberVO member) {
		String member_id = dao.memberFind(member);
		return member_id;
	}

	public String pwFind(MemberVO member) {
		String member_id = dao.pwFind(member);
		return member_id;
	}

	public void pwChange(MemberVO member) {
		dao.pwChange(member);
	}

	public HashMap<String, String> memberSelectOneAll(String member_id) {
		HashMap<String, String> hash = new HashMap<String, String>();
		hash = dao.memberSelectOneAll(member_id);
		return hash;
	}

	public void memberUpdate(MemberVO member) {
		dao.memberUpdate(member);
	}

}
