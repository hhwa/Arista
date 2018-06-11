package mypage;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import matchState.joinSoloVO;
import matchState.matchStateVO;
import mem.memVO;
import teamMatch.teamMatchVO;

public class mypageAction extends ActionSupport implements SessionAware {

	private Map session;
	private HttpServletRequest request;

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<teamMatchVO> list = new ArrayList<teamMatchVO>();
	private List<String> areaList = new ArrayList<String>();
	private List<String> posiList = new ArrayList<String>();

	private memVO memParam = new memVO();
	private memVO memResult = new memVO();
	private joinSoloVO joinParam = new joinSoloVO();

	private teamMatchVO teamParam = new teamMatchVO(); // 파라미터를 저장할 객체
	private matchStateVO matchStateParam = new matchStateVO();// 쿼리 결과 값을 저장할 객체

	// private String fileUploadPath =
	// "E:\\git\\Arista\\Arista\\WebContent\\mypage\\image";
	private String fileUploadPath = System.getProperty("user.dir") + "\\upload\\";
	// private String fileUploadPath= this.getClass().getResource("").getPath();

	private int currentPage; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String search;
	private int topic;

	// 내정보
	private String m_id; // 아이디
	private String m_passwd; // 비밀번호
	private String m_name; // 이름
	private String m_mobilephone; // 핸드폰 번호
	private int m_birthyear; // 생년월일
	private String m_region; // 지역
	private String m_email; // 이메일
	private String m_position; // 포지션
	private int admin_yn; // 관리자 유무
	private String prof_image_org; // 이미지
	private String prof_image_save; // 이미지
	private Date m_joindate; // 가입일
	private String m_nickname; // 닉네임
	private File upload;

	// 매치정보
	private int game_no;
	private String team_id;
	private String game_day;
	private String game_type;
	private String stadium;
	private int fee;
	private String game_area;
	private String uniform_color;
	private String content;
	private String match_type;

	// 조인정보
	private int match_no;
	private String mem_id;

	private String pageName;
	
	public mypageAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

		areaList.add("인천");
		areaList.add("서울");
		areaList.add("경기");
		areaList.add("강원");
		areaList.add("충남");
		areaList.add("충북");
		areaList.add("세종");
		areaList.add("대전");
		areaList.add("전북");
		areaList.add("전남");
		areaList.add("광주");
		areaList.add("경북");
		areaList.add("경남");
		areaList.add("대구");
		areaList.add("울산");
		areaList.add("부산");

		posiList.add("LWF");
		posiList.add("ST");
		posiList.add("RWF");
		posiList.add("LWM");
		posiList.add("CAM");
		posiList.add("CM");
		posiList.add("CDM");
		posiList.add("CB");
		posiList.add("LB");
		posiList.add("LWB");
		posiList.add("RB");
		posiList.add("RWB");
		posiList.add("GK");

	}

	public String layout() throws Exception {
		memParam = (memVO) sqlMapper.queryForObject("memSQL.memberView", (String) session.get("session_id"));

		if (memParam == null) {
			return LOGIN;
		}

		return SUCCESS;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		return SUCCESS;
	}

	// 내정보 상세보기
	public String view() throws Exception {

		setPageName("MY PAGE");
		memParam = (memVO) sqlMapper.queryForObject("memSQL.memberView", session.get("session_id"));

		if (memParam != null) {
			if (memParam.getM_passwd().equals(getM_passwd())) {
				if (memParam.getProf_image_save() != null) {
					memParam.setProf_image_save(fileUploadPath + memParam.getProf_image_save());
					System.out.println(memParam.getProf_image_save());
				}
				return SUCCESS;
			}
		}
		return ERROR;

	}

	// 내가 등록한 매치글
	public String TeamMatchInfo() throws Exception {

		setPageName("내가 등록한 매치글");
		if (session.get("session_id") != null) {
			memParam = new memVO();
			currentPage = 1;
			String paging = "TeamMatchInfo";
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
			list = sqlMapper.queryForList("matchStateSQL.myteamMatchView", memParam.getMyteam());
			totalCount = list.size();// 전체 글 갯수
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성

			pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

			// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
			int lastCount = totalCount;

			// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글번호보다 작으면
			// lastCount를 +1번호로 설정
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			// 전체 리스트에서 현재 페이지 만큼의 리스트만 가져온다.
			list = list.subList(page.getStartCount(), lastCount);
			return SUCCESS;
		}
		return LOGIN;
	}

	// 내가 신청한 매치글
	public String myMatch() throws Exception {
		setPageName("내가 신청한 매치글");
		if (session.get("session_id") != null) {
			currentPage = 1;
			String paging = "MyMatchInfo";
			list = sqlMapper.queryForList("matchStateSQL.myMatchView", (String) session.get("session_id"));
			totalCount = list.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);

			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			return SUCCESS;
		}
		return LOGIN;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<teamMatchVO> getList() {
		return list;
	}

	public void setList(List<teamMatchVO> list) {
		this.list = list;
	}

	public List<String> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<String> areaList) {
		this.areaList = areaList;
	}

	public memVO getMemParam() {
		return memParam;
	}

	public void setMemParam(memVO memParam) {
		this.memParam = memParam;
	}

	public memVO getMemResult() {
		return memResult;
	}

	public void setMemResult(memVO memResult) {
		this.memResult = memResult;
	}

	public teamMatchVO getTeamParam() {
		return teamParam;
	}

	public void setTeamParam(teamMatchVO teamParam) {
		this.teamParam = teamParam;
	}

	public matchStateVO getMatchStateParam() {
		return matchStateParam;
	}

	public void setMatchStateParam(matchStateVO matchStateParam) {
		this.matchStateParam = matchStateParam;
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

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_mobilephone() {
		return m_mobilephone;
	}

	public void setM_mobilephone(String m_mobilephone) {
		this.m_mobilephone = m_mobilephone;
	}

	public int getM_birthyear() {
		return m_birthyear;
	}

	public void setM_birthyear(int m_birthyear) {
		this.m_birthyear = m_birthyear;
	}

	public String getM_region() {
		return m_region;
	}

	public void setM_region(String m_region) {
		this.m_region = m_region;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public int getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}

	public String getProf_image_org() {
		return prof_image_org;
	}

	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}

	public String getProf_image_save() {
		return prof_image_save;
	}

	public void setProf_image_save(String prof_image_save) {
		this.prof_image_save = prof_image_save;
	}

	public Date getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public String getTeam_id() {
		return team_id;
	}

	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}

	public String getGame_day() {
		return game_day;
	}

	public void setGame_day(String game_day) {
		this.game_day = game_day;
	}

	public String getGame_type() {
		return game_type;
	}

	public void setGame_type(String game_type) {
		this.game_type = game_type;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public String getGame_area() {
		return game_area;
	}

	public void setGame_area(String game_area) {
		this.game_area = game_area;
	}

	public String getUniform_color() {
		return uniform_color;
	}

	public void setUniform_color(String uniform_color) {
		this.uniform_color = uniform_color;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMatch_type() {
		return match_type;
	}

	public void setMatch_type(String match_type) {
		this.match_type = match_type;
	}

	public joinSoloVO getJoinParam() {
		return joinParam;
	}

	public void setJoinParam(joinSoloVO joinParam) {
		this.joinParam = joinParam;
	}

	public int getMatch_no() {
		return match_no;
	}

	public void setMatch_no(int match_no) {
		this.match_no = match_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public List<String> getPosiList() {
		return posiList;
	}

	public void setPosiList(List<String> posiList) {
		this.posiList = posiList;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

}