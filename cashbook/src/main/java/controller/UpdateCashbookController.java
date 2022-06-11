package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CashbookDao;
import vo.Cashbook;

@WebServlet("/UpdateCashbookController")
public class UpdateCashbookController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		// 로그인 안했을때
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		if(sessionMemberId == null) {
			response.sendRedirect(request.getContextPath()+"/LoginController");
			return;
		}
		int cashbookNo =0;
		if(request.getParameter("cashbookNo") != null) {
			cashbookNo = Integer.parseInt(request.getParameter("cashbookNo"));
		}
		// vo
		Cashbook cashbook = new Cashbook();
		  
		// dao
		CashbookDao cashbookDao = new CashbookDao();
		cashbook = cashbookDao.selectCashBookOne(cashbookNo);
		  
		request.setAttribute("cashbook", cashbook);
		request.getRequestDispatcher("/WEB-INF/view/UpdateCashbook.jsp").forward(request, response);
		  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		
		//요청값 불러오기
		int cashbookNo = Integer.parseInt(request.getParameter("cashbookNo"));
		String cashDate = request.getParameter("cashDate");
		String kind = request.getParameter("kind");
		int cash = Integer.parseInt(request.getParameter("cash"));
		String memo = request.getParameter("memo");
		
		//디버깅
		System.out.println(cashbookNo + " <--cashbookNo UpdateCashBookController.doPost()");
		System.out.println(cashDate + " <--cashDate UpdateCashBookController.doPost()");
		System.out.println(kind + " <--kind UpdateCashBookController.doPost()");
		System.out.println(cash + " <--cash UpdateCashBookController.doPost()");
		System.out.println(memo + " <--memo UpdateCashBookController.doPost()");
		
		// 헌재 로그인된 세션의 아이디 받아와서 저장하기
		HttpSession session = request.getSession(); 
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		System.out.println("sessionMemberId(UpdateCashBookController(doPost)) :" + sessionMemberId);
		
		//요청값 데이터 바인딩
		Cashbook cashbook = new Cashbook();
		cashbook.setCashbookNo(cashbookNo);
		cashbook.setCashDate(cashDate);
		cashbook.setKind(kind);
		cashbook.setCash(cash);
		cashbook.setMemo(memo);
		cashbook.setMemberId(sessionMemberId);
		
		//태그 값 구하기
		List<String> hashtag = new ArrayList<>(); // tag 넣을 리스트
		String memo2 = memo.replace("#", " #"); // ## 불가능하게 만들기 "#"를 " #"로 바꾸는 문자열 새로 만들어서 memo2에 저장
		String[] arr = memo2.split(" "); // memo를 " "토큰으로 나눔
		for(String s : arr) {
			if(s.startsWith("#")) { // 문장이 #로 시작되면
				String temp = s.replace("#", ""); //#를 모두 공백으로 바꾸고 temp에 임시 저장한 후 
				if(temp.length()>0) { // temp가 빈칸이 아니라면
					hashtag.add(temp); //리스트에 저장
				}
			}
		}
		//디버깅
		System.out.println(hashtag.size() + " <--hashtag.size UpdateCashBookController.doPost()");
		for(String h : hashtag) {
			System.out.println(h + " <-- hashtag UpdateCashBookController.doPost()");
		}
	
		
		CashbookDao cashbookDao = new CashbookDao();
		
		//cashBookDao의 수정할 UpdateCashBook메서드 호출해서 수정한 개수 row 변수에 담기
		int row = cashbookDao.UpdateCashbook(cashbook, hashtag);
		
		if(row == 1) {
			response.sendRedirect(request.getContextPath()+"/CashBookOneController?cashbookNo="+cashbookNo);
		} else {
			response.sendRedirect(request.getContextPath()+"/UpdateCashBookController?error=UpdateFail");
		}
		
	}

}