package stadium;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class stadiumdeleteAction extends ActionSupport {
           public static Reader reader;
           public static SqlMapClient sqlMapper;
           
           private stadiumVO paramClass;
           private stadiumVO resultClass;
           
           private int currentPage;
           
           private String fileUploadPath="C:\\java\\upload\\";
           
           private int stadium_no;
           
           public stadiumdeleteAction() throws IOException{
        	   reader = Resources.getResourceAsReader("sqlMapConfig.xml");
        	   sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
        	   reader.close();
        	   
           }
           public String execute() throws Exception{
        	   paramClass = new stadiumVO();
        	   resultClass = new stadiumVO();
        	   
        	   resultClass = (stadiumVO)sqlMapper.queryForObject("stadiumSQL.selectOne",getStadium_no());
        	   
        	   File deleteFile = new File(fileUploadPath + resultClass.getStadium_main_img_save());
        	   deleteFile.delete();
        	   
        	   paramClass.setStadium_no(getStadium_no());
        	   
        	   sqlMapper.update("stadiumSQL.deleteStadium",paramClass);
        	   
        	   return SUCCESS;
        	   
        	   
           }
		
        
           
           public static Reader getReader() {
			return reader;
		}
		public static void setReader(Reader reader) {
			stadiumdeleteAction.reader = reader;
		}
		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}
		public static void setSqlMapper(SqlMapClient sqlMapper) {
			stadiumdeleteAction.sqlMapper = sqlMapper;
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
		public String getFileUploadPath() {
			return fileUploadPath;
		}
		public void setFileUploadPath(String fileUploadPath) {
			this.fileUploadPath = fileUploadPath;
		}
		public int getStadium_no() {
			return stadium_no;
		}
		public void setStadium_no(int stadium_no) {
			this.stadium_no = stadium_no;
		}
	
           
           
}

