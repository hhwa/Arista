package admin;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;

import mem.memVO;
import main.pagingAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import java.io.Reader;
import java.io.IOException;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

public class memberAction extends ActionSupport implements Preparable, ModelDriven<memVO>, ServletRequestAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private String m_id;
	private String m_passwd;
	private String m_name;
	private String m_mobilephone;
	private int m_birthyear;
	private String m_region;
	private String m_email;
	private String m_nickname;
	private int admin_yn;
	private int genUser = 0;
	private int adminUser = 1;
	private String m_position;
	private Calendar m_joindate;
	private String prof_image_org;
	private String prof_image_save;

	private String profpath;
	private memVO memberParam;
	private memVO memberResult;
	private List<memVO> memlist = new ArrayList<memVO>();

	private HttpServletRequest request;

	// 검색
	private String search;
	private int topic;
	// 페이징
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 5;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private String pageName;

	public memberAction() throws IOException {
		// TODO Auto-generated constructor stub
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	@Override
	public memVO getModel() {
		// TODO Auto-generated method stub
		return memberParam;
	}

	@Override
	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		memberParam = new memVO();
	}

	public String memberList() throws Exception {
		setPageName("회원리스트 관리");
		String paging = "adminMemList";
		if (getSearch() == null || getSearch().equals("")) {
			memlist = sqlMapper.queryForList("memSQL.memList");
			totalCount = memlist.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성

		} else {
			HashMap searchMap = new HashMap();
			String topics[] = { "m_id", "m_name", "m_email" };
			searchMap.put("param1", topics[getTopic()]);
			searchMap.put("param2", "%" + getSearch() + "%");
			memlist = sqlMapper.queryForList("memSQL.memSearch", searchMap);
			totalCount = memlist.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, getTopic(), getSearch(),paging);// pagingAction
																											// 객체 생성
		}

		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		memlist = memlist.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String memberView() throws Exception {
		memberResult = (memVO) sqlMapper.queryForObject("memSQL.memListView", memberParam);

		if (memberResult.getProf_image_save() != null) {
			prof_image_save = memberResult.getProf_image_save();
			prof_image_org = memberResult.getProf_image_org();
			profpath = request.getContextPath() + "/profUpload/" + prof_image_save;

		}

		return SUCCESS;
	}

	public String adminRightModi() throws Exception {
		sqlMapper.update("memSQL.updateAdminYN", memberParam);

		return SUCCESS;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_mobilephone() {
		return m_mobilephone;
	}

	public void setM_mobilephone(String m_mobilephone) {
		this.m_mobilephone = m_mobilephone;
	}

	public int getM_birthyear() {
		return m_birthyear;
	}

	public void setM_birthyear(int m_birthyear) {
		this.m_birthyear = m_birthyear;
	}

	public String getM_region() {
		return m_region;
	}

	public void setM_region(String m_region) {
		this.m_region = m_region;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_nickname() {
		return m_nickname;
	}

	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}

	public int getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}

	public int getGenUser() {
		return genUser;
	}

	public void setGenUser(int genUser) {
		this.genUser = genUser;
	}

	public int getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(int adminUser) {
		this.adminUser = adminUser;
	}

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public Calendar getM_joindate() {
		return m_joindate;
	}

	public void setM_joindate(Calendar m_joindate) {
		this.m_joindate = m_joindate;
	}

	public String getProf_image_org() {
		return prof_image_org;
	}

	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}

	public String getProf_image_save() {
		return prof_image_save;
	}

	public void setProf_image_save(String prof_image_save) {
		this.prof_image_save = prof_image_save;
	}

	public String getProfpath() {
		return profpath;
	}

	public void setProfpath(String profpath) {
		this.profpath = profpath;
	}

	public memVO getMemberParam() {
		return memberParam;
	}

	public void setMemberParam(memVO memberParam) {
		this.memberParam = memberParam;
	}

	public memVO getMemberResult() {
		return memberResult;
	}

	public void setMemberResult(memVO memberResult) {
		this.memberResult = memberResult;
	}

	public List<memVO> getMemlist() {
		return memlist;
	}

	public void setMemlist(List<memVO> memlist) {
		this.memlist = memlist;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
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

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}

	

}
