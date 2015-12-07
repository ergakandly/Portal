package com.hris.portal.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.hris.portal.manager.PortalManager;

/**
 * Application Lifecycle Listener implementation class PortalSessionListener
 *
 */
public class PortalSessionListener implements HttpSessionListener {

	private static int totalActiveSession = 0;

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event)  { 
    	System.out.println("===============================");
    	System.out.println("sessionCreated - PORTAL");
    	totalActiveSession++;
    	System.out.println("PORTAL - active session: " + totalActiveSession);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event)  { 
    	HttpSession session = event.getSession();
    	
    	System.out.println("===============================");
    	System.out.println("sessionDestroyed - PORTAL | "+session.getAttribute("username"));
    	if (totalActiveSession > 0)
    		totalActiveSession--;
    	System.out.println("PORTAL - active session: " + totalActiveSession);
    	
    	
    	PortalManager pManager = new PortalManager();
    	pManager.updateStatusLogin(session.getAttribute("username").toString(), 0);
    }
	
}
