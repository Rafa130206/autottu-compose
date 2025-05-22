package fiap.com.br.autottu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class AutottuApplication {

	public static void main(String[] args) {
		SpringApplication.run(AutottuApplication.class, args);
	}

}
