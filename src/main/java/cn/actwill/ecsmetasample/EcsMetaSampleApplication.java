package cn.actwill.ecsmetasample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@SpringBootApplication
public class EcsMetaSampleApplication {

    private final Environment env;

    RestTemplate restTemplate = new RestTemplate();

    @Autowired
    public EcsMetaSampleApplication(Environment env) {
        this.env = env;
    }

    public static void main(String[] args) {
        SpringApplication.run(EcsMetaSampleApplication.class, args);
    }

    @GetMapping("/meta-ip")
    public String getMetaIP() {
        return env.getProperty("META_IP");
    }

    @GetMapping("/uri-v4")
    public String getURIv4() {
        return env.getProperty("ECS_CONTAINER_METADATA_URI_V4");
    }

    @GetMapping("/uri-v4/data")
    public String getData() {
        String dataURL = env.getProperty("ECS_CONTAINER_METADATA_URI_V4");
        if (dataURL == null) return "NULL_URL";
        Object so = restTemplate.getForEntity(dataURL, Object.class);
        return so.toString();
    }

}
