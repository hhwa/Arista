package team;

public class teamInfoVO {

	private String team_id;
	private String mem_id;
	private int team_admin; //0 회원,1매니저,2 마스터
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getTeam_admin() {
		return team_admin;
	}
	public void setTeam_admin(int team_admin) {
		this.team_admin = team_admin;
	}
	
}
