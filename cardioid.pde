float total = 200;  //number of points to divide the circle
float factor = 0;  //start at the factor of 0.001 and increment 0.01
float r;    //radius of the cardioid

void setup() {
  size(800, 800);
  r = 250;
}

void draw() {
  background(255);
  fill(0);
  text("Factor: " + factor, 160, height - 170);
  //translate to the center
  translate(width/2, height/2);
  //draw circle
  stroke(0);
  noFill();
  ellipse(0, 0, r*2, r*2);

  for (int i = 0; i < total; i++) {
    //draw line between the two vector
    PVector a = getVector(float(i));
    PVector b = getVector(i * factor);
    mapColors(a.mag());
    line(a.x, a.y, b.x, b.y);
  }
  //increment the factor
  factor += 0.01;
}

PVector getVector(float i) {
  float theta = map(i % total, 0, total, 0, PI*2);
  return new PVector( r * cos(theta), r * sin(theta)); //you can add pi to flip the cardioid
}

//Map the colors using the magnitude of the vectors and current factor
void mapColors(float mag) {
  float r = map(factor * 20, 0, 200, 255, 0); 
  float g = map(factor * 60, 0, 360, 0, 255); 
  float b = map(mag, 0, 360, 0, 255); 
  stroke(r, g, b);
}
