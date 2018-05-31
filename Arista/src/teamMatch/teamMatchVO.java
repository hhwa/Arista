package teamMatch;

public class teamMatchVO {
	
	private int game_no; 			//경기 번호
	private String team_id;			//팀 이름
	private String game_day;		//경기 날짜
	private String game_type;		//경기 종류(풋살,축구)
	private String stadium;			//경기장
	private int fee;				//비용
	private String game_area;		//경기지역
	private String uniform_color;	//유니폼색상
	private String content;			//내용
	private String match_type;		//매치타입(팀)
	
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
