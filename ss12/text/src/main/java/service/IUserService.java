package service;

import model.User;

import java.util.List;

public interface IUserService
{

    List<User> disPlayByName(String name);

    void create(User user);

    User findById(int id);

    void update(int idUpdate, User userUpdate);

    void deteleById(int idDelete);
}
