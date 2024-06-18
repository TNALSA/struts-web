package action;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import service.SampleService;
import service.SampleServiceimpl;

public class writeAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		System.out.println(">> writeAction Execute");
		writeActionForm waf = (writeActionForm)form;
		System.out.println("[writeAction]작성자: "+waf.getUserID());
		System.out.println("[writeAction]게시글 이름: "+waf.getPostTitle());
		System.out.println("[writeAction]게시글 내용: "+waf.getPostContent());
		
		//SampleServiceimpl 객체 생성
		SampleService sample = new SampleServiceimpl();
		sample.write(waf.getUserID(),waf.getPostTitle(),waf.getPostContent()); //작성한 글 db에 저장
		request.setAttribute("pa", sample.getList(1)); //다시 getList하여 매개변수 pa로 전달
		return mapping.findForward("post");
	}
}
