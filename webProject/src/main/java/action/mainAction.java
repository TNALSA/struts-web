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

public class mainAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(">> mainAction Execute");
		HttpSession session = request.getSession();
		if((String)request.getParameter("lang")!=null) {
			String req = (String)request.getParameter("lang");
			switch (req) {
				case "ko": {
					System.out.println("[mainAction]session: "+req);
					session.setAttribute("lang", "ko");
					break;
				}
				case "en":{
					System.out.println("[mainAction]session: "+req);
					session.setAttribute("lang", "en");
					break;
				}
			}
		}
		return mapping.findForward("main");
	}
}
