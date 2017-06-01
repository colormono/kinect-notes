![Kinect](assets/images/kinectp-640x353.jpg)
# Apuntes Kinect


---

### Temario

+++

### Hardware  

- v1
    - Características
    - Requerimientos
- v2 __(one for XBox)__
    - Características
    - Requerimientos
- Drivers e Instalación

+++

### Software  

- Processing
- Librerías
    - Open Kinect
    - SimpleOpenNI

+++

### Code: Basics  

- Cámara RGB
- Imagen infrarroja
- Mapa e imagen de profundidad
- Nube de puntos

+++

### Code: Tracking  

- RAW Data
- Detección de objetos **(en un rango específico)**
- Centroide **(del obejto detectado)**
- Punto Extremo **(ej. el más alto)**
- Blobs

+++

### OSC

- Características
- Librería oscP5
- Código de ejemplo
- Comunicación con Resolume

+++

### Casos

- Encuentro 1
- Encuentro 2 
- Encuentro 3
- Encuentro 4

+++

### Bonus
### Bibliografía
### Cierre


---

## Sensor Kinect  

![Kinect sensor](assets/images/sensor-kinect.png)

+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/seventh-sense.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/iQlDEPLHPyQ)  

<span style="color: #562F99">Seventh Sense (Excerpt)</span>  

<span style="color: #AADC69">Anarchy Dance Theatre + Ultra Combos</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/the_v_motion_project.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/45417241)  

<span style="color: #562F99">The V Motion Project </span>  

<span style="color: #AADC69">Colenso BBDO</span>  


+++

### v1  

![Kinect componentes](assets/images/kinect-interior.png)  

Salió a finales de 2010.  

La profundidad de captura va de **0.5** a **4.5 metros**.  

Envía data a **30 FPS** con una resolución de **640x480** para el RGB y **320x240** para el D.

+++

#### Requerimientos  
![Kinect adaptador v1](assets/images/adaptador-v1.jpg)  

- Modelos compatibles: 1414 y 1473 __(este último trae algunos bugs)__
- Necesita un adaptador especial
- Se puede usar con Win, Mac y Linux
- USB 2.0

+++

### v2

![Kinect one for XBox](assets/images/kinect-one.png)  

Salió a finales de 2013. La profundidad de captura es igual.  

Envía data a **30 FPS** con una resolución de **1920x1080** para el RGB y **512x424** para el D.  

Trae una imagen __"Registered"__ que alinea la camara RGB con la D.

+++

#### Requerimientos  

![Kinect adaptador v2](assets/images/adaptador-v2-alt.jpg)  

- Necesita un adaptador MUY especial __(no hay chinos)__
- Se puede usar con Win __(W8 64 bit)__ y Mac __(OSx >= 10.9 y sin análisis de imagen)__
- USB 3.0

+++

#### Drivers

![Open Kinect](assets/images/logo-openkinect.png)  

