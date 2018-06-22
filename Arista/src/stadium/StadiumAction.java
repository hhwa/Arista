package stadium;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.SessionAware;

import main.pagingAction;
import team.teamInfoVO;
import teamMatch.teamMatchVO;

public class StadiumAction extends ActionSupport implements SessionAware {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private Map session;

	private List<stadiumVO> list = new ArrayList<stadiumVO>();
	private List<teamMatchVO> list2 = new ArrayList<teamMatchVO>(); 
	private List<String> timeList = new ArrayList<String>();
	private List typeList = new ArrayList();
	private Map areaMap = new HashMap();

	private String search;
	private int topic;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private int num = 0;

	// write
	private stadiumVO paramClass;
	private stadiumVO resultClass;
	private teamMatchVO param;
	private teamInfoVO teamInfoParam;

	private int game_no;
	private String game_day;
	private int stadium_no;
	private String stadium_name;
	private String stadium_type;
	private String stadium_tel;
	private String stadium_tel1;
	private String stadium_tel2;
	private int stadium_zipcode;
	private String stadium_addr;
	private String stadium_addr2;
	private String stadium_day;
	private String stadium_days[];
	private String stadium_time;
	private String stadium_time1;
	private String stadium_main_img_org;
	private String stadium_main_img_save;
	Calendar stadium_regdate = Calendar.getInstance();
	private String old_file;

	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "E:\\git\\Arista\\Arista\\WebContent\\stadium\\stadiumIMG\\";

	private String pageName;
	private String[] day1;
    private String sa="";
    
    private String mon;
    private String tue;
    private String wed;
    private String thu;
    private String fri;
    private String sat;
    private String sun;
    
    private String mastercheck;

	public StadiumAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

