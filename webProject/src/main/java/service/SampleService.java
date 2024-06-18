package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.postDTO;

public interface SampleService {
	//int getNext();
	ArrayList<postDTO> getList(int pageNumber);
	postDTO getPost(int postID);
	int write(String userID,String postTitle, String postContent);
	int update(int postID,String postTitle, String postContent);
	int delete(int postID);
	int login(String id, String password);
	int join(String id, String pw, String name, String gender, String email);
}
