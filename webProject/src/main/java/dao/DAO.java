package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO { //jdbc와 연결해줄 DAO 클래스
	//protected Connection conn; //접근 제한자로 인하여 private가 아닌 protected를 통해 자식 클래스에서도 사용가능.
	protected PreparedStatement pstmt;
	protected ResultSet rs;
	
	protected String dbURL = "jdbc:mysql://localhost:3306/jsp"; //사용할 데이터베이스의 위치(주소)
	protected String dbID = "root"; //데이터베이스 ID
	protected String dbPassword = "Als1tn2!@"; //데이터베이스 PW
	
	public DAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			//conn = DriverManager.getConnection(dbURL,dbID,dbPassword); //Connection클래스의 매개변수 conn로 데이터베이스와 직접 연결
			//System.out.println("connected DB:"+conn); //연결 확인하기
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
