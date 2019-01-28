package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
//데이터베이스 접근 객체의 약자, 실질적으로 회원 정보를 불러오거나 데이터베이스에 회원 정보를 넣을 때 사용
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			
			String dbURL="jdbc:mysql://localhost:3306/BBS";
			//데이터베이스 DB : 3306 포트의 BBS 데이터베이스에 접속할 수 있도록 함
			
			String dbID="root";
			String dbPassword="1234";
			//아이디와 비밀번호 값
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
			//dbURL에, 아이디와 비밀번호를 입력해서 접속할 수 있도록 함
			//로그인이 되면 conn 객체 안에 정보가 담기게 됨
			
		}catch(Exception e) {
			
			e.printStackTrace();
			//오류가 발생한 경우 어떤 오류인지 출력할 수 있도록 함
		}
	}
	
	//로그인 시도 함수 구현
	public int login(String userID, String userPassword) {
		
		String SQL="SELECT userPassword FROM USER WHERE userID=?";
		//실제로 데이터베이스에 입력할 명령어, 유저 테이블에서 해당 사용자의 비밀번호를 가지고 오도록 함
		
		try {
			
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			//sql 문장에서  ?에 해당하는 userID를 설정하도록 함
			
			rs=pstmt.executeQuery();
			//결과를 담을 수 있는 객체에 하나의 결과값을 넣어 줌
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
	
					return 1;
					//결과값이 존재한다면 여기가 실행
					//로그인 성공
				
				} else
					
					return 0;
					//결과가 존재(아이디)하지만 오류가 발생한다면 비밀번호 오류임을 알리도록 함
			}
			
			return -1;
			//결과가 맞지 않다면 여기가 실행, 아이디가 없다는 것을 의미
			//해당하는 회원의 아이디가 존재하지 않음
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}
		
		return -2;
		//데이터베이스 오류
	}
	
	public int join(User user) {
		
		String SQL="INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		try {
			//데이터베이스와 user.java에 적은 그대로 순서를 정해서 넣어야 함(순서대로 데이터베이스에 들어감)
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();
			//해당 정보를 베이터베이스에 업데이트한다는 의미
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -1;
		//데이터베이스 오류
		//executeUpdate를 사용했을 때에는 0 이상의 숫자가 반환이 되기 때문에 -1이 아닌 경우는 성공적으로 회원가입이 실행이 된 것을 의미함
		
		
	}
	
}
