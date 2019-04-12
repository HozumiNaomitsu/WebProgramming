SELECT * FROM user WHERE login_id = ? and password = ?;

select * from user;


SELECT * FROM user WHERE login_id = ? and password = ?;
	PreparedStatement pStmt = conn.prepareStatement(sql);
          pStmt.setString(1, loginId);
          pStmt.setString(2, password);
        	ResultSet rs = pStmt.executeQuery();

SERECT * FROM user WHERE login_id=? and name=? and birthDate=? and createDate=? and updateDate=?;
	PreparedStatement pStmt = conn.prepareStatement(sql);
          pStmt.setString(1, loginId);
          pStmt.setString(2, name);
		  pStmt.setString(3, birthDate);
		  pStmt.setString(4, createDate);
		  pStmt.setString(5, updateDate);
        	ResultSet rs = pStmt.executeQuery();
			
			INSERT INTO user
 (
     id,
	 login_id,
	 name,
     birth_date,
	 password,
	 create_date,
	 update_date
	 )
	 VALUES
	 (
	 2,
	 'takano',
	 'takano',
	 '1000-10-10',
	 'password',
	  now(),
	  now()
	 );
