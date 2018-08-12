package global.sesoc.lunch.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.plugin.Intercepts;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String loginid = (String) session.getAttribute("loginid");
		if (loginid == null) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/");
			return false;
		}

		return true;
	}

}
