package team;

import java.util.Date;

//0528
public class teamVO {
	
	private int team_no;
	private String team_id; //팀명
	private String team_area; //지역
	private String team_type; //소속유형
	private String team_fieldtype; //축구/풋살
	private String team_age; //연령
	private String team_skill; //실력
	private String team_count; //인원 수
	private String team_intro; //소개
	private String file_savname;
	private String file_orgname;
	private Date team_regdate;
	
	private String team_master;
	private int team_admin;
	
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getTeam_area() {
		return team_area;
	}
	public void setTeam_area(String team_area) {
		this.team_area = team_area;
	}
	public String getTeam_type() {
		return team_type;
	}
	public void setTeam_type(String team_type) {
		this.team_type = team_type;
	}

	public String getTeam_fieldtype() {
		return team_fieldtype;
	}
	public void setTeam_fieldtype(String team_fieldtype) {
		this.team_fieldtype = team_fieldtype;
	}

	public String getTeam_age() {
		return team_age;
	}
	public void setTeam_age(String team_age) {
		this.team_age = team_age;
	}
	public String getTeam_skill() {
		return team_skill;
	}
	public void setTeam_skill(String team_skill) {
		this.team_skill = team_skill;
	}

	public String getTeam_count() {
		return team_count;
	}
	public void setTeam_count(String team_count) {
		this.team_count = team_count;
	}
	public String getTeam_intro() {
		return team_intro;
	}
	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}
	public String getFile_savname() {
		return file_savname;
	}
	public void setFile_savname(String file_savname) {
		this.file_savname = file_savname;
	}
	public String getFile_orgname() {
		return file_orgname;
	}
	public void setFile_orgname(String file_orgname) {
		this.file_orgname = file_orgname;
	}
	public Date getTeam_regdate() {
		return team_regdate;
	}
	public void setTeam_regdate(Date team_regdate) {
		this.team_regdate = team_regdate;
	}
	public String getTeam_master() {
		return team_master;
	}
	public void setTeam_master(String team_master) {
		this.team_master = team_master;
	}
	public int getTeam_admin() {
		return team_admin;
	}
	public void setTeam_admin(int team_admin) {
		this.team_admin = team_admin;
	}
	

	
	

}
