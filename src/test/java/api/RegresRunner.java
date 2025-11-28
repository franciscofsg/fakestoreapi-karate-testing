package api;

import com.intuit.karate.junit5.Karate;

public class RegresRunner {

    @Karate.Test
    public Karate testUsuarios() {
      return Karate.run("classpath:api/crud_regres.feature");
    }
}