[https://openkinect.org](https://openkinect.org)  

__RGB e imágen de profundidad (Depth) y Motor__  

__Acelerómetro, LED, Audio__

<small>
##### v1: [https://github.com/OpenKinect/libfreenect](https://github.com/OpenKinect/libfreenect)
##### v2: [https://github.com/OpenKinect/libfreenect2](https://github.com/OpenKinect/libfreenect2)
##### Guía: https://openkinect.org/wiki/Getting_Started
</small>


---

## Processing
![Processing3](assets/images/processing3-logo.png)  

[http://processing.org/](http://processing.org/)

+++

### Open Kinect for Processing
![Open Kinect for Processing](assets/images/openkinect.jpg)  

https://github.com/shiffman/OpenKinect-for-Processing

+++

### SimpleOpenNi
![SimpleOpenNi Skeleton Tracking](assets/images/simpleopenni-skeleton-tracking.png)  

Reconocimiento de las uniones del cuerpo humano.  

Librería: https://github.com/wexstorm/simple-openni  

Driver: https://structure.io/openni _(Sólo windows y linux)_

+++

### Kinect v2 for Processing
![Kinect v2 for Processing](assets/images/openkinect.jpg)  

Se basa en el SDK oficial de Microsoft.  

Necesita correr en Windows.


---

## CODE   

<small style="color:gray;">Basics</small>

+++

```java
import org.openkinect.processing.*;

Kinect kinect; 

void setup() {
   kinect = new Kinect(this);
   //kinect.initVideo();
}

void draw() {
   //PImage img = kinect.getVideoImage();
   //image(img, 0, 0);
}
```

+++

### <span style="color:#562F99">1.</span> Cámara RGB
```java
// Setup
kinect.initVideo();
// Draw
kinect.enableMirror(true); // para espejar
PImage img = kinect.getVideoImage();
```

+++

### <span style="color:#562F99">2.</span> Imagen infrarroja
```java
// Setup
kinect.initVideo();
kinect.enableIR(true);
// Draw
PImage img = kinect.getVideoImage();
```

+++

### <span style="color:#562F99">3.</span> Imagen de profundidad
```java
// Setup
kinect.initDepth();
kinect.enableColorDepth(true); // si queremos mapa de color
// Draw
PImage img = kinect.getDepthImage();
```

+++

### <span style="color:#562F99">4.</span> Nube de puntos
```java
// Setup
size(640, 480, P3D); // Usar el render en P3d
kinect.initDepth();
// Draw
PImage img = kinect.getVideoImage();
```

+++

#### Otras funciones
**enableColorDepth(boolean)** — mostrar profundidad en color  


#### Sólo V1
**enableMirror(boolean)** — espejar imagen  

**float getTilt()** — consultar angulo del motor  

**setTilt(float)** — definir angulo del motor (entre -30 y 30)  


#### Sólo V2
**PImage getRegisteredImage()** — imagen con correspondencia RGB+D  



---

## CODE  

<small style="color:gray;">Tracking</small>

+++

### <span style="color:#562F99">1a.</span> RAW Data
![Kinect componentes](assets/images/kinectDepthRaw.jpg)  


+++

### <span style="color:#562F99">1b.</span> RAW Data
```java
// Setup
size(640, 480, P3D); // Usar el render en P3d
kinect.initDepth();
// Draw
int[] data = kinect.getRawDepth();
for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
        // p = profundidad del punto (x,y)
        int p = x + y * img.width;
        int valor = data[p];
    }
}
```

+++

### Average Point Tracking
```java
// Setup
size(640, 480, P3D); // Usar el render en P3d
kinect.initDepth();
// Draw
int[] data = kinect.getRawDepth();
for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
        // p = profundidad del punto (x,y)
        int p = x + y * img.width;
        int valor = data[p];
    }
}
```
+++

### Pixel Record Tracking

+++

### Blob Tracking

+++

### Blob Tracking con Física

![Imagen](assets/images/CAN-KinectPhysics.png)  

[https://github.com/enauman/CANKinectPhysics](https://github.com/enauman/CANKinectPhysics)


---

## OSC  

<small style="color:gray;">Open Sound Control</small>  

Protocolo de comunicación para compartir información, por red y en tiempo real, entre aplicaciones y dispositivos.  

Es "el sucesor del MIDI" porque ofrece un control mucho más preciso y una increíble flexibilidad.  

[http://opensoundcontrol.org/](http://http://opensoundcontrol.org/)

+++

### Librería para ENVIAR y RECIBIR mensajes

```java
import oscP5.*;
import netP5.*;
// SETUP
oscP5 = new OscP5(this, 9000); // Escuchar: Puerto 9000
miServidor = new NetAddress("192.168.1.112", 12345); // Enviar: IP, Puerto
// Enviar mensajes
void mousePressed() {
  OscMessage miMensaje = new OscMessage("/md8key/ctrl_layer_media/1");
  miMensaje.add( 8 );
  oscP5.send(miMensaje, miServidor);
}
// Recibir mensajes
void oscEvent(OscMessage elMensaje) {
    println("pattern: "+elMensaje);
    println("tipo: "+elMensaje.typetag());
}
```


<!-- 
VA EN EL ENCUENTRO 3

### Resolume

![OpenFrameworks](assets/images/osc-library.jpg)  

[Documentación](https://resolume.com/manual/es/r4/controlling)

-->

---

## OpenFrameworks
![OpenFrameworks](assets/images/of-logo.png)  

[http://openframeworks.cc/](http://openframeworks.cc/)

+++

![ofxKinect](assets/images/ofxKinect.jpg)  

1. ofxKinect


---

## CASOS  

<small style="color:gray;">Parte 1</small>

+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/mechanical-mirrors.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/101408845)  

<span style="color: #562F99">Mechanical Mirrors - Daniel Rozin</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/iris-hybe.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/qhdG7OltXnU)  

<span style="color: #562F99">Iris - HYBE Collective</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/musica.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/82414802)  

<span style="color: #562F99">Música (Tan Biónica) - QUALE Studio</span>  

<span style="color: #AADC69">Point Cloud | RGBD</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/phantom.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/HFpou6izBQg)  

<span style="color: #562F99">Phantom (Scars) - Julius Tuomisto & Janne Karhu</span>  

<span style="color: #AADC69">Point Cloud | RGBD</span>  


+++

![Dazzling](assets/images/dazzling-ir.jpg)  

<span style="color: #562F99">[Kinect’s Dazzling Infrared Lights Disco](http://mymodernmet.com/audrey-penven-dancing-with-invisible-light/)</span>  

<span style="color: #AADC69">Fotografía de patrones IR</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/nikefuel_station.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/44338220)  

<span style="color: #562F99">Nike Fuel Station | Onformative</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/fabricate-yourself.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/6PWaU4u5QVo)  

<span style="color: #562F99">Fabricate Yourself</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  



---

## CASOS  
<small style="color:gray;">Parte 2</small>

+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/quantum-120944206.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/120944206)  

