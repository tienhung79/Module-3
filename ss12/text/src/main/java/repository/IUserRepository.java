package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getAll(String name);

    void create(User user);

    User getAllById(int id);

    void update(int idUpdate, User userUpdate);
}
