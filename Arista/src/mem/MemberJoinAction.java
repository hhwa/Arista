package mem;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import mem.memVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;


public class MemberJoinAction extends ActionSupport implements Preparable, ModelDriven<memVO>, ServletRequestAware{
	//SQL 맵핑
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	//파일 업로드
	private File Upload;
	private String uploadContentType;
	private String uploadFileName;
	//private String fileUploadPath = "C:\\Users\\user1\\git\\Arista\\Arista\\WebContent\\profUpload\\";
	private String fileUploadPath = "C:\\Users\\yk\\git\\Arista\\Arista\\WebContent\\profUpload\\";
	
	//회원가입 속성
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
	
	private String prof_image_org;
	private String prof_image_save;
	private String profpath;
	
	private memVO memberParam;
	private memVO memberResult;
	
	private HttpServletRequest request;
	private File deletefile;
	
	
	//중복 체크
	private int idcheckresult = 0;
	private int nickcheckresult = 0;
	private int emailcheckresult = 0;
	//회원탈퇴
	private int deletemembercheck = 0;
	
	public MemberJoinAction() throws IOException {
		// TODO Auto-generated constructor stub
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	
	}
	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		memberParam = new memVO();
	}
	
	@Override
	public memVO getModel() {
		// TODO Auto-generated method stub
		return memberParam;
	}
	
	public String execute() throws Exception {
		memberParam.setAdmin_yn(genUser);
		memberParam.setM_joindate(m_joindate.getTime());
		sqlMapper.insert("memSQL.insertMem", memberParam);
		
		if(getUpload() != null) {
		
			//파일명 + ID
			String file_name = "file_" + memberParam.getM_id();
			//파일 확장자를 가져온다
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			//파일의 경로와 이름을 file객체에 담는다
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);

			//임시파일을 복사 후 설정한 이름과 경로(서버 컴퓨터)에 저장한다.원본이름을 그대로 저장하면 파일중복이 발생할 수 있다.
			FileUtils.copyFile(getUpload(), destFile);
			
			memberParam.setM_id(memberParam.getM_id());
			memberParam.setProf_image_org(getUploadFileName());
			memberParam.setProf_image_save(file_name+"."+file_ext);
			
			//DB에 파일의 원본이름과 새로 설정한 이름을 업데이트한다.
			sqlMapper.update("memSQL.updateProfile", memberParam);
		}
		return SUCCESS;
		
	}
	public String idcheck() throws Exception {
		//사용자가 입력한 id값을 받는다. select where조건 쿼리문으로 DB에서 같은 값을 찾는다. 결과값에 따라서 값을 준다.
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.idcheck", memberParam);
		if(memberResult == null)
			idcheckresult = 1;
		return SUCCESS;
	}
	
	public String nickcheck() throws Exception {
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.nickcheck", memberParam);
		if(memberResult == null)
			nickcheckresult = 1;
		
		return SUCCESS;
	}

	public String emailcheck() throws Exception {
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.emailcheck", memberParam);
		if(memberResult == null)
			emailcheckresult = 1;
		
		return SUCCESS;
	}

	public String joinform() throws Exception {
		
		return SUCCESS;
	}

	public String agree() throws Exception {
		
		return SUCCESS;
	}
	
	public String modifyMemForm() throws Exception {
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.updateform", memberParam);
		
		if(memberResult.getProf_image_save() != null) {
			prof_image_save = memberResult.getProf_image_save();
			prof_image_org = memberResult.getProf_image_org();
			profpath = request.getContextPath()+"/profUpload/"+prof_image_save;
			//profpath =fileUploadPath + prof_image_save;
		}
		return SUCCESS;
	}
	
	
	public String modifyMemPro() throws Exception {
		sqlMapper.update("memSQL.updateMem", memberParam);
		
		if(getUpload() != null) {
			deletefile = new File(fileUploadPath+memberParam.getProf_image_save());
			
			if(deletefile.isFile())
				FileUtils.forceDelete(deletefile);
			
			String file_name = "file_" + memberParam.getM_id();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);

			FileUtils.copyFile(getUpload(), destFile);
			
			memberParam.setM_id(memberParam.getM_id());
			memberParam.setProf_image_org(getUploadFileName());
			memberParam.setProf_image_save(file_name+"."+file_ext);
			
			sqlMapper.update("memSQL.updateProfile", memberParam);
		}
		
		return SUCCESS;
	}
	
	public String deleteMemPw() throws Exception {
		
		return SUCCESS;
	}
	
	
	public String deleteMem() throws Exception {
		memberResult = (memVO)sqlMapper.queryForObject("memSQL.selectPassword",memberParam);
		if(memberResult != null) { 
			sqlMapper.update("memSQL.deleteMem", memberParam);
			deletemembercheck = 1;}
		//프로필 사진 삭제 코드 추가
			
		return SUCCESS;
	
	}
	
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
		
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public String getProf_image_org() {
		return prof_image_org;
	}
	public String getProf_image_save() {
		return prof_image_save;
	}
	public String getProfpath() {
		return profpath;
	}
	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}
	public void setProf_image_save(String prof_image_save) {
		this.prof_image_save = prof_image_save;
	}
	public void setProfpath(String profpath) {
		this.profpath = profpath;
	}
	public int getNickcheckresult() {
		return nickcheckresult;
	}
	public int getEmailcheckresult() {
		return emailcheckresult;
	}
	public void setNickcheckresult(int nickcheckresult) {
		this.nickcheckresult = nickcheckresult;
	}
	public void setEmailcheckresult(int emailcheckresult) {
		this.emailcheckresult = emailcheckresult;
	}
	public int getIdcheckresult() {
		return idcheckresult;
	}
	public void setIdcheckresult(int idcheckresult) {
		this.idcheckresult = idcheckresult;
	}
	public memVO getMemberParam() {
		return memberParam;
	}

	public memVO getMemberResult() {
		return memberResult;
	}

	public void setMemberParam(memVO memberParam) {
		this.memberParam = memberParam;
	}

	public void setMemberResult(memVO memberResult) {
		this.memberResult = memberResult;
	}

	public static Reader getReader() {
		return reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public File getUpload() {
		return Upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public String getM_mobilephone() {
		return m_mobilephone;
	}

	public int getM_birthyear() {
		return m_birthyear;
	}

	public String getM_region() {
		return m_region;
	}

	public String getM_email() {
		return m_email;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public static void setReader(Reader reader) {
		MemberJoinAction.reader = reader;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		MemberJoinAction.sqlMapper = sqlMapper;
	}

	public void setUpload(File upload) {
		Upload = upload;
	}
	
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public void setM_mobilephone(String m_mobilephone) {
		this.m_mobilephone = m_mobilephone;
	}

	public void setM_birthyear(int m_birthyear) {
		this.m_birthyear = m_birthyear;
	}

	public void setM_region(String m_region) {
		this.m_region = m_region;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public Calendar getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Calendar m_joindate) {
		this.m_joindate = m_joindate;
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
	public int getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}
	public String getM_position() {
		return m_position;
	}
	public void setM_position(String m_position) {
		this.m_position = m_position;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getDeletemembercheck() {
		return deletemembercheck;
	}
	public void setDeletemembercheck(int deletemembercheck) {
		this.deletemembercheck = deletemembercheck;
	}
	
	
	
	
}
