package mypage;

import java.io.IOException;

import com.opensymphony.xwork2.ActionSupport;

public class mypageAction extends ActionSupport{

	public String layout() throws IOException{
		return SUCCESS;
	}
}
