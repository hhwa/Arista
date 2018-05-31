package team;


import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

public class viewAction extends ActionSupport {
	
	public static Reader reader; //?��?�� ?��?��림을 ?��?�� reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API�? ?��?��?���? ?��?�� sqlMapper 객체.

	private teamVO paramClass; //?��?��미터�? ???��?�� 객체
	private teamVO resultClass; //쿼리 결과 값을 ???��?�� 객체

	private int currentPage; //?��?�� ?��?���?
	
	private int team_no;
	
	private String fileUploadPath = "C:\\Users\\user1\\Desktop\\offtheball\\upload\\";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	public viewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ?��?��?�� ?��?��?��?��?�� �??��?��?��.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml?�� ?��?��?�� ?��?��?�� sqlMapper 객체 ?��?��.
		reader.close();
	}

	// ?��?��보기
	public String execute() throws Exception {

		// ?��?�� 번호?�� �??�� �??��?��?��.
		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

		return SUCCESS;
	}
	// 첨�? ?��?�� ?��?��로드
		public String download() throws Exception {

			// ?��?�� 번호?�� ?��?�� ?��보�?? �??��?��?��.
			resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

			// ?��?�� 경로?? ?��?��명을 file 객체?�� ?��?��?��.
			File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());

			// ?��?��로드 ?��?�� ?���? ?��?��.
			setContentLength(fileInfo.length());
			setContentDisposition("attachment;filename="
					+ URLEncoder.encode(resultClass.getFile_orgname(), "UTF-8"));
			setInputStream(new FileInputStream(fileUploadPath
					+ resultClass.getFile_savname()));

			return SUCCESS;
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
