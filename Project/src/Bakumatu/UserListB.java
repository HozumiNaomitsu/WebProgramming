package Bakumatu;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDao;
import model.User;

/**
 * Servlet implementation class UserListB
 */
@WebServlet("/UserListB") //一覧
public class UserListB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserListB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//一覧情報を取得
		UserDao UserDao = new UserDao();
		List<User> Iciran = UserDao.findAll();

		//JavaからJSPに送る
		request.setAttribute("usericiran", Iciran);

		//フォワード　JSPのuserIciranを見る
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userIciran.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// パラメータ取得
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String birthDate1 = request.getParameter("birthDate1");
		//
		UserDao UserDao = new UserDao();
		List<User> Iciran = UserDao.kensaku(loginId,name,birthDate,birthDate1);

		//JavaからJSPに送る
		request.setAttribute("usericiran", Iciran);

		//フォワード　JSPのuserIciranを見る
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userIciran.jsp");
		dispatcher.forward(request, response);
	}

}
