package code.CI_CD;

import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class CiCdApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	@Test
	@Order(1)
	public void test1() throws Exception {
		mockMvc.perform(get("/get_1"))
				.andExpect(status().isOk())
				.andExpect((ResultMatcher) content().string("Vanakam"));
	}

	@Test
	@Order(2)
	public void test2() throws Exception {
		mockMvc.perform(get("/get_2"))
				.andExpect(status().isOk())
				.andExpect((ResultMatcher) content().string("Hello Vanakam"));
	}

	@Test
	@Order(3)
	public void test3() throws Exception {
		mockMvc.perform(get("/get_3"))
				.andExpect(status().isOk())
				.andExpect((ResultMatcher) content().string("Hi Vanakam"));
	}

}
