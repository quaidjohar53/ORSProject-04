package in.co.rays.proj4.bean;

import java.sql.ResultSet;

public class MarksheetBean extends BaseBean {

	private long rollNo;
	private long studentId;
	private String name;
	private int physics;
	private int chemistry;
	private int maths;

	public long getRollNo() {
		return rollNo;
	}

	public void setRollNo(long rollNo) {
		this.rollNo = rollNo;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhysics() {
		return physics;
	}

	public void setPhysics(int physics) {
		this.physics = physics;
	}

	public int getChemistry() {
		return chemistry;
	}

	public void setChemistry(int chemistry) {
		this.chemistry = chemistry;
	}

	public int getMaths() {
		return maths;
	}

	public void setMaths(int maths) {
		this.maths = maths;
	}

	@Override
	public void setResultset(ResultSet rs) {

		super.setResultset(rs);

		try {

			this.setRollNo(rs.getLong("ROLL_NO"));
			this.setStudentId(rs.getLong("STUDENT_ID"));
			this.setName(rs.getString("NAME"));
			this.setPhysics(rs.getInt("PHYSICS"));
			this.setChemistry(rs.getInt("CHEMISTRY"));
			this.setMaths(rs.getInt("MATHS"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getValue() {
		return name;
	}
}