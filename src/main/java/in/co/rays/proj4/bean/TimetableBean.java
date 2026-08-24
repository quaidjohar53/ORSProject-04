package in.co.rays.proj4.bean;

import java.sql.ResultSet;
import java.util.Date;

public class TimetableBean extends BaseBean {

	private int semester;
	private String description;
	private Date examDate;
	private String examTime;
	private long courseId;
	private String courseName;
	private long subjectId;
	private String subjectName;

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
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

			this.setSemester(rs.getInt("SEMESTER"));
			this.setDescription(rs.getString("DESCRIPTION"));
			this.setExamDate(rs.getDate("EXAM_DATE"));
			this.setExamTime(rs.getString("EXAM_TIME"));
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
		return description;
	}
}