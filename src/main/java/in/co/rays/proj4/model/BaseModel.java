package in.co.rays.proj4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.JdbcConnection;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.exception.ApplicationException;
import in.co.rays.proj4.exception.DatabaseException;
import in.co.rays.proj4.exception.DuplicateRecordException;
import in.co.rays.proj4.util.JDBCDataSource;

public abstract class BaseModel<T extends BaseBean> {

	public abstract long add(T bean) throws DuplicateRecordException;

	public abstract void update(T bean) throws DuplicateRecordException;

	public abstract String getWhereClause(T bean);

	public abstract String getTable();

	public abstract T getBean();

	public Integer nextPk() throws DatabaseException {

		Connection conn = null;

		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select max(ID) from " + getTable());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				pk = rs.getInt(1);

			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DatabaseException("EXception : Exception in getting pk ");

		} finally {
			JDBCDataSource.closeConnection(conn);

		}

		return pk + 1;
	}

	public void delete(int id) throws DatabaseException {
		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("delete from " + getTable() + " where id = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

			conn.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			JDBCDataSource.trnRollBack(conn);

		} finally {
			JDBCDataSource.closeConnection(conn);
		}

	}

	public T findByPK(long pk) throws ApplicationException {
		T bean = null;
		Connection conn = null;

		try {

			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select * from " + getTable() + "where id = ? ");
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = getBean();
				bean.setResultset(rs);

			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			throw new ApplicationException("Exception : Exception is getting user by pk ");

		} finally {
			JDBCDataSource.closeConnection(conn);

		}
		return bean;

	}

	public T findByUniqueColumn(String column, String value) {

		T bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn
					.prepareStatement("select * from " + getTable() + "where " + column + "='" + value + "'");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = getBean();
				bean.setResultset(rs);

			}
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception: in findByUniqueColumn, " + column + " " + e.getMessage());

		}

		finally {
			JDBCDataSource.closeConnection(conn);
		}

		return bean;
	}

}