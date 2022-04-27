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
@WebServlet("/SelectMemberOneController")
public class SelectMemberOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	System.out.println(sessionMemberId+"<--sessionMemberId");
	if(sessionMemberId == null) {
		// 이미 로그인이 되어있는 상태
		response.sendRedirect(request.getContextPath()+"/CashBookListByMonthController");
		return;
	}
	MemberDao memberDao = new MemberDao();
	Member member = new Member();
	member = memberDao.selectMemberOne(sessionMemberId);
	request.setAttribute("member", member);
	
	// 뷰포워딩
	request.getRequestDispatcher("/WEB-INF/view/Member.jsp").forward(request, response);
	}
}
