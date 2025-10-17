import io.jsonwebtoken.io.Encoders;
import io.jsonwebtoken.security.Keys;

public class GenSecret {
	public static void main(String[] args) {
		System.out.println(
				Encoders.BASE64.encode(Keys.secretKeyFor(io.jsonwebtoken.SignatureAlgorithm.HS256).getEncoded()));
	}
}