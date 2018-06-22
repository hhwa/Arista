package mem;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

	PasswordAuthentication pa;

	public MyAuthentication() { // 생성자를 통해 구글 ID/PW 인증
		System.out.println("계정인증을 시작합니다.");
		String id = "ABOUT.OFFTHEBALL"; // 구글 ID
		String pw = "offtheball!@#"; // 구글 비밀번호

		// ID와 비밀번호를 입력한다.
		pa = new PasswordAuthentication(id, pw);
		System.out.println("계정 인증 완료");
	}

	// 시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}
