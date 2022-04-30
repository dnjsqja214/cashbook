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
		// doPost에서 error값 받아오기->updateMemberPw에 에러코드에 따른 유효성검사하기
		request.setAttribute("error", request.getParameter("error"));
		//뷰 포워딩
		request.getRequestDispatcher("/WEB-INF/view/UpdateMemberPw.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		String memberId="";
		// updateMemberPw.jsp에서 값 받기
		if(request.getParameter("memberId") != "" && request.getParameter("memberId")!= null ) {
			memberId = request.getParameter("memberId");
		}
		String currentPw = "";
		if(request.getParameter("currentPw") != "" && request.getParameter("currentPw")!= null ) {
			currentPw = request.getParameter("currentPw");
		}
		String updatePw="";
		if(request.getParameter("updatePw") != "" && request.getParameter("updatePw")!= null ) {
			updatePw = request.getParameter("updatePw");
		}
		String checkPw="";
		if(request.getParameter("checkPw") != "" && request.getParameter("checkPw")!= null ) {
			checkPw = request.getParameter("checkPw");
		}
		
		// curruntPw가 맞는지 확인하기 위해서 dao에서 sessionId와 currentPw값을 넣고 result값에 넣기
		MemberDao memberDao = new MemberDao();
		Member member = new Member();
		member.setMemberId(sessionMemberId);
		member.setMemberPw(currentPw);
		
		String result = memberDao.selectMemberByIdPW(member);
		
		// result값과 세션아이디가 같다면 통과 아니라면 다시 입력
		if(!sessionMemberId.equals(result)) {
			response.sendRedirect(request.getContextPath()+"/UpdateMemberPwController?error=1");
			return;
		}
		
		// 바꾼 비밀번호랑 바꾼 비밀번호확인이랑 일치하지않으면 다시 입력
		if(!updatePw.equals(checkPw)) {
			response.sendRedirect(request.getContextPath()+"/UpdateMemberPwController?error=2");
			return;
		}
		
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
		response.sendRedirect(request.getContextPath()+"/LogoutController");
	}
}
