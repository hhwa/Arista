package team;


import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class writeAction extends ActionSupport {
	
	public static Reader reader; //?��?�� ?��?��림을 ?��?�� reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API�? ?��?��?���? ?��?�� sqlMapper 객체.

	private teamVO paramClass; //?��?��미터�? ???��?�� 객체
	private teamVO resultClass; //쿼리 결과 값을 ???��?�� 객체

	private int currentPage; //?��?�� ?��?���?

	private int team_no;
	private String team_id;
	private String team_area;
	private String team_type;
	private String team_fieldtype;
	private String team_age;
	private String team_skill;
	private String team_count;
	private String team_intro;
	private String file_savname;
	private String file_orgname;
	Calendar team_regdate = Calendar.getInstance(); //?��?�� ?���? 구하�?.

	private File upload; //?��?�� 객체
	private String uploadContentType; //컨텐�? ???��
	private String uploadFileName; //?��?�� ?���?
	private String fileUploadPath = "C:\\Users\\user1\\Desktop\\offtheball\\upload\\"; //?��로드 경로.
	
	
	public writeAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception {
		
		return SUCCESS;
	}
	public String execute() throws Exception {
		
		paramClass = new teamVO();
		resultClass = new teamVO();
		
		paramClass.setTeam_id(getTeam_id());
		paramClass.setTeam_area(getTeam_area());
		paramClass.setTeam_type(getTeam_type());
		paramClass.setTeam_fieldtype(getTeam_fieldtype());
		paramClass.setTeam_age(getTeam_age());
		paramClass.setTeam_skill(getTeam_skill());
		paramClass.setTeam_count(getTeam_count());
		paramClass.setTeam_intro(getTeam_intro());
		paramClass.setTeam_regdate(team_regdate.getTime());
		
		sqlMapper.insert("teamSQL.insertTeam", paramClass);
		
		if(getUpload() != null) {
			
			resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectLastNo");
			
			String file_name = "file_" + resultClass.getTeam_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1, getUploadFileName().length());
			
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setTeam_no(resultClass.getTeam_no());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);
			
			sqlMapper.update("teamSQL.updateFile", paramClass);
		}
		return SUCCESS;
		
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		writeAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		writeAction.sqlMapper = sqlMapper;
	}
	public teamVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(teamVO paramClass) {
		this.paramClass = paramClass;
	}
	public teamVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(teamVO resultClass) {
		this.resultClass = resultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getTeam_area() {
		return team_area;
	}
	public void setTeam_area(String team_area) {
		this.team_area = team_area;
	}
	public String getTeam_type() {
		return team_type;
	}
	public void setTeam_type(String team_type) {
		this.team_type = team_type;
	}
	public String getTeam_fieldtype() {
		return team_fieldtype;
	}
	public void setTeam_fieldtype(String team_fieldtype) {
		this.team_fieldtype = team_fieldtype;
	}

	public String getTeam_age() {
		return team_age;
	}
	public void setTeam_age(String team_age) {
		this.team_age = team_age;
	}
	public String getTeam_skill() {
		return team_skill;
	}
	public void setTeam_skill(String team_skill) {
		this.team_skill = team_skill;
	}

	public String getTeam_count() {
		return team_count;
	}
	public void setTeam_count(String team_count) {
		this.team_count = team_count;
	}
	public String getTeam_intro() {
		return team_intro;
	}
	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}
	public Calendar getTeam_regdate() {
		return team_regdate;
	}
	public void setTeam_regdate(Calendar team_regdate) {
		this.team_regdate = team_regdate;
	}

	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getFileUploadPath() {
		return fileUploadPath;
	}
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	
	

}




































