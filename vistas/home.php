<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LiquorLogix - Home</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="./css/estilos.css">
</head>
<body>

  <section class="hero is-fullheight is-info">
    <div class="hero-body">
      <div class="container has-text-centered">
        <h1 class="title is-1 has-text-white">LiquorLogix</h1>
		<h2 class="subtitle">¡Bienvenido <?php echo $_SESSION['nombre']." ".$_SESSION['apellido']; ?>!</h2>
		<br>
        <p class="subtitle is-3 has-text-light">Tu solución confiable en gestión de Licor</p>
        <a href="#galeria" class="button is-large is-warning is-rounded">Explorar Galería</a>

      </div>
    </div>
  </section>

  <section id="galeria" class="section">
    <div class="container">
      <h1 class="title has-text-centered has-text-info">Galería de Imágenes</h1>
      <div class="columns is-multiline is-centered galeria">
        <?php
        $imagenes = [
          [
            "url" => "./img/galery/1_image_galery.jpg",
            "alt" => "img1",
            "titulo" => "IMAGEN 1",
            "texto" => "Conoce más sobre nuestra empresa y su misión."
          ],
          [
            "url" => "./img/galery/2_image_galery.jpg",
            "alt" => "img2",
            "titulo" => "IMAGEN 2",
            "texto" => "Esta es una segunda imagen para mostrar la galería."
          ],
          [
            "url" => "./img/galery/3_image_galery.jpg",
            "alt" => "img3",
            "titulo" => "IMAGEN 3",
            "texto" => "Explora nuestra galería y encuentra más contenido."
          ]
        ];

        foreach ($imagenes as $imagen) {
          echo '<div class="column is-4">';
          echo '  <div class="card">';
          echo '    <div class="card-image">';
          echo '      <figure class="image is-4by3 image-hover">';
          echo '        <img src="' . htmlspecialchars($imagen["url"]) . '" alt="' . htmlspecialchars($imagen["alt"]) . '">';
          echo '      </figure>';
          echo '    </div>';
          echo '    <div class="card-content">';
          echo '      <p class="has-text-weight-bold">' . htmlspecialchars($imagen["titulo"]) . '</p>';
          echo '      <p class="content">' . htmlspecialchars($imagen["texto"]) . '</p>';
          echo '    </div>';
          echo '  </div>';
          echo '</div>';
      }
        ?>
      </div>
    </div>
  </section>

</body>
</html>
