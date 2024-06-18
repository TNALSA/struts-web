package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class loginAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(">> loginAction Execute");
		HttpSession session = request.getSession(); //세션에 저장하기 위함
		String id = request.getParameter("userID");
		String password = request.getParameter("userPassword");
		System.out.println("[loginAction]ID: "+id);
		
		//System.out.println("[loginAction]lang: "+lang);
		
		SampleService sample = new SampleServiceimpl();
		int result = sample.login(id, password);
		
		if(result==1) {
			session.setAttribute("userID", id); //해당 유저의 id로 세션을 set
			return mapping.findForward("main");
		}else{
			return mapping.findForward("login");
		}
		
	}
}
