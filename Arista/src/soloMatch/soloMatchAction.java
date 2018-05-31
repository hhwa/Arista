package soloMatch;

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
import matchState.joinSoloVO;
import matchState.matchStateVO;

public class soloMatchAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<soloMatchVO> list = new ArrayList<soloMatchVO>();
	
	private soloMatchVO paramClass; //파라미터를 저장할 객체
	private matchStateVO resultClass;//쿼리 결과 값을 저장할 객체
	private matchStateVO resultClass2;
	private joinSoloVO joinSoloClass;
	
	private int currentPage; //현재 페이지
	

	private int totalCount;	//총 게시물의 수
	private int blockCount = 10;	//한 페이지의 게시물의 수
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

	public soloMatchAction() throws IOException{
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
			list = sqlMapper.queryForList("soloMatchSQL.soloMatchList");
			totalCount = list.size();//전체 글 갯수
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage);//pagingAction 객체 생성
		}else {
			HashMap searchMap = new HashMap();
			String topics[]= {"subject","name","content"};
			searchMap.put("param1",topics[getTopic()]);
			searchMap.put("param2","%"+getSearch()+"%");
			list = sqlMapper.queryForList("soloMatchSQL.soloMatchSearch",searchMap);
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
	
	//솔로 매치 생성 폼 (관리자)
	public String form() throws Exception {
		return SUCCESS;
	}
	//솔로 매치 생성
	public String create() throws Exception {
		paramClass = new soloMatchVO();
		resultClass = new matchStateVO();
		
		paramClass.setGame_day(getGame_day());
		paramClass.setGame_type(getGame_type());
		paramClass.setMatch_type("Solo");
		paramClass.setStadium(getStadium());
		paramClass.setFee(getFee());
		paramClass.setGame_area(getGame_area());
		paramClass.setContent(getContent());
		paramClass.setPeople_count(getPeople_count());
		paramClass.setPeople_max(getPeople_max());
		
		sqlMapper.insert("soloMatchSQL.insertSoloMatch", paramClass);
		
		paramClass = (soloMatchVO) sqlMapper.queryForObject("soloMatchSQL.selectLastNo");
		
		resultClass.setGame_no(paramClass.getGame_no());
		resultClass.setGame_day(getGame_day());
		resultClass.setGame_type(getGame_type());
		resultClass.setMatch_type("Solo");
		resultClass.setStadium(getStadium());
		resultClass.setFee(getFee());
		resultClass.setGame_area(getGame_area());
		resultClass.setContent(getContent());
		resultClass.setPeople_count(getPeople_count());
		resultClass.setPeople_max(getPeople_max());
		
		
		sqlMapper.insert("matchStateSQL.insertMatch",resultClass);
			
		return SUCCESS;
	}
	//솔로매치 수정
	public String modify() throws Exception {
		paramClass = new soloMatchVO();
		resultClass = new matchStateVO();
		
		paramClass.setGame_day(getGame_day());
		paramClass.setGame_type(getGame_type());
		paramClass.setStadium(getStadium());
		paramClass.setFee(getFee());
		paramClass.setGame_area(getGame_area());
		paramClass.setContent(getContent());
		
		sqlMapper.update("soloMatchSQL.updateSoloMatch",paramClass);
		return SUCCESS;
	}
	//솔로매치 신청 처리
	public String solo() throws Exception {
		
		paramClass = (soloMatchVO) sqlMapper.queryForObject("soloMatchSQL.soloMatchView",getGame_no());
		resultClass.setGame_no(paramClass.getGame_no());
		resultClass.setGame_type(paramClass.getGame_type());
		
		resultClass2 = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchTypeView",resultClass);
		joinSoloClass.setMatch_no(resultClass2.getMatch_no());
		joinSoloClass.setMem_id(getMem_id());
		
		sqlMapper.insert("joinSoloSQL.joinSoloMatch",joinSoloClass);
		sqlMapper.update("soloMatchSQL.soloCount",paramClass.getGame_no());
		sqlMapper.update("matchStateSQL.soloCount",resultClass2.getMatch_no());
		
		return SUCCESS;
	}
	

	public List<soloMatchVO> getList() {
		return list;
	}

	public void setList(List<soloMatchVO> list) {
		this.list = list;
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
	public soloMatchVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(soloMatchVO paramClass) {
		this.paramClass = paramClass;
	}

	public matchStateVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(matchStateVO resultClass) {
		this.resultClass = resultClass;
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
	public List<String> getAreaList() {
		return areaList;
	}

	public void setAreaList(List<String> areaList) {
		this.areaList = areaList;
	}

	public int getMatch_no() {
		return match_no;
	}

	public void setMatch_no(int match_no) {
		this.match_no = match_no;
	}

	public matchStateVO getResultClass2() {
		return resultClass2;
	}

	public void setResultClass2(matchStateVO resultClass2) {
		this.resultClass2 = resultClass2;
	}

	public joinSoloVO getJoinSoloClass() {
		return joinSoloClass;
	}

	public void setJoinSoloClass(joinSoloVO joinSoloClass) {
		this.joinSoloClass = joinSoloClass;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
