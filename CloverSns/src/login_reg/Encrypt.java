package login_reg;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class Encrypt {

	/*
	 * AES의 경우 128, 192, 256bit의 키 길이를 지원합니다 key 에 해당하는 문자열을 16byte(128) 또는
	 * 24byte(192) 또는 32byte(256) 생성
	 */

	public String key = "0123456789123456";

	/**
	 * hex to byte[] : 16진수 문자열을 바이트 배열로 변환한다.
	 * 
	 * @param hex
	 *            hex string
	 * @return
	 */
	public byte[] hexToByteArray(String hex) {
		if (hex == null || hex.length() == 0) {
			return null;
		}

		byte[] ba = new byte[hex.length() / 2];
		for (int i = 0; i < ba.length; i++) {
			ba[i] = (byte) Integer
					.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
		}
		return ba;
	}

	/**
	 * byte[] to hex : unsigned byte(바이트) 배열을 16진수 문자열로 바꾼다.
	 * 
	 * @param ba
	 *            byte[]
	 * @return
	 */
	public String byteArrayToHex(byte[] ba) {
		if (ba == null || ba.length == 0) {
			return null;
		}

		StringBuffer sb = new StringBuffer(ba.length * 2);
		String hexNumber;
		for (int x = 0; x < ba.length; x++) {
			hexNumber = "0" + Integer.toHexString(0xff & ba[x]);

			sb.append(hexNumber.substring(hexNumber.length() - 2));
		}
		return sb.toString();
	}

	
	/**
	 * AES 방식의 암호화
	 * 
	 * @param message
	 * @return
	 * @throws Exception
	 */
	public String encrypt(String message){
		byte[] encrypted = null;
		try{
			// use key coss2
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");
	
			// Instantiate the cipher
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
	
			encrypted = cipher.doFinal(message.getBytes());
		}
		catch(Exception err){
			System.out.println("encrypt : " + err);
		}
		return byteArrayToHex(encrypted);
	}

	
	/**
	 * AES 방식의 복호화
	 * 
	 * @param message
	 * @return
	 * @throws Exception
	 */
	public String decrypt(String encrypted){
		String originalString = null;
		try{
			// use key coss2
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");
	
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			byte[] original = cipher.doFinal(hexToByteArray(encrypted));
			originalString = new String(original);
		}
		catch(Exception err){
			System.out.println("decrypt : " + err);
		}
		return originalString;
	}
	
}
