package mypage.el;

import header.mvc.ContestCommand;
import header.mvc.FriendCommand;
import header.mvc.HeaderCommand;
import header.mvc.HeaderFactory;
import header.mvc.MypageCommand;
import header.mvc.OurcloverCommand;

public class MypageFactory {
	private MypageFactory(){}
	private static MypageFactory instance = new MypageFactory();
	public static MypageFactory getInstance(){
		return instance;
	}
	
	public mypage.el.MypageCommand createCommand(String com){
			
			if(com.equals("delete")){
				return new ContentDeleteCommand();
			}
			else{
				return null;
			}
	}
}
