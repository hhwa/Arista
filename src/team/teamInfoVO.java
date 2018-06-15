package team;

public class teamInfoVO {

	private String team_id;
	private String mem_id;
	private int team_admin; // 0 회원,1매니저,2 마스터
	private String m_position;
	private String m_name;

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

	public String getM_position() {
		return m_position;
	}

	public void setM_position(String m_position) {
		this.m_position = m_position;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

}
