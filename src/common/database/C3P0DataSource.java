package common.database;
import java.sql.Connection;
import java.sql.DriverManager;
import com.mchange.v2.c3p0.ComboPooledDataSource;
public class C3P0DataSource {
	public static void main(String[] args) {
		System.out.println("rrrrrrrrrrrr");
	}
	private static C3P0DataSource dataSource;
	   private ComboPooledDataSource comboPooledDataSource;
	   public static C3P0DataSource getInstance() {
	      if (dataSource == null)
	         dataSource = new C3P0DataSource();
	      return dataSource;
	   }
	   public Connection getConnection() {
		   Connection dbconn = null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	        // dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/talenthunt?autoReconnect=true", "support_t", "password");
	         dbconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/talenthunt?autoReconnect=true", "root", "");
	          } catch (Exception ex) {
	            System.out.println("Exception in DBConnection java file of fun" + ex);
	        }
	        return dbconn;
		}
	}
