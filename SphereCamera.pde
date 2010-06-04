public class SphereCamera {

  float camSphereRadius = 1000;
  boolean handheld = false; // Adds a perlin noise wobble to give a handheld feel

  float camAzimuth = 0;
  float camZenith = 0;

  float camAzimuthTarget = 0;
  float camZenithTarget = 0;
  float camSphereRadiusTarget = 500;

  float camTarg = 0;
  float camTargTarget = 0;
  float camTargX, camTargY, camTargZ;
  float handNoiseX, handNoiseY, handNoiseZ;
  
  float camXPos, camYPos, camZPos;
  
  float noiseScale=0.004; 
  
  void drawCamera(int camSpeed) {
    if (camAzimuthTarget > camAzimuth) {
      camAzimuth = camAzimuth + ((radians(camAzimuthTarget) - camAzimuth) / camSpeed);
    } else {
      camAzimuth = camAzimuth - ((camAzimuth - radians(camAzimuthTarget)) / camSpeed);
    }

    if (camZenithTarget > camZenith) {
      camZenith = camZenith + ((radians(camZenithTarget) - camZenith) / camSpeed);
    } else {
      camZenith = camZenith - ((camZenith - radians(camZenithTarget)) / camSpeed);
    }
 
    if (camSphereRadiusTarget > camSphereRadius) {
      camSphereRadius = camSphereRadius + ((camSphereRadiusTarget - camSphereRadius) / camSpeed);
    } else {
      camSphereRadius = camSphereRadius - ((camSphereRadius - camSphereRadiusTarget) / camSpeed);
    }  
    
    if (camTargTarget > camTarg) {
      camTarg = camTarg + ((camTargTarget - camTarg) / camSpeed);
    } else {
      camTarg = camTarg - ((camTarg - camTargTarget) / camSpeed);
    }  

    camXPos = camSphereRadius * (sin(camZenith) * cos(camAzimuth));
    camYPos = camSphereRadius * (sin(camZenith) * sin(camAzimuth));
    camZPos = camSphereRadius * (cos(camZenith));
    
    if (handheld) {
      float handNoiseX = noise((frameCount)*noiseScale)-.5; 
      float handNoiseY = noise((frameCount)*noiseScale, (frameCount)*noiseScale)-.5; 
      float handNoiseZ = noise((frameCount)*noiseScale, (frameCount)*noiseScale, (frameCount)*noiseScale)-.5; 
      camTargX = camTarg+handNoiseX*100;
      camTargY = camTarg+handNoiseY*100;
      camTargZ = camTarg+handNoiseZ*100;
      
    }
    
    camera(  camXPos, camYPos, camZPos, 
             camTargX, camTargY, camTargZ, 
             0.0, 1.0, 0.0
         );   
  }

  void axis() {
    strokeWeight(3);
    stroke(255,0,0);
    line(-50,0,0,50,0,0);
    stroke(0,255,0);
    line(0,-50,0,0,50,0);
    stroke(0,0,255);
    line(0,0,-50,0,0,50);
  }

}

