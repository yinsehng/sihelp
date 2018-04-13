package com.neusoft.jdbc;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class SiConnManager {
	
	private static SiConnManager instance;
    private static ComboPooledDataSource dataSource;
    
    private SiConnManager() throws SQLException, PropertyVetoException {
//    	ReadPropertie rp=new ReadPropertie();
//    	String username=rp.getValue("c_username");
//    	String password=rp.getValue("c_password");
//    	String url=rp.getValue("c_url");
//    	String driverclass=rp.getValue("c_driverclass");
//    	int initialpoolsize=Integer.parseInt(rp.getValue("c_initialpoolsize"));
//    	int minpool=Integer.parseInt(rp.getValue("c_minpool"));
//    	int maxpool=Integer.parseInt(rp.getValue("c_maxpool"));
//    	int maxstatements=Integer.parseInt(rp.getValue("c_maxstatements"));
//    	int maxidletime=Integer.parseInt(rp.getValue("c_maxidletime"));
    	
    	
        dataSource = new ComboPooledDataSource();
 
        dataSource.setUser("qqhesi");
        dataSource.setPassword("qqhesi");
        dataSource.setJdbcUrl("jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.8.153)(PORT = 1521))(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.8.154)(PORT = 1521))(LOAD_BALANCE = yes))(CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = qqhesi) (FAILOVER_MODE = (TYPE = SELECT) (METHOD = BASIC) (RETRIES = 180) (DELAY = 5))))");
        dataSource.setDriverClass("oracle.jdbc.OracleDriver");
        dataSource.setInitialPoolSize(10);
        dataSource.setMinPoolSize(1);
        dataSource.setMaxPoolSize(15);
        dataSource.setMaxStatements(50);
        dataSource.setMaxIdleTime(60);
        
    }

    public static synchronized SiConnManager getInstance() {
        if (instance == null) {
            try {
                instance = new SiConnManager();
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
