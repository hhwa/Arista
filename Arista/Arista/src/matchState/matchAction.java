package matchState;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import matchState.matchStateVO;
import soloMatch.soloMatchVO;
import main.pagingAction;

public class matchAction extends ActionSupport {

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<matchStateVO> list = new ArrayList<matchStateVO>();
	
	private matchStateVO paramClass = new matchStateVO();
	private joinSoloVO paramClass2 = new joinSoloVO();

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String search;
	private int topic;
	private int match_no;
	private String mem_id;

	public matchAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String form() throws Exception{
		return SUCCESS;
	}

	public String execute() throws Exception {

		list = sqlMapper.queryForList("matchStateSQL.matchList");
		totalCount = list.size();// 전체 글 갯수
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);// pagingAction 객체 생성

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
	//솔로매치 신청
	public String join() throws Exception {
		paramClass = (matchStateVO) sqlMapper.queryForObject("matchStateSQL.matchView",getMatch_no());
		
		paramClass2.setMatch_no(getMatch_no());
		paramClass2.setMem_id(getMem_id());
		
		if(paramClass.getMatch_type().equals("Solo")) {
			sqlMapper.insert("joinSoloSQL.joinSoloMatch",paramClass2);
			sqlMapper.update("soloMatchSQL.soloCount",paramClass.getGame_no());
			sqlMapper.update("matchStateSQL.soloCount",paramClass.getMatch_no());
		}
		
		return SUCCESS;
	}


	public joinSoloVO getParamClass2() {
		return paramClass2;
	}
	public void setParamClass2(joinSoloVO paramClass2) {
		this.paramClass2 = paramClass2;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String team() throws Exception {
		return SUCCESS;
	}

	public List<matchStateVO> getList() {
		return list;
	}

	public void setList(List<matchStateVO> list) {
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

	public int getMatch_no() {
		return match_no;
	}

	public void setMatch_no(int match_no) {
		this.match_no = match_no;
	}

	public matchStateVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(matchStateVO paramClass) {
		this.paramClass = paramClass;
	}

}
