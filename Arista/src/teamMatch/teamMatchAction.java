package teamMatch;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import matchState.matchStateVO;

public class teamMatchAction extends ActionSupport{
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<teamMatchVO> list = new ArrayList<teamMatchVO>();
	private List<String> areaList = new ArrayList<String>();
	
	private teamMatchVO paramClass; //파라미터를 저장할 객체
	private matchStateVO resultClass;//쿼리 결과 값을 저장할 객체
	
	private int currentPage; //현재 페이지
	private int totalCount;	//총 게시물의 수
	private int blockCount = 10;	//한 페이지의 게시물의 수
	private int blockPage=5;	//한화면에 보여줄 페이지 수
	private String pagingHtml;	//페이징을 구현한 HTML
	private pagingAction page;	//페이징 클래스
	private String search;
	private int topic;
	
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
	
	public teamMatchAction() throws IOException{
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
	}
	public String execute() throws Exception {
		currentPage = 1;
		if(getSearch()==null||getSearch().equals("")) {
			list = sqlMapper.queryForList("teamMatchSQL.teamMatchList");
			totalCount = list.size();//전체 글 갯수
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage);//pagingAction 객체 생성
		}else {
			HashMap searchMap = new HashMap();
			String topics[]= {"subject","name","content"};
			searchMap.put("param1",topics[getTopic()]);
			searchMap.put("param2","%"+getSearch()+"%");
			list = sqlMapper.queryForList("teamMatchSQL.teamMatchSearch",searchMap);
			totalCount = list.size();//전체 글 갯수
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage,getSearch());//pagingAction 객체 생성
		}
		
		pagingHtml = page.getPagingHtml().toString(); //페이지 HTML 생성.
		
		//현재 페이지에서 보여줄 마지막 글의 번호 설정.
		int lastCount = totalCount;
		
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글번호보다 작으면
		//lastCount를 +1번호로 설정
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount() + 1;
		
		//전체 리스트에서 현재 페이지 만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}
	public String form() throws Exception {
		return SUCCESS;
	}
	public String create() throws Exception {
		paramClass = new teamMatchVO();
		resultClass = new matchStateVO();
		
		paramClass.setTeam_id(getTeam_id());
		paramClass.setGame_day(getGame_day());
		paramClass.setGame_type(getGame_type());
		paramClass.setMatch_type("Team");
		paramClass.setStadium(getStadium());
		paramClass.setFee(getFee());
		paramClass.setUniform_color(getUniform_color());
		paramClass.setGame_area(getGame_area());
		paramClass.setContent(getContent());
		
		sqlMapper.insert("teamMatchSQL.insertTeamMatch",paramClass);
		
		paramClass = (teamMatchVO) sqlMapper.queryForObject("teamMatchSQL.selectLastNo");
		
		resultClass.setGame_no(paramClass.getGame_no());
		resultClass.setTeam_id(getTeam_id());
		resultClass.setGame_day(getGame_day());
		resultClass.setGame_type(getGame_type());
		resultClass.setMatch_type("Team");
		resultClass.setStadium(getStadium());
		resultClass.setFee(getFee());
		resultClass.setUniform_color(getUniform_color());
		resultClass.setGame_area(getGame_area());
		resultClass.setContent(getContent());
		
		sqlMapper.insert("matchStateSQL.insertMatch",resultClass);
		
		return SUCCESS;
	}
	public String modify() throws Exception {
		return SUCCESS;
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
	public teamMatchVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(teamMatchVO paramClass) {
		this.paramClass = paramClass;
	}
	public matchStateVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(matchStateVO resultClass) {
		this.resultClass = resultClass;
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
	
	
}
