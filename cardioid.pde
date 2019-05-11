float total = 300;  //number of points to divide the circle
float factor = 0;  //start at the factor of 0.001 and increment 0.01
float r;    //radius of the cardioid
float rgb[] = {random(255), random(255), random(255)};

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

  for (int i = 0; i < total; i++) {
    //draw line between the two vector
    PVector a = getVector(float(i));
    PVector b = getVector(i * factor);
    line(a.x, a.y, b.x, b.y);
    mapColors(b.mag());
  }
  //increment the factor
  factor += map(mouseX, 0, width, -0.1, 0.1);
  //draw circle
  stroke(0);
  strokeWeight(5);
  noFill();
  ellipse(0, 0, r*2, r*2);
}

PVector getVector(float i) {
  float theta = map(i % total, 0, total, 0, PI*2);
  return new PVector( r * cos(theta), r * sin(theta)); //you can add pi to flip the cardioid
}

//Map the colors using the magnitude of the vectors and current factor
void mapColors(float mag) {
  rgb[0] = map(factor * 20, 0, 255, 50, 25); 
  rgb[1] = map(factor * 60, 0, 360, 0, 0); 
  rgb[2] = map(mag, 0, 360, 0, 255); 
  strokeWeight(1);
  stroke(rgb[0], rgb[1], rgb[2]);
}
