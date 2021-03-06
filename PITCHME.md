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
    - OpenKinect
    - SimpleOpenNI
    - BlobDetection
    - oscP5
- OpenFrameworks
    - ofxKinect
    - ofxOpenCv
    - ofxOsc
- Kinect SDK
- Synapse

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

### Code: Skeleton

- Esqueleto **(articulaciones)**
- Motion Capture **(testing)**
- Synapse **(win/osx)**
- Distancia entre dos **"Joints"**
- Kinect SDK (win)

+++

### Code: Communication

- OSC, MIDI y Serial
    - Características
    - Resolume
    - Isadora
    - Arduino
- Múltiples kinects
- Calibrar con proyector

+++

### Montaje

+++

### Casos

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
- Se puede usar con Windows, OSx y Linux
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

- Necesita un adaptador **MUY** especial __(no hay genéricos)__
- Se puede usar con Windows __(>=8, 64 bit)__ y OSx __(>= 10.9; sin análisis de imagen)__
- USB 3.0


+++

#### Drivers


+++

![Open Kinect](assets/images/logo-openkinect.png)  

[https://openkinect.org](https://openkinect.org)  

__RGB e imágen de profundidad (Depth) y Motor__  

__Acelerómetro, LED, Audio__

<small>
##### v1: [https://github.com/OpenKinect/libfreenect](https://github.com/OpenKinect/libfreenect)
##### v2: [https://github.com/OpenKinect/libfreenect2](https://github.com/OpenKinect/libfreenect2)
##### Guía: https://openkinect.org/wiki/Getting_Started
</small>


+++

![Kinect SDK](assets/images/kinect-sdk.png)  

[https://developer.microsoft.com/en-us/windows/kinect](https://developer.microsoft.com/en-us/windows/kinect)  

__RGB e imágen de profundidad (Depth) y Motor__  

__Acelerómetro, LED, Audio__



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

## CODE 1   

<span style="color:gray;">Basics</span>

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

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/rgbImage)  


+++

### <span style="color:#562F99">2.</span> Imagen infrarroja
```java
// Setup
kinect.initVideo();
kinect.enableIR(true);
// Draw
PImage img = kinect.getVideoImage();
```

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/irImage)  


+++

### <span style="color:#562F99">3.</span> Imagen de profundidad
```java
// Setup
kinect.initDepth();
kinect.enableColorDepth(true); // si queremos mapa de color
// Draw
PImage img = kinect.getDepthImage();
```

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/depthImage)  


+++

### <span style="color:#562F99">4.</span> Nube de puntos
```java
// Setup
size(640, 480, P3D); // Usar el render en P3d
kinect.initDepth();
// Draw
PImage img = kinect.getVideoImage();
```

[Código de ejemplo (D. Shiffman)](https://github.com/colormono/kinect-notes/tree/master/code/pointCloud)  


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

## CODE 2  

<span style="color:gray;">Tracking</span>


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

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/depthImageRaw)  


+++

### Average Point Tracking

#### promedioX = sumaDeValores / cantidadPuntos  

```java
// Draw (todos los frames)
int cantidadPuntos = 0;
int sumaDeValores = 0;
float promedio = 0;

// para todos los puntos
for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
        int p = x + y * img.width;
        int d = data[p];
        // si está en el rango de tracking
        if( d < threshold ){
            // sumar posicion X del punto
            sumaDeValores += x;
            // incrementar contador
            cantidadPuntos++;
        }
    }
}

// calcular promedio
promedioX = sumaDeValores / cantidadPuntos;
```

