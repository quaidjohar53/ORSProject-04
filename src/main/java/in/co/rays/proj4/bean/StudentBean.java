package in.co.rays.proj4.bean;

import java.sql.ResultSet;
import java.util.Date;

public class StudentBean extends BaseBean {

	private String firstName;
	private String lastName;
	private Date dob;
	private String gender;
	private String mobileNo;
	private String email;
	private long collegeId;
	private String collegeName;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	@Override
	public void setResultset(ResultSet rs) {

		super.setResultset(rs);

		try {

			this.setFirstName(rs.getString("FIRST_NAME"));
			this.setLastName(rs.getString("LAST_NAME"));
			this.setDob(rs.getDate("DOB"));
			this.setGender(rs.getString("GENDER"));
			this.setMobileNo(rs.getString("MOBILE_NO"));
			this.setEmail(rs.getString("EMAIL"));
			this.setCollegeId(rs.getLong("COLLEGE_ID"));
			this.setCollegeName(rs.getString("COLLEGE_NAME"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getValue() {
		return firstName;
	}
}