![Kinect](assets/images/kinectp-640x353.jpg)
# Apuntes Kinect


---

## Encuentro 1

+++ 

### Intro
- Mariano
- Participantes <br><small style="color:gray;">(Nombre, De dónde venís? Por qué estás acá?)</small>

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

### Code
- Cámara RGB
- Imagen infrarroja
- Mapa e imagen de profundidad
- Nube de puntos

+++

### Casos


---

## Sensor Kinect

![Kinect sensor](assets/images/sensor-kinect.png)

+++

<!-- ![Video](assets/videos/seventh-sense.mp4) -->
![Video](https://www.youtube.com/watch?v=iQlDEPLHPyQ)<br>
<span style="color: #562F99">Seventh Sense (Excerpt)</span><br>
<span style="color: #AADC69">Anarchy Dance Theatre + Ultra Combos</span><br>

+++

<!-- ![Video](assets/videos/seventh-sense.mp4) -->
![Video](https://vimeo.com/45417241)<br>
<span style="color: #562F99">The V Motion Project </span><br>
<span style="color: #AADC69">Colenso BBDO</span><br>

+++

### v1

![Kinect componentes](assets/images/kinect-interior.png)<br>
Salió a finales de 2010.<br>
La profundidad de captura va de **0.5** a **4.5 metros**.<br>
Envía data a **30 FPS** con una resolución de **640x480** para el RGB y **320x240** para el D.

+++

#### Requerimientos
![Kinect adaptador v1](assets/images/adaptador-v1.jpg)<br>
- Modelos compatibles: 1414 y 1473 __(este último trae algunos bugs)__
- Necesita un adaptador especial
- Se puede usar con Win, Mac y Linux
- USB 2.0

+++

### v2

![Kinect one for XBox](assets/images/kinect-one.png)<br>
Salió a finales de 2013. La profundidad de captura es igual.<br>
Envía data a **30 FPS** con una resolución de **1920x1080** para el RGB y **512x424** para el D.<br>
Trae una imagen __"Registered"__ que alinea la camara RGB con la D.

+++

#### Requerimientos
![Kinect adaptador v2](assets/images/adaptador-v2-alt.jpg)<br>
- Necesita un adaptador MUY especial __(no hay chinos)__
- Se puede usar con Win __(W8 64 bit)__ y Mac __(OSx >= 10.9 y sin análisis de imagen)__
- USB 3.0

+++

#### Drivers

![Open Kinect](assets/images/logo-openkinect.png)<br>
[https://openkinect.org](https://openkinect.org)<br>
__RGB e imágen de profundidad (Depth), Motor, Acelerómetro, LED, Audio__

<small>
##### v1: [https://github.com/OpenKinect/libfreenect](https://github.com/OpenKinect/libfreenect)
##### v2: [https://github.com/OpenKinect/libfreenect2](https://github.com/OpenKinect/libfreenect2)
##### Guía: https://openkinect.org/wiki/Getting_Started
</small>

---

## Processing
![Processing3](assets/images/processing3-logo.png)<br>
[http://processing.org/](http://processing.org/)

+++

### Open Kinect for Processing
![Open Kinect for Processing](assets/images/openkinect.jpg)<br>
https://github.com/shiffman/OpenKinect-for-Processing

+++

### SimpleOpenNi
![SimpleOpenNi Skeleton Tracking](assets/images/simpleopenni-skeleton-tracking.png)<br>
Permite usar el analysis de la imagen para obtener las uniones del cuerpo humano.
https://github.com/wexstorm/simple-openni<br>
https://structure.io/openni<br>

+++

### Kinect v2 for Processing
![Kinect v2 for Processing](assets/images/openkinect.jpg)<br>
Se necesita correr desde Windows.<br>
Utiliza el SDK oficial de Microsoft para analizar la imagen y devolver el esqueleto entre otras cosas.


---

## CODE

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

**enableMirror(boolean)** — espejar imagen (v1)<br>
**enableColorDepth(boolean)** — color para la imagen de profundidad (v1)<br>
**float getTilt()** — consultar el angulo del motor (v1)<br>
**setTilt(float)** — ajustar el abgulo del motor (entre -30 y 30) (v1)<br>
**PImage getRegisteredImage()** — imagen con correspondencia RGB+D (v2)<br>


---

## OpenFrameworks
![OpenFrameworks](assets/images/of-logo.png)<br>
[http://openframeworks.cc/](http://openframeworks.cc/)

+++

1. All Together


---

## CASOS

+++

<!-- ![Video](assets/videos/mechanical-mirrors.mp4) -->
![Video](https://player.vimeo.com/video/101408845)<br>
<span style="color: #562F99">Mechanical Mirrors - Daniel Rozin</span><br>
<span style="color: #AADC69">Análisis de profundidad</span><br>

+++

<!-- ![Video](assets/videos/iris-hybe.mp4) -->
![Video](https://player.vimeo.com/video/101408845)<br>
<span style="color: #562F99">Iris - HYBE Collective</span><br>
<span style="color: #AADC69">Análisis de profundidad</span><br>

+++

<!-- ![Video](assets/videos/musica.mp4) -->
![Video](https://player.vimeo.com/video/82414802)<br>
<span style="color: #562F99">Música (Tan Biónica) - QUALE Studio</span><br>
<span style="color: #AADC69">Point Cloud | RGBD</span><br>

+++

<!-- ![Video](assets/videos/phantom.mp4) -->
![Video](https://www.youtube.com/watch?v=HFpou6izBQg)<br>
<span style="color: #562F99">Phantom (Scars) - Julius Tuomisto & Janne Karhu</span><br>
<span style="color: #AADC69">Point Cloud | RGBD</span><br>

+++

![Video](assets/images/dazzling-ir.jpg)<br>
<!-- [Video](http://mymodernmet.com/audrey-penven-dancing-with-invisible-light/) -->
<span style="color: #562F99">Kinect’s Dazzling Infrared Lights Disco</span><br>
<span style="color: #AADC69">Fotografía de patrones IR</span><br>

+++

<!-- ![Video](assets/videos/nikefuel_station.mp4) -->
![Video](https://vimeo.com/44338220)<br>
<span style="color: #562F99">Nike Fuel Station | Onformative</span><br>
<span style="color: #AADC69">Análisis de profundidad</span><br>

+++

<!-- ![Video](assets/videos/fabricate-yourself.mp4) -->
![Video](https://www.youtube.com/watch?v=6PWaU4u5QVo)<br>
<span style="color: #562F99">Fabricate Yourself</span><br>
<span style="color: #AADC69">Análisis de profundidad</span><br>


---

## Encuentro 2

---

## Bonus
### [TSPS](http://www.tsps.cc/)
### LeapMotion (manos)
### Kinect + LeapMotion + CardBoard
### Kinect + Arduino + OSC
### Syphon

---

## Bibliografía
- Making things see
- Hacking the kinect
- Learning Processing Shiffman

---

## Gracias

Mariano Rivas<br>
<span style="color: gray">colormono@gmail.com</span><br>
<span style="color: gray">https://github.com/colormono/kinect-notes</span>

+++

### Color Scheme

$violeta : #562F99
$verde : #AADC69
$gray : gray
