package in.co.rays.proj4.model;

import in.co.rays.proj4.bean.BaseBean;
import in.co.rays.proj4.bean.UserBean;
import in.co.rays.proj4.exception.DuplicateRecordException;

public class UserModel extends BaseModel<UserBean> {

	@Override
	public long add(UserBean bean) throws DuplicateRecordException {
		return 0;
	}

	@Override
	public void update(UserBean bean) throws DuplicateRecordException {

	}

	@Override
	public UserBean getBean() {
		return null;
	}

	@Override
	public String getWhereClause(UserBean bean) {

		return null;
	}

	@Override
	public String getTable() {

		return null;
	}

}