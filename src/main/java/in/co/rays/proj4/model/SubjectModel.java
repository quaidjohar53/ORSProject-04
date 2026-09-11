package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import in.co.rays.proj4.bean.SubjectBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public class SubjectModel extends BaseModel<SubjectBean> {

	@Override
	public long add(SubjectBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		int pk = 0;

		SubjectBean existBean = findByName(bean.getName());

		if (existBean != null) {

			throw new DuplicateRecordException("subject already exist");
		}

		try {

			pk = nextPK();

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement("insert into " + getTable() + " values (?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, pk);

			pstmt.setString(2, bean.getName());

			pstmt.setLong(3, bean.getCourseId());

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

			throw new ApplicationException("Exception in adding subject " + e.getMessage());

		} finally {

			JDBCDataSource.closeConnection(conn);
		}

		return pk;
	}

	@Override
	public void update(SubjectBean bean) throws ApplicationException, DuplicateRecordException {

		Connection conn = null;

		SubjectBean existBean = findByName(bean.getName());

		if (existBean != null && existBean.getId() != bean.getId()) {

			throw new DuplicateRecordException("subject already exist");
		}

		try {

			conn = JDBCDataSource.getConnection();

			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"update " + getTable() + " set name=?, " + "course_id=?, " + "description=?, " + "created_by=?, "
							+ "modified_by=?, " + "created_datetime=?, " + "modified_datetime=? " + "where id=?");

			pstmt.setString(1, bean.getName());

			pstmt.setLong(2, bean.getCourseId());

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

				throw new ApplicationException("Exception : " + ex.getMessage());
			}

			throw new ApplicationException("Exception in updating subject");

		} finally {

			JDBCDataSource.closeConnection(conn);
		}
	}

	public SubjectBean findByName(String name) throws ApplicationException {

		SubjectBean bean = findByUniqueColumn("NAME", name);

		return bean;
	}

	@Override
	public String getWhereClause(SubjectBean bean) {

		StringBuffer sql = new StringBuffer();

		if (bean.getName() != null && bean.getName().trim().length() > 0) {

			sql.append(" AND NAME LIKE '" + bean.getName() + "%'");
		}

		if (bean.getCourseId() != 0) {

			sql.append(" AND COURSE_ID = " + bean.getCourseId());
		}

		if (bean.getDescription() != null && bean.getDescription().trim().length() > 0) {

			sql.append(" AND DESCRIPTION LIKE '" + bean.getDescription() + "%'");
		}

		return sql.toString();
	}

	@Override
	public String getTable() {

		return "ST_SUBJECT";
	}

	@Override
	public SubjectBean getBean() {

		return new SubjectBean();
	}
}