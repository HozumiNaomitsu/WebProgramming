package Bakumatu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDao;
import model.User;

/**
 * Servlet implementation class LoginB
 */
@WebServlet("/LoginB")//ログイン
public class LoginB extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//フォワード
				RequestDispatcher RD = request.getRequestDispatcher("/WEB-INF/jsp/userLogin.jsp");
				RD.forward(request, response);
				return;

			}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");


		//このgetParameterの引数の（"loginId"）（"password"）はJSPのnameに行く。
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");

		//Daoのコンストラクタ
		UserDao userDao = new UserDao();
		User user = userDao.login(loginId, password);

		//ログインに失敗しましたをJSPに送る
		if (user == null) {
			request.setAttribute("errMsg", "ログインに失敗しました。");

			//フォワード　エラーの為、JSPのuserLoginにエラーを返す。
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/userLogin.jsp");
			rd.forward(request, response);
			return;
		}

		/** テーブルに該当のデータが見つかった場合 **/
		// セッションにユーザの情報をセット
		HttpSession session = request.getSession();
		session.setAttribute("userInfo", user);


			//サーブレットからサーブレットへ繋げる
		response.sendRedirect("UserListB");


	}

}

