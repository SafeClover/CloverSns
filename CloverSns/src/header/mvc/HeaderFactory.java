package header.mvc;


public class HeaderFactory {
	private HeaderFactory(){}
	private static HeaderFactory instance = new HeaderFactory();
	public static HeaderFactory getInstance(){
		return instance;
	}
	
	public HeaderCommand createCommand(String com){
			
			if(com.equals("friendslist")){
				return new FriendCommand();
			}
			else if(com.equals("mypage")){
				return new MypageCommand();
			}
			else if(com.equals("ourclover")){
				return new OurcloverCommand();
			}
			else if(com.equals("contestboard")){
				return new ContestCommand();
			}
			else{
				return null;
			}
	}
}
