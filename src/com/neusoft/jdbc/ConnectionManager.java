package com.neusoft.jdbc;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class ConnectionManager {
	
	private static ConnectionManager instance;
    private static ComboPooledDataSource dataSource;
    
    private ConnectionManager() throws SQLException, PropertyVetoException {
    	
    	ReadPropertie rp=new ReadPropertie();
    	String username=rp.getValue("username");
    	String password=rp.getValue("password");
    	String url=rp.getValue("url");
    	String driverclass=rp.getValue("driverclass");
    	int initialpoolsize=Integer.parseInt(rp.getValue("initialpoolsize"));
    	int minpool=Integer.parseInt(rp.getValue("minpool"));
    	int maxpool=Integer.parseInt(rp.getValue("maxpool"));
    	int maxstatements=Integer.parseInt(rp.getValue("maxstatements"));
    	int maxidletime=Integer.parseInt(rp.getValue("maxidletime"));
    	
    	
        dataSource = new ComboPooledDataSource();
 
        dataSource.setUser(username);
        dataSource.setPassword(password);
        dataSource.setJdbcUrl(url);
//        dataSource.setJdbcUrl("jdbc:mysql://localhost:3306/thstore?user=root&password=root&useUnicode=true&characterEncoding=gbk");
        dataSource.setDriverClass(driverclass);
        dataSource.setInitialPoolSize(initialpoolsize);
        dataSource.setMinPoolSize(minpool);
        dataSource.setMaxPoolSize(maxpool);
        dataSource.setMaxStatements(maxstatements);
        dataSource.setMaxIdleTime(maxidletime);
        
    }

    public static synchronized ConnectionManager getInstance() {
        if (instance == null) {
            try {
                instance = new ConnectionManager();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return instance;
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = dataSource.getConnection();
            //取消事物自动提交
            conn.setAutoCommit(false);
            //设置事物隔绝级别
            conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    


}
