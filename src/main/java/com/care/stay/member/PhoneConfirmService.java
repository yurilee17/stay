package com.care.stay.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;


import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class PhoneConfirmService {

//	@Autowired	private JavaMailSender mailSender;
//
	public String sendMsg(String to, String content) {

		// 문자 인증 우선 닫아둘 예정
//		String timestamp = Long.toString(System.currentTimeMillis());
//
//		String accessKey = "rCQTAfK1rBX3Jncf1ihj";
//		String secretKey = "0QJlyuAYBun4y8bT17TN976MXxoFxUWAnEx1SEHz";
//		String serviceId = "ncp:sms:kr:312620649512:stay";
//		String from = "01091278625";
//
//		String reqUrl = "https://sens.apigw.ntruss.com";
//		String rurl = "/sms/v2/services/" + serviceId + "/messages";
//		String apiUrl = reqUrl + rurl;
//		
//
//		// 문자 내용 JSON
//		JSONObject bodyJson = new JSONObject();
//		JSONObject toJson = new JSONObject();
//		JSONArray toArr = new JSONArray();
//
//		toJson.put("to", to);
//		toJson.put("content", content);
//		toArr.put(toJson);
//
//		bodyJson.put("type", "SMS");
//		bodyJson.put("contentType", "COMM");
//		bodyJson.put("countryCode", "82");
//		bodyJson.put("from", from);
//		bodyJson.put("content", "test");
//		bodyJson.put("messages", toArr);
//		String body = bodyJson.toString();
//		System.out.println(body);
//
//		HttpURLConnection conn;
//		try {
//			URL url = new URL(apiUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
//			conn = (HttpURLConnection) url.openConnection();
//			conn.setUseCaches(false);// 캐시 미사용
//			conn.setDoInput(true);
//			conn.setRequestMethod("POST"); // POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
//			conn.setDoOutput(true); // POST 메소드를 이용해서 데이터를 전달하기 위한 설정
//			conn.setRequestProperty("Content-Type", "application/json");
//			conn.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
//			conn.setRequestProperty("x-ncp-iam-access-key", accessKey);
//			conn.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(rurl, timestamp, "POST", accessKey, secretKey));
//			
//			DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
//			
//			wr.write(body.getBytes());
//			wr.flush();
//			wr.close();
//			
//			int responseCode = conn.getResponseCode(); // 결과 코드가 200이라면 성공
//			System.out.println("responseCode : " + responseCode);
//			
//			BufferedReader br;
//			if(responseCode==202) {
//				br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			} else {
//				br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//			}
//			
//			String inputLine;
//			StringBuffer response = new StringBuffer();
//			while((inputLine = br.readLine()) != null) {
//				response.append(inputLine);
//			}
//			br.close();
//			
//			System.out.println(response.toString());	

			return "전송 완료";
//		} catch (IOException e) {
//			e.printStackTrace();
//			return "전송 실패";
//		}

	}

	public String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) {
		String space = " "; // one space
		String newLine = "\n"; // new line

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
				.append(newLine).append(accessKey).toString();

		String encodeBase64String;
		try {
			SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (Exception e) {
			encodeBase64String = e.toString();
		}

		return encodeBase64String;
	}

}
