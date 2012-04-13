// Analog pin:
const byte accPin = 0;
const byte sustainPin = 1;
const byte sensitivityPin = 2;
// Digital pin:
const byte pingPin = 2;
const byte speakerPin = 3;
const byte powerPin = 4;
const byte finger1Pin = 9;
const byte finger2Pin = 10;
const byte finger3Pin = 11;
const byte finger4Pin = 12;

// An array containing the waveform
// of a guitar sound
const char waveform[] =
{  13,  15,  13,   7,  -1,  -8, -15,
 -18, -19, -16, -10,  -1,   7,  16,
  22,  27,  28,  27,  23,  18,  13,
   9,   7,   6,   9,  14,  21,  29,
  36,  42,  44,  42,  36,  23,   6,
 -16, -40, -65, -86,-103,-114,-115,
-108, -92, -69, -42, -11,  19,  47,
  70,  87,  97, 101,  97,  88,  75,
  60,  44,  29,  15,   2,  -9, -18,
 -26, -33, -38, -42, -44, -43, -39,
 -33, -25, -14,  -3,   9,  18,  26,
  30,  29,  23,  14,   2, -12, -26,
 -36, -43, -45, -41, -33, -20,  -6,
  11,  24,  35,  43,  46,  43,  37,
  29,  20,  11,   5,   2,   1,   1,
   2,   1,  -2,  -9, -21, -35, -50,
 -64, -75, -80, -78, -67, -48, -22,
   8,  41,  74, 102, 124, 137, 137,
 124, 102,  71,  35,  -1, -34, -61,
 -82, -92, -94, -88, -76, -58, -39,
 -21,  -4,   8,  16,  17,  15,   9,
   2,  -5, -11, -15, -16, -13,  -9,
  -1,   6,  13,  19,  23,  24,  23,
  20,  15,  11,   9,   9,  10,  13,
  20,  27,  34,  41,  45,  46,  41,
  32,  17,  -3, -27, -51, -75, -96,
-110,-117,-114,-103, -83, -58, -28,
   3,  33,  60,  81,  96, 103, 103,
  96,  84,  69,  52,  35,  20,   6,
  -5, -15, -24, -31, -37, -41, -43,
 -43, -41, -37, -30, -21, -10,   1,
  13,  23,  30,  32,  31,  25,  14,
   0, -16, -29, -39, -46, -47, -43,
 -34, -21,  -5,  10,  25,  37,  45,
  48,  46,  40,  32,  23,  14,   7,
   2,  -1,  -2,  -3,  -6, -12, -20,
 -31, -44, -57, -67, -74, -75, -69,
 -55, -34,  -9,  21,  53,  83, 110,
 128, 136, 132, 117,  92,  59,  24,
 -11, -42, -68, -86, -94, -95, -87,
 -74, -56, -37, -18,  -2,  10,  18,
  20,  18,  12,   6,  -2,  -8, -12,
 -14, -12,  -8,  -2,   5,  11,  16,
  19,  20,  19,  16,  13,  11,  10,
  10,  13,  17,  24,  31,  38,  44,
  47,  46,  39,  27,  10, -12, -37,
 -62, -85,-103,-115,-118,-112, -97,
 -75, -48, -17,  14,  44,  70,  89,
 101, 105, 102,  93,  79,  62,  45,
  28,  13,   0, -11, -20, -28, -35,
 -39, -42, -43, -42, -39, -34, -26,
 -16,  -6,   6,  18,  28,  34,  36,
  33,  25,  13,  -1, -17, -31, -41,
 -48, -49, -44, -34, -21,  -5,  11,
  26,  38,  46,  50,  48,  44,  35,
  25,  15,   7,   1,  -3,  -6,  -9,
 -13, -20, -29, -40, -51, -62, -69,
 -72, -69, -60, -44, -22,   4,  33,
  63,  91, 113, 129, 134, 127, 109,
  83,  50,  14, -20, -50, -74, -89,
 -97, -95, -86, -72, -54, -34, -15,
   1,  13,  20,  22,  20,  15,   8,
   1,  -6, -10, -12, -11,  -8,  -2,
   4,   9,  14,  16,  17,  16,  14,
  12,  11,  11,  13,  16,  22,  29,
  36,  42,  47,  48,  44,  35,  21,
   3, -21, -45, -70, -91,-108,-117,
-117,-108, -91, -67, -37,  -6,  26,
  54,  78,  94, 104, 106, 100,  89,
  74,  56,  38,  21,   6,  -7, -18,
 -27, -34, -39, -42, -43, -43, -41,
 -37, -32, -24, -14,  -2,  10,  21,
  30,  36,  37,  33,  23,  10,  -5,
 -21, -34, -45, -50, -50, -44, -34,
 -20,  -5,  12,  27,  40,  48,  52,
  51,  46,  37,  27,  17,   8,   1,
  -4,  -9, -14, -20, -27, -36, -45,
 -55, -63, -68, -69, -63, -52, -34,
 -12,  15,  43,  72,  97, 118, 129,
 131, 122, 102,  74,  41,   6, -27,
 -55, -77, -91, -97, -95, -86, -71,
 -53, -33, -13,   3,  15,  22,  25,
  23,  17,  10,   2,  -5, -10, -12,
 -11,  -8,  -4,   1,   6,  11,  14,
  15,  14,  13,  12,  12,  12,  15,
  19,  26,  32,  39,  45,  47,  48,
  42,  32,  17,  -4, -28, -53, -77,
 -98,-112,-118,-115,-103, -84, -58,
 -29,   3,  33,  61,  84,  99, 107,
 106,  99,  85,  68,  50,  31,  15,
   0, -12, -22, -30, -36, -40, -43,
 -43, -43, -40, -35, -29, -19,  -9,
   3,  15,  26,  34,  38,  38,  32,
  22,   9,  -7, -22, -35, -45, -50,
 -50, -45, -34, -20,  -4,  13,  29,
  42,  50,  53,  51,  46,  37,  27,
  16,   7,  -1,  -7, -13, -19, -26,
 -34, -42, -51, -59, -64, -67, -65,
 -58, -45, -27,  -4,  23,  50,  77,
 101, 119, 128, 127, 115,  93,  65,
  33,  -1, -33, -60, -80, -93, -98,
 -95, -85, -69, -50, -30, -11,   5};
