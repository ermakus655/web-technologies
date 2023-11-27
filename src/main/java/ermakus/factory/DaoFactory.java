package ermakus.factory;

import ermakus.dao.AuthorDao;
import ermakus.dao.BookDao;
import ermakus.dao.UserDao;
import ermakus.dao.impl.AuthorDaoImpl;
import ermakus.dao.impl.BookDaoImpl;
import ermakus.dao.impl.UserDaoImpl;

public final class DaoFactory {
	public static final DaoFactory INSTANCE = new DaoFactory();

	private final AuthorDao authorDao = new AuthorDaoImpl();
	private final BookDao bookDao = new BookDaoImpl();
	private final UserDao userDao = new UserDaoImpl();

	private DaoFactory() {
	}

	public AuthorDao getAuthorDao() {
		return authorDao;
	}

	public BookDao getBookDao() {
		return bookDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}
}