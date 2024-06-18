package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class logoutAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(">> logoutAction Execute");
		HttpSession session = request.getSession();
		session.removeAttribute("userID");
		
		return mapping.findForward("logout");
	}
}
