package OnlineClass;
import java.sql.*;

public class day5_JDBC_PostgreSQL {

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		Connection con = connection();
		insert(con);
		
	}
	public static Connection connection() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		try {
			String username = "postgres";
			String password = "101298";
			String database = "bajaj";
			
			Connection con = null;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/"+database, username, password);
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
		stmt.executeUpdate("insert into employee values (14, 'Pranav', 24, 35000); ");
		System.out.println("Record insterted succesfully");
	}

}
