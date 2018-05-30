package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import mem.memVO;

public class mypageAction extends ActionSupport{


	public static Reader reader;	// 파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper;	//sqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private memVO paramClass;	//파라미터를 저장할 객체
	private memVO resultClass; //뭐리 결과 값을 저장할 객체
	
	private String m_ID;
	private String m_passwd;
	private String m_name;
	private int m_mobilephone;
	private int m_birthyear;
	private String m_region;
	private String m_email;
	private String m_position;
	private String m_nickname;
	private Date m_joindate;
	private String prof_image_org;
	private String prof_image_save;
	
	
	private Map<String,Object> session;
	
	public mypageAction() throws IOException {
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String view() throws Exception{
		
		ActionContext context=ActionContext.getContext();
		session=context.getSession();
		
		paramClass=new memVO();
		resultClass=new memVO();
		
		
		sqlMapper.update("updateReadHit", paramClass);
		resultClass = (memVO)sqlMapper.queryForObject("selectOneMember",getM_ID());
		
		
		//m_paramClass.setM_passwd(getM_passwd());
		paramClass.setM_name(getM_name());
		paramClass.setM_nickname(getM_nickname());
		paramClass.setM_birthyear(getM_birthyear());
		paramClass.setM_mobilephone(getM_mobilephone());
		paramClass.setM_email(getM_email());
		paramClass.setM_position(getM_position());
		paramClass.setM_region(getM_region());
		paramClass.setM_joindate(getM_joindate());
		
		sqlMapper.update("memberModify",paramClass);
		
		return SUCCESS;
		
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stubs
		
		
		
		return SUCCESS;
	}

	public memVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(memVO paramClass) {
		this.paramClass = paramClass;
	}

	public memVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(memVO resultClass) {
		this.resultClass = resultClass;
	}

	public String getM_ID() {
		return m_ID;
	}

	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
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

	public int getM_mobilephone() {
		return m_mobilephone;
	}

	public void setM_mobilephone(int m_mobilephone) {
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

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
