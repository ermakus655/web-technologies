package ermakus.dao.impl;

import ermakus.ConnectionPool;
import ermakus.bean.Author;
import ermakus.bean.container.Page;
import ermakus.dao.AuthorDao;
import ermakus.exception.ConnectionException;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorDaoImpl implements AuthorDao {
	private static final ConnectionPool POOL = ConnectionPool.getInstance();

	private static final String INSERT_AUTHOR = "INSERT INTO authors (name, imagePath) VALUES(?, ?)";

	private static final String SELECT_AUTHORS = "SELECT * FROM authors LIMIT ?, ?";

	@Override
	public void addAuthor(Author author) throws ConnectionException, SQLException {
		var connection = POOL.getConnection();
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(INSERT_AUTHOR);
			statement.setString(1, author.getName());
			statement.setString(2, author.getImagePath());
			statement.execute();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			POOL.returnConnection(connection);
		}
	}

	@Override
	public List<Author> getAuthors(Page params) throws ConnectionException, SQLException {
		List<Author> result = new ArrayList<>();
		var connection = POOL.getConnection();
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(SELECT_AUTHORS);
			var startPosition = params.getPageNumber() * params.getPageSize();
			statement.setInt(1, startPosition);
			statement.setInt(2, params.getPageSize());
			var set = statement.executeQuery();
			while (set.next()) {
				result.add(Author.builder().id(set.getInt("id")).name(set.getString("name")).imagePath(set.getString("imagePath")).build());
			}
			set.close();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			POOL.returnConnection(connection);
		}
		return result;
	}
}