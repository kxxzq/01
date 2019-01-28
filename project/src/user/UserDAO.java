package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
//�����ͺ��̽� ���� ��ü�� ����, ���������� ȸ�� ������ �ҷ����ų� �����ͺ��̽��� ȸ�� ������ ���� �� ���
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		
		try {
			
			String dbURL="jdbc:mysql://localhost:3306/BBS";
			//�����ͺ��̽� DB : 3306 ��Ʈ�� BBS �����ͺ��̽��� ������ �� �ֵ��� ��
			
			String dbID="root";
			String dbPassword="1234";
			//���̵�� ��й�ȣ ��
			
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
			//dbURL��, ���̵�� ��й�ȣ�� �Է��ؼ� ������ �� �ֵ��� ��
			//�α����� �Ǹ� conn ��ü �ȿ� ������ ���� ��
			
		}catch(Exception e) {
			
			e.printStackTrace();
			//������ �߻��� ��� � �������� ����� �� �ֵ��� ��
		}
	}
	
	//�α��� �õ� �Լ� ����
	public int login(String userID, String userPassword) {
		
		String SQL="SELECT userPassword FROM USER WHERE userID=?";
		//������ �����ͺ��̽��� �Է��� ��ɾ�, ���� ���̺��� �ش� ������� ��й�ȣ�� ������ ������ ��
		
		try {
			
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			//sql ���忡��  ?�� �ش��ϴ� userID�� �����ϵ��� ��
			
			rs=pstmt.executeQuery();
			//����� ���� �� �ִ� ��ü�� �ϳ��� ������� �־� ��
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
	
					return 1;
					//������� �����Ѵٸ� ���Ⱑ ����
					//�α��� ����
				
				} else
					
					return 0;
					//����� ����(���̵�)������ ������ �߻��Ѵٸ� ��й�ȣ �������� �˸����� ��
			}
			
			return -1;
			//����� ���� �ʴٸ� ���Ⱑ ����, ���̵� ���ٴ� ���� �ǹ�
			//�ش��ϴ� ȸ���� ���̵� �������� ����
			
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}
		
		return -2;
		//�����ͺ��̽� ����
	}
	
	public int join(User user) {
		
		String SQL="INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		
		try {
			//�����ͺ��̽��� user.java�� ���� �״�� ������ ���ؼ� �־�� ��(������� �����ͺ��̽��� ��)
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			
			return pstmt.executeUpdate();
			//�ش� ������ �����ͺ��̽��� ������Ʈ�Ѵٴ� �ǹ�
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
		return -1;
		//�����ͺ��̽� ����
		//executeUpdate�� ������� ������ 0 �̻��� ���ڰ� ��ȯ�� �Ǳ� ������ -1�� �ƴ� ���� ���������� ȸ�������� ������ �� ���� �ǹ���
		
		
	}
	
}
