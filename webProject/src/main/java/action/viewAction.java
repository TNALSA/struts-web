package action;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class viewAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception, InvocationTargetException {
		System.out.println(">> viewAction");
		String postID = (String)request.getParameter("postID");
		System.out.println("[viewAction]postID: "+postID);
		
		SampleService sample = new SampleServiceimpl();
		request.setAttribute("va", sample.getPost(Integer.parseInt(postID)));
		return mapping.findForward("view");
	}
}
