package stadium;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;
import java.util.*;

import org.apache.commons.io.FileUtils;

public class stadiummodifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private stadiumVO paramClass;
	private stadiumVO resultClass;
	
	private int currentPage;
    
	private int stadium_no;
    private String stadium_name;
    private String stadium_tel;
    private int stadium_zipcode;
    private String stadium_addr;
    private String stadium_day; 
    private String stadium_time;
    private String stadium_main_img_org;
    private String stadium_main_img_save;
    Calendar stadium_regdate = Calendar.getInstance();
    private String old_file;
    
    
    private File upload;
    private String uploadContentType;
    private String uploadFileName;
    private String fileUploadPath = "C:\\Java\\upload\\";
    
    public stadiummodifyAction() throws IOException{
    	reader = Resources.getResourceAsReader("sqlMapConfig.xml");
    	sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
    	reader.close();
    }
    
    public String execute() throws Exception{
    	paramClass = new stadiumVO();
    	resultClass = new stadiumVO();
    	
    	
    	paramClass.setStadium_name(getStadium_name());
    	paramClass.setStadium_time(getStadium_time());
    	paramClass.setStadium_day(getStadium_day());
    	paramClass.setStadium_addr(getStadium_addr());
    	paramClass.setStadium_tel(getStadium_tel());
    	paramClass.setStadium_day(getStadium_day());
    	paramClass.setStadium_regdate(stadium_regdate.getTime());
    	
    	sqlMapper.update("stadiumSQL.updateStadium",paramClass);
    	
    	if (getUpload() != null) {
    		String file_name = "file_" + getStadium_no();
    		String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1,getUploadFileName().length());
    		
    		File deleteFile = new File(fileUploadPath + getOld_file());
    		deleteFile.delete();
    		
    		File destFile = new File(fileUploadPath + file_name +"."+file_ext);
    		FileUtils.copyFile(getUpload(),destFile);
    		
    		paramClass.setStadium_main_img_org(getUploadFileName());
    		paramClass.setStadium_main_img_save(file_name+"."+file_ext);
    		
    		sqlMapper.update("stadiumSQL.updateFile",paramClass);
    		
    	}
    	resultClass = (stadiumVO)sqlMapper.queryForObject("stadiumSQL.selectOne",getStadium_no());
    	return SUCCESS;
    }
    
	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
	}

	public Calendar getStadium_regdate() {
		return stadium_regdate;
	}

	public void setStadium_regdate(Calendar stadium_regdate) {
		this.stadium_regdate = stadium_regdate;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		stadiummodifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		stadiummodifyAction.sqlMapper = sqlMapper;
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

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public String getStadium_tel() {
		return stadium_tel;
	}

	public void setStadium_tel(String stadium_tel) {
		this.stadium_tel = stadium_tel;
	}

	public int getStadium_zipcode() {
		return stadium_zipcode;
	}

	public void setStadium_zipcode(int stadium_zipcode) {
		this.stadium_zipcode = stadium_zipcode;
	}

	public String getStadium_addr() {
		return stadium_addr;
	}

	public void setStadium_addr(String stadium_addr) {
		this.stadium_addr = stadium_addr;
	}

	public String getStadium_day() {
		return stadium_day;
	}

	public void setStadium_day(String stadium_day) {
		this.stadium_day = stadium_day;
	}

	public String getStadium_time() {
		return stadium_time;
	}

	public void setStadium_time(String stadium_time) {
		this.stadium_time = stadium_time;
	}

	public String getStadium_main_img_org() {
		return stadium_main_img_org;
	}

	public void setStadium_main_img_org(String stadium_main_img_org) {
		this.stadium_main_img_org = stadium_main_img_org;
	}

	public String getStadium_main_img_save() {
		return stadium_main_img_save;
	}

	public void setStadium_main_img_save(String stadium_main_img_save) {
		this.stadium_main_img_save = stadium_main_img_save;
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
