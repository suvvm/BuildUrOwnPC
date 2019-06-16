package buildPc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private static final String dbName = "BuildPC";
	private static final String userName = "root";
	private static final String password = "password";
	private static final String dbProps = "useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String url = "jdbc:mysql://localhost:3306/" + dbName + "?" + dbProps;
	
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, userName, password);
	}
	
	public static int executeUpdate(String sql) {
		Connection connection = null;
		int result = 0;
		try {
			connection = DB.getConnection();
			Statement statement = connection.createStatement();
			result = statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			
		}
		return result;
	}
	
	public static ResultSet executeQuery(String sql) throws Exception{
		Connection connection = null;
		ResultSet rSet = null;
		connection = DB.getConnection();
		Statement statement = connection.createStatement();
		rSet = statement.executeQuery(sql);
		return rSet;
	}	
}
