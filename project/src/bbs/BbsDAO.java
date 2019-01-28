package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {

	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			
			String dbURL="jdbc:mysql://localhost:3306/BBS";
			//데이터베이스 DB : 3306 포트의 project 데이터베이스에 접속할 수 있도록 함
			
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
	
	//게시판 글쓰기를 위해서 세 개의 함수가 필요함
	
	public String getDate() {
		
		String SQL="SELECT NOW()";
		//현재의 시간을 가지고 오는 함수
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//실행 준비 단계
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
				//현재의 날짜를 그대로 반환해 줄 수 있도록 함
				
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return "";
		//데이터베이스 오류
		
	}
	
	public int getNext() {
		
		String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
		//현재의 시간을 가지고 오는 함수
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			//실행 준비 단계
			rs=pstmt.executeQuery();
			
				if(rs.next()) {
				
				return rs.getInt(1) + 1;
				
			}
			
			return 1;
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		return -1;
		//데이터베이스 오류
		
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
			
			String SQL="INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
			//현재의 시간을 가지고 오는 함수
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				//실행 준비 단계
				
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, userID);
				pstmt.setString(4, getDate());
				pstmt.setString(5, bbsContent);
				pstmt.setInt(6, 1);
				//삭제가 되지 않은 상태고, 글이 보여야 하므로 1을 넣음
								
				return pstmt.executeUpdate();
				//0 이상의 결과를 반환
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -1;
			//데이터베이스 오류
			
		}
	
		public ArrayList<Bbs> getList(int pageNumber){
		//특정한 리스트를 받아서 반환할 수 있도록 만듦
			
			String SQL="SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
			//현재 삭제가 되지 않은 글을 가지고 오는데, 최대 10개까지만 불어올 수 있도록 함
			
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			//인스턴스를 보관할 수 있는 리스트를 하나 작성
			
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				//실행 준비 단계
				
				pstmt.setInt(1, getNext()-(pageNumber -1)*10);
				//글 다음으로 작성될 번호를 의미하므로, 6보다 작은 것을 가지고 오기 때문에 -1을 해 주어야 함
				
				rs = pstmt.executeQuery();
				
					while(rs.next()) {
						
						Bbs bbs= new Bbs();
						
						bbs.setBbsID(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserID(rs.getString(3));
						bbs.setBbsDate(rs.getString(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						
						list.add(bbs);
					}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return list;
			//데이터베이스 오류
			
		}
		
		public boolean nextPage(int pageNumber) {
		//글의 양이 다음 페이지로 넘어갈 수 없는 양이라면 다음 페이지로 가는 버튼이 없도록 해야 함
		//페이징 처리를 위해서 존재하는 함수
			
		String SQL="SELECT * FROM BBS WHERE bbsID < ? AND bbsAvailable =1";
			
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				//실행 준비 단계
				
				pstmt.setInt(1, getNext()-(pageNumber -1)*10);
				//글 다음으로 작성될 번호를 의미하므로, 6보다 작은 것을 가지고 오기 때문에 -1을 해 주어야 함
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
						
					return true;
					//다음 페이지가 넘어갈 수 있는 글이 하나라도 있다면 넘어갈 수 있도록 함
					
				}
				
				}catch(Exception e) {
					
					e.printStackTrace();
				
				}
					return false;
					//다음 페이지가 넘어갈 수 없을 경우
			
		}
		
		 public Bbs getBbs(int bbsID) {
			 
				String SQL="SELECT * FROM BBS WHERE bbsID=?";
				
				
				try {
					
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					//실행 준비 단계
					
					pstmt.setInt(1, bbsID);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
							
						Bbs bbs= new Bbs();
						
						bbs.setBbsID(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserID(rs.getString(3));
						bbs.setBbsDate(rs.getString(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						
						return bbs;
					}
					
					}catch(Exception e) {
						
						e.printStackTrace();
					
					}
						return null;
						//다음 페이지가 넘어갈 수 없을 경우
			 
		 }
		
		
		
		
		
		public int update(int bbsID, String bbsTitle, String bbsContent) {
			
			String SQL="UPDATE BBS SET bbsTitle = ?, bbsContent =? WHERE bbsID = ?";
			//현재의 시간을 가지고 오는 함수
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				//실행 준비 단계
				
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsID);
								
				return pstmt.executeUpdate();
				//0 이상의 결과를 반환
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -1;
			//데이터베이스 오류

		}
		
		public int delete(int bbsID) {
			
			String SQL="UPDATE BBS SET bbsAvailable = 0 WHERE bbsID=?";
			//현재의 시간을 가지고 오는 함수
			
			try {
				
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				//실행 준비 단계
				
				pstmt.setInt(1, bbsID);

				return pstmt.executeUpdate();
				//0 이상의 결과를 반환
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -1;
			//데이터베이스 오류
			
		}
		
	}


			
