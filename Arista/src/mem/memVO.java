package mem;

import java.util.Date;

public class memVO {
	
	private String m_ID;
	private String m_passwd;
	private String m_name;
	private int m_mobilephone;
	private int m_birthyear;
	private String m_region;
	private String m_email;
	private String m_position;
	private String m_nickname;
	private Date m_joindate;
	private String Admin_yn;
	private String prof_image_org;
	private String ptof_image_save;
	
	 
	
	
	public String getProf_image_org() {
		return prof_image_org;
	}
	public void setProf_image_org(String prof_image_org) {
		this.prof_image_org = prof_image_org;
	}
	public String getPtof_image_save() {
		return ptof_image_save;
	}
	public void setPtof_image_save(String ptof_image_save) {
		this.ptof_image_save = ptof_image_save;
	}
	public String getAdmin_yn() {
		return Admin_yn;
	}
	public void setAdmin_yn(String admin_yn) {
		Admin_yn = admin_yn;
	}
	public String getM_ID() {
		return m_ID;
	}
	public void setM_ID(String m_ID) {
		this.m_ID = m_ID;
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
	public int getM_mobilephone() {
		return m_mobilephone;
	}
	public void setM_mobilephone(int m_mobilephone) {
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
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public Date getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(Date m_joindate) {
		this.m_joindate = m_joindate;
	}

	
}
/*m_ID
m_passwd
m_name
m_mobilephone
m_birthyear
m_region
m_email
m_position
admin_yn
prof_image_org
prof_image_save
m_joindate
m_nickname
*/