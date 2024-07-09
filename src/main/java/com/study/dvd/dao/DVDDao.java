package com.study.dvd.dao;

import com.study.dvd.db.DBConnectionMgr;
import com.study.dvd.entity.DVD;
import com.study.dvd.entity.Producer;
import com.study.dvd.entity.Publisher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DVDDao {
    public static int addDvd(DVD dvd) {
        DBConnectionMgr pool = DBConnectionMgr.getInstance();

        // 자바에 다른 프로그램을 연결시키디 위해 사용하는 매체 Connection과 PreparedStatement
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int successCount = 0;

        try {
            connection = pool.getConnection();  // 데이터베이스 연결 (pool: 저장소를 뜻함)
            String sql = "insert into dvd_tb values(0, ?, ?, ?, ?, ?, now())";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, dvd.getRegistrationNumber());
            preparedStatement.setString(2, dvd.getTitle());
            preparedStatement.setInt(3, dvd.getProducer().getProducerId());
            preparedStatement.setInt(4, dvd.getPublisher().getPublisherId());
            preparedStatement.setInt(5, dvd.getPublicationYear());
            successCount = preparedStatement.executeUpdate();

        } catch (Exception e) {

        } finally {
            pool.freeConnection(connection, preparedStatement);
        }

        return successCount;
    }

    public static int addProducer(Producer producer) {
        DBConnectionMgr pool = DBConnectionMgr.getInstance();

        // 자바에 다른 프로그램을 연결시키디 위해 사용하는 매체 Connection과 PreparedStatement
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generateedKeys = null;
        int successCount = 0;

        try {
            connection = pool.getConnection();  // 데이터베이스 연결 (pool: 저장소를 뜻함)
            String sql = "insert into producer_tb values(0, ?)";
            // auto increments 값이 얼마부터인지 모르기 때문에 RETURN_GENERATED_KEYS을 사용해야 한다
            preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS); // 미완성된 쿼리 실행시킬 준비
            preparedStatement.setString(1, producer.getProducerName()); // 자리에 데이터 채우기
            successCount = preparedStatement.executeUpdate(); // 쿼리 실행
            generateedKeys = preparedStatement.getGeneratedKeys();
            generateedKeys.next();
            producer.setProducerId(generateedKeys.getInt(1));
        } catch (Exception e) {

        } finally {
            pool.freeConnection(connection, preparedStatement, generateedKeys);
        }

        return successCount;
    }

    public static int addPublisher(Publisher publisher) {
        DBConnectionMgr pool = DBConnectionMgr.getInstance();

        // 자바에 다른 프로그램을 연결시키디 위해 사용하는 매체 Connection과 PreparedStatement
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet generateedKeys = null;
        int successCount = 0;

        try {
            connection = pool.getConnection();  // 데이터베이스 연결 (pool: 저장소를 뜻함)
            String sql = "insert into publisher_tb values(0, ?)";
            preparedStatement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS); // 미완성된 쿼리 실행시킬 준비
            preparedStatement.setString(1, publisher.getPublisherName()); // 자리에 데이터 채우기
            successCount = preparedStatement.executeUpdate(); // 쿼리 실행
            generateedKeys = preparedStatement.getGeneratedKeys();
            generateedKeys.next();
            publisher.setPublisherId(generateedKeys.getInt(1));
        } catch (Exception e) {

        } finally {
            pool.freeConnection(connection, preparedStatement, generateedKeys);
        }

        return successCount;
    }

    public static List<DVD> findAll(int count) {
        DBConnectionMgr pool = DBConnectionMgr.getInstance();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<DVD> dvdList = new ArrayList<>();

        try {
            connection = pool.getConnection();
            String sql = "select * from dvd_view limit 0, ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, count);
            resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                System.out.println(resultSet.getString(3));
                Producer producer = Producer.builder()
                        .producerId(resultSet.getInt(4))
                        .producerName(resultSet.getString(5))
                        .build();
                Publisher publisher = Publisher.builder()
                        .publisherId(resultSet.getInt(6))
                        .publisherName(resultSet.getString(7))
                        .build();
                DVD dvd = DVD.builder()
                        .dvdId(resultSet.getInt(1))
                        .registrationNumber(resultSet.getString(2))
                        .title(resultSet.getString(3))
                        .producerId(producer.getProducerId())
                        .producer(producer)
                        .publisherId(publisher.getPublisherId())
                        .publisher(publisher)
                        .publicationYear(resultSet.getInt(8))
                        .databaseDate(resultSet.getDate(9).toLocalDate())
                        .build();

                dvdList.add(dvd);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(connection);
        }

        return dvdList;

    }

}
