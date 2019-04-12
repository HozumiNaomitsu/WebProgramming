package Bakumatu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDao;
import model.User;

/**
 * Servlet implementation class DeleteB
 */
@WebServlet("/DeleteB")
public class DeleteB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//IDの値を取得
		String id = request.getParameter("id");
		//IDを使ってテーブル検索 データベースを使う
		UserDao userDao = new UserDao();
		User user = userDao.moredetail(Integer.parseInt(id));
		//検索結果をリクエストに設定
		request.setAttribute("user", user);

		//詳細画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userSakuzyo.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//IDの値を取得
		String loginId = request.getParameter("loginId");
		UserDao userDao = new UserDao();

		userDao.delete(loginId);

		//リダイレクトでサーブレットのUserListBに繋げる。
		response.sendRedirect("UserListB");
	}

}
