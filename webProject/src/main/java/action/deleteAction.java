package action;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class deleteAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">> deleteAction Execute");
		String postID = (String)request.getParameter("postID");
		//SampleServiceimpl 객체 생성
		SampleService sample = new SampleServiceimpl();
		sample.delete(Integer.parseInt(postID));
		request.setAttribute("pa", sample.getList(1));
		
		return mapping.findForward("delete");
	}
}
