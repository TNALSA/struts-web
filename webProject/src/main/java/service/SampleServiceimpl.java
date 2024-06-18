package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.DAO;
import dto.postDTO;

public class SampleServiceimpl extends DAO implements SampleService {
	public int getNext() throws SQLException { //최근 포스트ID를 가져와 postID를 붙여주기 위한 메소드
		String SQL = "select postID from post order by postID desc";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)){
			System.out.println("connected DB:"+conn);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시글인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<postDTO> getList(int pageNumber){
		String SQL = "select postID,postTitle,userID,postDate,postContent from post where postID < ? and postAvailable = 1";
		ArrayList<postDTO> list = new ArrayList<postDTO>();
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			System.out.println("connected DB:"+conn);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			rs = pstmt.executeQuery();  
			while(rs.next()) {
				postDTO post = new postDTO();
				post.setPostID(rs.getInt("postID"));
				post.setPostTitle(rs.getString("postTitle"));
				post.setUserID(rs.getString("userID"));
				post.setPostDate(rs.getString("postDate"));
				post.setPostContent(rs.getString("postContent"));
				list.add(post);
				}
		}
		catch(Exception e) 
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public postDTO getPost(int postID) {
		String SQL = "select postID,postTitle,userID,postDate,postContent from post where postID = ?";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				postDTO post = new postDTO();
				post.setPostID(rs.getInt("postID"));
				post.setPostTitle(rs.getString("postTitle"));
				post.setUserID(rs.getString("userID"));
				post.setPostDate(rs.getString("postDate"));
				post.setPostContent(rs.getString("postContent"));
				return post;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;	
	}
	public int write(String userID, String postTitle, String postContent) {
		String SQL = "insert into post values(?,?,?,?,?,?)";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, postTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, postContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		return -1;
	}
	
	public String getDate() {
		String SQL = "select now()";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			
		}
		return "";
	}
	
	public int update(int postID, String postTitle, String postContent) {
		String SQL = "update post set postTitle = ?, postContent = ? where postID = ?";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, postContent);
			pstmt.setInt(3, postID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int delete(int postID) {
		String SQL = "update post set postAvailable = 0 where postID = ?";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, postID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int login(String id, String password) {
		System.out.println("login Method");
		String SQL = "select userPassword from user where userID = ?";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)) {
			System.out.println(conn);
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				if(rs.next()) {
					System.out.println("[SampleServiceimpl]resultSet: "+rs.getString("userPassword"));
					if(rs.getString("userPassword").equals(password)) {
						System.out.println("일치");
						return 1; //일치
					}else
						System.out.println("불 일치");
						return 0; //불일치
				}
				return 2; //존재하지 않음
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int join(String id, String pw, String name, String gender, String email) {
		System.out.println("join Method");
		String SQL = "INSERT INTO user VALUES(?,?,?,?,?)";
		try(Connection conn = DriverManager.getConnection(dbURL,dbID,dbPassword)){
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, gender);
			pstmt.setString(5, email);
		
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
	
