package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.Member;

@WebServlet("/UpdateMemberController")
public class UpdateMemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 접속허가 체크
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		System.out.println(sessionMemberId+"<--sessionMemberId");
		if(sessionMemberId == null) {
			response.sendRedirect(request.getContextPath()+"/LoginController");
			return;
			}
		String memberName = null;
		if(request.getParameter("memberName") != null) {
			memberName = request.getParameter("memberName");
		}
		System.out.println(memberName+"<-memberName");
		// vo
		Member member = new Member();
		member.setMemberName(memberName);
		
		request.setAttribute("memberName", memberName);
		request.getRequestDispatcher("/WEB-INF/view/UpdateMember.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		// 접속허가 체크
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		System.out.println(sessionMemberId+"<--sessionMemberId");
		if(sessionMemberId == null) {
			response.sendRedirect(request.getContextPath()+"/LoginController");
			return;
			}
		String memberId=null;
		// updateMemberPw.jsp에서 값 받기
		if(request.getParameter("memberId") != "" && request.getParameter("memberId")!= null ) {
			memberId = request.getParameter("memberId");
		}
		String memberGender = null;
		String memberName = null;
		if(request.getParameter("memberGender") != "" && request.getParameter("memberGender")!= null ) {
			memberGender = request.getParameter("memberGender");
		}
		if(request.getParameter("memberName") != "" && request.getParameter("memberName")!= null ) {
			memberName = request.getParameter("memberName");
		}
		
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberGender(memberGender);
		member.setMemberName(memberName);
		
		memberDao.updateMember(member);
		member = memberDao.selectMemberOne(sessionMemberId);
		request.setAttribute("member", member);
		request.getRequestDispatcher("/WEB-INF/view/Member.jsp").forward(request, response);
	}
}
