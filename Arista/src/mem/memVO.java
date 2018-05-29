package mem;

import java.util.Date;

public class memVO {
	
	private String m_id;
	private String m_passwd;
	private String m_name;
	private String m_mobilephone; 
	private int m_birthyear; 
	private String m_region;
	private String m_email;
	private String m_nickname;
	private Date m_joindate;
	private String m_position;
	private int admin_yn;
	private String prof_image_org;
	private String prof_image_save;
	
	
	public String getM_position() {
		return m_position;
	}
	public void setM_position(String m_position) {
		this.m_position = m_position;
	}
	public int getAdmin_yn() {
		return admin_yn;
	}
	public void setAdmin_yn(int admin_yn) {
		this.admin_yn = admin_yn;
	}

	public String getM_passwd() {
		return m_passwd;
	}
	public String getM_name() {
		return m_name;
	}
	public String getM_mobilephone() {
		return m_mobilephone;
	}
	public int getM_birthyear() {
		return m_birthyear;
	}
	public String getM_region() {
		return m_region;
	}
	public String getM_email() {
		return m_email;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public Date getM_joindate() {
		return m_joindate;
	}

	public String getProf_image_org() {
		return prof_image_org;
	}
	public String getProf_image_save() {
		return prof_image_save;
	}
	
	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public void setM_mobilephone(String m_mobilephone) {
		this.m_mobilephone = m_mobilephone;
	}
	public void setM_birthyear(int m_birthyear) {
		this.m_birthyear = m_birthyear;
	}
	public void setM_region(String m_region) {
		this.m_region = m_region;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}
	
	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}
	public void setProf_image_save(String prof_image_save) {
		this.prof_image_save = prof_image_save;
	}
	public int getM_admin_yn() {
		return admin_yn;
	}
	public void setM_admin_yn(int m_admin_yn) {
		this.admin_yn = m_admin_yn;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	
}
