package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> disPlayByName(String name) {
        if (name == null){
            name = "";
        }
        return userRepository.getAll(name);
    }

    @Override
    public void create(User user) {
        userRepository.create(user);
    }

    @Override
    public User findById(int id) {
        return userRepository.getAllById(id);
    }

    @Override
    public void update(int idUpdate, User userUpdate) {
        userRepository.update(idUpdate,userUpdate);
    }
}
