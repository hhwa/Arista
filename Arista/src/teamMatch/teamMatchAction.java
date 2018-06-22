package teamMatch;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import matchState.matchStateVO;
import mem.memVO;
import stadium.stadiumVO;
import team.teamInfoVO;
import team.teamVO;

public class teamMatchAction extends ActionSupport implements SessionAware {
	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체
	private Map session;

	private List<teamMatchVO> list = new ArrayList<teamMatchVO>();
	private List<String> areaList = new ArrayList<String>();
	private List<String> timeList = new ArrayList<String>();
	private Map<Integer,String> imgMap = new HashMap();
	private Map<Integer,Integer> teamNoMap = new HashMap();

	private teamMatchVO teamMatchParam = new teamMatchVO(); // 파라미터를 저장할 객체
	private matchStateVO matchStateParam = new matchStateVO();// 쿼리 결과 값을 저장할 객체
	private matchStateVO matchStateResult = new matchStateVO();
	private memVO memParam = new memVO();
	private teamInfoVO teamInfoResult = new teamInfoVO();
	private teamInfoVO teamInfoParam = new teamInfoVO();
	private teamVO teamParam = new teamVO();
	private stadiumVO stadiumParam = new stadiumVO();

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 9; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String search;
	private int topic;

	private int game_no;
	private String team_id;
	private String game_day;
	private String game_time;
	private String game_time1;
	private String game_type;
	private String stadium;
	private int fee;
	private String game_area;
	private String uniform_color;
	private String content;
	private String match_type;
	private String team2_id;

	private String pageName;
	private int stadium_no;

	public teamMatchAction() throws IOException {
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
		
		for(int i=0; i<24; i++) {
			if(i<10)
				timeList.add("0"+i+"시");
			else
				timeList.add(i+"시");
		}
		
		setPageName("TEAM MATCH");
	}

	public String execute() throws Exception {
		memParam = new memVO();
		String paging = "TeamMatchList";

		if (getSearch() == null || getSearch().equals("")) {
			list = sqlMapper.queryForList("teamMatchSQL.teamMatchList");
			totalCount = list.size();// 전체 글 갯수
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성
		} else {
			HashMap searchMap = new HashMap();
			String topics[] = { "subject", "name", "content" };
			searchMap.put("param1", topics[getTopic()]);
			searchMap.put("param2", "%" + getSearch() + "%");
			list = sqlMapper.queryForList("teamMatchSQL.teamMatchSearch", searchMap);
			totalCount = list.size();// 전체 글 갯수
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, getTopic(), getSearch(), paging);// pagingAction
																														// 객체
																														// 생성
		}
		if(session.get("session_id")!=null) {
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
			if (memParam.getMyteam() != null) {
				teamInfoParam.setMem_id((String) session.get("session_id"));
				teamInfoParam.setTeam_id(memParam.getMyteam());
				teamInfoResult = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember", teamInfoParam);//team_admin 구하기위한 메소드
			}
		}
		pagingHtml = page.getPagingHtml().toString(); // 페이지 HTML 생성.

		// 현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;

