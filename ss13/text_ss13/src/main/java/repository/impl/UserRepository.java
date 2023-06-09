package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public List<User> getAll(String name) {
        List<User> userList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select id,name, email, country from users where name like concat ('%',?,'%')");
            preparedStatement.setString(1,name);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
//    public void create(User user) {
//        try {
//            PreparedStatement preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("insert into users (name, email, country)values (?,?,?);");
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
    public void create(User user) {
        try {
            CallableStatement callableStatement = BaseRepository.getConnection()
                    .prepareCall("CALL insert_user(?,?,?)");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
//    public User getAllById(int id) {
//        User user;
//        try {
//            PreparedStatement preparedStatement = BaseRepository.getConnection()
//                    .prepareStatement("select id,name, email, country from users where id = ?");
//            preparedStatement.setInt(1,id);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {
//                user = new User();
//                user.setId(resultSet.getInt("id"));
//                user.setName(resultSet.getString("name"));
//                user.setEmail(resultSet.getString("email"));
//                user.setCountry(resultSet.getString("country"));
//                return user;
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null ;
//    }
    public User getAllById(int id) {
        User user;
        try {
            CallableStatement callableStatement = BaseRepository.getConnection()
                            .prepareCall("CALL get_user_by_id(?)");
            callableStatement.setInt(1,id);
            ResultSet resultSet = callableStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null ;
    }

    @Override
    public void update(int idUpdate, User userUpdate) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("update users set name=?,email= ?, country=? where id = ?");
            preparedStatement.setString(1, userUpdate.getName());
            preparedStatement.setString(2, userUpdate.getEmail());
            preparedStatement.setString(3, userUpdate.getCountry());
            preparedStatement.setInt(4,idUpdate);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deteleById(int idDelete) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("delete from users where id =?");
            preparedStatement.setInt(1,idDelete);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void addUserPermission() {
        Connection connection = null;
        try {
            connection = BaseRepository.getConnection();
            connection.setAutoCommit(false);

            PreparedStatement preparedStatement = connection.prepareStatement("insert into users(name, email, country) values ('Đào', 'dao@gmail.com', 'Mỹ')");
            preparedStatement.executeUpdate();
            PreparedStatement preparedStatement1 = connection.prepareStatement("insert into users(name, email, country) values ('Huy', 'huy@gmail.com', 'Lào')");
            preparedStatement1.executeUpdate();

            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
    }
}
