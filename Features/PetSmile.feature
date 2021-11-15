Feature: Realizacion de casos ingresando nombre de usuario y contraseña

  Scenario: Ingreso de nombre de usuario con datos almacenados en BD
    Given Abrir Chrome
    When el usuario ingresa Username "siboney" y Password "12345" correctos.
    Then Entonces se le da la bienvenida al sitio "Dashboard"
    And Cierra el navegador

  Scenario: Ingreso de nombre de usuario y passoword con datos erroneos.
    Given Abrir Chrome
    When el usuario ingresa Username "userincorrecto" y Password "passwordincorrecto" incorrectos
    Then Entonces mostrar error de "Verifique su usuario o password!"
    And Cierra el navegador

  Scenario: Ingresar valores invalidos.
    Given Abrir Chrome
    When el usuario ingresa ingresa Username y Password vacios
    Then Entonces mostrar error de "Inserte Username y Password!"
    And Cierra el navegador

  Scenario: Registro de hora medica veterinaria.
    Given Abrir Chrome
    When el usuario ingresa Username "siboney" y Password "12345" correctos.
    Then Entonces se le da la bienvenida al sitio "Dashboard"
    And debe ir al registro de hora medica veterinaria e insertar un registro
    And Cierra el navegador
