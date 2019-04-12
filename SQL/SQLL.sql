SELECT•¶‚¶‚á‚È‚¢‚Ì‚Å‚±‚¤‚¢‚¤‘‚«•û
šV‹K“o˜^
INSERT INTO user('login_id','name','birth_date','password','create_date','update_date') VALUES('?','?','?','?', 'now()','now()');

PreparedStatement pt = conn.prepareStatement(sql);
          pt.setString(1, loginId);
          pt.setString(2, name);
		  pt.setString(3, birthDate);
		  pt.setString(4, password);
		  pt.setString(5, createDate);
		  pt.setString(6, updateDate);
        	ResultSet rs = pt.executeQuery();
šÚ×	
select * from user where id = ?;

š’Ç‰ÁEXV
UPDATE user SET loginId=? and password=? name=? and birthDate=? WHERE loginId=?;

šíœ
DELETE FROM user WHERE loginId=?;

UPDATE user SET password='1' , name='1' , birth_date='100-01-01' WHERE login_id='takano';

DELETE FROM user WHERE login_id='takano';
