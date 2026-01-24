package code.CI_CD;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controller {
    @Autowired private service service;
    @GetMapping("/get_1") public ResponseEntity<String> get_1() { return new ResponseEntity<>(service.get_1(), HttpStatus.OK); }
    @GetMapping("/get_2") public ResponseEntity<String> get_2() { return new ResponseEntity<>(service.get_2(), HttpStatus.OK); }
    @GetMapping("/get_3") public ResponseEntity<String> get_3() { return new ResponseEntity<>(service.get_3(), HttpStatus.OK); }
}
