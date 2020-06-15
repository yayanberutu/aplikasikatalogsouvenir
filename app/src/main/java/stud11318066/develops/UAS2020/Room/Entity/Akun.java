package stud11318066.develops.UAS2020.Room.Entity;

@Entity
public class Akun {
    @PrimaryKey
    public String username;

    @ColumnInfo(name = "password")
    public String password;
}
