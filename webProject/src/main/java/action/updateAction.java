package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class updateAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">> updateAction Execute");

		updateActionForm uaf = (updateActionForm)form;
		System.out.println("[updateAction]postID: "+uaf.getPostID());
		System.out.println("[updateAction]postTitle: "+uaf.getPostTitle());
		System.out.println("[updateAction]postContent: "+uaf.getPostContent());
		 //SampleServiceimpl 객체 생성
		SampleService sample = new SampleServiceimpl();
		sample.update(Integer.parseInt(uaf.getPostID()),uaf.getPostTitle(),uaf.getPostContent()); //작성한 글 db에 저장
		request.setAttribute("va", sample.getPost(Integer.parseInt(uaf.getPostID())));
		return mapping.findForward("view");
	}
}
