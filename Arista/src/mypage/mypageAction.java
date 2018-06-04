package mypage;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import main.pagingAction;
import matchState.matchStateVO;
import mem.memVO;
import teamMatch.teamMatchVO;

public class mypageAction extends ActionSupport{
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List<teamMatchVO> list = new ArrayList<teamMatchVO>();
	private List<String> areaList = new ArrayList<String>();
	
	private memVO m_paramClass;
	private memVO m_resultClass;
	
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
	
	private String m_ID;	// 아이디
	private String m_password;	//비밀번호
	private String m_name;	//이름
	private String m_mobilephone;	//핸드폰 번호
	private int m_birthyear;	//생년월일
	private String m_region;	//지역
	private String m_email;		//이메일
	private String m_position;	//포지션
	private boolean admin_yn;	//관리자 유무
	private String prof_image_org;	//이미지
	private String prof_image_save;	//이미지
	private Date m_joindate;	//가입일
	private String m_nickname;	//닉네임
	
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
	
	public mypageAction() throws IOException{
		
		reader=Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
		
	
		
	}
	
	public String layout() throws Exception{
		return SUCCESS;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	//내정보
	public String view() throws Exception{
		m_paramClass=new memVO();
		m_resultClass=new memVO();
		
		m_paramClass.setM_id(getM_ID());
		m_paramClass.setM_passwd(getM_password());
		m_paramClass.setM_name(getM_name());
		m_paramClass.setM_region(getM_region());
		m_paramClass.setM_mobilephone(getM_mobilephone());
		m_paramClass.setM_email(getM_email());
		m_paramClass.setM_birthyear(getM_birthyear());
		m_paramClass.setM_position(getM_position());
		m_paramClass.setM_nickname(getM_nickname());
		m_paramClass.setM_joindate(getM_joindate());
		
		sqlMapper.insert("memSQL.insertMem",paramClass);
		m_paramClass=(memVO) sqlMapper.queryForObject("memSQL.selectOneMember");
		
		m_resultClass.setM_id(getM_ID());
		m_resultClass.setM_passwd(getM_password());
		m_resultClass.setM_name(getM_name());
		m_resultClass.setM_region(getM_region());
		m_resultClass.setM_mobilephone(getM_mobilephone());
		m_resultClass.setM_email(getM_email());
		m_resultClass.setM_birthyear(getM_birthyear());
		m_resultClass.setM_position(getM_position());
		m_resultClass.setM_nickname(getM_nickname());
		m_resultClass.setM_joindate(getM_joindate());
		
		sqlMapper.insert("memSQL.insertMem",resultClass);
		return SUCCESS;
	
	}
	public String TeamMatchInfo() throws Exception{
		
		
		currentPage = 1;
			list = sqlMapper.queryForList("teamMatchSQL.teamMatchList");
			totalCount = list.size();//전체 글 갯수
			page = new pagingAction(currentPage, totalCount,blockCount,blockPage);//pagingAction 객체 생성
		
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


	public int getTopic() {
		return topic;
	}


	public void setTopic(int topic) {
		this.topic = topic;
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

	public memVO getM_paramClass() {
		return m_paramClass;
	}


	public void setM_paramClass(memVO m_paramClass) {
		this.m_paramClass = m_paramClass;
	}


	public memVO getM_resultClass() {
		return m_resultClass;
	}


	public void setM_resultClass(memVO m_resultClass) {
		this.m_resultClass = m_resultClass;
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


	public String getM_ID() {
		return m_ID;
	}


	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
	}


	public String getM_password() {
		return m_password;
	}


	public void setM_password(String m_password) {
		this.m_password = m_password;
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


	public String getM_position() {
		return m_position;
	}


	public void setM_position(String m_position) {
		this.m_position = m_position;
	}


	public boolean isAdmin_yn() {
		return admin_yn;
	}


	public void setAdmin_yn(boolean admin_yn) {
		this.admin_yn = admin_yn;
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


	public Date getM_joindate() {
		return m_joindate;
	}


	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}


	public String getM_nickname() {
		return m_nickname;
	}


	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
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






















