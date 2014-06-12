package ourclover;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

public class XMLController {
	DocumentBuilderFactory factory = null;
	DocumentBuilder builder= null;
	Document doc = null;
		
	public XMLController(){
		try{
		factory = DocumentBuilderFactory.newInstance();
		builder= factory.newDocumentBuilder();
		builder.parse(new FileInputStream("C:\\Users\\jhta\\git\\CloverSns14\\CloverSns\\WebContent\\clover\\ourclover\\clover.xml")); // 
		}catch(Exception e){
			System.out.println("getXmldata:"+e);
		}	
	}
	/*public static void main(String[] args) throws ParserConfigurationException, FileNotFoundException, SAXException, IOException{*/
	public String getXmldata(String id){
		String result = null;
		NodeList nodeList = doc.getElementsByTagName(id);
		for(int i =0; i<nodeList.getLength(); i++){
			Node cloverNode = nodeList.item(i);
			System.out.println(i);
			System.out.println(cloverNode.getNodeName());
			if(cloverNode.getNodeType() == Node.ELEMENT_NODE){
				System.out.println("if");
				Element ele = (Element)cloverNode;
				NodeList cloverEleList = ele.getElementsByTagName("content");
				Element fstNmEle = (Element)cloverEleList.item(0);
				NodeList fstNm = fstNmEle.getChildNodes();
				System.out.println("content : "+((Node)fstNm.item(0)).getNodeValue());
				result = ((Node)fstNm.item(0)).getNodeValue();
			}
		}
		
		return result;
	}
	public void appendData(String id, String Upno){
		Element clover = doc.getDocumentElement();
		
		for(Node n = clover.getFirstChild(); n != null; n = n.getNextSibling()){
			if(n.getNodeType() == Node.ELEMENT_NODE){ // 공백 필터링
				if(n.getNodeName().equals(id)){ //해당 세션 아이디태그
					Document d = n.getOwnerDocument();
					Element e = d.createElement("content");
					Text t = d.createTextNode(Upno);
					
					n.appendChild(e);
					e.appendChild(t);
				}
			}
		}
	}
	}
/*}*/
