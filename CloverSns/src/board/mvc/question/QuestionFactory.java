package board.mvc.question;

public class QuestionFactory {
	
	private QuestionFactory(){}
	private static QuestionFactory instance = new QuestionFactory();
	public static QuestionFactory getInstance(){
		return instance;
	}
	
	public QuestionCommand createCommand(String com){
		
		if(com.equals("LIST")){
			return new ListCommand();
		}
		else if(com.equals("POST")){
			return new PostCommand();
		}
		else if(com.equals("POSTPROC")){
			return new PostProcCommand();
		}
		else if(com.equals("READ")){
			return new ReadCommand();
		}
		else if(com.equals("REPLY")){
			return new ReplyCommand();
		}
		else if(com.equals("REPLYPROC")){
			return new ReplyProcCommand();
		}
		else if(com.equals("DELETE")){
			return new DeleteCommand();
		}
		else if(com.equals("DELETEPROC")){
			return new DeleteProcCommand();
		}
		else if(com.equals("UPDATE")){
			return new UpdateCommand();
		}
		else if(com.equals("UPDATEPROC")){
			return new UpdateProcCommand();
		}
		else{
		return null;
		}
	}
}
