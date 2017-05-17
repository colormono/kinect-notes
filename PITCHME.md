![Kinect](assets/images/kinectp-640x353.jpg)
# Apuntes Kinect

---

### Encuentro 1

+++ 

- Presentación
    - Instructor
    - Participantes (Nombre, De dónde venís? Por qué estás acá?)

+++

- Kinect
    - Presentación del sensor
    - Drivers
    - Instalación (Windows, Linux, OSx)

+++

- Librerías
    - Libfreekinect
    - SimpleOpenNI

+++

- Processing
    - Cámara RGB
    - Imagen infrarroja
    - Mapa e imagen de profundidad
    - Nube de puntos

+++

- Ejemplos
    - RGBD

---

## Kinect

![Logo](assets/2017-mm-curso-kinect-facebook.jpg)


Video 1 de accion con Kinect
Video 2 de accion con Kinect
Video 3 de accion con Kinect

Conociendo el Kinect
No es tan nueva (finales de 2010), pero no deja de ser interesante

Componentes del kinect
imagen

Proyector Infrarojo
Camara color (RGB)
Camara infrarojo
Multi-array de micrófonos
Motor de inclinación
Acelerómetro

![Adaptador para PC](assets/images/adaptador-v1.jpg)
Adaptador para PC

## Resolución
La profundidad de captura va de 0.7 a 3.5 metros. La información es recogida a 30 frames por segundo en una resolución de 640 por 480px.

## Drivers
https://github.com/OpenKinect/libfreenect
https://github.com/OpenKinect/libfreenect2
https://structure.io/openni

https://openkinect.org/wiki/Main_Page


1
brew install libfreenect
Una vez instalada la librería conectamos la cámara a la corriente y luego al puerto USB y ejecutamos:


freenect-glview
1
freenect-glview
Listo, la cámara está corriendo y  deberías estar viendo una imagen como la siguiente.
<small>
    <span style="color: #562F99">‘w’</span> – tilt up (contra picar),
    <span style="color: #562F99">‘s’</span> – level (nivelar),
    <span style="color: #562F99">‘x’</span> – tilt down (picar),
    <span style="color: #562F99">‘0’-‘6’</span> – select LED mode (modo del led),
    <span style="color: #562F99">‘f’</span> – change video format (formato del video),
    <span style="color: #562F99">‘m’</span> – mirror video (espejar),
    <span style="color: #562F99">‘o’</span> – rotate video with accelerometer (rotar video con acelerometro),
    <span style="color: #562F99">‘e’</span> – auto exposure (auto exposición),
    <span style="color: #562F99">‘b’</span> – white balance (balance de blancos),
    <span style="color: #562F99">‘r’</span> – raw color (color original)
</small>


## Processing
https://github.com/shiffman/OpenKinect-for-Processing


## Kinect 2 (one for xbox)


## LeapMotion (manos)


## Kinect + LeapMotion + CardBoard




#### Get the word out
<br>
<span style="color:gray">Markdown Presentations For Everyone</span>
<br>
<span style="color:gray">on</span>
<br>
<span style="color:gray">GitHub, GitLab and Bitbucket</span>

---

### GitPitch turns <span style="color: #562F99; text-transform: none">PITCHME.md</span> into interactive, online slideshows.
<br>
<span style="color:gray; font-size:0.6em;">[ JUST LIKE THIS ONE ]</span>

---

### No more <span style="color: #666666">Keynote.</span>
### No more <span style="color: #666666">Powerpoint.</span>
<br>
### Just <span style="color: #562F99">Markdown</span>. Then <span style="color: #562F99">Git-Commit</span>.

---

<span style="color: #562F99">STEP 1. PITCHME.md</span>

![MARKDOWN](https://d1z75bzl1vljy2.cloudfront.net/hello-world/markdown.png)

Create GitPitch slideshow content using GitHub flavored Markdown in your favorite editor.

---

<span style="color: #562F99">STEP 2. GIT-COMMIT</span>

![TERMINAL](https://d1z75bzl1vljy2.cloudfront.net/hello-world/terminal.png)

Git-commit on any branch and push your PITCHME.md to GitHub, GitLab or Bitbucket.

---

<span style="color: #562F99">STEP 3. GET THE WORD OUT!</span>

<br>

<span style="font-size: 1.3em;"><span style="color:#AADC69">htt</span><span style="color:#AADC69">ps://git</span><span style="color: #562F99">pitch</span><span style="color: #AADC69">.com/<span style="color: #562F99">user</span>/<span style="color: #562F99">repo</span>/<span style="color: #562F99">branch</span></span>

<br>

Instantly use your GitPitch slideshow URL to promote, pitch or present absolutely anything.

---

<span style="color: #562F99">GIT</span>PITCH DESIGNED FOR SHARING

![SOCIAL](https://d1z75bzl1vljy2.cloudfront.net/hello-world/gp-social.jpg)

- View any slideshow at its public URL
- Promote any slideshow using a GitHub badge
- Embed any slideshow within a blog or website
- Share any slideshow on Twitter, LinkedIn, etc
- Print any slideshow as a PDF document
- Download and present any slideshow offline

---

<span style="color: #562F99">GIT</span>PITCH FEATURE RICH SLIDESHOWS

- GitHub Flavored Markdown +
- Code Block and GIST Slides
- Image and Video Slides
- Custom Logos and Backgrounds
- Multiple Themes And More
- <span style="color: #562F99">Plus...</span>
- Your Slideshow Is Part Of Your Project
- Under Git Version Control Within Your Git Repo


---

### Go for it.
### Just add <span style="color: #562F99; text-transform: none">PITCHME.md</span> ;)


---

## Bibliografía
- Making things see
- Hacking the kinect
- Learning Processing Shiffman

+++

## Enlaces útiles
- [Name](#)

+++

### Repositorio
<span style="color: gray">https://github.com/colormono/kinect-notes</span>

+++

### Presentación
<span style="color: gray">https://gitpitch.com/colormono/kinect-notes/master</span>

+++

### Color Scheme

$violeta : #562F99
$verde : #AADC69
$gray : gray

---

## Gracias

Mariano Rivas
<span style="color: gray">colormono@gmail.com</span>
