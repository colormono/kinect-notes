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
- RGBD


---

## Sensor Kinect

![Kinect sensor](assets/images/sensor-kinect.png)

+++

Video de ejemplo Kinect

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

##### v1: [https://github.com/OpenKinect/libfreenect](https://github.com/OpenKinect/libfreenect)
##### v2: [https://github.com/OpenKinect/libfreenect2](https://github.com/OpenKinect/libfreenect2)
##### Guía: https://openkinect.org/wiki/Getting_Started


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
https://structure.io/openni
https://code.google.com/archive/p/simple-openni/
https://github.com/wexstorm/simple-openni

+++

### Kinect v2 for Processing
![Kinect v2 for Processing](assets/images/openkinect.jpg)
Se necesita correr desde Windows.
Utiliza el SDK oficial de Microsoft para analizar la imagen y devolver el esqueleto entre otras cosas.


---

## CODE

+++

1. Cámara RGB

+++

2. Imagen infrarroja

+++

3. Mapa e imagen de profundidad

+++

4. Nube de puntos


---

## OpenFrameworks
![OpenFrameworks](assets/images/of-logo.png)
[http://openframeworks.cc/](http://openframeworks.cc/)

+++

1. All Together

---

## Encuentro 2

---

`brew install libfreenect`
Una vez instalada la librería conectamos la cámara a la corriente y luego al puerto USB y ejecutamos:
`freenect-glview`
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

---

## Bonus: LeapMotion (manos)
### Kinect + LeapMotion + CardBoard

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
