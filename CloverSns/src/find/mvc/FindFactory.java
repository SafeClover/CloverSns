package find.mvc;

public class FindFactory {
	
	public FindFactory(){}
	
	private static FindFactory instance = new FindFactory();
	public static FindFactory getInstance(){
		return instance;
	}
	
	public FindCommand createCommand(String com){
		if(com.equals("ID")){
			return new IdCommand();
		}
		else if(com.equals("PW")){
			return new PwCommand();
		}
		
		return null;
	}
	
}
