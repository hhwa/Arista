package team;

import com.opensymphony.xwork2.ActionSupport;

import mem.memVO;
import team.teamVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;
import java.util.*;

import java.net.URLEncoder;
import team.pagingAction;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

public class teamAction extends ActionSupport implements SessionAware{

   public static Reader reader;
   public static SqlMapClient sqlMapper;

   private Map session;
   private List<teamVO> list = new ArrayList<teamVO>();

   private String searchKeyword;
   private int searchNum;

   private teamVO paramClass = new teamVO();
   private teamVO resultClass =new teamVO();
   private memVO memParam = new memVO();
   private teamInfoVO teamInfoParam = new teamInfoVO();

   private int team_no;

   private String fileUploadPath = "C:\\Users\\user1\\git\\Arista\\Arista\\WebContent\\teamimg\\";

   private InputStream inputStream;
   private String contentDisposition;
   private long contentLength;
   private String file_savname;
   private String file_orgname;
   private String teamimg;

   private int currentPage = 1;
   private int totalCount;
   private int blockCount = 5;
   private int blockPage = 2;
   private String pagingHtml;
   private pagingAction page;
   private int num = 0;

   private String team_id;
   private String team_area;
   private String team_type;
   private String team_fieldtype;
   private String team_age;
   private String team_skill;
   private String team_count;
   private String team_intro;
   private String team_master;
   private int team_admin;
   
   Calendar team_regdate = Calendar.getInstance();

   private String old_file;

   private File upload;
   private String uploadContentType;
   private String uploadFileName;

   public teamAction() throws IOException {
      reader = Resources.getResourceAsReader("sqlMapConfig.xml");
      sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
      reader.close();
   }

   public String execute() throws Exception {

      if (getSearchKeyword() != null) {
         return search();
      }

      list = sqlMapper.queryForList("teamSQL.teamList");

      totalCount = list.size();
      page = new pagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      list = list.subList(page.getStartCount(), lastCount);
      return SUCCESS;
   }

   public String search() throws Exception {

      // searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
      // System.out.println(searchKeyword);
      // System.out.println(searchNum);
      if (searchNum == 0) {
         list = sqlMapper.queryForList("teamSQL.teamSearch", "%" + getSearchKeyword() + "%");
      }

      totalCount = list.size();
      page = new pagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      list = list.subList(page.getStartCount(), lastCount);
      return SUCCESS;
   }
   public String myTeam() throws Exception {
      memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam",session.get("session_id"));
      
      if(memParam.getMyteam()==null) {
         return "noTeam";
      }
      
      paramClass = (teamVO) sqlMapper.queryForObject("teamSQL.myTeamView",memParam.getMyteam());
      return SUCCESS;
   }
   public String view() throws Exception {
      paramClass = (teamVO) sqlMapper.queryForObject("teamSQL.teamView", getTeam_no());

      return SUCCESS;
   }

   public String download() throws Exception {

      resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

      File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());

      setContentLength(fileInfo.length());
      setContentDisposition("attachment;filename=" + URLEncoder.encode(resultClass.getFile_orgname(), "UTF-8"));
      setInputStream(new FileInputStream(fileUploadPath + resultClass.getFile_savname()));

