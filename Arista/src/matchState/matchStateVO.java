package matchState;

public class matchStateVO {

	private int match_no; // 매치번호
	private int game_no; // 게임번호
	private String match_type; // 매치 종류(솔로,팀)
	private String team_id; // 생성팀(팀매치)
	private String team2_id; // 신청팀(팀매치)
	private String game_day; // 경기일
	private String game_type; // 경기 종류(풋살,축구)
	private String stadium; // 경기장
	private int fee; // 비용
	private String game_area; // 경기지역
	private String uniform_color; // 유니폼색상
	private String content; // 내용
	private int people_max; // 경기최대신청인원
	private int people_count; // 경기신청인원수
	private String mem_id;
	private String game_time;

	public int getMatch_no() {
		return match_no;
	}

	public void setMatch_no(int match_no) {
		this.match_no = match_no;
	}

	public int getGame_no() {
		return game_no;
	}

	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}

	public String getMatch_type() {
		return match_type;
	}

	public void setMatch_type(String match_type) {
		this.match_type = match_type;
	}

	public String getTeam_id() {
		return team_id;
	}

	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}

	public String getTeam2_id() {
		return team2_id;
	}

	public void setTeam2_id(String team2_id) {
		this.team2_id = team2_id;
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

	public int getPeople_max() {
		return people_max;
	}

	public void setPeople_max(int people_max) {
		this.people_max = people_max;
	}

	public int getPeople_count() {
		return people_count;
	}

	public void setPeople_count(int people_count) {
		this.people_count = people_count;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getGame_time() {
		return game_time;
	}

	public void setGame_time(String game_time) {
		this.game_time = game_time;
	}
	

}
