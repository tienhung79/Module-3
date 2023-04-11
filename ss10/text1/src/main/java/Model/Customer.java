package Model;

import org.omg.PortableInterceptor.ServerRequestInfo;

public class Customer {
    private String name;
    private String dateOfBirh;
    private String add;
    private String image;

    public Customer() {
    }

    public Customer(String name, String dateOfBirh, String add, String image) {
        this.name = name;
        this.dateOfBirh = dateOfBirh;
        this.add = add;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirh() {
        return dateOfBirh;
    }

    public void setDateOfBirh(String dateOfBirh) {
        this.dateOfBirh = dateOfBirh;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
