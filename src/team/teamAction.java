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
import main.pagingAction;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

public class teamAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private Map session;
	private List<teamVO> list = new ArrayList<teamVO>();
	private List<teamInfoVO> teamMemberList = new ArrayList<teamInfoVO>();
	private List<teamInfoVO> teamJoinList = new ArrayList<teamInfoVO>();

	private String search;
	private int topic;

	private teamVO paramClass = new teamVO();
	private teamVO resultClass;
	private memVO memParam = new memVO();
	private teamInfoVO teamInfoParam = new teamInfoVO();
	private teamInfoVO teamInfoParam2 = new teamInfoVO();

	private int team_no;

	private String fileUploadPath = "E:\\git\\Arista\\Arista\\WebContent\\team\\teamIMG\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	private String file_savname;
	private String file_orgname;
	private String teamimg;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
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

	private String pageName;
	private String mem_id;
	private File deleteFile;

	public teamAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

		setPageName("TEAM");
	}

	// 팀목록
	public String execute() throws Exception {
		memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", session.get("session_id"));
		if (getSearch() != null) {
			return search();
		}

		list = sqlMapper.queryForList("teamSQL.teamList");

		totalCount = list.size();
		String paging = "TeamList";
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	// 팀목록(검색)
	public String search() throws Exception {
		memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", session.get("session_id"));
		if (topic == 0) {
			list = sqlMapper.queryForList("teamSQL.teamSearch", "%" + getSearch() + "%");
		}

		totalCount = list.size();
		String paging = "TeamList";
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, topic, getSearch(), paging);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	// 마이팀
	public String myTeam() throws Exception {
		setPageName("MY TEAM");
		resultClass = new teamVO();
		if (session.get("session_id") != null) {
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", session.get("session_id"));
			teamInfoParam = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember1",
					(String) session.get("session_id"));
			if (memParam.getMyteam() == null) {
				return "noTeam";
			}

			resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.myTeamView", memParam.getMyteam());
			teamMemberList = sqlMapper.queryForList("teamSQL.teamMemberList", memParam.getMyteam());
			teamJoinList = sqlMapper.queryForList("teamSQL.teamJoinWait", memParam.getMyteam());
			return SUCCESS;
		}
		return LOGIN;

	}

	// 팀 상세보기
	public String view() throws Exception {
		resultClass = new teamVO();
		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.teamView", getTeam_no());
		teamInfoParam = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember1",
				(String) session.get("session_id"));

		memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", session.get("session_id"));

		return SUCCESS;
	}

	// 다운로드?
	public String download() throws Exception {

		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.selectOne", getTeam_no());

		File fileInfo = new File(fileUploadPath + resultClass.getFile_savname());

		setContentLength(fileInfo.length());
		setContentDisposition("attachment;filename=" + URLEncoder.encode(resultClass.getFile_orgname(), "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath + resultClass.getFile_savname()));

		return SUCCESS;
	}

	// 팀생성
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
		paramClass.setTeam_master((String) session.get("session_id"));

		sqlMapper.insert("teamSQL.insertTeam", paramClass);

		teamInfoParam.setTeam_id(getTeam_id());
		teamInfoParam.setMem_id((String) session.get("session_id"));
		teamInfoParam.setTeam_admin(2);

		sqlMapper.insert("teamSQL.joinTeam", teamInfoParam);

		sqlMapper.update("memSQL.agreeJoinTeam", getTeam_id());

		if (getUpload() != null) {

			String file_name = "file_" + getTeam_id();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);

			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setTeam_no(getTeam_no());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);

			sqlMapper.update("teamSQL.updateFile", paramClass);
		}else {
			String file_name = "noImage.jpg";

			paramClass.setTeam_no(getTeam_no());
			paramClass.setFile_orgname(file_name);
			paramClass.setFile_savname(file_name);
			
			sqlMapper.update("teamSQL.updateFile",paramClass);
		}
		return SUCCESS;

	}

	// 팀가입
	public String joinTeam() throws Exception {
		teamInfoParam.setMem_id((String) session.get("session_id"));
		teamInfoParam.setTeam_id(getTeam_id());

		sqlMapper.insert("teamSQL.joinTeam", teamInfoParam);

		return SUCCESS;
	}

	public String form() throws Exception {

		return SUCCESS;
	}

	// 팀정보수정
	public String modify() throws Exception {

		paramClass.setTeam_no(getTeam_no());
		paramClass.setTeam_id(getTeam_id());
		paramClass.setTeam_area(getTeam_area());
		paramClass.setTeam_type(getTeam_type());
		paramClass.setTeam_fieldtype(getTeam_fieldtype());
		paramClass.setTeam_age(getTeam_age());
		paramClass.setTeam_skill(getTeam_skill());
		paramClass.setTeam_count(getTeam_count());
		paramClass.setTeam_intro(getTeam_intro());
		
		System.out.println(getOld_file());
		sqlMapper.update("teamSQL.updateTeam", paramClass);
		if (getUpload() != null) {

			deleteFile = new File(fileUploadPath + getOld_file());

			if (deleteFile.isFile())
				FileUtils.forceDelete(deleteFile);

			String file_name = "file_" + getTeam_id();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);

			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setTeam_no(getTeam_no());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);

			sqlMapper.update("teamSQL.updateFile", paramClass);
		}

		resultClass = (teamVO) sqlMapper.queryForObject("teamSQL.teamView", getTeam_no());

		return SUCCESS;
	}

	// 팀 멤버등급관리
	public String changeAdmin() throws Exception {
		teamInfoParam.setTeam_id(getTeam_id());
		teamInfoParam.setMem_id(getMem_id());
		teamInfoParam.setTeam_admin(getTeam_admin());

		sqlMapper.update("teamSQL.TeamAdmin", teamInfoParam);
		return SUCCESS;
	}

	// 팀 가입 승인
	public String agree() throws Exception {
		teamInfoParam.setTeam_id(getTeam_id());
		teamInfoParam.setMem_id(getMem_id());
		teamInfoParam.setTeam_admin(0);
		sqlMapper.update("teamSQL.TeamAdmin", teamInfoParam);
		memParam.setM_id(getMem_id());
		memParam.setMyteam(getTeam_id());
		sqlMapper.update("memSQL.agreeJoinTeam", memParam);

		return SUCCESS;
	}

	// 팀 제명/탈퇴/가입거절
	public String withdraw() throws Exception {
		if (getMem_id().equals((String) session.get("session_id"))) {
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
			teamInfoParam = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember1",
					(String) session.get("session_id"));
		} else {
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", getMem_id());
			teamInfoParam = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember1", getMem_id());
		}
		if (memParam.getMyteam() == null) { // 가입 취소/거절
			sqlMapper.delete("teamSQL.withdrawTeam", teamInfoParam);
		} else { // 팀 탈퇴
			sqlMapper.delete("teamSQL.withdrawTeam", teamInfoParam);
			memParam.setMyteam("");
			memParam.setM_id(getMem_id());
			sqlMapper.update("memSQL.agreeJoinTeam", memParam);
		}
		return SUCCESS;
	}

	public List<teamVO> getList() {
		return list;
	}

	public void setList(List<teamVO> list) {
		this.list = list;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getTopic() {
		return topic;
	}

	public void setTopic(int topic) {
		this.topic = topic;
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

	public teamInfoVO getTeamInfoParam2() {
		return teamInfoParam2;
	}

	public void setTeamInfoParam2(teamInfoVO teamInfoParam2) {
		this.teamInfoParam2 = teamInfoParam2;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public List<teamInfoVO> getTeamMemberList() {
		return teamMemberList;
	}

	public void setTeamMemberList(List<teamInfoVO> teamMemberList) {
		this.teamMemberList = teamMemberList;
	}

	public List<teamInfoVO> getTeamJoinList() {
		return teamJoinList;
	}

	public void setTeamJoinList(List<teamInfoVO> teamJoinList) {
		this.teamJoinList = teamJoinList;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public File getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(File deleteFile) {
		this.deleteFile = deleteFile;
	}
	

}