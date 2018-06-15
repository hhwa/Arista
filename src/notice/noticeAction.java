package notice;

import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import notice.noticeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import org.apache.commons.io.FileUtils;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.struts2.interceptor.SessionAware;

public class noticeAction extends ActionSupport implements SessionAware {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<noticeVO> list = new ArrayList<noticeVO>();

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;

	private noticeVO paramClass;
	private noticeVO resultClass;

	private int notice_no = 0;
	private String notice_id;
	private String notice_content;
	private String notice_subject;
	private String PageName;

	Calendar today = Calendar.getInstance();

	private Map session;

	public noticeAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		setPageName("공지사항");
	}

	public String execute() throws Exception {

		list = sqlMapper.queryForList("noticeSQL.noticeList");

		totalCount = list.size();

		String paging = "noticeList";
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String form() throws Exception {
		return SUCCESS;
	}

	public String write() throws Exception {
		paramClass = new noticeVO();
		resultClass = new noticeVO();

		paramClass.setNotice_subject(getNotice_subject());
		paramClass.setNotice_id((String) session.get("session_id"));
		paramClass.setNotice_content(getNotice_content());
		paramClass.setNotice_regdate(today.getTime());

		sqlMapper.insert("noticeSQL.insertNotice", paramClass);

		return SUCCESS;
	}

	public String view() throws Exception {
		paramClass = new noticeVO();
		resultClass = new noticeVO();

		paramClass.setNotice_no(getNotice_no());
		sqlMapper.update("noticeSQL.updateReadHit", paramClass);
		resultClass = (noticeVO) sqlMapper.queryForObject("noticeSQL.noticeView", getNotice_no());
		return SUCCESS;
	}

	public String update() throws Exception {
		paramClass = new noticeVO();
		resultClass = new noticeVO();

		paramClass.setNotice_no(getNotice_no());
		paramClass.setNotice_subject(getNotice_subject());
		paramClass.setNotice_id(getNotice_id());
		paramClass.setNotice_content(getNotice_content());

		sqlMapper.update("noticeSQL.updateNotice", paramClass);

		resultClass = (noticeVO) sqlMapper.queryForObject("noticeSQL.noticeView", getNotice_no());

		return SUCCESS;
	}

	public String delete() throws Exception {
		paramClass = new noticeVO();
		resultClass = new noticeVO();

		resultClass = (noticeVO) sqlMapper.queryForObject("noticeSQL.noticeView", getNotice_no());

		paramClass.setNotice_no(getNotice_no());

		sqlMapper.update("noticeSQL.deleteNotice", paramClass);

		return SUCCESS;
	}

	public List<noticeVO> getList() {
		return list;
	}

	public void setList(List<noticeVO> list) {
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

	public noticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(noticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public noticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(noticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_subject() {
		return notice_subject;
	}

	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public String getPageName() {
		return PageName;
	}

	public void setPageName(String pageName) {
		PageName = pageName;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
}
