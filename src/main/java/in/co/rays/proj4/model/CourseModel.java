package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.CourseBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class CourseModel extends BaseModel<CourseBean> {

	@Override
	public long add(CourseBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		int pk = 0;

		CourseBean existBean = findByName(bean.getName());

		if (existBean != null) {
			throw new DuplicateRecordException("course already exist");
		}

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"insert into " + getTable()
					+ " values (?,?,?,?,?,?,?,?)");

			pk = nextPK();

			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getDuration());
			pstmt.setString(4, bean.getDescription());
			pstmt.setString(5, bean.getCreatedBy());
			pstmt.setString(6, bean.getModifiedBy());
			pstmt.setTimestamp(7, bean.getCreatedDatetime());
			pstmt.setTimestamp(8, bean.getModifiedDatetime());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			JDBCDataSource.trnRollBack(conn);

			throw new ApplicationException(
					"Exception in adding course " + e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	@Override
	public void update(CourseBean bean)
			throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		CourseBean existBean = findByName(bean.getName());

		if (existBean != null && existBean.getId() != bean.getId()) {
			throw new DuplicateRecordException("course already exist");
		}

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update " + getTable()
					+ " set name=?, duration=?, description=?, "
					+ "created_by=?, modified_by=?, "
					+ "created_datetime=?, modified_datetime=? "
					+ "where id=?");

			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getDuration());
			pstmt.setString(3, bean.getDescription());
			pstmt.setString(4, bean.getCreatedBy());
			pstmt.setString(5, bean.getModifiedBy());
			pstmt.setTimestamp(6, bean.getCreatedDatetime());
			pstmt.setTimestamp(7, bean.getModifiedDatetime());
			pstmt.setLong(8, bean.getId());

			pstmt.executeUpdate();

			conn.commit();

			pstmt.close();

		} catch (Exception e) {

			try {
				conn.rollback();
			} catch (Exception ex) {
				throw new ApplicationException(
						"Exception : " + ex.getMessage());
			}

			throw new ApplicationException(
					"Exception in updating course");

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
	}

	public CourseBean findByName(String name)
			throws ApplicationException {

		CourseBean bean =
				findByUniqueColumn("NAME", name);

		return bean;
	}

	@Override
	public String getWhereClause(CourseBean bean) {

		StringBuffer sql = new StringBuffer();

		if (bean.getName() != null
				&& bean.getName().length() > 0) {

			sql.append(" AND NAME LIKE '"
					+ bean.getName() + "%'");
		}

		if (bean.getDuration() != null
				&& bean.getDuration().length() > 0) {

			sql.append(" AND DURATION LIKE '"
					+ bean.getDuration() + "%'");
		}

		if (bean.getDescription() != null
				&& bean.getDescription().length() > 0) {

			sql.append(" AND DESCRIPTION LIKE '"
					+ bean.getDescription() + "%'");
		}

		return sql.toString();
	}

	@Override
	public String getTable() {
		return "ST_COURSE";
	}

	@Override
	public CourseBean getBean() {
		return new CourseBean();
	}
}