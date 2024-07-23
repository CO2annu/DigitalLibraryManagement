package classes;

public class userBook {
    private int IID;
    private int UID;
    private int BID;
    private String issuedDate;
    private String returnDate;
    private String bookName;
    private String genre;
    private int price;

    public userBook(int IID, int UID, int BID, String issuedDate, String returnDate, String bookName, String genre, int price) {
        this.IID = IID;
        this.UID = UID;
        this.BID = BID;
        this.issuedDate = issuedDate;
        this.returnDate = returnDate;
        this.bookName = bookName;
        this.genre = genre;
        this.price = price;
    }

    public int getIID() {
        return IID;
    }

    public int getUID() {
        return UID;
    }

    public int getBID() {
        return BID;
    }

    public String getIssuedDate() {
        return issuedDate;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public String getBookName() {
        return bookName;
    }

    public String getGenre() {
        return genre;
    }

    public int getPrice() {
        return price;
    }
}

