package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dto.postDTO;
import service.SampleService;
import service.SampleServiceimpl;

//게시판 목록을 띄워줄 Action
public class postAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">> postAction Execute");
		//String pageNumber = request.getParameter("pageNumber");
		 //SampleServiceimpl 객체 생성
		SampleService sample = new SampleServiceimpl();
		
		//SampleServiceimpl클래스의 getList함수를 호출하여 DB의 모든 데이터를 리스트의 형태로 가져옴.
		//가져온 리스트 객체를 pa라는 변수명으로 넘겨줌 
		request.setAttribute("pa", sample.getList(1));
		System.out.println("[postAction]ListSize:"+sample.getList(1).size());	
		return mapping.findForward("post");
	}
}
