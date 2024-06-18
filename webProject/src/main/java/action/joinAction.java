package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class joinAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(">> joinAction Execute");
//		joinActionForm jaf = (joinActionForm)form;
//		System.out.println("[joinAction]userID: "+jaf.getUserID());
//		System.out.println("[joinAction]userPassword: "+jaf.getUserPassword());
//		System.out.println("[joinAction]userName: "+jaf.getUserName());
//		System.out.println("[joinAction]userGender: "+jaf.getUserGender());
//		System.out.println("[joinAction]userEmail: "+jaf.getUserEmail());
		request.setCharacterEncoding("UTF-8");	
		System.out.println(request.getParameter("userID"));
		System.out.println(request.getParameter("userPassword"));
		System.out.println(request.getParameter("userName"));
		System.out.println(request.getParameter("userGender"));
		System.out.println(request.getParameter("userEmail"));
		
		SampleService sample = new SampleServiceimpl();
		
		int result = sample.join(request.getParameter("userID"),request.getParameter("userPassword"),request.getParameter("userName"), request.getParameter("userGender"), request.getParameter("userEmail"));
		if(result == 1) {
			System.out.println("회원가입 성공");
			return mapping.findForward("login");
		}else {
			System.out.println("회원가입 실패");
			return mapping.findForward("join");
		}
	}
}
