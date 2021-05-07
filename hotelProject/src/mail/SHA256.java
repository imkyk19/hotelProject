package mail;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {

	public static String getEncrypt(String rawPassword, String salt) {
		String result = "";
		byte[] b = (rawPassword + salt).getBytes();

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(b); // MessageDigest가 SHA-256으로 암호화된 값을 들고 있음.

			byte[] bResult = md.digest();

			for (byte data : bResult) {
				System.out.print(data + " ");
			}
			System.out.println();

			StringBuffer sb = new StringBuffer();
			for (byte data : bResult) {
				sb.append(Integer.toString(data & 0xff, 16));
			}
			result = sb.toString();
			System.out.println(result);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public static String getSHA256(String input) {
		StringBuffer result=new StringBuffer();
		try {
			MessageDigest digest=MessageDigest.getInstance("SHA-256");
			byte[]salt="Hello This is Salt.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars=digest.digest(input.getBytes("UTF-8"));
			for(int i=0; i<chars.length;i++) {
				String hex=Integer.toHexString(0xff & chars[i]);
				if(hex.length()==1) result.append("0");
				result.append(hex);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
		
	}
}