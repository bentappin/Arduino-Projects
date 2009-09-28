/*
 * Project:  Ghetto Blaster LEDs
 * Author:   Ben Tappin
 * Date:     Late September 2009
 * Summary:  A simple app that chases LEDs, makes them
 *           blink, flash ramdomly, all in the name of
 *           fun and a fancy dress party.
 */

int totalLeds = 10;
int startPin = 0;
int delayInterval = 110;

void setup() {
  // Set pin modes
  for(int i = startPin; i < startPin + totalLeds; i++) {
    pinMode(i, OUTPUT);
  }
}


void loop() {
  allOff();

  nightrider(4);

  straightChase(4, false);  // forwards
  straightChase(4, true);   // backwards

  blinkAll(12);

  inPairs(4, false);
  inPairs(4, true);

  randomFlashes(6);
}

void blinkAll() {
  blinkAll(1);
}

void blinkAll(int count) {
  for(int j=1; j<= count; j++) {
    allOn();
    delay(delayInterval);
    allOff();
    delay(delayInterval);
  } 
}

void allOn() {
  for(int i = startPin; i < startPin + totalLeds; i++) {
    digitalWrite(i, HIGH);
  }
}

void allOff() {
  for(int i = startPin; i < startPin + totalLeds; i++) {
    digitalWrite(i, LOW);
  }
}

void straightChase() {
  straightChase(1, false);
}

void straightChase(int count, boolean reverse) {

  for( int j=1; j <= count; j++) {
    for(int i = startPin; i < startPin + totalLeds; i++) {
      int pin = i;
      if(reverse) {
        pin = totalLeds - i -1;
      }

      digitalWrite(pin, HIGH);
      delay(delayInterval);
      digitalWrite(pin, LOW);
    }

  }
}

void randomFlashes() {
  randomFlashes(1);
}

void randomFlashes(int count) {
  for( int j=1; j <= count; j++) {
    for(int i = startPin * -3; i < startPin + totalLeds; i++) {
      long pin1 = random(startPin, totalLeds);
      long pin2 = random(startPin, totalLeds);


      digitalWrite(pin1, HIGH);
      digitalWrite(pin2, HIGH);
      delay(delayInterval);
      digitalWrite(pin1, LOW);
      digitalWrite(pin2, LOW);
    }
  }
}

void inPairs() {
  inPairs(1, false);
}

void inPairs(int count, boolean reverse) {
  if(reverse) {
    inPairsReverse(count);
  } 
  else {
    inPairsForward(count);
  }
}

void inPairsForward(int count) {
  for( int j=1; j <= count; j++) {
    for(int i = startPin; i < startPin + totalLeds; i++) {
      int pin1 = i;
      int pin2 = (i + (totalLeds/2)) % totalLeds;

      digitalWrite(pin1, HIGH);
      digitalWrite(pin2, HIGH);
      delay(delayInterval);
      digitalWrite(pin1, LOW);
      digitalWrite(pin2, LOW);
    }
  }
}

void inPairsReverse(int count) {
  for( int j=1; j <= count; j++) {
    for(int i = totalLeds+startPin-1; i >= startPin; i--) {
      int pin1 = i;
      int pin2 = (i + (totalLeds/2)) % totalLeds;

      digitalWrite(pin1, HIGH);
      digitalWrite(pin2, HIGH);
      delay(delayInterval);
      digitalWrite(pin1, LOW);
      digitalWrite(pin2, LOW);
    }
  }
}

void nightrider() {
  nightrider(1); 
}

void nightrider(int count) {
  for( int j=1; j <= count; j++) {
    for(int i = startPin; i < startPin + totalLeds; i++) {
      digitalWrite(i, HIGH);
      delay(delayInterval);
    }
    
    for(int i = startPin; i < startPin + totalLeds; i++) {
      digitalWrite(i, LOW);
      delay(delayInterval);
    }
  }
}


