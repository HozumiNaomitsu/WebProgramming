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
 * Servlet implementation class UpdateB
 */
@WebServlet("/UpdateB")
public class UpdateB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateB() {
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
		//IDを使ってテーブル検索
		UserDao userDao = new UserDao();
		User user = userDao.moredetail(Integer.parseInt(id));

		//検索結果をリクエストに設定
		request.setAttribute("user", user);
		//更新画面にフォワード
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userKousin.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//IDの値を取得
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		//IDを使ってテーブル検索
		UserDao userDao = new UserDao();

		//文字列の比較にはequalsを使う。
		if (!password.equals(password2)) {
			request.setAttribute("errMsg", "入力された内容は正しくありません。");

			//検索結果をリクエストに設定

			//更新画面にフォワード
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userKousin.jsp");
			rd.forward(request, response);
			return;
		}

		if (password.equals("")) {
			// パスワード更新しない
			userDao.update(loginId, name, birthDate);

		} else {
			// パスワード更新する
			userDao.update(loginId, password, name, birthDate);
		}

		//リダイレクトでサーブレットのTakanoListに繋げる。
		response.sendRedirect("UserListB");
	}

}
