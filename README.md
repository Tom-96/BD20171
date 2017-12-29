# README

Pauta Tarea 2 BD
Actualizada al 13/6 ( 4ª Sesión Lista + Preparada Sesion 5)

Relaciones Tropa-Usuario, Tropa-TipoTropa, Tropa-Recurso y Recurso-Usuario creadas
---------------------------------------------------------------------------
Se agregó la relación faltante (Recurso-Usuario (M:N)). Se pueden adquirir recursos cada 1 minuto (Esto puede ser modificado en la vista mostrar_recursos). Ahora, al adquirir tropas, se descuenta la cantidad de recursos correspondiente. No se muestra el botón de adquirir recursos si no ha pasado un minuto desde la última vez que se adquirieron recursos de ese tipo, ni tampoco de adquirir tropa si no se tienen recursos suficientes.


NOTA: Para hacer funcionar el envío de correos para reestablecer contraseña, ingresar datos de mail de google (correo y contraseña) en los archivos:

* config/initializers/devise.rb (La linea "please-change-me-at-config-initializers-devise@example.com")
* /config/environments/development.rb
* /config/environments/production.rb