      return SUCCESS;
   }

   public String create() throws Exception {

      paramClass.setTeam_id(getTeam_id());
      paramClass.setTeam_area(getTeam_area());
      paramClass.setTeam_type(getTeam_type());
      paramClass.setTeam_fieldtype(getTeam_fieldtype());
      paramClass.setTeam_age(getTeam_age());
      paramClass.setTeam_skill(getTeam_skill());
      paramClass.setTeam_count(getTeam_count());
      paramClass.setTeam_intro(getTeam_intro());
      paramClass.setTeam_regdate(team_regdate.getTime());
      paramClass.setTeam_master((String)session.get("session_id"));
      
      sqlMapper.insert("teamSQL.insertTeam", paramClass);
      
      teamInfoParam.setTeam_id(getTeam_id());
      teamInfoParam.setMem_id((String)session.get("session_id"));
      teamInfoParam.setTeam_admin(2);
      
      sqlMapper.insert("teamSQL.joinTeam",teamInfoParam);
      

      return SUCCESS;

   }
   private String joinTeam() throws Exception {
      
      teamInfoParam.setTeam_id(team_id);
      return SUCCESS;
   }

   public String form() throws Exception {
	   resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());
      return SUCCESS;
   }

   public String modify() throws Exception {
	   
	  resultClass = new teamVO();
	  
      paramClass.setTeam_no(getTeam_no());
      paramClass.setTeam_id(getTeam_id());
      paramClass.setTeam_area(getTeam_area());
      paramClass.setTeam_type(getTeam_type());
      paramClass.setTeam_fieldtype(getTeam_fieldtype());
      paramClass.setTeam_age(getTeam_age());
      paramClass.setTeam_skill(getTeam_skill());
      paramClass.setTeam_count(getTeam_count());
      paramClass.setTeam_intro(getTeam_intro());
      
      sqlMapper.update("teamSQL.updateTeam", paramClass);

      if (getUpload() != null) {

         String file_name = "file_" + getTeam_no();
         String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
               getUploadFileName().length());

         File deleteFile = new File(fileUploadPath + getOld_file());
         deleteFile.delete();

         File destFile = new File(fileUploadPath + file_name + "." + file_ext);
         FileUtils.copyFile(getUpload(), destFile);

         paramClass.setFile_orgname(getUploadFileName());
         paramClass.setFile_savname(file_name + "." + file_ext);

         sqlMapper.update("updateFile", paramClass);
      }

      resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", paramClass.getTeam_no());

      return SUCCESS;
   }
   
   public String deleteform() throws Exception {

      return SUCCESS;
   }
   
   public String deletee() throws Exception {
	   
	   paramClass =new teamVO();
	   resultClass = new teamVO();
	   
	   resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());
	   
	   File deleteFile = new File(fileUploadPath + paramClass.getFile_savname());
	   deleteFile.delete();
	   
	   paramClass.setTeam_no(getTeam_no());
	   
	   sqlMapper.update("teamSQL.deleteTeam", paramClass);
	   
	   return SUCCESS;
   }

   public List<teamVO> getList() {
      return list;
   }

   public void setList(List<teamVO> list) {
      this.list = list;
   }

   public String getSearchKeyword() {
      return searchKeyword;
   }

   public void setSearchKeyword(String searchKeyword) {
      this.searchKeyword = searchKeyword;
   }

   public int getSearchNum() {
      return searchNum;
   }

   public void setSearchNum(int searchNum) {
      this.searchNum = searchNum;
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

   public int getTotalCount() {
      return totalCount;
   }

   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
   }

   public int getBlockCount() {
      return blockCount;
   }

   public void setBlockCount(int blockCount) {
      this.blockCount = blockCount;
   }

   public int getBlockPage() {
      return blockPage;
   }

   public void setBlockPage(int blockPage) {
      this.blockPage = blockPage;
   }

   public String getPagingHtml() {
      return pagingHtml;
   }

   public void setPagingHtml(String pagingHtml) {
      this.pagingHtml = pagingHtml;
   }

   public pagingAction getPage() {
      return page;
   }

   public void setPage(pagingAction page) {
      this.page = page;
   }

   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
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

   public memVO getMemParam() {
      return memParam;
   }

   public void setMemParam(memVO memParam) {
      this.memParam = memParam;
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

   public String getOld_file() {
      return old_file;
   }

   public void setOld_file(String old_file) {
      this.old_file = old_file;
   }
   public String getTeam_master() {
      return team_master;
   }
   public void setTeam_master(String team_master) {
      this.team_master = team_master;
   }
   public int getTeam_admin() {
      return team_admin;
   }
   public void setTeam_admin(int team_admin) {
      this.team_admin = team_admin;
   }

   public Map getSession() {
      return session;
   }

   public void setSession(Map session) {
      this.session = session;
   }

   public teamInfoVO getTeamInfoParam() {
      return teamInfoParam;
   }

   public void setTeamInfoParam(teamInfoVO teamInfoParam) {
      this.teamInfoParam = teamInfoParam;
   }
   

}