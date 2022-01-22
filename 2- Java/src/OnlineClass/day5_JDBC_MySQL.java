package OnlineClass;
import java.sql.*;

public class day5_JDBC_MySQL {

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		Connection con = connection();
		insert(con);
		
	}
	public static Connection connection() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			String username = "root";
			String password = "101298";
			String database = "shashank";
			
			Connection con = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database+"?useSSL=false", username, password);
			System.out.println("Connection is sucessful");
			return con;
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	public static void insert(Connection con) throws SQLException {
		Statement stmt = con.createStatement();
		stmt.executeUpdate("insert into student values (123, 'shashank'); ");
		System.out.println("Record insterted succesfully");
	}

}