		setPageName("STADIUM");
		for(int i=0; i<24; i++) {
			timeList.add(i+"시");
		}
	}

	public String form() throws Exception {
		return SUCCESS;
	}

	public String form2() throws Exception {
		resultClass = new stadiumVO();
		resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectOne", getStadium_no());

		return SUCCESS;
	}

	public String execute() throws Exception {

		if (getSearch() != null) {
			return search();
		}
		list = sqlMapper.queryForList("stadiumSQL.stadiumList"); // stadiumSQL의 stadiumList의 쿼리문을 실행해서 List에 넣는다.

		totalCount = list.size();
		String paging = "StadiumList";
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String search() throws Exception {

		HashMap searchMap = new HashMap();
		String topics[] = { "stadium_name", "stadium_addr", "stadium_tel" };
		searchMap.put("param1", topics[getTopic()]);
		searchMap.put("param2", "%" + getSearch() + "%");

		list = sqlMapper.queryForList("stadiumSQL.stadiumSearch", searchMap);

		totalCount = list.size();
		String paging = "StadiumList";
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, getTopic(), getSearch(), paging);// pagingAction
																													// 객체
																													// 생성
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

	public String write() throws Exception {

		paramClass = new stadiumVO();
		resultClass = new stadiumVO();

		for(String val : getStadium_days()) {
			if(stadium_day==null) {
				stadium_day = val;
			}else {
				stadium_day += val;
			}
		}
		
		paramClass.setStadium_name(getStadium_name());
		paramClass.setStadium_type(getStadium_type());
		paramClass.setStadium_day(getStadium_day());
		paramClass.setStadium_addr(getStadium_addr());
		paramClass.setStadium_addr2(getStadium_addr2());
		paramClass.setStadium_tel(getStadium_tel()+"-"+getStadium_tel1()+"-"+getStadium_tel2());
		paramClass.setStadium_zipcode(getStadium_zipcode());
		paramClass.setStadium_time(getStadium_time()+"~"+getStadium_time1());
		paramClass.setStadium_regdate(stadium_regdate.getTime());

		sqlMapper.insert("stadiumSQL.insertStadium", paramClass);

		if (getUpload() != null) {

			resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectLastNo");

			String file_name = "file_" + resultClass.getStadium_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			File destFile = new File(fileUploadPath + file_name + "." + file_ext);

			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setStadium_no(resultClass.getStadium_no());
			paramClass.setStadium_main_img_org(getUploadFileName());
			paramClass.setStadium_main_img_save(file_name + "." + file_ext);

			sqlMapper.update("stadiumSQL.updateFile", paramClass);

		}else {
			String file_name="noImage.jpg";
			resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectLastNo");
			paramClass.setStadium_no(resultClass.getStadium_no());
			paramClass.setStadium_main_img_org(file_name);
			paramClass.setStadium_main_img_save(file_name);
			
			sqlMapper.update("stadiumSQL.updateFile",paramClass);
		}

		return SUCCESS;
	}

	public String view() throws Exception { // 상세보기 부분

		resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectOne", getStadium_no());
		list2 = sqlMapper.queryForList("teamMatchSQL.teamMatchView2",resultClass.getStadium_name());
		
		String temp[] = resultClass.getStadium_tel().split("-");
		setStadium_tel(temp[0]);
		setStadium_tel1(temp[1]);
		setStadium_tel2(temp[2]);
		temp = resultClass.getStadium_day().split("");
		String day=""; //view에서 이용가능 요일
		for(int i=0; i<temp.length; i++) {
			if(i==temp.length-1)
				day += temp[i];
			else
				day += temp[i]+", ";
			
			if(temp[i].equals("월")) //수정폼에서 체크박스 
				setMon("월");
			else if(temp[i].equals("화"))
				setTue("화");
			else if(temp[i].equals("수"))
				setWed("수");
			else if(temp[i].equals("목"))
				setThu("목");
			else if(temp[i].equals("금"))
				setFri("금");
			else if(temp[i].equals("토"))
				setSat("토");
			else if(temp[i].equals("일"))
				setSun("일");
		}
		temp = resultClass.getStadium_time().split("~");
		setStadium_time(temp[0]);
		setStadium_time1(temp[1]);
		resultClass.setStadium_day(day);
		
		teamInfoParam = (teamInfoVO) sqlMapper.queryForObject("teamSQL.teamMember1", (String) session.get("session_id"));
		if(teamInfoParam!=null) {
			if(teamInfoParam.getTeam_admin() == 0) {
				mastercheck = "0";
			}else if(teamInfoParam.getTeam_admin() == 1) {
				mastercheck = "1";
			}else if(teamInfoParam.getTeam_admin() == 2) {
				mastercheck = "2";
			}else {
				mastercheck = "3";
			}
		}else {
			mastercheck = "-1";
		}
	  	sa = Integer.toString(list2.size());
		
		return SUCCESS;
	}

	public String modify() throws Exception {
		paramClass = new stadiumVO();
		resultClass = new stadiumVO();

		for(String val : getStadium_days()) {
			if(stadium_day==null) {
				stadium_day = val;
			}else {
				stadium_day += val;
			}
		} 
		paramClass.setStadium_no(getStadium_no());
		paramClass.setStadium_name(getStadium_name());
		paramClass.setStadium_type(getStadium_type());
		paramClass.setStadium_time(getStadium_time()+"~"+getStadium_time1());
		paramClass.setStadium_day(getStadium_day());
		paramClass.setStadium_addr(getStadium_addr());
		paramClass.setStadium_addr2(getStadium_addr2());
		paramClass.setStadium_tel(getStadium_tel()+"-"+getStadium_tel1()+"-"+getStadium_tel2());
		paramClass.setStadium_zipcode(getStadium_zipcode());
		paramClass.setStadium_day(getStadium_day());
		paramClass.setStadium_regdate(stadium_regdate.getTime());

		sqlMapper.update("stadiumSQL.updateStadium", paramClass);

		if (getUpload() != null) {
			String file_name = "file_" + getStadium_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());
			if(!getOld_file().equals("noImage.jpg")) {
				File deleteFile = new File(fileUploadPath + getOld_file());
				deleteFile.delete();
			}

			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setStadium_main_img_org(getUploadFileName());
			paramClass.setStadium_main_img_save(file_name + "." + file_ext);

			sqlMapper.update("stadiumSQL.updateFile", paramClass);

		}
		resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectOne", getStadium_no());
		return SUCCESS;
	}

	public String delete() throws Exception {
		paramClass = new stadiumVO();
		resultClass = new stadiumVO();

		resultClass = (stadiumVO) sqlMapper.queryForObject("stadiumSQL.selectOne", getStadium_no());
		
		if(!resultClass.getStadium_main_img_save().equals("noImage.jpg")) {
			File deleteFile = new File(fileUploadPath + resultClass.getStadium_main_img_save());
			deleteFile.delete();
		}

		paramClass.setStadium_no(getStadium_no());

		sqlMapper.update("stadiumSQL.deleteStadium", paramClass);

		return SUCCESS;

	}
	//매치생성시 경기장 리스트 검색할수 있는 오픈 창
	public String openlist() throws Exception {
		if(getSearch()==null || getSearch().equals("전체검색")  ) {	//페이징을 위한 stadium_type => search
			list = sqlMapper.queryForList("stadiumSQL.stadiumList"); 
			totalCount = list.size();
			String paging = "OpenStadiumList";
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, paging);// pagingAction 객체 생성
			
		}else if(getSearch().equals("풋살경기장")||getSearch().equals("축구경기장")){
			list = sqlMapper.queryForList("stadiumSQL.stadiumList2",getSearch()); //라디오 버튼 선택시 검색 ( 타입별로 select)
			totalCount = list.size();
			String paging = "OpenStadiumList";
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, getTopic(), getSearch(), paging);// pagingAction 객체 생성
		}
		
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		for(int i=0; i<list.size(); i++) {
			String type=list.get(i).getStadium_type().substring(0, 2);
			String temp[] = list.get(i).getStadium_addr().split(" ");
			typeList.add(type);
			areaMap.put(i, temp[0]);
			areaMap.put(i+10, temp[1]);
		}
		
		return SUCCESS;
	}
	public String apply() throws Exception {

		param = new teamMatchVO();
		param.setGame_no(getGame_no());
		param.setGame_day(getGame_day());
		param.setStadium(getStadium_name());

		sqlMapper.update("teamMatchSQL.updateTeamMatch2", param);
		return SUCCESS;
	}

	
	public List<teamMatchVO> getList2() {
		return list2;
	}

	public void setList2(List<teamMatchVO> list2) {
		this.list2 = list2;
	}

	public List<String> getTimeList() {
		return timeList;
	}

	public void setTimeList(List<String> timeList) {
		this.timeList = timeList;
	}

	public String[] getDay1() {
		return day1;
	}

	public void setDay1(String[] day1) {
		this.day1 = day1;
	}

	public String getSa() {
		return sa;
	}

	public void setSa(String sa) {
		this.sa = sa;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public teamMatchVO getParam() {
		return param;
	}

	public void setParam(teamMatchVO param) {
		this.param = param;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public List<stadiumVO> getList() {
		return list;
	}

	public void setList(List<stadiumVO> list) {
		this.list = list;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getStadium_type() {
		return stadium_type;
	}

	public void setStadium_type(String stadium_type) {
		this.stadium_type = stadium_type;
	}

	public stadiumVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(stadiumVO paramClass) {
		this.paramClass = paramClass;
	}

	public stadiumVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(stadiumVO resultClass) {
		this.resultClass = resultClass;
	}

	public teamInfoVO getTeamInfoParam() {
		return teamInfoParam;
	}

	public void setTeamInfoParam(teamInfoVO teamInfoParam) {
		this.teamInfoParam = teamInfoParam;
	}

	public int getStadium_no() {
		return stadium_no;
	}

	public void setStadium_no(int stadium_no) {
		this.stadium_no = stadium_no;
	}

	public String getStadium_name() {
		return stadium_name;
	}

	public void setStadium_name(String stadium_name) {
		this.stadium_name = stadium_name;
	}

	public String getStadium_tel() {
		return stadium_tel;
	}

	public void setStadium_tel(String stadium_tel) {
		this.stadium_tel = stadium_tel;
	}

	public String getStadium_tel1() {
		return stadium_tel1;
	}

	public void setStadium_tel1(String stadium_tel1) {
		this.stadium_tel1 = stadium_tel1;
	}

	public String getStadium_tel2() {
		return stadium_tel2;
	}

	public void setStadium_tel2(String stadium_tel2) {
		this.stadium_tel2 = stadium_tel2;
	}

	public int getStadium_zipcode() {
		return stadium_zipcode;
	}

	public void setStadium_zipcode(int stadium_zipcode) {
		this.stadium_zipcode = stadium_zipcode;
	}

	public String getStadium_addr() {
		return stadium_addr;
	}

	public void setStadium_addr(String stadium_addr) {
		this.stadium_addr = stadium_addr;
	}

	public String getStadium_addr2() {
		return stadium_addr2;
	}

	public void setStadium_addr2(String stadium_addr2) {
		this.stadium_addr2 = stadium_addr2;
	}

	public String getStadium_day() {
		return stadium_day;
	}

	public void setStadium_day(String stadium_day) {
		this.stadium_day = stadium_day;
	}

	public String[] getStadium_days() {
		return stadium_days;
	}

	public void setStadium_days(String[] stadium_days) {
		this.stadium_days = stadium_days;
	}

	public String getStadium_time() {
		return stadium_time;
	}

	public void setStadium_time(String stadium_time) {
		this.stadium_time = stadium_time;
	}

	public String getStadium_time1() {
		return stadium_time1;
	}

	public void setStadium_time1(String stadium_time1) {
		this.stadium_time1 = stadium_time1;
	}

	public String getStadium_main_img_org() {
		return stadium_main_img_org;
	}

	public void setStadium_main_img_org(String stadium_main_img_org) {
		this.stadium_main_img_org = stadium_main_img_org;
	}

	public String getStadium_main_img_save() {
		return stadium_main_img_save;
	}

	public void setStadium_main_img_save(String stadium_main_img_save) {
		this.stadium_main_img_save = stadium_main_img_save;
	}

	public Calendar getStadium_regdate() {
		return stadium_regdate;
	}

	public void setStadium_regdate(Calendar stadium_regdate) {
		this.stadium_regdate = stadium_regdate;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getOld_file() {
		return old_file;
	}

	public void setOld_file(String old_file) {
		this.old_file = old_file;
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

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getTue() {
		return tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getWed() {
		return wed;
	}

	public void setWed(String wed) {
		this.wed = wed;
	}

	public String getThu() {
		return thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getFri() {
		return fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public String getSat() {
		return sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public List getTypeList() {
		return typeList;
	}

	public void setTypeList(List typeList) {
		this.typeList = typeList;
	}

	public Map getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(Map areaMap) {
		this.areaMap = areaMap;
	}

	public String getMastercheck() {
		return mastercheck;
	}

	public void setMastercheck(String mastercheck) {
		this.mastercheck = mastercheck;
	}

	
	

}
