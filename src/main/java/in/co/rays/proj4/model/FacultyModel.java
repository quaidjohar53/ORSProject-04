package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.CollegeBean;
import in.co.rays.proj4.bean.FacultyBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class FacultyModel extends BaseModel<FacultyBean> {

	@Override
	public long add(FacultyBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		int pk = 0;

		FacultyBean existBean = findByEmail(bean.getEmail());

		if (existBean != null) {
			throw new DuplicateRecordException(
					"faculty already exist");
		}

		/*
		 * Get college name using college id
		 */
		CollegeModel cmodel = new CollegeModel();

		CollegeBean cbean =
				cmodel.findByPK(bean.getCollegeId());

		if (cbean != null) {
			bean.setCollegeName(cbean.getName());
		}

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			pk = nextPK();

			pstmt.setLong(1, pk);
			pstmt.setLong(2, bean.getCollegeId());
			pstmt.setString(3, bean.getCollegeName());
			pstmt.setString(4, bean.getFirstName());
			pstmt.setString(5, bean.getLastName());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getMobileNo());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getGender());
			pstmt.setDate(10,
					new java.sql.Date(
							bean.getDob().getTime()));
			pstmt.setString(11, bean.getCreatedBy());
			pstmt.setString(12, bean.getModifiedBy());
			pstmt.setTimestamp(13, bean.getCreatedDatetime());
			pstmt.setTimestamp(14, bean.getModifiedDatetime());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			JDBCDataSource.trnRollBack(conn);

			throw new ApplicationException(
					"Exception in adding faculty "
					+ e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	@Override
	public void update(FacultyBean bean)
			throws ApplicationException,
			DuplicateRecordException {

		Connection conn = null;

		FacultyBean existBean =
				findByEmail(bean.getEmail());

		if (existBean != null
				&& existBean.getId() != bean.getId()) {

			throw new DuplicateRecordException(
					"faculty already exist");
		}

		CollegeModel cmodel = new CollegeModel();

		CollegeBean cbean =
				cmodel.findByPK(bean.getCollegeId());

		if (cbean != null) {
			bean.setCollegeName(cbean.getName());
		}

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt =
					conn.prepareStatement(
					"update " + getTable()
					+ " set college_id=?, college_name=?, "
					+ "first_name=?, last_name=?, email=?, "
					+ "mobile_no=?, address=?, gender=?, "
					+ "date_of_birth=?, created_by=?, "
					+ "modified_by=?, created_datetime=?, "
					+ "modified_datetime=? "
					+ "where id=?");

			pstmt.setLong(1, bean.getCollegeId());
			pstmt.setString(2, bean.getCollegeName());
			pstmt.setString(3, bean.getFirstName());
			pstmt.setString(4, bean.getLastName());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getMobileNo());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getGender());
			pstmt.setDate(9,
					new java.sql.Date(
							bean.getDob().getTime()));
			pstmt.setString(10, bean.getCreatedBy());
			pstmt.setString(11, bean.getModifiedBy());
			pstmt.setTimestamp(12,
					bean.getCreatedDatetime());
			pstmt.setTimestamp(13,
					bean.getModifiedDatetime());
			pstmt.setLong(14, bean.getId());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			JDBCDataSource.trnRollBack(conn);

			throw new ApplicationException(
					"Exception in updating faculty "
					+ e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
	}

	public FacultyBean findByEmail(String email)
			throws ApplicationException {

		return findByUniqueColumn("EMAIL", email);
	}

	@Override
	public String getWhereClause(FacultyBean bean) {

		StringBuffer sql = new StringBuffer();

		if (bean.getFirstName() != null
				&& bean.getFirstName().length() > 0) {

			sql.append(" AND FIRST_NAME LIKE '"
					+ bean.getFirstName() + "%'");
		}

		if (bean.getLastName() != null
				&& bean.getLastName().length() > 0) {

			sql.append(" AND LAST_NAME LIKE '"
					+ bean.getLastName() + "%'");
		}

		if (bean.getEmail() != null
				&& bean.getEmail().length() > 0) {

			sql.append(" AND EMAIL LIKE '"
					+ bean.getEmail() + "%'");
		}

		if (bean.getMobileNo() != null
				&& bean.getMobileNo().length() > 0) {

			sql.append(" AND MOBILE_NO LIKE '"
					+ bean.getMobileNo() + "%'");
		}

		if (bean.getAddress() != null
				&& bean.getAddress().length() > 0) {

			sql.append(" AND ADDRESS LIKE '"
					+ bean.getAddress() + "%'");
		}

		if (bean.getGender() != null
				&& bean.getGender().length() > 0) {

			sql.append(" AND GENDER LIKE '"
					+ bean.getGender() + "%'");
		}

		if (bean.getCollegeId() != 0) {

			sql.append(" AND COLLEGE_ID = "
					+ bean.getCollegeId());
		}

		return sql.toString();
	}

	@Override
	public String getTable() {
		return "ST_FACULTY";
	}

	@Override
	public FacultyBean getBean() {
		return new FacultyBean();
	}
}