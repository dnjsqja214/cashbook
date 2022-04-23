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

@WebServlet("/DeleteMemberController")
public class DeleteMemberController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		System.out.println(sessionMemberId+"<---sesionMemberId");
		if(sessionMemberId == null) {
			response.sendRedirect(request.getContextPath()+"/LoginController");
			return;
		}
		MemberDao memberDao = new MemberDao();
		Member member = memberDao.selectMemberOne(sessionMemberId);
		request.setAttribute("member",member);
		
		// 뷰 delete
		request.getRequestDispatcher("/WEB-INF/view/DeleteMember.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 값 받아오기
		String memberId= "";
		String memberPw="";
		if(request.getParameter("memberId") != null && request.getParameter("memberId") != "" ) {
			memberId = request.getParameter("memberId");
		}
		if(request.getParameter("memberPw") != null && request.getParameter("memberPw") != "" ) {
			memberPw = request.getParameter("memberPw");
		}
		System.out.println(memberPw+"DeleteMemberController,memberPw");
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		MemberDao memberDao = new MemberDao();
		int row = memberDao.deleteMember(member);
		//삭제했으면 로그아웃 페이지로 보내기 -> 세션만료
		response.sendRedirect(request.getContextPath()+"/LogoutController");
	}
}