Códigos de ejemplo: [X](https://github.com/colormono/kinect-notes/tree/master/code/averagePointTrackingX), 
[Y](https://github.com/colormono/kinect-notes/tree/master/code/averagePointTrackingY), 
[XY](https://github.com/colormono/kinect-notes/tree/master/code/averagePointTrackingXY)  


+++

### Pixel Record Tracking

#### Ej.: El punto más alto  

```java
// Draw
int record = 480;

// para todos los puntos
for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
        int p = x + y * img.width;
        int d = data[p];
        // si está en el rango de tracking
        if( d < threshold ){
            // si Y es más alta, actualizar record
            if( y < record ){
                record = y;
            }
        }
    }
}
```

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/highestPointTracking)  


+++

### Blob Tracking

![Imagen](assets/images/blobdetection.png)  

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/blobTracking)  


+++

### Blob Tracking con Física

![Imagen](assets/images/CAN-KinectPhysics.png)  

[https://github.com/enauman/CANKinectPhysics](https://github.com/enauman/CANKinectPhysics)



---

## CODE 3  

<span style="color:gray;">Skeleton</span>


+++

<span style="color:gray;">Interfaz Natural de Usuario (NUI)</span>  

Se interactúa con una aplicación mediante movimientos gestuales del cuerpo o de alguna de sus partes como las manos.
También existe el control de sistemas operativos por medio de la voz humana, denominado control por reconocimiento del habla o reconocimiento de voz, como por ejemplo Siri, Google Now u OK Google.


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/nui.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/PJqbivkm0Ms)  


+++

### Skeleton
![Kinect componentes](assets/images/kinect-skeleton.png)  

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/SynapseReceiver)  


+++

### Motion Capture

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/distanceMeasurement.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/aNKfXN_OrbA)  


+++

### SimpleOpenNi

![Kinect SDK](assets/images/simpleOpenNi.png)  

Para correr necesita Processing 2.2.1 **(no es compatible con otras versiones)**  

