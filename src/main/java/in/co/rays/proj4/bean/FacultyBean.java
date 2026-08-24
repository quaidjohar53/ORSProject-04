package in.co.rays.proj4.bean;

import java.sql.ResultSet;
import java.util.Date;

public class FacultyBean extends BaseBean {

	private String firstName;
	private String lastName;
	private Date dob;
	private String gender;
	private String mobileNo;
	private String email;
	private long collegeId;
	private String collegeName;
	private long courseId;
	private String courseName;
	private long subjectId;
	private String subjectName;

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

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
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
			this.setCourseId(rs.getLong("COURSE_ID"));
			this.setCourseName(rs.getString("COURSE_NAME"));
			this.setSubjectId(rs.getLong("SUBJECT_ID"));
			this.setSubjectName(rs.getString("SUBJECT_NAME"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getValue() {
		return firstName;
	}
}