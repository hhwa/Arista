package mem;

import java.util.Map;


import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginCheckInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> session = invocation.getInvocationContext().getSession();		
		
		String m_id = (String)session.get("m_id");
		
		if(m_id == null) {
			return "gologin";
		}
		
		
		return invocation.invoke();
	}
	
}
