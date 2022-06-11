package controller;

import java.io.IOException; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CashbookDao;
import vo.Cashbook;
@WebServlet("/CashBookOneController")
public class CashBookOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 안했을때
		HttpSession session = request.getSession();
		String sessionMemberId = (String)session.getAttribute("sessionMemberId");
		if(sessionMemberId == null) {
			 response.sendRedirect(request.getContextPath()+"/LoginController");
			 return;
		}
		int cashbookNo= Integer.parseInt(request.getParameter("cashbookNo"));
		System.out.println(cashbookNo+"cashbookNo");
		CashbookDao cashbookDao = new CashbookDao();
		Cashbook cashbook = new Cashbook();
		cashbook= cashbookDao.selectCashBookOne(cashbookNo);
       
		request.setAttribute("cashbook", cashbook);
       
		// 3)뷰 포워딩
     	 request.getRequestDispatcher("/WEB-INF/view/CashBookOne.jsp").forward(request, response);
	}

}
