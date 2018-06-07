package mem;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import mem.memVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.Calendar;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import java.io.Reader;
import java.io.IOException;

public class loginAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private String m_id;
	private String m_passwd;
	private String m_name;
	private String m_mobilephone; 
	private int m_birthyear;
	private String m_region;
	private String m_email;
	private String m_nickname;
	private int admin_yn;
	private int genUser =0;
	private int adminUser = 1;
	private String m_position;
	private Calendar m_joindate = Calendar.getInstance();

	private memVO memberParam;
	private memVO memberResult;
	
	private Map session;
	
	public loginAction() throws IOException {
		// TODO Auto-generated constructor stub
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	@Override
	public String execute() throws Exception {
		//사용자에게 입력 받은 정보와 같은 값이 DB 안에 존재하는지 확인한다.
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.loginPro",getM_id());
		int adminYN = memberResult.getAdmin_yn();
		if(memberResult != null) {
			if (memberResult.getM_passwd().equals(getM_passwd())) {
				session.put("session_id", memberResult.getM_id());
				session.put("session_adminYN", adminYN);
				return SUCCESS;
			}
		}
		return ERROR;
		
	}
	public String form() {
		return SUCCESS;
	}
	public String logout() {
		if(session.get("session_id")!=null) {
			session.remove("session_id");
		}
		return SUCCESS;
	}
	
	public String findId() throws Exception{
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.findId",memberParam);
		return SUCCESS;
	}

	public String findPw() throws Exception{
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.findPw",memberParam);

		if(memberResult !=null) {
		String subject = memberResult.getM_name()+"님, 비밀번호를 알려드립니다. -Arista";
		String content = "고객님의 아이디: " + memberResult.getM_id() + " 비밀번호: " + memberResult.getM_passwd();
		Emailsend mail = new Emailsend();
		mail.GmailSet(memberResult.getM_email(), subject, content);
		}
		
		return SUCCESS;
	}
	

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_mobilephone() {
		return m_mobilephone;
	}

	public void setM_mobilephone(String m_mobilephone) {
		this.m_mobilephone = m_mobilephone;
	}

	public int getM_birthyear() {
		return m_birthyear;
	}

	public void setM_birthyear(int m_birthyear) {
		this.m_birthyear = m_birthyear;
	}

	public String getM_region() {
		return m_region;
	}

	public void setM_region(String m_region) {
		this.m_region = m_region;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public int getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}

	public int getGenUser() {
		return genUser;
	}

	public void setGenUser(int genUser) {
		this.genUser = genUser;
	}

	public int getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(int adminUser) {
		this.adminUser = adminUser;
	}

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public Calendar getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Calendar m_joindate) {
		this.m_joindate = m_joindate;
	}

	public memVO getMemberParam() {
		return memberParam;
	}

	public void setMemberParam(memVO memberParam) {
		this.memberParam = memberParam;
	}

	public memVO getMemberResult() {
		return memberResult;
	}

	public void setMemberResult(memVO memberResult) {
		this.memberResult = memberResult;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	
	
}