<span style="color: #562F99">Quantum Space | Kuflex</span>  

<span style="color: #AADC69">Análisis de RAW Data</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/34533540-lozano.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/107092350)  

<span style="color: #562F99">Locomoción | QUALE Studio</span>  

<span style="color: #AADC69">Average Point Tracking</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/34533540-lozano.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/34533540)  

<span style="color: #562F99">Tape Recorders | Rafael Lozano-Hemmer</span>  

<span style="color: #AADC69">Average Point Tracking</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/firewall_640x360.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/54882144)  

<span style="color: #562F99">Firewall | Aaron Sherwood & Michael Allison</span>  

<span style="color: #AADC69">Blob detection | OSC</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/derivations.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/209096035)  

<span style="color: #562F99">Derivations | Raven Kwok</span>  

<span style="color: #AADC69">Blob Detection</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/cinematique.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/9782048)  

<span style="color: #562F99">Cinematique | Adrien M & Claire B</span>  

<span style="color: #AADC69">Varias técnicas</span>  


<!-- 
VA EN EL ENCUENTRO 4
<video width="640" height="480" controls><source src="./assets/md/assets/videos/ar-sandbox.mp4" type="video/mp4"></video>  

![Video](https://www.youtube.com/embed/j9JXtTj0mzE)  

<span style="color: #562F99">Augmented Reality Sandboxr</span>  

<span style="color: #AADC69">Raw DATA, Análisis de profundidad</span>  

 -->

---

## Bonus  

### [TSPS](http://www.tsps.cc/)
### [Synapse](http://synapsekinect.tumblr.com/post/6305020721/download)
### Kinect + Raspberry GPIO
### Kinect + Raspberry + OSC
### Kinect + Arduino Serial
### LeapMotion
### Syphon

---

## Bibliografía
- Making things see
- Hacking the kinect
- Learning Processing Shiffman

---

## Gracias

Mariano Rivas  

<span style="color: gray">colormono@gmail.com</span>  

<span style="color: gray">https://github.com/colormono/kinect-notes</span>

+++

### Color Scheme

$violeta : #562F99
$verde : #AADC69
$gray : gray
