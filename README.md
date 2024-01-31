# Chq.to

- TTPS Ruby 2023 - Trabajo Integrador
- Gianfranco Quaranta - 18741/6

## Versiones y Gemas:
- Ruby 3.2.2
- Rails 7.1.3
- devise 4.9
- tailwindcss-rails 2.3
- bcrypt 3.1
- kaminari 1.2

## Pasos a seguir:
- Clonar repositorio: 
    - git clone git@github.com:gianquaranta/chq_to.git
- Instalar las dependencias necesarias: 
    - bundle install
- Crear y cargar la base de datos: 
    - rails db:create
    - rails db:migrate
    - rails db:seed
- Ejecutar conmandos de estilos:
    - rails assets:precompile
    - rails tailwindcss:build
- Ejecutar app:
    - rails s (o bundle exec rails server)
    - Abrir en el navegador: 127.0.0.1:3000


## Decisiones de Diseño:
- Usuarios:
    - Para los usuarios usé Devise, gema vista en teoría, que aportó la estructura inicial de los modelos y vistas.
    - Se agregó el campo 'username' y se modificaron los templates para que queden acordes al resto de la app.
    - El funcionamiento es el aportado por Devise, la autenticación, la modificación o eliminación de la cuenta, etcétera.
- Links:
    - Se crean los 4 tipos de link como modelos que heredan de Link.
    - Se nombró al link efímero 'OneTimeLink' para que quede claro que solo funciona una vez
    - El slug consta de 8 caracteres y se genera con SecureRandom
    - Para los links privados, la contraseña no tiene restricciones (caracteres mínimos, etcétera) y se encripta con BCrypt
    - Se decidió que el 'editar' permite cambiar el nombre asignado al link y la contraseña si es privado o la fecha de
      expiración si es temporal. Si un link temporal expiró, puede cambiarse la fecha para re-habilitarlo o viceversa.
      No se puede modificar el tipo ni la URL ya que sería cambiar la esencia misma del link, en ese caso se debería eliminar
      ese y crear uno nuevo, ya no se trataría del link originado en un principio.
- Accesos a Links:
    - Se registra la IP y la fecha-hora y son estos lo parámetros por los que se puede filtrar.
    - Se pensó en un principio en un apartado 'Estadísticas' pero se decidió que se acceda en los detalles de cada link
      a los reportes del mismo.
- Consideraciones generales:
    - Se utiliza Tailwind para todo el decorado de los templates, más bien simple y minimalista. No se aportó demasiada 
      atención al apartado estético. En un principio tuve problemas para instalar Bootstrap y por eso me decanté por esta opción.
    - Se utiliza Kaminari para el paginado ya que en un principio se usó 'will_paginate' pero al ser esta exclusiva para modelos,
      no era suficiente para el paginado de 'Accesos por día', por lo que se cambió a Kamimnari.


## Datos de la Base de Datos
- Usuarios:
    - Username: userConLinks - Email: userConLinks@gmail.com - Contraseña: 123456
    - Username: user2ConLinks - Email: user2ConLinks@gmail.com - Contraseña: 123456
    - Username: userSinLinks - Email: userSinLinks@gmail.com - Contraseña: 123456
- Links y Accesos:
    - Se crearon diversos links de los distintos tipos, algunos con varios accesos para probar la paginación y otros con menos o,
      directamente, sin accesos.
    - También hay links temporales con fechas de expiración pasadas y futuras y links efímeros ya accedidos.
    - La contraseña del link privado es '1234'