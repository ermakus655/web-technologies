package ermakus.service.impl;

import ermakus.exception.ConnectionException;
import ermakus.exception.DatabaseException;
import ermakus.exception.ServiceException;
import ermakus.factory.DaoFactory;
import ermakus.service.LoginService;
import ermakus.utils.Tools;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

import static ermakus.utils.Constants.*;

public class LoginServiceImpl implements LoginService {
	@Override
	public void getLoginPage(ServletRequest request, ServletResponse response, ServletConfig servlet) throws ServiceException {
		try {
			var requestDispatcher = servlet.getServletContext().getRequestDispatcher(PREFIX + LOGIN_PAGE + POSTFIX);
			requestDispatcher.forward(request, response);
		} catch (IOException | ServletException e) {
			throw new ServiceException(SERVICE_EXCEPTION);
		}
	}

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response, ServletConfig servlet) throws DatabaseException, ServiceException {
		try {
			var daoFactory = DaoFactory.INSTANCE;
			var userDao = daoFactory.getUserDao();
			var requestDispatcher = servlet.getServletContext().getRequestDispatcher(PREFIX + LOGIN_PAGE + POSTFIX);
			var user = userDao.getUserByEmailPassword(request.getParameter(EMAIL), Tools.getHash(request.getParameter(PASSWORD)));
			if (user != null) {
				request.getSession().setAttribute(USER, user);
				response.sendRedirect(request.getContextPath() + "/profile");
			} else {
				request.setAttribute(STATUS, INVALID_CREDENTIALS);
				requestDispatcher.forward(request, response);
			}
		} catch (SQLException | ConnectionException e) {
			throw new DatabaseException(DB_EXCEPTION);
		} catch (ServletException | IOException e) {
			throw new ServiceException(SERVICE_EXCEPTION);
		}
	}
}