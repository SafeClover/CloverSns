package board.mvc.notice;

public class NoticeFactory {
	
	private NoticeFactory(){}
	private static NoticeFactory instance = new NoticeFactory();
	public static NoticeFactory getInstance(){
		return instance;
	}
	
	public NoticeCommand createcmdmand(String cmd){
		
		  if(cmd.equals("LIST")){
	         return new ListCommand();
	      }
	      else if(cmd.equals("POST")){
	         return new PostCommand();
	      }
	      else if(cmd.equals("POSTPROC")){
	    	  return new PostProcCommand();
	      }
	      else if(cmd.equals("READ")){
	         return new ReadCommand();
	      }
	      else if(cmd.equals("DELETE")){
	         return new DeleteCommand();
	      }
	      else if(cmd.equals("UPDATE")){
	         return new UpdateCommand();
	      }
	      else if(cmd.equals("UPDATEPROC")){
	    	  return new UpdateProcCommand();
	      }
	      else{
	    	  return null;
	   }
	}
}
