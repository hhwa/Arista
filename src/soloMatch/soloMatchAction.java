package soloMatch;

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
import matchState.joinSoloVO;
import matchState.matchStateVO;

public class soloMatchAction extends ActionSupport implements SessionAware{
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<soloMatchVO> list = new ArrayList<soloMatchVO>();
	private Map session;
	private soloMatchVO soloMatchParam = new soloMatchVO(); //파라미터를 저장할 객체
	private matchStateVO matchStateParam = new matchStateVO();//쿼리 결과 값을 저장할 객체
	private matchStateVO matchStateResult = new matchStateVO();
	private joinSoloVO joinSoloParam = new joinSoloVO();
	
	private int currentPage=1; //현재 페이지

	private int totalCount;	//총 게시물의 수
	private int blockCount = 5;	//한 페이지의 게시물의 수
	private int blockPage=5;	//한화면에 보여줄 페이지 수
	private String pagingHtml;	//페이징을 구현한 HTML
	private pagingAction page;	//페이징 클래스
	private String search;
	private int topic;
	
	private int game_no;
	private String game_day;
	private String game_type;
	private String stadium;
	private int fee;
	private String game_area;
	private String content;
	private int people_max;			//경기최대신청인원
	private int people_count;		//경기신청인원수
	private String match_type;
	
	private int match_no;
	private String mem_id;
	
	private List<String> areaList = new ArrayList<String>();
	private String pageName;

	public soloMatchAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
		areaList.add("인천");		areaList.add("서울");		areaList.add("경기");		areaList.add("강원");
		areaList.add("충남");		areaList.add("충북");		areaList.add("세종");		areaList.add("대전");
		areaList.add("전북");		areaList.add("전남");		areaList.add("광주");		areaList.add("경북");
		areaList.add("경남");		areaList.add("대구");		areaList.add("울산");		areaList.add("부산");
	}
	
	//soloMatchList
	public String execute() throws Exception {
		setPageName("SOLO MATCH");
		String paging="SoloMatchList";
		if(getSearch()==null||getSearch().equals("")) {
			list = sqlMapper.queryForList("soloMatchSQL.soloMatchList");
			totalCount = list.size();//전체 글 갯수
			
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage,paging);//pagingAction 객체 생성
		}else {
			HashMap searchMap = new HashMap();
			String topics[]= {"subject","name","content"};
			searchMap.put("param1",topics[getTopic()]);
			searchMap.put("param2","%"+getSearch()+"%");
			list = sqlMapper.queryForList("soloMatchSQL.soloMatchSearch",searchMap);
			totalCount = list.size();//전체 글 갯수
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage,getTopic(),getSearch(),paging);//pagingAction 객체 생성
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
	
	//솔로 매치 생성 폼 (관리자)
	public String form() throws Exception {
		setPageName("MAKE SOLO MATCH");
		return SUCCESS;
	}
	//솔로 매치 생성
	public String create() throws Exception {
		
		soloMatchParam = new soloMatchVO();
		matchStateParam = new matchStateVO();
		
		soloMatchParam.setGame_day(getGame_day());
		soloMatchParam.setGame_type(getGame_type());
		soloMatchParam.setMatch_type("Solo");
		soloMatchParam.setStadium(getStadium());
		soloMatchParam.setFee(getFee());
		soloMatchParam.setGame_area(getGame_area());
		soloMatchParam.setContent(getContent());
		soloMatchParam.setPeople_count(getPeople_count());
		soloMatchParam.setPeople_max(getPeople_max());
		
		sqlMapper.insert("soloMatchSQL.insertSoloMatch", soloMatchParam);
		
		soloMatchParam = (soloMatchVO) sqlMapper.queryForObject("soloMatchSQL.selectLastNo");
		
		matchStateParam.setGame_no(soloMatchParam.getGame_no());
		matchStateParam.setGame_day(getGame_day());
		matchStateParam.setGame_type(getGame_type());
		matchStateParam.setMatch_type("Solo");
		matchStateParam.setStadium(getStadium());
		matchStateParam.setFee(getFee());
		matchStateParam.setGame_area(getGame_area());
		matchStateParam.setContent(getContent());
		matchStateParam.setPeople_count(getPeople_count());
		matchStateParam.setPeople_max(getPeople_max());
		
		
		sqlMapper.insert("matchStateSQL.insertMatch",matchStateParam);
			
		return SUCCESS;
	}
	//솔로매치 수정
	public String modify() throws Exception {
		setPageName("솔로매치 수정");
		soloMatchParam = new soloMatchVO();
		matchStateParam = new matchStateVO();
		
		soloMatchParam.setGame_day(getGame_day());
		soloMatchParam.setGame_type(getGame_type());
		soloMatchParam.setStadium(getStadium());
		soloMatchParam.setFee(getFee());
		soloMatchParam.setGame_area(getGame_area());
		soloMatchParam.setContent(getContent());
		
		sqlMapper.update("soloMatchSQL.updateSoloMatch",soloMatchParam);
		return SUCCESS;
	}
	//솔로매치 신청 처리
	public String join() throws Exception {
		
		soloMatchParam = (soloMatchVO) sqlMapper.queryForObject("soloMatchSQL.soloMatchView",getGame_no());
		matchStateParam.setGame_no(soloMatchParam.getGame_no());
		matchStateParam.setGame_type(soloMatchParam.getGame_type());
		
		matchStateResult = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchTypeView",matchStateParam);
		joinSoloParam.setMatch_no(matchStateResult.getMatch_no());
		joinSoloParam.setMem_id((String)session.get("session_id"));
		
		sqlMapper.insert("joinSoloSQL.joinSoloMatch",joinSoloParam);
		int count = (int) sqlMapper.queryForObject("joinSoloSQL.joinSoloMatchCount",getMatch_no());
		matchStateResult.setPeople_count(count);
		soloMatchParam.setPeople_count(count);
		
		sqlMapper.update("soloMatchSQL.soloCount",soloMatchParam);
		sqlMapper.update("matchStateSQL.soloCount",matchStateResult);
		
		return SUCCESS;
	}
	//솔로매치 취소
	public String cancel() throws Exception{
		
		
		return SUCCESS;
	}

	public List<soloMatchVO> getList() {
		return list;
	}

	public void setList(List<soloMatchVO> list) {
		this.list = list;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public soloMatchVO getSoloMatchParam() {
		return soloMatchParam;
	}

	public void setSoloMatchParam(soloMatchVO soloMatchParam) {
		this.soloMatchParam = soloMatchParam;
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

	public joinSoloVO getJoinSoloParam() {
		return joinSoloParam;
	}

	public void setJoinSoloParam(joinSoloVO joinSoloParam) {
		this.joinSoloParam = joinSoloParam;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPeople_max() {
		return people_max;
	}

	public void setPeople_max(int people_max) {
		this.people_max = people_max;
	}

	public int getPeople_count() {
		return people_count;
	}

	public void setPeople_count(int people_count) {
		this.people_count = people_count;
	}

	public String getMatch_type() {
		return match_type;
	}

	public void setMatch_type(String match_type) {
		this.match_type = match_type;
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

	public List<String> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<String> areaList) {
		this.areaList = areaList;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	

	
}
