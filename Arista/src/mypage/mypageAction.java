package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import mem.memVO;

public class mypageAction extends ActionSupport{
	
	public static Reader reader;	//파일 스트림을 위한 reader
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<memVO> list=new ArrayList<memVO>();
	
	private memVO paramClass;	//파라미터를 저장할 객체
	private memVO resultClass;	//쿼리 결과 값을 저장할 객체
	
	private int currentPage;	//현재 페이지
	
	private String m_ID;	// 아이디
	private String m_password;	//비밀번호
	private String m_name;	//이름
	private String m_mobilephone;	//핸드폰 번호
	private int m_birthyear;	//생년월일
	private String m_region;	//지역
	private String m_email;		//이메일
	private String m_position;	//포지션
	private boolean admin_yn;	//관리자 유무
	private String prof_image_org;	//이미지
	private String prof_image_save;	//이미지
	private Date m_joindate;	//가입일
	private String m_nickname;	//닉네임
	
	
	public mypageAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	}
	
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}

	//내정보
	public String view() throws Exception{
		paramClass=new memVO();
		resultClass=new memVO();
		
		paramClass.setM_id(getM_ID());
		paramClass.setM_passwd(getM_password());
		paramClass.setM_name(getM_name());
		paramClass.setM_region(getM_region());
		paramClass.setM_mobilephone(getM_mobilephone());
		paramClass.setM_email(getM_email());
		paramClass.setM_birthyear(getM_birthyear());
		paramClass.setM_position(getM_position());
		paramClass.setM_nickname(getM_nickname());
		paramClass.setM_joindate(getM_joindate());
		
		sqlMapper.insert("memSQL.insertMem",paramClass);
		paramClass=(memVO) sqlMapper.queryForObject("memSQL.selectOneMember");
		
		resultClass.setM_id(getM_ID());
		resultClass.setM_passwd(getM_password());
		resultClass.setM_name(getM_name());
		resultClass.setM_region(getM_region());
		resultClass.setM_mobilephone(getM_mobilephone());
		resultClass.setM_email(getM_email());
		resultClass.setM_birthyear(getM_birthyear());
		resultClass.setM_position(getM_position());
		resultClass.setM_nickname(getM_nickname());
		resultClass.setM_joindate(getM_joindate());
		
		sqlMapper.insert("memSQL.insertMem",resultClass);
		return SUCCESS;
	
	}
	
	public String layout() throws Exception{
		return SUCCESS;
	}


	public List<memVO> getList() {
		return list;
	}


	public void setList(List<memVO> list) {
		this.list = list;
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


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public String getM_ID() {
		return m_ID;
	}


	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
	}


	public String getM_password() {
		return m_password;
	}


	public void setM_password(String m_password) {
		this.m_password = m_password;
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


	public String getM_position() {
		return m_position;
	}


	public void setM_position(String m_position) {
		this.m_position = m_position;
	}


	public boolean isAdmin_yn() {
		return admin_yn;
	}


	public void setAdmin_yn(boolean admin_yn) {
		this.admin_yn = admin_yn;
	}


	public String getProf_image_org() {
		return prof_image_org;
	}


	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}


	public String getProf_image_save() {
		return prof_image_save;
	}


	public void setProf_image_save(String prof_image_save) {
		this.prof_image_save = prof_image_save;
	}


	public Date getM_joindate() {
		return m_joindate;
	}


	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}


	public String getM_nickname() {
		return m_nickname;
	}


	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

}






















