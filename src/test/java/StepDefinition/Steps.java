package StepDefinition;

import static org.junit.Assert.assertEquals;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class Steps {
	private WebDriver driver;
	String usuario_correcto, password_correcto;
	
	@Given("Abrir Chrome")
	public void abrir_Chrome() {
		System.setProperty("webdriver.chrome.driver", "driverselenium/chromedriver.exe");
		ChromeOptions options = new ChromeOptions();
	//	options.addArguments("--disable-dev-shm-usage");
	//	options.addArguments("--no-sandbox");
		driver = new ChromeDriver(options);
		driver.get("http://localhost:8080/petSmile");
	}

	@When("el usuario ingresa Username {string} y Password {string} correctos.")
	public void el_usuario_ingresa_Username_y_Password_correctos(String string, String string2) {
		// YA este test pasa correctamente
	    driver.findElement(By.name("usuario")).click();
	    driver.findElement(By.name("usuario")).sendKeys(string);
	    driver.findElement(By.name("password")).sendKeys(string2);
	    driver.findElement(By.cssSelector(".button")).click();
	    this.usuario_correcto = string;
	    this.password_correcto= string2;
	}

	@Then("Entonces se le da la bienvenida al sitio {string}")
	public void entonces_se_le_da_la_bienvenida_al_sitio(String string) {
	
		;

		assertEquals(string, driver.getTitle());
	}

	@When("el usuario ingresa Username {string} y Password {string} incorrectos")
	public void el_usuario_ingresa_username_y_password_incorrectos(String string, String string2) {
	    // Write code here that turns the phrase above into concrete actions
	    driver.findElement(By.name("usuario")).click();
	    driver.findElement(By.name("usuario")).sendKeys(string);
	    driver.findElement(By.name("password")).sendKeys(string2);
		driver.findElement(By.cssSelector(".button")).click();
	}

	@When("el usuario ingresa ingresa Username y Password vacios")
	public void el_usuario_ingresa_ingresa_Username_y_Password_vacios() {
	    driver.findElement(By.name("usuario")).click();
	    driver.findElement(By.name("usuario")).sendKeys("");
	    driver.findElement(By.name("password")).sendKeys("");
		driver.findElement(By.cssSelector(".button")).click();
	}

	@Then("Entonces mostrar error de {string}")
	public void entonces_mostrar_error_de(String string) {
		String error = driver.findElement(By.cssSelector(".is-4")).getText();
		assertEquals("Mensaje de error", string, error);
	}
	
	@Then("debe ir al registro de hora medica veterinaria e insertar un registro")
	public void debe_ir_al_registro_de_hora_medica_veterinaria_alli_debe_insertar_un_registro() {
	    // Write code here that turns the phrase above into concrete actions
	    driver.findElement(By.cssSelector(".button:nth-child(5)")).click();
	    driver.findElement(By.name("idMascota")).sendKeys("8");
	    driver.findElement(By.name("rutDuenio")).sendKeys("24980047");
	    driver.findElement(By.name("nombreMascota")).sendKeys("Mario");
	    driver.findElement(By.name("hora")).sendKeys("02:54");
	    driver.findElement(By.name("fecha")).click();
	    driver.findElement(By.cssSelector(".button")).click();
	}
		
	@Then("Cierra el navegador")
	public void cierra_el_navegador() {
		// Write code here that turns the phrase above into concrete actions
		driver.quit();
	}
	
}
