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
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private teamVO paramClass; //파라미터를 저장할 객체
	private teamVO resultClass; //쿼리 결과 값을 저장할 객체

	private int currentPage; //현재 페이지
	
	private int team_no;
	
	private String fileUploadPath = "C:\\Users\\user1\\Desktop\\offtheball\\upload\\";
	
	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	public viewAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 상세보기
	public String execute() throws Exception {

		// 해당 번호의 글을 가져온다.
		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

		return SUCCESS;
	}
	// 첨부 파일 다운로드
		public String download() throws Exception {

			// 해당 번호의 파일 정보를 가져온다.
			resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

			// 파일 경로와 파일명을 file 객체에 넣는다.
			File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());

			// 다운로드 파일 정보 설정.
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
