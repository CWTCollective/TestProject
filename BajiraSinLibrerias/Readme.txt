Antes de el webinar
Se puede seguir el webinario sin haber instalado esta aplicación, pero se sacará mucho más provecho si todos tenemos la misma aplicación instalada y podemos realizar las acciones que vamos explicando.
La aplicación Bajira contiene código jsp, java servlets  y javascript por lo que nos puede servir como ejemplo para cubrir los diferentes aspectos de hacer diagnóstico de errores (debugging) en estos tres campos.
Tened en cuenta que yo tengo todos los menús en inglés y por lo tanto mi traducción puede nos ser exactamente lo que pone en la herramienta pero será muy parecido.
Instrucciones para poder ejecutar el código durante el webinario.
Instalar la aplicación y la base de datos
Bajar el archivo bajira.zip y extraer todo. Al extraer veras dos directorios. 
-BajiraApp este es el código de la aplicación de java. Cópialo al directorio donde tengas tus proyectos de java. Abre NetBeans y en el menú Archivo-> Abre Proyecto ve al directorio donde tienes el proyecto y selecciónalo. Esto cargara la aplicación en Netbeans.
--dbFiles. Este directorio contiene el archivo para generar la base de datos. Abre XAMPP. Empieza apache y  MYSQL y haz clic en Admin. Esto te muestra la página de phpMyadmin que es la herramienta para poder interactuar con la base de datos. En esta pagina ve a la pestaña- Importar. Dale al botón de elije archivo y en el dialogo que se muestra elije el archivo bajira.sql. Si todo ha ido bien ahora tendrás una base de datos llamada bajira. 
El dump de la base de datos crea todas las entidades pero no crea los usuarios que también son necesario para poder hacer loging. Para crear los usuarios en la base de datos. Abre el archivo creUsuarioEnDB.sql en un editor de texto(por ejemplo Notepad). Selecciona todo el texto. Abre phpMyadmin, ve a la pestaña SQL y copia todo el testo ahí(Ctrl+V). Pulsa el boton IR.(go).
Cuando todo ha funcionado bien en la base de datos salen unos mensajes en verde, si algo ha ido mal los mensajes en rojo dan información sobre el problema.

Ejecutar la aplicación
En Netbeans selecciona el projecto bajira. Haz botón derecho y en ese menú pulsa
-	Limpia y compila (Clean and Build)
-	Despliega(Deploy)
-	Debug
La aplicación muestra una pagina de web que contiene cajas donde se puede hacer login con usuario y contraseña.
Estos son los usuarios que se puede utilizar para hacer login
Nivel administrador-  badmin   badmin
Soporte nivel 1  -  nivel1-1  
Contraseña-  nivel1
Soporte nivel 2  -  nivel2-1 
Contraseña nivel2
Soporte nivel 2  -  test5 
Contraseña - test5
Usuario 	 -  test4 
Contraseña - test4

Hacer login ir a un menú y hacer alguna operación para comprobar que todo funciona.


NOTA-
La aplicación usa las siguientes librerías. El archivo con librerías es muy grande. Si las puedes añadir manualmente mejor sino puedes bajarlas mediante el enlace del correo.

 org-netbeans-modules-java-j2seproject-copylibstask.jar
activation.jar
com.mysql.jdbc_5.1.5.jar
gson-2.2.2.jar
java-mail-1.4.4.jar
javax.activation-api-1.2.0.jar
mariadb-java-client-1.1.7.jar


 

