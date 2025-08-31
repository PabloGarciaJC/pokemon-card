# Landing Page – Sass

Landing page desarrollada con **HTML5** y **Sass** como preprocesador CSS, pensada como base escalable para integrar futuras funcionalidades, tecnologías o frameworks.

## Demo del Proyecto

[https://landing-page-sass.com/](https://landing-page-sass.pablogarciajc.com/)

| ![Imagen 1](https://pablogarciajc.com/wp-content/uploads/2025/07/landing-page-sass1.webp) | ![Imagen 2](https://pablogarciajc.com/wp-content/uploads/2025/07/landing-page-sass2.webp) |
|-----------|-----------|

---

## Funcionalidades principales

- Menú de navegación adaptable para dispositivos móviles y escritorio.
- Secciones integradas: Inicio, Nosotros, Servicios, Portafolio y Contacto.
- Formulario de contacto estilizado.

---

## Tecnologías utilizadas

- **HTML5 semántico**.
- **Sass** (preprocesador CSS compilado a CSS puro).
- **CSS3** (resultado compilado).
- Entorno preparado para integrarse con herramientas como Vite o Webpack si se desea escalar.

---

## Uso de Sass en el Proyecto

Este proyecto utiliza **Sass** como preprocesador CSS para facilitar la escritura y mantenimiento de estilos, aplicando conceptos avanzados que permiten un código más limpio, modular y escalable.

### Conceptos y características principales usadas

- **Variables:** Para almacenar colores, tamaños y otros valores reutilizables, facilitando cambios globales y manteniendo consistencia.
- **Mapas:** Colecciones clave-valor para agrupar colores de botones y otros estilos temáticos, mejorando la organización.
- **Mixins:** Bloques reutilizables de estilos, como el mixin `flex-center` para centrar contenido con flexbox, que evitan la repetición y permiten parametrización.
- **Funciones:** Para obtener valores dinámicos, por ejemplo, la función `btn-color($key)` que extrae colores de un mapa.
- **Nesting (Anidación):** Permite escribir selectores CSS anidados de forma jerárquica y clara, reflejando la estructura HTML y mejorando la legibilidad.
- **Operador `&`:** Usado para referirse al selector padre dentro de reglas anidadas, facilitando la escritura de estados como `:hover` o variantes como `.btn--primary`.
- **Uso de módulos de Sass (`@use`):** Importación organizada de módulos oficiales (`sass:color`, `sass:map`) y archivos personalizados para mantener el código modular y limpio.
- **Media queries anidados:** Incorporación de consultas responsivas dentro de bloques específicos para facilitar estilos adaptativos sin dispersar el código.
- **Funciones de color (`color.adjust`):** Manipulación dinámica de colores para efectos visuales en estados como hover, mejorando la experiencia de usuario.

Gracias a estas características, el código CSS generado es limpio, eficiente y fácil de mantener, facilitando futuras escalas y modificaciones.

---

## Instalación

### Requisitos Previos

- Tener **Docker** y **Docker Compose** instalados.
- **Make**: Utilizado para automatizar procesos y gestionar contenedores de manera más eficiente.

### Pasos de Instalación

1. Clona el repositorio desde GitHub.
2. Dentro del repositorio, encontrarás un archivo **Makefile** que contiene los comandos necesarios para iniciar y gestionar tu aplicación.
3. Usa los siguientes comandos de **Make** para interactuar con la aplicación:

   - **`make init-app`**: Inicializa los contenedores y configura la aplicación.
   - **`make up`**: Levanta la aplicación y sus contenedores asociados.
   - **`make down`**: Detiene los contenedores y apaga la aplicación.
   - **`make shell`**: Ingresa al contenedor para interactuar directamente con el sistema en su entorno de ejecución.
   - **`make compile-sass`**: Compila Sass

4. Además de estos comandos, dentro del archivo **Makefile** puedes encontrar otros comandos que te permitirán interactuar de manera más específica con los contenedores y los diferentes servicios que conforman la aplicación.

5. Accede a los siguientes URL:
   - **Aplicación Web**: [http://localhost:8081/](http://localhost:8081/)
   - **PhpMyAdmin**: [http://localhost:8082/](http://localhost:8082/)

---

## Contáctame / Sígueme en mis redes sociales

| Red Social   | Descripción                                              | Enlace                   |
|--------------|----------------------------------------------------------|--------------------------|
| **Facebook** | Conéctate y mantente al tanto de mis actualizaciones.    | [Presiona aquí](https://www.facebook.com/PabloGarciaJC) |
| **YouTube**  | Fundamentos de la programación, tutoriales y noticias.   | [Presiona aquí](https://www.youtube.com/@pablogarciajc)     |
| **Página Web** | Más información sobre mis proyectos y servicios.        | [Presiona aquí](https://pablogarciajc.com/)              |
| **LinkedIn** | Sigue mi carrera profesional y establece conexiones.     | [Presiona aquí](https://www.linkedin.com/in/pablogarciajc) |
| **Instagram**| Fotos, proyectos y contenido relacionado.                 | [Presiona aquí](https://www.instagram.com/pablogarciajc) |
| **Twitter**  | Proyectos, pensamientos y actualizaciones.                | [Presiona aquí](https://x.com/PabloGarciaJC?t=lct1gxvE8DkqAr8dgxrHIw&s=09)   |

---
> _"El buen manejo de tus finanzas hoy construye la seguridad del mañana."_
