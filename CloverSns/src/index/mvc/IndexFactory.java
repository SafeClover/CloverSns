package index.mvc;

import header.mvc.MypageCommand;

public class IndexFactory {
	
	private IndexFactory(){}
		private static IndexFactory instance = new IndexFactory();
		public static IndexFactory getInstance(){
			return instance;
		}
		
		public IndexCommand createCommand(String cmd){
			
			if(cmd.equals("Login")){
				return new MypageCommand();
			}
			else if(cmd.equals("InfoEditImg")){
				return new InfoEditImgCommand();
			}
			else if(cmd.equals("INFO_EDITIMG")){
				return new InfoEditImgProcCommand();
			}
			else if(cmd.equals("profileEdit")){
				return new ProfileEditCommand();
			}
			else if(cmd.equals("infoEditproc")){
				return new InfoEditProcCommand();
			}
			else if(cmd.equals("logout")){
				return new LogoutCommand();
			}
			else if(cmd.equals("impression")){
				return new ImpressionCommand();
			}
			else{
				return null;
			}
			
		}
}
