package main;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
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

public class mainAction extends ActionSupport {
	
	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<matchStateVO> list = new ArrayList<matchStateVO>();
	private matchStateVO paramClass = new matchStateVO();
	private memVO memParam = new memVO();
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private pagingAction page; // 페이징 클래스
	private String m_id;
	
	public mainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception{
		
		memParam = new memVO();
		
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

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
}
