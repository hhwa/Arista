package team;


import com.opensymphony.xwork2.ActionSupport;

import team.teamVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class viewAction extends ActionSupport {
	
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 

	private teamVO paramClass; 
	private teamVO resultClass; 

	private int currentPage; 
	
	private int team_no;
	
	private String fileUploadPath = "C:\\Users\\user1\\git\\Arista\\Arista\\WebContent\\teamimg\\";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	private String file_savname;
	private String file_orgname;
	private String teamimg;
	
	
	
	public viewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); 
		reader.close();
	}

	public String execute() throws Exception {
		
		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

		return SUCCESS;
		
	}
	
		public String download() throws Exception {

			resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());


			File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());

			
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getFile_orgname(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getFile_savname()));

			return SUCCESS;
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

		public String getTeamimg() {
			return teamimg;
		}

		public void setTeamimg(String teamimg) {
			this.teamimg = teamimg;
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			viewAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			viewAction.sqlMapper = sqlMapper;
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

		public String getFileUploadPath() {
			return fileUploadPath;
		}

		public void setFileUploadPath(String fileUploadPath) {
			this.fileUploadPath = fileUploadPath;
		}

		public InputStream getInputStream() {
			return inputStream;
		}

		public void setInputStream(InputStream inputStream) {
			this.inputStream = inputStream;
		}

		public String getContentDisposition() {
			return contentDisposition;
		}

		public void setContentDisposition(String contentDisposition) {
			this.contentDisposition = contentDisposition;
		}

		public long getContentLength() {
			return contentLength;
		}

		public void setContentLength(long contentLength) {
			this.contentLength = contentLength;
		}
		

}
