package com.hris.portal.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hris.portal.manager.PortalManager;

/**
 * Servlet Filter implementation class PortalFilter
 */
public class PortalFilter implements Filter {

	private ServletContext context;
	
    /**
     * Default constructor. 
     */
    public PortalFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		this.context.log("Requested Resource::PORTAL");
		HttpSession session = req.getSession(false);
		
		if (null == session.getAttribute("username")) {
			this.context.log("Unauthorized access request - PORTAL");
			
			PortalManager manager = new PortalManager();
			res.sendRedirect(manager.getPortalUrl());
		}
		else
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}

}
