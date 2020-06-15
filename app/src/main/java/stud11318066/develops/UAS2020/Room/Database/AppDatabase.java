package stud11318066.develops.UAS2020.Room.Database;


@Database(entities = {Produk.class}, version = 1)
public abstract AppDatabase extends RoomDatabase {
    public abstract AkunDao akunDao();
    public abstract ProdukDao akunDao();
}