		// 현재 페이지의 마지막 글의 번호가 전체의 마지막 글번호보다 작으면
		// lastCount를 +1번호로 설정
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		if(getGame_no()>0) {
			teamMatchParam = (teamMatchVO) sqlMapper.queryForObject("teamMatchSQL.teamMatchView",getGame_no());
			String temp[]=teamMatchParam.getGame_time().split("~");
			setGame_time(temp[0]);
			setGame_time1(temp[1]);
		}
		// 전체 리스트에서 현재 페이지 만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		
		for(int i=0; i<list.size(); i++) {
			List<teamMatchVO> listMap = list;
			team_id=listMap.get(i).getTeam_id();
			team2_id=listMap.get(i).getTeam2_id();
			String team_img = (String) sqlMapper.queryForObject("teamSQL.teamIMGView",team_id);
			if(team_img == null) {
				team_img = "noImage.jpg";
			}
			imgMap.put(i, team_img);
			team_img = (String) sqlMapper.queryForObject("teamSQL.teamIMGView",team2_id);
			if(team_img==null) {
				team_img = "noImage.jpg";
			}
			imgMap.put(i+10, team_img);
			teamParam = (teamVO) sqlMapper.queryForObject("teamSQL.myTeamView",team_id);
			teamNoMap.put(i, teamParam.getTeam_no());
			if(team2_id != null) {
				teamParam = (teamVO) sqlMapper.queryForObject("teamSQL.myTeamView",team2_id);
				teamNoMap.put(i+10, teamParam.getTeam_no());
			}
		}
		return SUCCESS;
	}

	public String form() throws Exception {
		if(getStadium_no()>0) {
			stadiumParam = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectOne",getStadium_no());
			
			teamMatchParam.setGame_day(getGame_day());
			teamMatchParam.setStadium(stadiumParam.getStadium_name());
			teamMatchParam.setGame_type(stadiumParam.getStadium_type().substring(0, 2));
			teamMatchParam.setGame_area(stadiumParam.getStadium_addr().substring(0, 2));
			
		}
		
		return SUCCESS;
	}

	public String create() throws Exception {
		
		memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
		teamMatchParam.setTeam_id(memParam.getMyteam());
		teamMatchParam.setGame_day(getGame_day());
		teamMatchParam.setGame_time(getGame_time()+"~"+getGame_time1());
		teamMatchParam.setGame_type(getGame_type());
		teamMatchParam.setMatch_type("Team");
		teamMatchParam.setStadium(getStadium());
		teamMatchParam.setFee(getFee());
		teamMatchParam.setUniform_color(getUniform_color());
		teamMatchParam.setGame_area(getGame_area());
		teamMatchParam.setContent(getContent());

		sqlMapper.insert("teamMatchSQL.insertTeamMatch", teamMatchParam);

		teamMatchParam = (teamMatchVO) sqlMapper.queryForObject("teamMatchSQL.selectLastNo");

		matchStateParam.setGame_no(teamMatchParam.getGame_no());
		matchStateParam.setTeam_id(memParam.getMyteam());
		matchStateParam.setGame_day(getGame_day());
		matchStateParam.setGame_time(getGame_time()+"~"+getGame_time1());
		matchStateParam.setGame_type(getGame_type());
		matchStateParam.setMatch_type("Team");
		matchStateParam.setStadium(getStadium());
		matchStateParam.setFee(getFee());
		matchStateParam.setUniform_color(getUniform_color());
		matchStateParam.setGame_area(getGame_area());
		matchStateParam.setContent(getContent());

		sqlMapper.insert("matchStateSQL.insertMatch", matchStateParam);

		return SUCCESS;
	}

	public String modify() throws Exception {
		
		teamMatchParam.setGame_no(getGame_no());
		teamMatchParam.setGame_time(getGame_time()+"~"+getGame_time1());
		teamMatchParam.setGame_type(getGame_type());
		teamMatchParam.setStadium(getStadium());
		teamMatchParam.setFee(getFee());
		teamMatchParam.setUniform_color(getUniform_color());
		teamMatchParam.setGame_area(getGame_area());
		teamMatchParam.setContent(getContent());
		
		sqlMapper.update("teamMatchSQL.updateTeamMatch",teamMatchParam);
		
		matchStateParam.setGame_no(getGame_no());
		matchStateParam.setGame_time(getGame_time()+"~"+getGame_time1());
		matchStateParam.setGame_type(getGame_type());
		matchStateParam.setMatch_type("Team");
		matchStateParam.setStadium(getStadium());
		matchStateParam.setFee(getFee());
		matchStateParam.setUniform_color(getUniform_color());
		matchStateParam.setGame_area(getGame_area());
		matchStateParam.setContent(getContent());

		sqlMapper.update("matchStateSQL.updateTeamMatch",matchStateParam);
		
		return SUCCESS;
	}

	// 팀매치 신청
	public String join() throws Exception {
		
		teamMatchParam = (teamMatchVO) sqlMapper.queryForObject("teamMatchSQL.teamMatchView", getGame_no());
		matchStateParam.setGame_no(teamMatchParam.getGame_no());
		matchStateParam.setMatch_type(teamMatchParam.getMatch_type());
		
		matchStateResult = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchTypeView", matchStateParam);
		memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
		if (matchStateResult.getTeam_id().equals(memParam.getMyteam())) {
			return ERROR;
		}
		matchStateResult.setTeam2_id(memParam.getMyteam());
		teamMatchParam.setTeam2_id(memParam.getMyteam());
		sqlMapper.update("teamMatchSQL.joinTeamMatch", teamMatchParam);
		sqlMapper.update("matchStateSQL.MatchUp", matchStateResult);

		return SUCCESS;
	}

	// 팀매치 취소
	public String cancel() throws Exception {
		teamMatchParam = new teamMatchVO();
		matchStateParam = new matchStateVO();
		matchStateResult = new matchStateVO();
		teamMatchParam = (teamMatchVO) sqlMapper.queryForObject("teamMatchSQL.teamMatchView", getGame_no());
		matchStateParam.setGame_no(teamMatchParam.getGame_no());
		matchStateParam.setMatch_type(teamMatchParam.getMatch_type());

		matchStateResult = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchTypeView", matchStateParam);
		matchStateResult.setTeam2_id("");
		sqlMapper.update("teamMatchSQL.cancelTeamMatch", getGame_no());
		sqlMapper.update("matchStateSQL.cancelMatch", matchStateResult);
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		
		matchStateParam.setGame_no(getGame_no());
		matchStateParam.setMatch_type("Team");
		matchStateResult = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchTypeView",matchStateParam);
		
		sqlMapper.delete("teamMatchSQL.deleteTeamMatch",getGame_no());
		sqlMapper.delete("matchStateSQL.deleteMatch",matchStateResult.getMatch_no());
		
		return SUCCESS;
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

	public List<String> getTimeList() {
		return timeList;
	}

	public void setTimeList(List<String> timeList) {
		this.timeList = timeList;
	}

	public teamMatchVO getTeamMatchParam() {
		return teamMatchParam;
	}

	public void setTeamMatchParam(teamMatchVO teamMatchParam) {
		this.teamMatchParam = teamMatchParam;
	}

	public matchStateVO getMatchStateParam() {
		return matchStateParam;
	}

	public void setMatchStateParam(matchStateVO matchStateParam) {
		this.matchStateParam = matchStateParam;
	}

	public matchStateVO getMatchStateResult() {
		return matchStateResult;
	}

	public void setMatchStateResult(matchStateVO matchStateResult) {
		this.matchStateResult = matchStateResult;
	}

	public memVO getMemParam() {
		return memParam;
	}

	public void setMemParam(memVO memParam) {
		this.memParam = memParam;
	}

	public teamVO getTeamParam() {
		return teamParam;
	}

	public void setTeamParam(teamVO teamParam) {
		this.teamParam = teamParam;
	}

	public stadiumVO getStadiumParam() {
		return stadiumParam;
	}

	public void setStadiumParam(stadiumVO stadiumParam) {
		this.stadiumParam = stadiumParam;
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

	public String getGame_time() {
		return game_time;
	}

	public void setGame_time(String game_time) {
		this.game_time = game_time;
	}

	public String getGame_time1() {
		return game_time1;
	}

	public void setGame_time1(String game_time1) {
		this.game_time1 = game_time1;
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

	public String getTeam2_id() {
		return team2_id;
	}

	public void setTeam2_id(String team2_id) {
		this.team2_id = team2_id;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public teamInfoVO getTeamInfoResult() {
		return teamInfoResult;
	}

	public void setTeamInfoResult(teamInfoVO teamInfoResult) {
		this.teamInfoResult = teamInfoResult;
	}

	public teamInfoVO getTeamInfoParam() {
		return teamInfoParam;
	}

	public void setTeamInfoParam(teamInfoVO teamInfoParam) {
		this.teamInfoParam = teamInfoParam;
	}

	public teamInfoVO getteamInfoParam() {
		return teamInfoParam;
	}

	public void setteamInfoParam(teamInfoVO teamInfoParam) {
		this.teamInfoParam = teamInfoParam;
	}

	public Map<Integer, String> getImgMap() {
		return imgMap;
	}

	public void setImgMap(Map<Integer, String> imgMap) {
		this.imgMap = imgMap;
	}

	public Map<Integer, Integer> getTeamNoMap() {
		return teamNoMap;
	}

	public void setTeamNoMap(Map<Integer, Integer> teamNoMap) {
		this.teamNoMap = teamNoMap;
	}

	public int getStadium_no() {
		return stadium_no;
	}

	public void setStadium_no(int stadium_no) {
		this.stadium_no = stadium_no;
	}

}
