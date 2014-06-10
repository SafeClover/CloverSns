package index.mvc;

public class IndexFactory {
	
	private IndexFactory(){}
		private static IndexFactory instance = new IndexFactory();
		public static IndexFactory getInstance(){
			return instance;
		}
		
		public IndexCommand createCommand(String cmd){
			
			if(cmd.equals("Login")){
				return new LoginCommand();
			}
			else if(cmd.equals("Mypage")){
				return new MyPageCommand();				
			}
			else if(cmd.equals("Ourclover")){
				return new OurCloverCommand();
			}
			else if(cmd.equals("Contest")){
				return new ContestCommand();
			}
			else if(cmd.equals("Infoedit")){
				return new InfoeditCommand();
			}
			else{
				return null;
			}
			
		}
}
