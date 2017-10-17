package com.jesus.interceptor;


import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.jesus.entity.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class AdminAuthorityInterceptor extends AbstractInterceptor {


	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// 取得请求的Action名
        String name = invocation.getInvocationContext().getName();
        if (name.equals("loginAdminAction")) {
            // 如果用户想登录，则使之通过
            return invocation.invoke();
        } else {
            // 取得Session
            ActionContext ac = invocation.getInvocationContext();
            Map session = (Map)ac.get(ServletActionContext.SESSION);
            if (session == null) {
                // 如果Session为空，则让用户登陆
                System.out.println("没有session,请登录");
                return "loginAdmin";
            } else {
            	Admin admin = (Admin)session.get("admin");
            	if (admin == null){
            		return "loginAdmin";
            	}
            	else {
            		return invocation.invoke();
            	}
            }   
        }            
	}


}
