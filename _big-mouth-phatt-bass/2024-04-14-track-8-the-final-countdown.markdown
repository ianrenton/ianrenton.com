---
comments: true
layout: post
title: "Track 8: The Final Countdown"
slug: track-8-the-final-countdown
date: 2024-03-16 16:00:00
layout: post
---

All that's left now is to combine everything from the previous steps into one working whole. Motor control, music playing, button & light level sensing, and the startup mode choice combine into the following program for the Phatt Bass. Video below!

```cpp
// Button and sensor pins
#define BUTTON_PIN 4
#define LDR_PIN 33

// Motor control pins
#define HEADTAIL_MOTOR_PIN_1 12
#define HEADTAIL_MOTOR_PIN_2 14
#define HEADTAIL_MOTOR_PWM_PIN 13
#define MOUTH_MOTOR_PIN_1 27
#define MOUTH_MOTOR_PIN_2 26
#define MOUTH_MOTOR_PWM_PIN 25

// Motor PWM settings
#define PWM_FREQUENCY 1000
#define PWM_RESOLUTION 8
#define HEADTAIL_MOTOR_PWM_CHANNEL 0
#define MOUTH_MOTOR_PWM_CHANNEL 1
#define HEADTAIL_MOTOR_PWM_DUTY_CYCLE 255 // Proxy for motor speed, up to 2^resolution
#define MOUTH_MOTOR_PWM_DUTY_CYCLE 255    // Proxy for motor speed, up to 2^resolution

// Music settings
#define TRACK_NUMBER 1
#define VOLUME 30 // Up to 30
#define MP3_PLAYER_BAUD_RATE 9600


bool sensorMode = false;
double lastSensorLightLevel = 0;


// Setup and run the program
void setup() {
  // Set up button and LDR pins
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(LDR_PIN, INPUT_PULLUP);

  // Set up motor control pins
  pinMode(HEADTAIL_MOTOR_PIN_1, OUTPUT);
  pinMode(HEADTAIL_MOTOR_PIN_2, OUTPUT);
  pinMode(HEADTAIL_MOTOR_PWM_PIN, OUTPUT);
  pinMode(MOUTH_MOTOR_PIN_1, OUTPUT);
  pinMode(MOUTH_MOTOR_PIN_2, OUTPUT);
  pinMode(MOUTH_MOTOR_PWM_PIN, OUTPUT);

  // Set up PWM
  ledcSetup(HEADTAIL_MOTOR_PWM_CHANNEL, PWM_FREQUENCY, PWM_RESOLUTION);
  ledcSetup(MOUTH_MOTOR_PWM_CHANNEL, PWM_FREQUENCY, PWM_RESOLUTION);
  ledcAttachPin(HEADTAIL_MOTOR_PWM_PIN, HEADTAIL_MOTOR_PWM_CHANNEL);
  ledcAttachPin(MOUTH_MOTOR_PWM_PIN, MOUTH_MOTOR_PWM_CHANNEL);
  ledcWrite(HEADTAIL_MOTOR_PWM_CHANNEL, HEADTAIL_MOTOR_PWM_DUTY_CYCLE);
  ledcWrite(MOUTH_MOTOR_PWM_CHANNEL, MOUTH_MOTOR_PWM_DUTY_CYCLE);

  // Set up serial comms to MP3 player
  Serial2.begin(MP3_PLAYER_BAUD_RATE);
  while (!Serial2);

  // Check startup mode. If the button is held down at startup time, we go into
  // "sensor mode" to use the LDR to trigger the fish, otherwise we go into
  // normal mode where a button press triggers it.
  if (isButtonPushed()) {
    // Button held in on startup, so going into sensor mode.
    // Wait for button to be unpushed, then wait 5 seconds for the user to move away
    sensorMode = true;
    while (isButtonPushed());
    delay(5000);

    // Record the current light level, so we don't trigger immediately
    lastSensorLightLevel = getLightLevel();

  } else {
    // Normal mode, nothing else to do here
  }
}

// Main program loop
void loop() {
  // Wait for a trigger condition, either a change in light level or
  // a button push depending on our mode.
  if (sensorMode) {
    double lightLevel = getLightLevel();
    if (lightLevel < lastSensorLightLevel - 0.04 || lightLevel > lastSensorLightLevel + 0.04) {
      trigger();
    }
    lastSensorLightLevel = lightLevel;
    delay(200);

  } else if (isButtonPushed()) {
    trigger();
  }
}

// Return true if button is pushed
boolean isButtonPushed() {
  return digitalRead(BUTTON_PIN) == 0;
}

// Return a normalised light level 0-1
double getLightLevel() {
  int measuredLevel = analogRead(LDR_PIN);
  return constrain(1 - measuredLevel / 2500.0, 0.0, 1.0);
}

// Trigger the song and the lip-sync actions
void trigger() {
  // Start playing MP3
  changeVolume(VOLUME);
  playTrack(TRACK_NUMBER);

  // Lip-sync!
  lipsync();

  // Stop once complete
  stop();
}

// Main lip-sync function, operating the motors in time to music. The music is already playing
// at this point so we just have to move motors accordingly.
void lipsync() {
  delay(3000); // *sirens*
  headOut();
  delay(1000);
  mouthOpenFor(1000); // Listen
  delay(1000);
  mouthOpenFor(500); // to the
  delay(300);
  mouthOpenFor(300); // phatt
  delay(200);
  flapMouthFor(1750, 250); // bass... bass... bass... bass...
  tailOut();
  mouthOpenFor(300); // bass...
  headTailRest();
  mouthOpenFor(300); // bass...
  tailOut();
  mouthOpenFor(300); // bass...
  headTailRest();
  delay(300);
  flapTailFor(5400, 200); // *early 2000s techno noises*
  headOut();
  delay(200);
  mouthOpenFor(600); // phatt
  delay(600);
  mouthOpenFor(600); // bass
  for (int i = 0; i < 10; i++) { // rest of music
    flapTailFor(400, 200);
    flapHeadFor(400, 200);
  }
}

// Play a specific track number
void playTrack(int tracknum) {
  sendCommandToMP3Player(0x03, tracknum);
}

// Flap the head in and out for a defined time (in millis), moving it at the defined interval (in millis).
// runtime should be a multiple of interval * 2, otherwise the number of mouth movements will be rounded down.
// Used to bop to music
void flapHeadFor(int runtime, int interval) {
  int runs = runtime / interval;
  for (int i = 0; i < runs; i++) {
    headOut();
    delay(interval);
    headTailRest();
    delay(interval);
  }
}

// Flap the tail in and out for a defined time (in millis), moving it at the defined interval (in millis).
// runtime should be a multiple of interval * 2, otherwise the number of mouth movements will be rounded down.
// Used to bop to music
void flapTailFor(int runtime, int interval) {
  int runs = runtime / interval;
  for (int i = 0; i < runs; i++) {
    tailOut();
    delay(interval);
    headTailRest();
    delay(interval);
  }
}

// Flap the head out for a defined time (in millis), then back in for the same time. Used to bop to music.
void flapHead(int interval) {
  headOut();
  delay(interval);
  headTailRest();
  delay(interval);
}

// Flap the tail out for a defined time (in millis), then back in for the same time. Used to bop to music.
void flapTail(int interval) {
  tailOut();
  delay(interval);
  headTailRest();
  delay(interval);
}

// Bring the fish's head out
void headOut() {
  digitalWrite(HEADTAIL_MOTOR_PIN_1, LOW);
  digitalWrite(HEADTAIL_MOTOR_PIN_2, HIGH);
}

// Bring the fish's tail out
void tailOut() {
  digitalWrite(HEADTAIL_MOTOR_PIN_1, HIGH);
  digitalWrite(HEADTAIL_MOTOR_PIN_2, LOW);
}

// Put the fish head and tail back to the neutral position
void headTailRest() {
  digitalWrite(HEADTAIL_MOTOR_PIN_1, LOW);
  digitalWrite(HEADTAIL_MOTOR_PIN_2, LOW);
}

// Flap the fish's mouth for a defined time (in millis), opening and closing it at the defined interval (in millis).
// runtime should be a multiple of interval * 2, otherwise the number of mouth movements will be rounded down.
// Used to simulate singing or rapid speech.
void flapMouthFor(int runtime, int interval) {
  int runs = runtime / interval;
  for (int i = 0; i < runs; i++) {
    mouthOpen();
    delay(interval);
    mouthClose();
    delay(interval);
  }
}

// Open the fish's mouth for a defined time (in millis), then close it. Used to simulate speaking a word.
void mouthOpenFor(int runtime) {
  mouthOpen();
  delay(runtime);
  mouthClose();
}

// Open the fish's mouth
void mouthOpen() {
  digitalWrite(MOUTH_MOTOR_PIN_1, LOW);
  digitalWrite(MOUTH_MOTOR_PIN_2, HIGH);
}

// Close the fish's mouth
void mouthClose() {
  digitalWrite(MOUTH_MOTOR_PIN_1, HIGH);
  digitalWrite(MOUTH_MOTOR_PIN_2, LOW);
}

// Rest the fish's mouth
void mouthRest() {
  digitalWrite(MOUTH_MOTOR_PIN_1, LOW);
  digitalWrite(MOUTH_MOTOR_PIN_2, LOW);
}

// Stop the motors & music
void stop() {
  headTailRest();
  mouthRest();
  sendCommandToMP3Player(0x16, 0);
}

// Set volume to specific value
void changeVolume(int thevolume) {
  sendCommandToMP3Player(0x06, thevolume);
}

// Send a command to the MP3-TF-16P. Some commands support one or two bytes of data
void sendCommandToMP3Player(byte command, int dataBytes) {
  byte commandData[10];
  byte q;
  int checkSum;
  commandData[0] = 0x7E; //Start of new command
  commandData[1] = 0xFF; //Version information
  commandData[2] = 0x06; //Data length (not including parity) or the start and version
  commandData[3] = command; //The command
  commandData[4] = 0x01; //1 = feedback
  commandData[5] = highByte(dataBytes); //High byte of the data
  commandData[6] = lowByte(dataBytes); //low byte of the data
  checkSum = -(commandData[1] + commandData[2] + commandData[3] + commandData[4] + commandData[5] + commandData[6]);
  commandData[7] = highByte(checkSum); //High byte of the checkSum
  commandData[8] = lowByte(checkSum); //low byte of the checkSum
  commandData[9] = 0xEF; //End bit
  for (q = 0; q < 10; q++) {
    Serial2.write(commandData[q]);
  }
  delay(100);
}
```

*\*DJ voice\* Y'all know what time it is... PUT YOUR HANDS IN THE AIR!!!*

<center><video style="width: 720px; max-width:100%" controls><source src="https://video.ianrenton.com/phattbass/phattbass.webm" type="video/webm"></video></center>
