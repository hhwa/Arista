package team;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.Calendar;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class modifyAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private teamVO paramClass; //파라미터를 저장할 객체
	private teamVO resultClass; //쿼리 결과 값을 저장할 객체

	private int currentPage; //현재 페이지

	private int team_no;
	private String team_id;
	private String team_area;
	private String team_type;
	private String team_fieldtype;
	private String team_age;
	private String team_skill;
	private String team_count;
	private String team_intro;
	private String old_file;

	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath = "C:\\Users\\user1\\Desktop\\offtheball\\upload\\"; //업로드 경로.
	
	
	public modifyAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
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
		
		sqlMapper.update("teamSQL.updateTeam", paramClass);
		
		// 수정할 파일이 업로드 되었다면 파일을 업로드하고 DB의 file 항목을 수정함.
				if (getUpload() != null) {
					
					//실제 서버에 저장될 파일 이름과 확장자 설정.
					String file_name = "file_" + getTeam_no();
				           String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
					
					//이전 파일 삭제
					File deleteFile = new File(fileUploadPath + getOld_file());
					deleteFile.delete();
					
					//새 파일 업로드
					File destFile = new File(fileUploadPath + file_name + "." + file_ext);
					FileUtils.copyFile(getUpload(), destFile);
					
					//파일 정보 파라미터 설정.
					paramClass.setFile_orgname(getUploadFileName());
					paramClass.setFile_savname(file_name + "." + file_ext);
					
					//파일 정보 업데이트.
					sqlMapper.update("updateFile", paramClass);
				}

				// 수정이 끝나면 view 페이지로 이동.
				resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

				return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		modifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		modifyAction.sqlMapper = sqlMapper;
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

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
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
