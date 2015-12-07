package com.hris.portal.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.hris.portal.manager.PortalManager;

/**
 * Application Lifecycle Listener implementation class PortalConfigListener
 *
 */
public class PortalConfigListener implements ServletContextListener {

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  { 
    	System.out.println("Webapp shutdown - PORTAL");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  {
    	System.out.println("Webapp start - PORTAL");
    	
    	System.out.println("PORTAL - Reset Status Login.");
    	PortalManager pManager = new PortalManager();
    	pManager.resetStatusLogin();
    }
	
}
