package faq;

import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import faq.faqVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import org.apache.commons.io.FileUtils;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

public class FAQAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<faqVO> list = new ArrayList<faqVO>();

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;

	private faqVO paramClass;
	private faqVO resultClass;

	private int faq_no = 0;
	private String faq_content;
	private String faq_subject;
	private String PageName;

	public FAQAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		setPageName("자주 묻는 질문");
	}

	public String execute() throws Exception {

		list = sqlMapper.queryForList("faqSQL.FAQList");

		totalCount = list.size();
		String paging = "FAQList";
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
		paramClass = new faqVO();
		resultClass = new faqVO();

		paramClass.setFaq_subject(getFaq_subject());
		paramClass.setFaq_content(getFaq_content());

		sqlMapper.insert("faqSQL.insertFAQ", paramClass);

		return SUCCESS;
	}

	public String view() throws Exception {
		paramClass = new faqVO();
		resultClass = new faqVO();

		paramClass.setFaq_no(getFaq_no());
		resultClass = (faqVO) sqlMapper.queryForObject("faqSQL.FAQView", getFaq_no());
		return SUCCESS;
	}

	public String update() throws Exception {
		paramClass = new faqVO();
		resultClass = new faqVO();

		paramClass.setFaq_no(getFaq_no());
		paramClass.setFaq_subject(getFaq_subject());
		paramClass.setFaq_content(getFaq_content());

		sqlMapper.update("faqSQL.updateFAQ", paramClass);

		resultClass = (faqVO) sqlMapper.queryForObject("faqSQL.FAQView", getFaq_no());

		return SUCCESS;
	}

	public String delete() throws Exception {
		paramClass = new faqVO();
		resultClass = new faqVO();

		resultClass = (faqVO) sqlMapper.queryForObject("faqSQL.FAQView", getFaq_no());

		paramClass.setFaq_no(getFaq_no());

		sqlMapper.update("faqSQL.deleteFAQ", paramClass);

		return SUCCESS;
	}

	public List<faqVO> getList() {
		return list;
	}

	public void setList(List<faqVO> list) {
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

	public faqVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(faqVO paramClass) {
		this.paramClass = paramClass;
	}

	public faqVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(faqVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getPageName() {
		return PageName;
	}

	public void setPageName(String pageName) {
		PageName = pageName;
	}
}
