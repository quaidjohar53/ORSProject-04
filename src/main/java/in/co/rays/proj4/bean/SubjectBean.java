package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class SubjectBean extends BaseBean {

	private String name;
	private long courseId;
	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public void setResultset(ResultSet rs) {

		super.setResultset(rs);

		try {

			this.setName(rs.getString("NAME"));
			this.setCourseId(rs.getLong("COURSE_ID"));
			this.setDescription(rs.getString("DESCRIPTION"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getValue() {
		return name;
	}
}