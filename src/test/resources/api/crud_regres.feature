Feature: Probar la API de reqres.in

  Background:
    * url 'https://reqres.in'
    * header Content-Type = 'application/json; charset=UTF-8'
    * header x-api-key = 'reqres-free-v1'

  Scenario: Obtener un usuario existente
    Given path '/api/users/2'
    When method GET
    Then status 200
    * def usuario = {}
    * set usuario.id = response.data.id
    * set usuario.email = response.data.email
    * set usuario.nombre = response.data.first_name + ' ' + response.data.last_name
    * print '=== Usuario encontrado ============='
    * print 'ID    :', usuario.id
    * print 'Email :', usuario.email
    * print 'Nombre:', usuario.nombre
    * print '===================================='


  @crearUsuario
  Scenario: Crear nuevo usuario
    Given path '/api/users'
    And request { name: 'juan', job: 'engineer' }
    When method POST
    Then status 201
    And match response.name == 'juan'
    And match response.job == 'engineer'
    * def usuario = {}
    * set usuario.nombre = response.name
    * set usuario.job = response.job
    * set usuario.id = response.id
    * print '=== Usuario creado correctamente =============='
    * print 'Nombre:', usuario.nombre
    * print 'Job :', usuario.job
    * print 'Id :', usuario.id
    * print '==============================================='


  @actualizarUsuario
  Scenario: Actualizar un usuario existente
    Given path '/api/users/2'
    And request { name: 'morpheus', job: 'zion resident' }
    When method PUT
    Then status 200
    And match response.name == 'morpheus'
    And match response.job == 'zion resident'
    * def usuario = {}
    * set usuario.nombre = response.name
    * set usuario.job = response.job
    * print '=== Usuario actualizado correctamente =============='
    * print 'Nombre:', usuario.nombre
    * print 'Job :', usuario.job
    * print '==============================================='



  @eliminarUsuario
  Scenario: Eliminar un usuario por id
    Given path '/api/users/2'
    When method DELETE
    Then status 204
    * print '==============================================='
    * print 'Usuario eliminado correctamente'
    * print 'ID del usuario eliminado: 2'
    * print '==============================================='









