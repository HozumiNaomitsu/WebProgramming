SELECT文じゃないのでこういう書き方
★新規登録
INSERT INTO user('login_id','name','birth_date','password','create_date','update_date') VALUES('?','?','?','?', 'now()','now()');

PreparedStatement pt = conn.prepareStatement(sql);
          pt.setString(1, loginId);
          pt.setString(2, name);
		  pt.setString(3, birthDate);
		  pt.setString(4, password);
		  pt.setString(5, createDate);
		  pt.setString(6, updateDate);
        	ResultSet rs = pt.executeQuery();
★詳細	
select * from user where id = ?;

★追加・更新
UPDATE user SET loginId=? and password=? name=? and birthDate=? WHERE loginId=?;

★削除
DELETE FROM user WHERE loginId=?;

UPDATE user SET password='1' , name='1' , birth_date='100-01-01' WHERE login_id='takano';

DELETE FROM user WHERE login_id='takano';
