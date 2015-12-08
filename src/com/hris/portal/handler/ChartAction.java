package com.hris.portal.handler;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;

import com.hris.portal.manager.ChartManager;
import com.hris.portal.model.ChartBean;

public class ChartAction extends DispatchAction {
	
	ChartManager manager = new ChartManager();
	
	public ActionForward getPastAttendance(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		List<ChartBean> list = null;
		
		
		list = manager.getPastAttendance();
		
		DefaultCategoryDataset barDataSet = new DefaultCategoryDataset();
		
		for(int i=0;i<list.size();i++)
		{
			barDataSet.setValue(list.get(i).getAverage(), "Total Attendance", list.get(i).getDepartmentName());
			System.out.println("Departments: "+list.get(i).getDepartmentName());
			System.out.println("Average: "+list.get(i).getAverage());
		}
		
		JFreeChart barChart = ChartFactory.createBarChart(  
		          "Departments - Total Attendance over Last 3 Months",      //Title  
		          "Departments",             // X-axis Label  
		          "Total Attendance",               // Y-axis Label  
		          barDataSet,             // Dataset  
		          PlotOrientation.VERTICAL,      //Plot orientation  
		          false,                // Show legend  
		          true,                // Use tooltips  
		          false                // Generate URLs  
		       );  
		
		OutputStream out=response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(out, barChart, 500, 220);
		out.flush();
		
		return null;
	}

	public ActionForward getPastLate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		List<ChartBean> list = null;
		
		
		list = manager.getPastLate();
		
		DefaultCategoryDataset barDataSet = new DefaultCategoryDataset();
		
		for(int i=0;i<list.size();i++)
		{
			barDataSet.setValue(list.get(i).getAverage(), "Total Attendance", list.get(i).getDepartmentName());
			System.out.println("Departments: "+list.get(i).getDepartmentName());
			System.out.println("Average: "+list.get(i).getAverage());
		}
		
		JFreeChart barChart = ChartFactory.createBarChart(  
		          "Departments - Total Late over Last 3 Months",      //Title  
		          "Departments",             // X-axis Label  
		          "Total Late",               // Y-axis Label  
		          barDataSet,             // Dataset  
		          PlotOrientation.VERTICAL,      //Plot orientation  
		          false,                // Show legend  
		          true,                // Use tooltips  
		          false                // Generate URLs  
		       );  
		
		OutputStream out=response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(out, barChart, 500, 220);
		out.flush();
		
		return null;
	}
	
	public ActionForward getPastWorkingHours(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		List<ChartBean> list = null;
		
		
		list = manager.getPastWorkingHours();
		
		DefaultCategoryDataset barDataSet = new DefaultCategoryDataset();
		
		for(int i=0;i<list.size();i++)
		{
			barDataSet.setValue(list.get(i).getAverage(), "Total Attendance", list.get(i).getDepartmentName());
			System.out.println("Departments: "+list.get(i).getDepartmentName());
			System.out.println("Average: "+list.get(i).getAverage());
		}
		
		JFreeChart barChart = ChartFactory.createBarChart(  
		          "Departments - Total Working Hours over Last 3 Months",      //Title  
		          "Departments",             // X-axis Label  
		          "Total Hours",               // Y-axis Label  
		          barDataSet,             // Dataset  
		          PlotOrientation.VERTICAL,      //Plot orientation  
		          false,                // Show legend  
		          true,                // Use tooltips  
		          false                // Generate URLs  
		       );  
		
		OutputStream out=response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(out, barChart, 500, 220);
		out.flush();
		
		return null;
	}
	
	public ActionForward getPastLeave(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		List<ChartBean> list = null;
		
		
		list = manager.getPastLeave();
		
		DefaultCategoryDataset barDataSet = new DefaultCategoryDataset();
		
		for(int i=0;i<list.size();i++)
		{
			barDataSet.setValue(list.get(i).getAverage(), "Total Attendance", list.get(i).getDepartmentName());
			System.out.println("Departments: "+list.get(i).getDepartmentName());
			System.out.println("Average: "+list.get(i).getAverage());
		}
		
		JFreeChart barChart = ChartFactory.createBarChart(  
		          "Departments - Total Leave over Last 3 Months",      //Title  
		          "Departments",             // X-axis Label  
		          "Total Leave",               // Y-axis Label  
		          barDataSet,             // Dataset  
		          PlotOrientation.VERTICAL,      //Plot orientation  
		          false,                // Show legend  
		          true,                // Use tooltips  
		          false                // Generate URLs  
		       );  
		
		OutputStream out=response.getOutputStream();
		ChartUtilities.writeChartAsJPEG(out, barChart, 500, 220);
		out.flush();
		
		return null;
	}
}