const int waveLength = 714;

// An array used as a buffer to avoid
// erroneous punctual distance
// measurements
unsigned int distance_buffer[] = {16000,
16000, 16000, 16000, 16000, 16000, 16000,
16000, 16000, 16000, 16000, 16000, 16000,
16000, 16000, 16000};

const byte distance_length = 3;
byte distance_index = 0;

// The overflow values for 2 octaves
const byte frequencies[] = { 39, 42, 44, 47,
50, 52, 56, 59, 63, 66, 70, 74, 79,
84, 89, 94, 100, 105, 112, 118, 126,
133, 141, 149};

// Initial pitch
byte pitch = 149;
// Initial volume and acceleration
// parameter
int lastAcc = 0;
long volume = 0;
int acc = 0;
int accDiff = 0;
int sustain = 512;
int sensitivity = 512;
int fingerValue = 0;
unsigned int cm=1600;

//index variable for position in
//waveform
volatile byte waveindex = 0;
volatile byte currentvalue = 0;
volatile unsigned long currenttime = 0;
volatile unsigned long duration = 0;


void setup() {
  Serial.begin(9600);
  pinMode(3,OUTPUT); //Speaker on pin 3
  pinMode(4,OUTPUT); //Power LED on pin 4
  digitalWrite(4, HIGH);
  
  pinMode(finger1Pin,INPUT);
  pinMode(finger2Pin,INPUT);
  pinMode(finger3Pin,INPUT);
  pinMode(finger4Pin,INPUT);
  
  attachInterrupt(0,checkDistance, HIGH);
  /**************************
      PWM audio configuration
  ****************************/
  //set Timer2 to fast PWM mode
  //(doubles PWM frequency)
  bitSet(TCCR2A, WGM21);
  bitSet(TCCR2B, CS20);
  bitClear(TCCR2B, CS21);
  bitClear(TCCR2B, CS22);
  
  /*************************
  Timer 1 interrupt configuration
  *************************/
  
  /* Normal port operation, pins disconnected
  from timer operation (breaking pwm) */
  bitClear(TCCR1A, COM1A1);
  bitClear(TCCR1A, COM1A1);
  bitClear(TCCR1A, COM1A1);
  bitClear(TCCR1A, COM1A1);
  
  /* Mode 4, CTC with TOP set by register
  OCR1A. Allows us to set variable timing for
  the interrupt by writing new values to
  OCR1A. */
  bitClear(TCCR1A, WGM10);
  bitClear(TCCR1A, WGM11);
  bitSet(TCCR1B, WGM12);
  bitClear(TCCR1B, WGM13);
  
  /* set the clock prescaler to /8.  */
  bitClear(TCCR1B, CS10);
  bitSet(TCCR1B, CS11);
  bitClear(TCCR1B, CS12);
  
  /* Disable Force Output Compare for
  Channels A and B. */
  bitClear(TCCR1C, FOC1A);
  bitClear(TCCR1C, FOC1B);
  
  /* Initializes Output Compare
  Register A at 149 to set the
  initial pitch */
  OCR1A = pitch;
  
  //disable input capture interrupt
  bitClear(TIMSK1, ICIE1);
  //disable Output
  //Compare B Match Interrupt
  bitClear(TIMSK1, OCIE1B);
  //enable Output
  //Compare A Match Interrupt
  bitSet(TIMSK1, OCIE1A);
  //disable Overflow Interrupt
  bitClear(TIMSK1, TOIE1);
  
  // enable interrupts now that
  // registers have been set
  sei();
}

