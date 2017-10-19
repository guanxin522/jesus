package com.jesus.interceptor;


import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.jesus.entity.Admin;
import com.jesus.entity.Users;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class UserAuthorityInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// ȡ�������Action��
        String name = invocation.getInvocationContext().getName();
        if (name.equals("loginUser")) {
            // ����û����¼����ʹ֮ͨ��
            return invocation.invoke();
        } else {
            // ȡ��Session
            ActionContext ac = invocation.getInvocationContext();
            Map session = (Map)ac.get(ServletActionContext.SESSION);
            if (session == null) {
                // ���SessionΪ�գ������û���½
                System.out.println("û��session,���¼");
                return "loginUser";
            } else {
            	Users user = (Users)session.get("user");
            	if (user == null){
            		return "loginUser";
            	}
            	else {
            		return invocation.invoke();
            	}
            }   
        }            
	}


}
