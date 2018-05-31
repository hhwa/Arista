package team;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class deleteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private teamVO paramClass; //파라미터를 저장할 객체
	private teamVO resultClass; //쿼리 결과 값을 저장할 객체

	private int currentPage;	//현재 페이지
	
	private String fileUploadPath = "C:\\Java\\upload\\";
	
	private int team_no;
	
public deleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}

	// 게시글 글 삭제
	public String execute() throws Exception {
		
		//파라미터와 리절트 객체 생성.
		paramClass = new teamVO();
		resultClass = new teamVO();
		
		// 해당 번호의 글을 가져온다.
		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

		//서버 파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getFile_savname());
		deleteFile.delete();

		// 삭제할 항목 설정.
		paramClass.setTeam_no(getTeam_no());
				
		// 삭제 쿼리 수행.
		sqlMapper.update("teamSQL.deleteTeam", paramClass);

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		deleteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		deleteAction.sqlMapper = sqlMapper;
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

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public int getTeam_no() {
		return team_no;
	}

	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}

	
	

}
