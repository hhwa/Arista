package qna;

import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import qna.qnaVO;
import mem.memVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import java.io.Reader;
import java.io.IOException;


public class QNAAction extends ActionSupport implements SessionAware{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	private Map session;
	
	private List<qnaVO> list = new ArrayList<qnaVO>();
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	
	private String search;
	private int topic;  
	
	//write
	private qnaVO paramClass;
	private qnaVO resultClass;
	
	private memVO resultMember;
	private memVO paramMember;
	
	private int qna_no;
	private String qna_subject;
	private String qna_id;
	private String qna_password;
	private String qna_content;
	private String adminYN;
	
	private int ref;
	private int re_step;
	private int re_level;
	
	private int writeCheck;
	
	boolean reply = false;
	
	Calendar today = Calendar.getInstance();
	
	private String PageName;
	
	
	public QNAAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		setPageName("QNA");
	}
	
	public String execute() throws Exception {
		String paging="QNAList";
		if(getSearch()==null||getSearch().equals("")) {
			list = sqlMapper.queryForList("qnaSQL.qnaList");
			totalCount = list.size();
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage,paging);//pagingAction 객체 생성
		}else {
			HashMap searchMap = new HashMap();
			String topics[]= {"qna_subject","qna_id","qna_content"};
			searchMap.put("param1",topics[getTopic()]);
			searchMap.put("param2","%"+getSearch()+"%");
			list = sqlMapper.queryForList("qnaSQL.qnaSearch",searchMap);
			totalCount = list.size();
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage,getTopic(),getSearch(),paging);//pagingAction 객체 생성
		}
		
		pagingHtml = page.getPagingHtml().toString(); 
		
		int lastCount = totalCount;
		
		if(page.getEndCount()<totalCount)
			lastCount=page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}
	
	public String form() throws Exception {
		return SUCCESS;
	}	
	
	public String reply() throws Exception {
		reply = true;
		resultClass = new qnaVO();
		resultClass = (qnaVO) sqlMapper.queryForObject("qnaSQL.qnaView", getQna_no());
		resultClass.setQna_subject("" + resultClass.getQna_subject());
		resultClass.setQna_password("");
		resultClass.setQna_content("");

		return SUCCESS;
	}
	
	public String write() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		
		if(ref == 0) {
			paramClass.setRe_step(0);
			paramClass.setRe_level(0);
		} else {
			paramClass.setRef(getRef());
			paramClass.setRe_step(getRe_step());
			sqlMapper.update("qnaSQL.updateReplyStep", paramClass);
			
			paramClass.setRe_step(getRe_step() + 1);
			paramClass.setRe_level(getRe_level() + 1);
			paramClass.setRef(getRef());
		}
		
		paramClass.setQna_subject(getQna_subject());
		paramClass.setQna_id((String)session.get("session_id"));
		paramClass.setQna_password(getQna_password());
		paramClass.setQna_content(getQna_content());
		paramClass.setQna_regdate(today.getTime());
				
		if(ref == 0)
			sqlMapper.insert("qnaSQL.insertQNA", paramClass);
		else
			sqlMapper.insert("qnaSQL.insertQNAReply", paramClass);

		
		return SUCCESS;
	}
	
	public String view() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		
		paramClass.setQna_no(getQna_no());
		sqlMapper.update("qnaSQL.updateReadHit", paramClass);
		resultClass = (qnaVO) sqlMapper.queryForObject("qnaSQL.qnaView", getQna_no());
		return SUCCESS;
	}
	
	public String checkForm() throws Exception {
		return SUCCESS;
	}
	
	public String checkAction() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		resultMember = new memVO();
		paramMember = new memVO();
		String sessionId = (String)session.get("session_id");
		String adminYN = (String)session.get("session_adminYN");
		
		
		if(adminYN.equals("0")){
			System.out.println("test");
			paramClass.setQna_no(getQna_no());
			paramClass.setQna_password(getQna_password());
			resultClass = (qnaVO) sqlMapper.queryForObject("qnaSQL.selectPassword", paramClass);
			if(resultClass != null) {
				return SUCCESS;
			} 
		}

		
		if (adminYN.equals("1")) {
			System.out.println("test2");
			paramMember.setM_id((String)session.get("session_id"));
     		paramMember.setM_passwd(getQna_password());
		
			resultMember = (memVO)sqlMapper.queryForObject("memSQL.selectPassword", paramMember);
		
			if(resultMember != null) {
				return SUCCESS;} 
		}
		
		return ERROR;
		
		
	}
	
	public String update() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();		
		
		paramClass.setQna_no(getQna_no());
		paramClass.setQna_subject(getQna_subject());
		paramClass.setQna_id(getQna_id());
		paramClass.setQna_password(getQna_password());
		paramClass.setQna_content(getQna_content());
		
		sqlMapper.update("qnaSQL.updateQNA", paramClass);
		
		resultClass = (qnaVO) sqlMapper.queryForObject("qnaSQL.qnaView", getQna_no());
		
		return SUCCESS;
	}
	
	public String delete() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		
		resultClass = (qnaVO) sqlMapper.queryForObject("qnaSQL.qnaView", getQna_no());
		
		paramClass.setQna_no(getQna_no());
		
		sqlMapper.update("qnaSQL.deleteQNA", paramClass);
		
		return SUCCESS;
	}	



	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public List<qnaVO> getList() {
		return list;
	}

	public void setList(List<qnaVO> list) {
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

	public String getPageName() {
		return PageName;
	}

	public void setPageName(String pageName) {
		PageName = pageName;
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
	//write

	public qnaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(qnaVO paramClass) {
		this.paramClass = paramClass;
	}

	public qnaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(qnaVO resultClass) {
		this.resultClass = resultClass;
	}



	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_subject() {
		return qna_subject;
	}

	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public String getQna_password() {
		return qna_password;
	}

	public void setQna_password(String qna_password) {
		this.qna_password = qna_password;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getAdminYN() {
		return adminYN;
	}

	public void setAdminYN(String adminYN) {
		this.adminYN = adminYN;
	}

	public memVO getResultMember() {
		return resultMember;
	}

	public void setResultMember(memVO resultMember) {
		this.resultMember = resultMember;
	}

	public memVO getParamMember() {
		return paramMember;
	}

	public void setParamMember(memVO paramMember) {
		this.paramMember = paramMember;
	}

	public int getWriteCheck() {
		return writeCheck;
	}

	public void setWriteCheck(int writeCheck) {
		this.writeCheck = writeCheck;
	}
}
