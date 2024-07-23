package classes;
public class Book {
    private int BID;
    private String Bname;
    private String genre;
    private int price;

    public Book(int BID, String Bname, String genre, int price) {
        this.BID = BID;
        this.Bname = Bname;
        this.genre = genre;
        this.price = price;
    }

    public int getBID() {
        return BID;
    }

    public String getBname() {
        return Bname;
    }

    public String getGenre() {
        return genre;
    }

    public int getPrice() {
        return price;
    }
}