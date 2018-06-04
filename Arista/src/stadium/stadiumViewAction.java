package stadium;

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

public class stadiumViewAction extends ActionSupport {
       public static Reader reader;
       public static SqlMapClient sqlMapper;
       
       private stadiumVO paramClass = new stadiumVO();
       private stadiumVO resultClass = new stadiumVO();
       
       private int currentPage;
       
       private int stadium_no;
       
       private String fileUploadPath="C:\\Java\\upload\\";
       
       private InputStream inputStream;
       private String contentDisposition;
       private long contentLength;
       
       public stadiumViewAction() throws IOException {
    	    
    	   reader = Resources.getResourceAsReader("sqlMapConfig.xml");
    	    sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
    	    reader.close();    	    
       }
       public String execute() throws Exception{ //상세보기 부분
    	   
    	   
    	   resultClass = (stadiumVO)sqlMapper.queryForObject("stadiumSQL.selectOne",getStadium_no());
    	   
    	   return SUCCESS;
       }
	
	public stadiumVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(stadiumVO paramClass) {
		this.paramClass = paramClass;
	}
	public stadiumVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(stadiumVO resultClass) {
		this.resultClass = resultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStadium_no() {
		return stadium_no;
	}
	public void setStadium_no(int stadium_no) {
		this.stadium_no = stadium_no;
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