**Processing 2.2.1:** 
[Win 32](http://download.processing.org/processing-2.2.1-windows32.zip), 
[Win 64](http://download.processing.org/processing-2.2.1-windows64.zip), 
[Mac OS x](http://download.processing.org/processing-2.2.1-macosx.zip)

**Librería para Processing:** 
[SimpleOpenNi con soporte para 1473](http://troikatronix.com/files/SimpleOpenNI_1.96_osx_kinect_1473.zip)  

**Sketch:** 
[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/simpleOpenNiUser)  


+++

### Kinect SDK  

![Kinect SDK](assets/images/kinect-sdk.png)  

[https://developer.microsoft.com/en-us/windows/kinect](https://developer.microsoft.com/en-us/windows/kinect)  


+++

### Distancia entre dos Joints

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/distanceMeasurement.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/CScdZrYSr3I)  

[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/SynapseReceiver2)  


+++

### Synapse
![Synapse](assets/images/synapse.jpg)  

[http://synapsekinect.tumblr.com/](http://synapsekinect.tumblr.com/)  

__Puertos OSC:__ 12345 y 12347  



---

## CODE 4  

<span style="color:gray;">Communication</span>  


+++

### OSC  

<span style="color:gray;">Open Sound Control</span> 

Protocolo de comunicación para compartir información, por red y en tiempo real, entre aplicaciones y dispositivos.  

Es "el sucesor del MIDI" porque ofrece un control mucho más preciso y una increíble flexibilidad.  

[http://opensoundcontrol.org/](http://http://opensoundcontrol.org/)


+++

### oscP5: Librería para ENVIAR y RECIBIR mensajes

```java
// importar liberías
import oscP5.*; // Recibir
import netP5.*; // Enviar

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

+++

#### Resolume  

![OpenFrameworks](assets/images/resolume-osc.png)  

[Documentación](https://resolume.com/manual/es/r4/controlling#open_sound_control_osc), 
[Código de ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/oscResolumeKinect)  


+++

#### Isadora  

![Isadora](assets/images/isadora-osc.png)  

**Tutorial:** 
[Parte 1](https://support.troikatronix.com/support/solutions/articles/13000014928-isadora-kinect-tracking-tutorial-part-1),  
[Parte 2](https://troikatronix.freshdesk.com/support/solutions/articles/13000014929-isadora-kinect-tracking-tutorial-part-2),  
[Parte 3](https://troikatronix.freshdesk.com/support/solutions/articles/13000014930-isadora-kinect-tracking-tutorial-part-3), 
[Video](https://www.youtube.com/watch?v=0HY5U6QSyhM)  



+++

#### Arduino  

![Arduino](assets/images/arduino-kinect.jpg)  

**Enlaces:** 
[Arduino](https://www.arduino.cc/), 
[Código de Ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/arduinoFirmataKinect)  


+++

### Múltiples kinects  

[Código de Ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/multipleKinect)  


+++

### Calibrar con proyector  

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/calibrarMapping.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/84658886)

<span style="color: #562F99">Kinect Projector Toolkit</span>

[Toolkit v1](https://github.com/genekogan/KinectProjectorToolkit), 
[Toolkit v2](https://github.com/bradenneufeld/K2P3Toolkit), 
[Tutorial](https://vimeo.com/84658886)  



---

## OpenFrameworks  

![OpenFrameworks](assets/images/of-logo.png)  

[http://openframeworks.cc/](http://openframeworks.cc/)  


+++

![ofxKinect](assets/images/ofxKinect.jpg)  

[ofxKinect](https://github.com/colormono/kinect-notes/tree/master/code/of-kinectExample)


+++

![ofxOpenCV](assets/images/ofxOpenCV.png)  

[ofxOpenCV](link_source)


+++

![ofxOsc](assets/images/ofxOsc.jpg)  

[ofxOsc](link_source)



---

## Montaje  


+++

![Case Study: UD Interactive Wall](assets/images/UniversityOfDaytonInteractiveWall.png)  

[Case Study: UD Interactive Wall](http://www.flightphase.com/case-studies/ud-interactive-wall)  


+++

![Pisto](assets/images/montaje2.png)  

Cuando se usan prolongadores USB tienen que ser activos.  


+++

![Adaptador](assets/images/IMG_0904_preview_featured.jpg)  

[Adaptador para Imprimir en 3D](https://www.thingiverse.com/thing:27510)  


+++

![Adaptador](assets/images/kinect-mount-09_display_large_preview_featured.jpg)  

[Adaptador para Imprimir en 3D](https://www.thingiverse.com/thing:6930)  


+++

![Adaptador](assets/images/IMG_20120106_221652_display_large_preview_featured.jpg)  

[Adaptador para Imprimir en 3D](https://www.thingiverse.com/thing:15638)  



---

## CASOS - <span style="color:gray;">Parte 1</span>  


+++

![Dazzling](assets/images/dazzling-ir.jpg)  

<span style="color: #562F99">[Kinect’s Dazzling Infrared Lights Disco](http://mymodernmet.com/audrey-penven-dancing-with-invisible-light/)</span>  

<span style="color: #AADC69">Fotografía de patrones IR</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/radiohead.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/8nTFjVm9sTQ)  

<span style="color: #562F99">"House of Cards" (Radiohead) - Aaron Koblin</span>  

<span style="color: #AADC69">Point Cloud</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/musica.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/82414802)  

<span style="color: #562F99">"Música" (Tan Biónica) - QUALE Studio</span>  

<span style="color: #AADC69">Point Cloud | RGBd</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/iris-hybe.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/qhdG7OltXnU)  

<span style="color: #562F99">Iris - HYBE Collective</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/nikefuel_station.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/44338220)  

<span style="color: #562F99">Nike Fuel Station - Onformative</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/mechanical-mirrors.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/101408845)  

<span style="color: #562F99">Mechanical Mirrors - Daniel Rozin</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/fabricate-yourself.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/6PWaU4u5QVo)  

<span style="color: #562F99">Fabricate Yourself</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/phantom.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/HFpou6izBQg)  

<span style="color: #562F99">Phantom (Scars) - Julius Tuomisto & Janne Karhu</span>  

<span style="color: #AADC69">Point Cloud | RGBD</span>  



---

## CASOS - <span style="color:gray;">Parte 2</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/quantum-120944206.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/120944206)  

<span style="color: #562F99">Quantum Space - Kuflex</span>  

<span style="color: #AADC69">Análisis de RAW Data</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/34533540-lozano.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/107092350)  

<span style="color: #562F99">Locomoción - QUALE Studio</span>  

<span style="color: #AADC69">Average Point Tracking</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/34533540-lozano.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/34533540)  

<span style="color: #562F99">Tape Recorders - Rafael Lozano-Hemmer</span>  

<span style="color: #AADC69">Average Point Tracking</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/firewall_640x360.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/54882144)  

<span style="color: #562F99">Firewall - Aaron Sherwood & Michael Allison</span>  

<span style="color: #AADC69">Blob detection, OSC</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/derivations.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/209096035)  

<span style="color: #562F99">Derivations - Raven Kwok</span>  

<span style="color: #AADC69">Blob Detection</span>  


---

## CASOS - <span style="color:gray;">Parte 3</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/AndroidifyTSE.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/126631920)  

<span style="color: #562F99">Androidify Times Square Experience - Google</span>  

<span style="color: #AADC69">Esqueleto</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/50229394.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/50229394)  

<span style="color: #562F99">The Treachery of Sanctuary - Chris Milk</span>  

<span style="color: #AADC69">Esqueleto, Blob</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/PuppetParade.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/34824490)

<span style="color: #562F99">Puppet Parade - I/O Design</span>  

<span style="color: #AADC69">Esqueleto, Blobs, Gestos</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/DepthJS.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/17180651)

<span style="color: #562F99">DepthJS - Fluid Interfaces</span>  

<span style="color: #AADC69">Gestos</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/DepthJS.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/43756177)

<span style="color: #562F99">SPRING - SUGOI Inc</span>  

<span style="color: #AADC69">Gestos</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/AirGuitar.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/8DmOux4IdAE)  

<span style="color: #562F99">AirGuitar - Chris O'Shea</span>  

<span style="color: #AADC69">Gestos</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/AirGuitarWarrior.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/1sQYxOqGsxM)  

<span style="color: #562F99">Air Guitar Warrior</span>  

<span style="color: #AADC69">Gestos / Game</span>  



---

## CASOS - <span style="color:gray;">Parte 4</span>


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/rozin-trolls.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/ck_soI_Agy8)  

<span style="color: #562F99">Trolls Mirror - Daniel Rozin</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  



+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/207140893.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/207140893)

<span style="color: #562F99">Mimic - Design I/O</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/207185635.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/207185635)

<span style="color: #562F99">Mimic (Behind the scenes) - Design I/O</span>  

<span style="color: #AADC69">Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/unnamed_soundsculpture_1280x640.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/38874664)

<span style="color: #562F99">Unnamed SoundSculpture - onformative</span>

<span style="color: #AADC69">RAW Data, Multiples Kinect</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/unnamed_soundsculpture_(docu)_1280x640.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/38850289)

<span style="color: #562F99">Unnamed SoundSculpture - onformative</span>

<span style="color: #AADC69">RAW Data, Multiples Kinect</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/35458411.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/35458411)

<span style="color: #562F99">University of Dayton Interactive Wall - Flightphase</span>

<span style="color: #AADC69">RAW Data, Multiples Kinect</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/RainRoom.mp4" type="video/mp4"></video>  -->
![Video](https://www.youtube.com/embed/EkvazIZx-F0)  

<span style="color: #562F99">Barbican's Rain Room</span>  

<span style="color: #AADC69">Raw DATA, Análisis de profundidad</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/the_v_motion_project.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/45417241)  

<span style="color: #562F99">The V Motion Project - Colenso BBDO</span>  

<span style="color: #AADC69">Esqueleto, Blob, OSC</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/apparition.mp4" type="video/mp4"></video><br> -->
![Video](https://www.youtube.com/embed/-wVq41Bi2yE)  

<span style="color: #562F99">Apparition - laus Obermaier & Ars Electronica Futurelab</span>  

<span style="color: #AADC69">Mapping Callibration</span>  


+++

<!-- <video width="640" height="480" controls><source src="./assets/md/assets/videos/cinematique.mp4" type="video/mp4"></video><br> -->
![Video](https://player.vimeo.com/video/9782048)  

<span style="color: #562F99">Cinematique | Adrien M & Claire B</span>  

<span style="color: #AADC69">Varias técnicas</span>  



---

## Bonus  

+++

### Syphon/Spout  

Sirve para compartir video entre aplicaciones utilizando [FreeFrame](http://freeframe.sourceforge.net/).

[Syphon (OS x)](http://syphon.v002.info/) | [Spout (Win)](http://spout.zeal.co/)  


+++

### TSPS

![TSPS](assets/images/tsps.jpg)  

TSPS es una plataforma para sensar gente en el espacio: [http://www.tsps.cc](http://www.tsps.cc/)  


+++

### Tracker Class  

[Código de Ejemplo](https://github.com/colormono/kinect-notes/tree/master/code/tracker)  



---

## Bibliografía

- "Making things see", Greg Borenstein, 2012. [Link](http://makingthingssee.com/)
- "Hacking the kinect", Kramer J. Parker, 2012. [Link](http://www.apress.com/us/book/9781430238676)
- "Learning Processing", Daniel Shiffman, 2008. [Link](http://learningprocessing.com/)
- "The nature of code", Daniel Shiffman, 2012. [Link](http://natureofcode.com/)



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
