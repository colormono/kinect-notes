
![Apuntes Kinect](assets/2017-mm-curso-kinect-facebook.jpg)

---

## Encuentro 1
Presentación de Mariano
Presentación de alumnos
(Nombre, De dónde venís? Por qué estás acá?)


Presentación del sensor Kinect
Presentación de la librería SimpleOpenNI
Instalación (Windows, Linux, OSx)
Uso de librerías en Processing
Modos de visualización
- Mapa e imagen de profundidad
- Imagen infrarroja
- Nube de puntos

Ejemplos:
- RGBd?

Bibliografía
- Making things see
- Hacking the kinect
- Learning Processing Shiffman

Link a este repo.


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

‘w’ – tilt up (contra picar),
‘s’ – level (nivelar),
‘x’ – tilt down (picar),
‘0’-‘6’ – select LED mode (modo del led),
‘f’ – change video format (formato del video),
‘m’ – mirror video (espejar),
‘o’ – rotate video with accelerometer (rotar video con acelerometro),
‘e’ – auto exposure (auto exposición),
‘b’ – white balance (balance de blancos),
‘r’ – raw color (color original)



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

### GitPitch turns <span style="color: #e49436; text-transform: none">PITCHME.md</span> into interactive, online slideshows.
<br>
<span style="color:gray; font-size:0.6em;">[ JUST LIKE THIS ONE ]</span>

---

### No more <span style="color: #666666">Keynote.</span>
### No more <span style="color: #666666">Powerpoint.</span>
<br>
### Just <span style="color: #e49436">Markdown</span>. Then <span style="color: #e49436">Git-Commit</span>.

---

<span style="color: #e49436">STEP 1. PITCHME.md</span>

![MARKDOWN](https://d1z75bzl1vljy2.cloudfront.net/hello-world/markdown.png)

Create GitPitch slideshow content using GitHub flavored Markdown in your favorite editor.

---

<span style="color: #e49436">STEP 2. GIT-COMMIT</span>

![TERMINAL](https://d1z75bzl1vljy2.cloudfront.net/hello-world/terminal.png)

Git-commit on any branch and push your PITCHME.md to GitHub, GitLab or Bitbucket.

---

<span style="color: #e49436">STEP 3. GET THE WORD OUT!</span>

<br>

<span style="font-size: 1.3em;"><span style="color:white">htt</span><span style="color:white">ps://git</span><span style="color: #e49436">pitch</span><span style="color: white">.com/<span style="color: #e49436">user</span>/<span style="color: #e49436">repo</span>/<span style="color: #e49436">branch</span></span>

<br>

Instantly use your GitPitch slideshow URL to promote, pitch or present absolutely anything.

---

<span style="color: #e49436">GIT</span>PITCH DESIGNED FOR SHARING

![SOCIAL](https://d1z75bzl1vljy2.cloudfront.net/hello-world/gp-social.jpg)

- View any slideshow at its public URL
- Promote any slideshow using a GitHub badge
- Embed any slideshow within a blog or website
- Share any slideshow on Twitter, LinkedIn, etc
- Print any slideshow as a PDF document
- Download and present any slideshow offline

---

<span style="color: #e49436">GIT</span>PITCH FEATURE RICH SLIDESHOWS

- GitHub Flavored Markdown +
- Code Block and GIST Slides
- Image and Video Slides
- Custom Logos and Backgrounds
- Multiple Themes And More
- <span style="color: #e49436">Plus...</span>
- Your Slideshow Is Part Of Your Project
- Under Git Version Control Within Your Git Repo


---

### Go for it.
### Just add <span style="color: #e49436; text-transform: none">PITCHME.md</span> ;)


### Enalces
https://www.youtube.com/watch?v=ZNxIzcM435E