void loop()
{
   // Desactivate interputs, send a ping
   // message.
   pinMode(pingPin, OUTPUT);
   digitalWrite(pingPin, LOW);
   delayMicroseconds(2);
   cli();
   digitalWrite(pingPin, HIGH);
   currenttime = micros();
   delayMicroseconds(5);
   digitalWrite(pingPin, LOW);
   sei();
   delayMicroseconds(2);
   pinMode(pingPin, INPUT);

   
    // Delay to avoid bouncing signals
   delay(50);
   
   // convert the time into a distance
   // in centimetres
   // and store in buffer
   distance_buffer[distance_index++
    % distance_length] = duration / 25 - 25;
  
   //Find in the buffer the shortest
   // distance measured
   cm = 16000;
   for(int i = 0; i < distance_length; i++) {
      cm = min(cm, distance_buffer[i]);
   }
   
   // Check which fingers are pressed
   fingerValue = 5;
   if(!digitalRead(finger4Pin)){
      fingerValue = 4;
   }
   if(!digitalRead(finger3Pin)){
      fingerValue = 3;
   }
   if(!digitalRead(finger2Pin)){
      fingerValue = 2;
   }
   if(!digitalRead(finger1Pin)){
      fingerValue = 1;
   }
  
   // Update the sustain and
   // sensitivity values
   sustain = analogRead(sustainPin);
   sensitivity = analogRead(sensitivityPin);
  
   // Update the volume
   volume = (volume * sustain) / 1024;
   
   if(volume > 128){
       volume = 128;
   }
  
   // Check the accelerometer
   acc = analogRead(0);
   accDiff = lastAcc - acc;
  
   // Update the volume value
   if (accDiff > sensitivity) {
      volume = 128;
   }
   
   lastAcc = acc;
  
   // Set the pitch according to the distance
   // between the two hands and the
   // fingers pressed
   if(cm < 102 && cm > 0) {
      if(cm > 30) {
         pitch = frequencies[7 +
          (((cm - 30) / 24) * 4 + fingerValue - 1)];
      }else{
         pitch = map(cm, 0, 30, 39, 79);
      }
   }else{
      pitch = frequencies[7 +
       (((102 - 30) / 24) * 4 + fingerValue - 1)];
   }
   
   OCR1A = pitch;
}

// Timer overflow handler
ISR(TIMER1_COMPA_vect) {
   // reset waveindex if it has reached
   // the end of the array
   analogWrite(speakerPin,(((waveform[waveindex] * volume) >> 8) + 118));
   if (waveindex >= waveLength) {
      waveindex = 0;
   }
   waveindex++;
} 
void checkDistance()        // here the interrupt is handled after wakeup
{
    duration = micros();
    duration -= currenttime;
}

