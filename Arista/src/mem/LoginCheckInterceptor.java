package mem;

import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginCheckInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		ActionContext context = invocation.getInvocationContext();
		Map<String, memVO> session = context.getSession();
		
		memVO memvo = (memVO)session.get("m_id");
		
		if(memvo == null) {
			
		}
		
		
		return invocation.invoke();
	}
	
}
