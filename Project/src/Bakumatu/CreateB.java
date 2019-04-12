package Bakumatu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDao;

/**
 * Servlet implementation class CreateB
 */
@WebServlet("/CreateB") //新規登録
public class CreateB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//新規登録画面の表示　フォワード
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userSinki.jsp");
		rd.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 登録処理
		//漢字とひらがな、カタカナを使えるようにする。全角
		request.setCharacterEncoding("UTF-8");

		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");

		UserDao userDao = new UserDao();

		//エラーは確定前にif文で書く。登録に失敗しましたをJSPに送る.
		if (!password.equals(password2)) {
			request.setAttribute("errMsg", "入力された内容は正しくありません。");

			request.setAttribute("loginId", loginId);
			request.setAttribute("name", name);
			request.setAttribute("birthDate", birthDate);

			//フォワード　エラーの為、JSPのuserSinkiにエラーを返す。
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userSinki.jsp");
			rd.forward(request, response);
			return;
			//確定　実装はF3
			//		userDao.update(loginId, password, name, birthDate);

		}

		if (loginId.equals("") || name.equals("") || birthDate.equals("") || password.equals("")) {
			request.setAttribute("errMsg", "入力された内容は正しくありません。");

			request.setAttribute("loginId", loginId);
			request.setAttribute("name", name);
			request.setAttribute("birthDate", birthDate);

			//フォワード　エラーの為、JSPのuserSinkiにエラーを返す。
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userSinki.jsp");
			rd.forward(request, response);
			return;
		}
		//確定　実装はF3
		userDao.create(loginId, password, name, birthDate);

		//リダイレクトでサーブレットのCreateListに繋げる。
		response.sendRedirect("UserListB");
	}

}
