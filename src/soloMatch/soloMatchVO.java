package soloMatch;

public class soloMatchVO {

	private int game_no;		//경기 번호
	private String game_day;	//경기 날짜
	private String match_type;	//매치 종류(솔로, 팀)
	private String game_type;	//경기 타입(풋살,축구)
	private String stadium;		//경기장
	private int fee;			//비용
	private String game_area;	//경기지역
	private String content;		//내용
	private int people_max;			//경기최대신청인원
	private int people_count;		//경기신청인원수
	private String mem_id;
	
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
	
	public String getMatch_type() {
		return match_type;
	}
	public void setMatch_type(String match_type) {
		this.match_type = match_type;
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
	
}
