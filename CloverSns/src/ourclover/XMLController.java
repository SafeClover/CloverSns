package ourclover;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

public class XMLController extends HttpServlet{
	DocumentBuilderFactory factory = null;
	DocumentBuilder builder= null;
	Document doc = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("post��:"+req.getParameter("upNo"));
		String upNo = req.getParameter("upNo");	// Ŭ���� �۹�ȣ�� �޾ƿ�
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		appendData(id, upNo);
	}

	public XMLController(){
		try{
			factory = DocumentBuilderFactory.newInstance();
			builder = factory.newDocumentBuilder();
			doc = builder.parse(new FileInputStream("C:\\Users\\jhta\\git\\CloverSns\\CloverSns\\WebContent\\clover\\ourclover\\clover.xml")); //
		}catch(Exception e){
			System.out.println("getXmldata:"+e);
		}
	}
	
	public Vector getXmldata(String id){
		Vector alreadyContents = new Vector();
		
		NodeList nodeList = doc.getElementsByTagName(id);	// �ش� ���̵� �±�
		
		Node cloverNode = nodeList.item(0);
		if(cloverNode.getNodeType() == Node.ELEMENT_NODE){
			Element ele = (Element)cloverNode;
			NodeList cloverEleList = ele.getElementsByTagName("content");	// content�±� List ��������
			
			for(int i=0; i<cloverEleList.getLength(); i++){
				Element fstNmEle = (Element)cloverEleList.item(i);	// i��° content ���� 
				NodeList fstNm = fstNmEle.getChildNodes();	// �ش� content�� �ڽĳ��
				alreadyContents.add(((Node)fstNm.item(0)).getNodeValue());	// �ش� content �ڽĳ���� ���� vector�� ����
			}
			
		}
		
		return alreadyContents;
	}
	
	
	public void appendData(String id, String Upno){
		try{
			doc = builder.parse(new FileInputStream("C:\\Users\\jhta\\git\\CloverSns\\CloverSns\\WebContent\\clover\\ourclover\\clover.xml"));
			Element clover = doc.getDocumentElement();
	
			for(Node n = clover.getFirstChild(); n != null; n = n.getNextSibling()){
				if(n.getNodeType() == Node.ELEMENT_NODE){ // ���� ���͸�
					if(n.getNodeName().equals(id)){ // �ش� ���� ���̵��±�
						Document d = n.getOwnerDocument();
						Element e = d.createElement("content");	// content �±� ����
						Text t = d.createTextNode(Upno);	// �ش� �۹�ȣ �ؽ�Ʈ��� ����
						
						n.appendChild(e);	// content �±� �ֱ�
						e.appendChild(t);
						
					}
				}
			}
		}
		catch(Exception err){
			System.out.println("XMLController appendData : " + err);
		}
		
		
		// clover.xml ���Ͽ� Ŭ���� �۹�ȣ ����
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transform;
		try {
			transform = tFactory.newTransformer();
			
			transform.setOutputProperty(OutputKeys.ENCODING, "euc-kr");
			transform.setOutputProperty(OutputKeys.INDENT, "no");
			//... �������� ���� ����
			
			DOMSource source = new DOMSource(doc);
			StreamResult result;
		
			result = new StreamResult(
				new FileOutputStream(
					new File("C:\\Users\\jhta\\git\\CloverSns\\CloverSns\\WebContent\\clover\\ourclover\\clover.xml")));
			transform.transform(source, result);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch (TransformerConfigurationException e1) {
			e1.printStackTrace();
		}catch (TransformerException e) {
			e.printStackTrace();
		}			
		
	}
}
/*}*/
