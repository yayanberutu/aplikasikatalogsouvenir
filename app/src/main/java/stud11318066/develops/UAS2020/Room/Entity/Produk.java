package stud11318066.develops.UAS2020.Room.Entity;

@Entity
public class Produk {
    @PrimaryKey
    public int id;

    @ColumnInfo(name = "nama")
    public String nama;

    @ColumnInfo(name = "deskripsi")
    public String deskripsi;

    @ColumnInfo(name = "harga")
    public float harga;

    @ColumnInfo(name = "stok")
    public int stok;
}
