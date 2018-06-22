package matchState;

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
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import matchState.matchStateVO;
import mem.memVO;
import soloMatch.soloMatchVO;
import teamMatch.teamMatchVO;
import main.pagingAction;

public class matchAction extends ActionSupport implements SessionAware {

	private Map session;

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<matchStateVO> list = new ArrayList<matchStateVO>();

	private matchStateVO matchStateParam = new matchStateVO();
	private soloMatchVO soloMatchParam = new soloMatchVO();
	private joinSoloVO joinSoloParam = new joinSoloVO();
	private teamMatchVO teamMatchParam = new teamMatchVO();
	private memVO memParam = new memVO();

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 5; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String search;
	private int topic;
	private int match_no;
	private int game_no;
	private String mem_id;
	private String pageName;

	public matchAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	// selectMatch.jsp
	public String form() throws Exception {
		setPageName("매치 선택");
		if(session.get("session_id")==null) {
			return LOGIN;
		}
		return SUCCESS;
	}

	// 전체매치 리스트
	public String execute() throws Exception {
		setPageName("전체 매치");

		list = sqlMapper.queryForList("matchStateSQL.matchList");
		totalCount = list.size();// 전체 글 갯수
		String paging = "matchList";
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
		// int isJoinSoloMatch = (int)
		// sqlMapper.queryForObject("joinSoloSQL.isJoinSoloMatch",)
		return SUCCESS;
	}

	// 매치 신청
	public String join() throws Exception {

		matchStateParam = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchView", getMatch_no());
		soloMatchParam = (soloMatchVO) sqlMapper.queryForObject("soloMatchSQL.soloMatchView",matchStateParam.getGame_no());

		joinSoloParam.setMatch_no(getMatch_no());
		joinSoloParam.setMem_id((String) session.get("session_id"));
		joinSoloParam.setGame_no(matchStateParam.getGame_no());

		if (matchStateParam.getMatch_type().equals("Solo")) {
			sqlMapper.insert("joinSoloSQL.joinSoloMatch", joinSoloParam);
			int count = (int) sqlMapper.queryForObject("joinSoloSQL.joinSoloMatchCount", getMatch_no());

			matchStateParam.setPeople_count(count);
			soloMatchParam.setPeople_count(count);
			sqlMapper.update("soloMatchSQL.soloCount", soloMatchParam);
			sqlMapper.update("matchStateSQL.soloCount", matchStateParam);
		} else {
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
			if (matchStateParam.getTeam_id().equals(memParam.getMyteam())) {
				return ERROR;
			}
			teamMatchParam.setTeam2_id(memParam.getMyteam());
			teamMatchParam.setGame_no(matchStateParam.getGame_no());

			matchStateParam.setTeam2_id(memParam.getMyteam());
			matchStateParam.setMatch_no(getMatch_no());

			sqlMapper.update("teamMatchSQL.joinTeamMatch", teamMatchParam);
			sqlMapper.update("matchStateSQL.MatchUp", matchStateParam);
		}
		return SUCCESS;
	}

	// 팀&솔로매치 취소(상대팀/개인회원)
	public String cancel() throws Exception {
		matchStateParam = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchView", getMatch_no());

		if (matchStateParam.getMatch_type().equals("Solo")) {
			joinSoloParam.setMatch_no(getMatch_no());
			joinSoloParam.setMem_id((String) session.get("session_id"));
			sqlMapper.delete("joinSoloSQL.cancelSoloMatch", joinSoloParam);

			int count = (int) sqlMapper.queryForObject("joinSoloSQL.joinSoloMatchCount", getMatch_no());

			matchStateParam.setPeople_count(count);
			soloMatchParam.setPeople_count(count);
			sqlMapper.update("soloMatchSQL.soloCount", soloMatchParam);
			sqlMapper.update("matchStateSQL.soloCount", matchStateParam);
		} else {
			matchStateParam = new matchStateVO();
			matchStateParam.setMatch_no(getMatch_no());
			matchStateParam.setTeam2_id("");
			sqlMapper.update("matchStateSQL.cancelMatch", matchStateParam);
			sqlMapper.update("teamMatchSQL.cancelTeamMatch", matchStateParam.getGame_no());
		}

		return SUCCESS;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<matchStateVO> getList() {
		return list;
	}

	public void setList(List<matchStateVO> list) {
		this.list = list;
	}

	public matchStateVO getMatchStateParam() {
		return matchStateParam;
	}

	public void setMatchStateParam(matchStateVO matchStateParam) {
		this.matchStateParam = matchStateParam;
	}

	public soloMatchVO getSoloMatchParam() {
		return soloMatchParam;
	}

	public void setSoloMatchParam(soloMatchVO soloMatchParam) {
		this.soloMatchParam = soloMatchParam;
	}

	public joinSoloVO getJoinSoloParam() {
		return joinSoloParam;
	}

	public void setJoinSoloParam(joinSoloVO joinSoloParam) {
		this.joinSoloParam = joinSoloParam;
	}

	public teamMatchVO getTeamMatchParam() {
		return teamMatchParam;
	}

	public void setTeamMatchParam(teamMatchVO teamMatchParam) {
		this.teamMatchParam = teamMatchParam;
	}

	public memVO getMemParam() {
		return memParam;
	}

	public void setMemParam(memVO memParam) {
		this.memParam = memParam;
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

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

}
