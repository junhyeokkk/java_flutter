package ch02;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class StrategyTest {
	
	public static void main(String[] args) {
		
		// 문자열
		//  ---> 상대방에 문자열을 보내야한다. 
		//  ---> 일반 텍스트
		//  ---> Base64 인코딩 방식을 적용
		//  ---> 특별한 방식으로 인코딩을 적용 

		// 추상화를 높이는게 좋은 코드가 될 수 있다.
		EncodingStrategy base64 = new Base64Strategy();
		EncodingStrategy normal = new NormalStrategy();
		EncodingStrategy append = new AppendStrategy();
		EncodingStrategy url = new URLStrategy();
		
		String message = "www.google.com/search?q=C# 프로그래밍";
		Encoder encoder = new Encoder();
		
		// Base64로 인코딩해주세요
		encoder.setEncodingStrategy(base64);
		System.out.println(encoder.getMessage(message));
		// 일반 텍스트로 인코딩해주세요 
		encoder.setEncodingStrategy(normal);
		System.out.println(encoder.getMessage(message));
		
		// Append 텍스트로 인코딩해주세요 
		encoder.setEncodingStrategy(append);
		System.out.println(encoder.getMessage(message));
		
		// 도전 과제 - URL 인코딩해주세요 
		encoder.setEncodingStrategy(url);
		System.out.println(encoder.getMessage(message));
		
 	}
	
} // end of class


// 인코딩 전략
interface EncodingStrategy {
	String encode(String text);
	
}

// 바이트 010101 ---> new File();
// 서버측 데이터를 API --- json --> 문자열 
// Base64 인코딩
class Base64Strategy implements EncodingStrategy {

	@Override
	public String encode(String text) {
		
		return Base64.getEncoder().encodeToString(text.getBytes());
	}
}

// 일반 텍스트 전략
class NormalStrategy implements EncodingStrategy {

	@Override
	public String encode(String text) {
		
		return text;
	}
}

// 문자열 ABC를 붙여서 보내라
class AppendStrategy implements EncodingStrategy {

	@Override
	public String encode(String text) {
		
		return "ABC"+text;
	}
}

// URL 인코딩 전략
class URLStrategy implements EncodingStrategy {

	@Override
	public String encode(String text)  {
		try {
			return URLEncoder.encode(text, StandardCharsets.UTF_8.toString());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("인코딩 실패", e);
		}
	}
	
}
// 클라이언트 클래스
class Encoder {
	
	// DI - 생성자 주입
	// DI - 메서드 주입 setter 
	
	
	// 행동을 할 멤버
	EncodingStrategy encodingStrategy;
	
	// 전략에 따라서 실행할 메서드
	public String getMessage(String message) {
		return this.encodingStrategy.encode(message);
	}
	
	// 전략에 따라서 멤버를 변경할 수 있는 메서드 
	public void setEncodingStrategy(EncodingStrategy encodingStrategy) {
		this.encodingStrategy = encodingStrategy;
	}
}

