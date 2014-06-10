package board;

public class ServiceDto {
   private int		boardUpNo;
   private String	title;
   private String	id;      
   private String	boardContent;
   private String	regDate;   
   private int		count;
   private int		pos;
   private int		depth;
   private String	pw;
   private String 	division;
   
   public String getDivision() {
	return division;
}
public void setDivision(String division) {
	this.division = division;
}
public int getBoardUpNo() {
      return boardUpNo;
   }
   public void setBoardUpNo(int boardUpNo) {
      this.boardUpNo = boardUpNo;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getBoardContent() {
      return boardContent;
   }
   public void setBoardContent(String boardContent) {
      this.boardContent = boardContent;
   }
   public String getRegDate() {
      return regDate;
   }
   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
   public int getCount() {
      return count;
   }
   public void setCount(int count) {
      this.count = count;
   }
   public int getPos() {
      return pos;
   }
   public void setPos(int pos) {
      this.pos = pos;
   }
   public int getDepth() {
      return depth;
   }
   public void setDepth(int depth) {
      this.depth = depth;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }

}