<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>

<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>

<%@page import="java.net.URL"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>

<%@ page contentType="text/xml; charset=UTF-8"%>


<%!
	public String getTagValue(String tag, Element eElement) {
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);
		if (nValue == null) {
			return null;
		}
		return nValue.getNodeValue();
	}
%>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String addr = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?solYear=2020&solMonth=01&ServiceKey=x784laBLXdGNmyVZqW90PSSj612YVc4a%2BXTWtwKwvi%2FJ28hKcB0cmX5yEK9n2KvtcW3sI%2Fuj9dk2VTDg5G5yug%3D%3D";
	String serviceKey = "";
	String paramYear= "";
	String paramMonth = "";
	
	////////////////////////////////////////////////////////////////////// JSON Parsing
	URL url = new URL(addr);
	BufferedInputStream in = new BufferedInputStream(url.openStream());
	StringBuffer buffer = new StringBuffer();
	int i;
	byte[] b = new byte[4096];
	while ((i = in.read(b)) != -1) {
		buffer.append(new String(b, 0, i));
	}
	System.out.println(buffer.toString());
	////////////////////////////////////////////////////////////////////// JSON Parsing
	

	////////////////////////////////////////////////////////////////////// XML Parsing
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(addr);
	
	doc.getDocumentElement().normalize();
	System.out.println(doc.getDocumentElement().getNodeName()); // response
	
	NodeList nList = doc.getElementsByTagName("item");
	System.out.println("# 개수: " + nList.getLength());
	
	for (int temp = 0; temp < nList.getLength(); temp++) {
		Node nNode = nList.item(temp);
		if (nNode.getNodeType() == Node.ELEMENT_NODE) {
			Element eElement = (Element) nNode;
			System.out.println("# XML PARSING");
			System.out.println("휴일명: " + getTagValue("dateName", eElement));
			System.out.println("휴일명: " + getTagValue("locdate", eElement));
		} // if end
	} // for end
	////////////////////////////////////////////////////////////////////// XML Parsing
%>