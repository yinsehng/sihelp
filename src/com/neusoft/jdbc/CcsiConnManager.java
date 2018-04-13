package com.neusoft.jdbc;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class CcsiConnManager {
	
	private static CcsiConnManager instance;
    private static ComboPooledDataSource dataSource;
    
    private CcsiConnManager() throws SQLException, PropertyVetoException {
        dataSource = new ComboPooledDataSource();
        dataSource.setUser("ccsimis");
        dataSource.setPassword("ccsimis");
        dataSource.setJdbcUrl("jdbc:oracle:thin:@10.1.1.56:1521:test1");
//        dataSource.setPassword("ccsimis_1101");
//        dataSource.setJdbcUrl("jdbc:oracle:thin:@10.1.1.26:1521:yb2");
        dataSource.setDriverClass("oracle.jdbc.OracleDriver");
        dataSource.setInitialPoolSize(10);
        dataSource.setMinPoolSize(1);
        dataSource.setMaxPoolSize(15);
        dataSource.setMaxStatements(500);
        dataSource.setMaxIdleTime(60);
        
    }

    public static synchronized CcsiConnManager getInstance() {
        if (instance == null) {
            try {
                instance = new CcsiConnManager();
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
