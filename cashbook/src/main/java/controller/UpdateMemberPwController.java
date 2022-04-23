package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.Member;
@WebServlet("/UpdateMemberPwController")
public class UpdateMemberPwController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// 접속허가 체크
	HttpSession session = request.getSession();
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	System.out.println(sessionMemberId+"<--sessionMemberId");
	if(sessionMemberId == null) {
		response.sendRedirect(request.getContextPath()+"/LoginController");
		return;
		}
	MemberDao memberDao = new MemberDao();
		
	// 사용자의 개인정보 들고올 메서드 호출해서 member객체에 담기
	Member member = memberDao.selectMemberOne(sessionMemberId);
			
	request.setAttribute("member", member);
	
	//뷰 포워딩
	request.getRequestDispatcher("/WEB-INF/view/UpdateMemberPw.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		String memberId="";
		if(request.getParameter("memberId") != "" && request.getParameter("memberId")!= null ) {
			memberId = request.getParameter(memberId);
		}
		String memberPw = "";
		if(request.getParameter("memberPw") != "" && request.getParameter("memberPw")!= null ) {
			memberPw = request.getParameter(memberPw);
		}
		String updatePw="";
		if(request.getParameter("updatePw") != "" && request.getParameter("updatePw")!= null ) {
			memberPw = request.getParameter(updatePw);
		}
		String checkPw="";
		if(request.getParameter("checkPw") != "" && request.getParameter("checkPw")!= null ) {
			checkPw = request.getParameter(checkPw);
		}
		// 입력한 비밀번호랑 세션 비밀번호랑 같다면 통과 아니라면 다시 입력
		// 바꾼 비밀번호랑 바꾼 비밀번호확인이랑 일치하지않으면 다시 입력
		if(updatePw != checkPw) {
			response.sendRedirect(request.getContextPath()+"UpdateMemberPwController");
			return;
		}
		
		MemberDao memberDao = new MemberDao();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId",memberId);
		map.put("updatePw",updatePw);
		int row = memberDao.updateMemberPw(map);
		if(row != 1) { // 행 수정 실패했을경우
			System.out.println("정보수정 실패");
			response.sendRedirect(request.getContextPath()+"/UpdateMemberController");
			return;
		} 
		// 뷰
		response.sendRedirect(request.getContextPath()+"LogoutController");
	}
}
