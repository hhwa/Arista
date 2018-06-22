package main;

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
import team.teamInfoVO;
import teamMatch.teamMatchVO;

public class mainAction extends ActionSupport implements SessionAware {

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<matchStateVO> list = new ArrayList<matchStateVO>();
	private Map<Integer,String> imgMap = new HashMap();
	private matchStateVO paramClass = new matchStateVO();
	private memVO memParam = new memVO();
	private teamInfoVO teamInfoParam = new teamInfoVO();
	private teamInfoVO teamInfoResult = new teamInfoVO();

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 9; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String mem_id;
	private String pageName;
	private String team_id;
	private String team2_id;

	private Map session;

	public mainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		setPageName("TOTAL MATCH");
		memParam = new memVO();

		if (session.get("session_id") == null) {
			list = sqlMapper.queryForList("matchStateSQL.matchList");
		} else {
			list = sqlMapper.queryForList("matchStateSQL.matchList2", (String) session.get("session_id"));
			memParam = (memVO) sqlMapper.queryForObject("memSQL.myTeam", (String) session.get("session_id"));
			if (memParam.getMyteam() != null) {
				teamInfoParam.setMem_id((String) session.get("session_id"));
				teamInfoParam.setTeam_id(memParam.getMyteam());

				teamInfoResult = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember", teamInfoParam);
			}
		}

		totalCount = list.size();// 전체 글 갯수
		String paging = "main";
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
		
		for(int i=0; i<list.size(); i++) {
			List<matchStateVO> listMap = list;
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
		}
		return SUCCESS;
	}

	public List<matchStateVO> getList() {
		return list;
	}

	public void setList(List<matchStateVO> list) {
		this.list = list;
	}

	public matchStateVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(matchStateVO paramClass) {
		this.paramClass = paramClass;
	}

	public memVO getMemParam() {
		return memParam;
	}

	public void setMemParam(memVO memParam) {
		this.memParam = memParam;
	}

	public teamInfoVO getTeamInfoParam() {
		return teamInfoParam;
	}

	public void setTeamInfoParam(teamInfoVO teamInfoParam) {
		this.teamInfoParam = teamInfoParam;
	}

	public teamInfoVO getTeamInfoResult() {
		return teamInfoResult;
	}

	public void setTeamInfoResult(teamInfoVO teamInfoResult) {
		this.teamInfoResult = teamInfoResult;
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

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public String getTeam_id() {
		return team_id;
	}

	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}

	public String getTeam2_id() {
		return team2_id;
	}

	public void setTeam2_id(String team2_id) {
		this.team2_id = team2_id;
	}

	public Map<Integer, String> getImgMap() {
		return imgMap;
	}

	public void setImgMap(Map<Integer, String> imgMap) {
		this.imgMap = imgMap;
	}

}
