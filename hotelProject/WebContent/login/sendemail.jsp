<%@page import="mail.SHA256"%>
<%@page import="mail.Gmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.Address" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="java.util.Properties" %>
<%@ page import="mail.SHA256"%>
<%@ page import="mail.Gmail"%>
<%@ page import="java.io.PrintWriter"%>

<%

	String email=request.getParameter("email");
	String pa=request.getParameter("pa");
	

	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:9000/hotelProject/main.jsp?go=member/memberform.jsp?ech=ok";//이메일 링크로 들어가야한다
	String from = "rlatngus9655";
	String to = email;
	String subject = "그레이스호텔 임시번호입니다.";
	String content = "임시 비밀번호는 <b style='text-decoration: underline;'>" + pa+"</b> 입니다";
		

	

	// SMTP에 접속하기 위한 정보를 기입합니다.

	   Properties p = new Properties();
   p.put("mail.smtp.user", from);
   p.put("mail.smtp.host", "smtp.googlemail.com");
   p.put("mail.smtp.port", "456");
   p.put("mail.smtp.starttls.enable", "true");
   p.put("mail.smtp.auth", "true");
   p.put("mail.smtp.debug", "true");
   p.put("mail.smtp.socketFactory.port", "465");
   p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
   p.put("mail.smtp.socketFactory.fallback", "false");
   

	try {
	   Authenticator auth = new Gmail();
	   Session ses = Session.getInstance(p, auth);
	   ses.setDebug(true);
	   MimeMessage msg = new MimeMessage(ses);
	   msg.setSubject(subject);
	   Address fromAddr = new InternetAddress(from);
	   msg.setFrom(fromAddr);
	   Address toAddr = new InternetAddress(to);
	   msg.addRecipient(Message.RecipientType.TO, toAddr);
	   msg.setContent(content, "text/html;charset=UTF8");
	   Transport.send(msg);
	   
   } catch (Exception e) {
	   e.printStackTrace();
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('오류가 발생했습니다..');");
	   script.println("history.back();");
	   script.println("</script>");
	   script.close();
	   return;
   }
      

%>
<script type="text/javascript">
window.close();

</script>
