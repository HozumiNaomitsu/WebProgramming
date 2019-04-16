package DAO;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import model.User;

public class UserDao {
	//★ログイン用のメソッド
	public User login(String loginId, String password) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();

			// 確認済みのSQL 荷物を作る。
			String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

			/* SELECTを実行し、結果表を取得　Daoのコンストラクタへ。
			SQLが？の為、PreparedStatement*/
			PreparedStatement pStmt = conn.prepareStatement(sql);

			//public String encryptionのメソッドから
			String pass = encryption(password);

			pStmt.setString(1, loginId);
			pStmt.setString(2, pass);
			ResultSet rs = pStmt.executeQuery();

			if (!rs.next()) {
				return null;
			}
			//
			String loginIdData = rs.getString("login_id");
			String nameData = rs.getString("name");
			return new User(loginIdData, nameData);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// データベース切断
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;

	}

	//★ユーザ一覧のメソッド
	//複数の場合はList<User>findAllで1つの場合はLogin(String LoginId,String password)などと書く。
	public List<User> findAll() {
		Connection conn = null;

		List<User> userList = new ArrayList<User>();

		try {
			//データベース接続（ここのtakanoDのところはDAOのデータベース名）
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			//adminではない処理が必要　データベースのテキストに書いてある。
			String sql = "SELECT * FROM user WHERE login_id !='admin'";

			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery(sql);

			//一覧情報をすべて取得
			while (rs.next()) {
				int id = rs.getInt("id");
				String loginId = rs.getString("login_id");
				String name = rs.getString("name");
				Date birthDate = rs.getDate("birth_date");
				String password = rs.getString("password");
				String createDate = rs.getString("create_date");
				String updateDate = rs.getString("update_date");

				//コンストラクタを作るとエラーが消える。
				User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

				//上のuserListに入る。
				userList.add(user);

				//データベース切断
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;

				}

			}

		}
		//findAllの{}に合わせる。
		return userList;
	}

	//★ユーザ一覧の検索メソッド
	public List<User> kensaku(String loginId, String name,String birthDate,String  birthDate1) {
		Connection conn = null;

		List<User> userList = new ArrayList<User>();

		try {
			//データベース接続（ここのtakanoDのところはDAOのデータベース名）
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			//adminではない処理が必要　データベースのテキストに書いてある。
			String sql = "SELECT * FROM user WHERE login_id !='admin'";

			if (!loginId.equals("")) {
				sql += " AND login_id ='" + loginId + "'";
			}

			if (!name.equals("")) {
				sql += " AND name like '%"+name+"%'";
			}

			if (!birthDate.equals("")) {
				sql += " AND birth_Date >='" + birthDate + "'";
			}

			if (!birthDate1.equals("")) {
				sql += " AND birth_Date <='" + birthDate1 + "'";
			}
			System.out.println(sql);

			Statement pt = conn.createStatement();
			ResultSet rs = pt.executeQuery(sql);

			while (rs.next()) {
				User user = new User();

				user.setLoginId(rs.getString("login_id"));
				user.setName(rs.getString("name"));
				user.setBirthDate(rs.getDate("birth_date"));
				user.setPassword(rs.getString("password"));
				user.setCreateDate(rs.getString("create_date"));
				user.setUpdateDate(rs.getString("update_date"));


				//上のuserListに入る。
				userList.add(user);
			}



			//データベース切断

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;

				}

			}

		}
		//findAllの{}に合わせる。
		return userList;
	}

	//★ユーザ新規登録のメソッド　登録したいだけなので戻り値なし
	public void create(String loginId, String password, String name, String birthDate) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			String sql = " INSERT INTO user(login_id,name,birth_date,password,create_date,update_date) VALUES(?,?,?,?, now(),now())";
			/*登録したい情報。 ?の分だけ
			*登録をしたいだけなのでセットするだけで良い。
			*/

			String pass = encryption(password);
			//暗号化 password,passのところを変える。
			/*String source = password;
			Charset charset = StandardCharsets.UTF_8;
			String algorithm = "MD5";
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			String pass = DatatypeConverter.printHexBinary(bytes);
			System.out.println(pass);
			*/

			/*登録したい情報。 ?の分だけ
			登録をしたいだけなのでセットするだけで良い。
			*/
			PreparedStatement pt = conn.prepareStatement(sql);
			pt.setString(1, loginId);
			pt.setString(2, name);
			pt.setString(3, birthDate);
			pt.setString(4, pass);
			//SELECT文ならexecuteQuery(),INSERT・UPDATE・DELETEはexecuteUpdate()
			pt.executeUpdate();

			//データベース切断
		} catch (SQLException e) {
			e.printStackTrace();
			return;

		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return;

				}
			}
		}
	}

	//★ユーザ情報詳細参照のメソッド。

	public User moredetail(int id) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			String sql = "select * from user where id = ?";

			PreparedStatement pt = conn.prepareStatement(sql);
			pt.setInt(1, id);

			//SELECT文ならexecuteQuery(),INSERT・UPDATE・DELETEはexecuteUpdate()
			ResultSet rs = pt.executeQuery();

			//インスタンスを作る　userを詳細の時は返すのでインスタンスをwhile文前に書く
			User user = new User();

			while (rs.next()) {
				user.setId(rs.getInt("id"));
				user.setLoginId(rs.getString("login_id"));
				user.setName(rs.getString("name"));
				user.setBirthDate(rs.getDate("birth_date"));
				user.setPassword(rs.getString("password"));
				user.setCreateDate(rs.getString("create_date"));
				user.setUpdateDate(rs.getString("update_date"));
			}
			return user;

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return null;

				}
			}
		}
	}

	//★ユーザ情報更新のメソッド
	public void update(String loginId, String password, String name, String birthDate) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			String sql = "UPDATE user SET password=? , name=? , birth_date=? WHERE login_id=?";

			String pass = encryption(password);
			//暗号化 password,passのところだけ変える。
			/*String source = password;
			Charset charset = StandardCharsets.UTF_8;
			String algorithm = "MD5";
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			String pass = DatatypeConverter.printHexBinary(bytes);
			System.out.println(pass);
			 */

			PreparedStatement pt = conn.prepareStatement(sql);
			//sqlの？の数だけ作らないといけない。
			pt.setString(1, pass);
			pt.setString(2, name);
			pt.setString(3, birthDate);
			pt.setString(4, loginId);

			//SELECT文ならexecuteQuery(),INSERT・UPDATE・DELETEはexecuteUpdate()
			pt.executeUpdate();

			//データベース切断
		} catch (SQLException e) {
			e.printStackTrace();
			return;

		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return;

				}
			}
		}
	}

	//★ユーザ情報更新のメソッド
	public void update(String loginId, String name, String birthDate) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			String sql = "UPDATE user SET  name=? , birth_date=? WHERE login_id=?";

			PreparedStatement pt = conn.prepareStatement(sql);
			//sqlの？の数だけ作らないといけない。
			pt.setString(1, name);
			pt.setString(2, birthDate);
			pt.setString(3, loginId);

			//SELECT文ならexecuteQuery(),INSERT・UPDATE・DELETEはexecuteUpdate()
			pt.executeUpdate();

			//データベース切断
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return;

				}
			}
		}
	}

	//★ユーザ削除のメソッド
	public void delete(String loginId) {
		Connection conn = null;
		try {
			// データベースへ接続
			conn = DBManager.getConnection();
			//確認済みのSQL、荷物を作る。
			String sql = "DELETE FROM user WHERE login_id=?;";

			PreparedStatement pt = conn.prepareStatement(sql);
			//sqlの？の数作らないといけない。
			pt.setString(1, loginId);
			//SELECT文ならexecuteQuery(),INSERT・UPDATE・DELETEはexecuteUpdate()
			pt.executeUpdate();

			//データベース切断
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
					return;

				}
			}
		}
	}
	//暗号化のメソッド
	public String encryption(String password) {
		String pass = "";
		try {
			String source = password;
			Charset charset = StandardCharsets.UTF_8;
			String algorithm = "MD5";
			byte[] bytes = MessageDigest.getInstance(algorithm).digest(source.getBytes(charset));
			pass = DatatypeConverter.printHexBinary(bytes);

		} catch (NoSuchAlgorithmException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
		return pass;

	}

}