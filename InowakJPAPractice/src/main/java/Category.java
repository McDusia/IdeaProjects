import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;

    @OneToMany
    @JoinColumn(name = "CATEGORY_FK")
    private Set<Product> products = new HashSet<>();


    public Category(String name) {
        this.name = name;
    }

    public Category() {

    }


    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void addProduct(Product p) {
        this.products.add(p);
        p.setCategory(this);
    }


}
