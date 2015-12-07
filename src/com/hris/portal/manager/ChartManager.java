package com.hris.portal.manager;

import java.sql.SQLException;
import java.util.List;

import com.hris.portal.ibatis.IbatisHelper;
import com.hris.portal.model.ChartBean;
import com.ibatis.sqlmap.client.SqlMapClient;

public class ChartManager {

	private SqlMapClient ibatis;

	public ChartManager() {
		ibatis = new IbatisHelper().getSqlMapInstance();
	}
	
	public List<ChartBean> getPastAttendance()
	{
		List<ChartBean> result = null;
		
		try {
			result = ibatis.queryForList("charts.getPastAttendance", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
