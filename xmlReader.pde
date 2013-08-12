// read in xml and store in a useful way.
import controlP5.*;

import processing.opengl.*;
import unlekker.modelbuilder.*;
import unlekker.modelbuilder.filter.*;
import unlekker.util.*;

XML xml;
XML [] songs;
String [] artistNames; 
XML [] song;
int [] wordCount;
int [] syllableCount;
int [] polyWordcount;
int [] sentenceCount;
float [] fleshScore;
int [] smogScore;
float [] avgSyllablesword;
//float [] avgLettersword;
float [] avgLetterssyl;
int [] educationLevel;


void setup() {
  size(800, 600, OPENGL);
  xml = loadXML("TheBurgerSong.xml");
  XML[] body = xml.getChildren("body");
  // println(body.length);
  XML[] results = body[0].getChildren("results");
  // println(results.length);
  XML[] songs = results[0].getChildren("songs");
  // println(songs.length);
  song = songs[0].getChildren("song");
  //println(song.length);
  artistNames = new String[song.length];

  for (int i = 0; i<song.length; i++) {  
    XML[] artist1 = song[i].getChildren("artist");  
    // println(artist1.length); 
    //println(artist1); 

    XML[] artist2 = artist1[0].getChildren("artist");  
    //println(artist2[0].getContent());
    //println(artist2);
    artistNames[i] = artist2[0].getContent();
  }
  //println(artistNames.length); 
  //println(artistNames); 
  wordCount = fieldArray(wordCount, "word_count");

  syllableCount =  fieldArray(syllableCount, "syllable_count");
  polyWordcount =  fieldArray(polyWordcount, "polysyllabic_word_count");
  sentenceCount =  fieldArray(sentenceCount, "sentence_count");
  fleshScore =  fieldArray(fleshScore, "flesh_score");
  smogScore = fieldArray(smogScore, "smog_score");
  avgSyllablesword = fieldArray(avgSyllablesword, "average_syllables_per_word");
  //  fieldArray(avgLettersword, "average_letters_per_word");
  avgLetterssyl  = fieldArray(avgLetterssyl, "average_letters_per_syllable");
  educationLevel = fieldArray(educationLevel, "education_level");

for(int i=0; i<song.length; i++){
  UGeometry geo;
  println(i);
  //int wordCountNum = wordCount[0];
 
int syllableCountNum = syllableCount[i];
   int polyWordcountNum = polyWordcount[i];
   int sentenceCountNum= sentenceCount[i];
   float fleshScoreNum = fleshScore[i];
   int smogScoreNum = smogScore[i];
   float avgSyllableswordNum = avgSyllablesword[i];
   float  avgLetterssylNum = avgLetterssyl[i];
   int educationLevelNum = educationLevel[i];

  // radius, height, num faces, numTriangles
  //float, float, int, int
   float flash = map(fleshScoreNum, 1, 20, 5, 50); 
   float avgSyllable = map(avgSyllableswordNum, .5,2, 5, 200);
  geo= UPrimitive.cylinderGrid(flash, avgSyllable, polyWordcountNum, educationLevelNum, true);
  geo.calcBounds();
  geo.translate(0, -geo.bb.min.y, 0);
  int sentenceCountNumVar = int (map(sentenceCountNum, 45, 150, 0,45));
  new UTransformDeform().bend(1*radians(sentenceCountNumVar)).transform(geo);
  pushMatrix();
   translate(width/2, height/2); 
  geo.draw(this);
  popMatrix();
  geo.writeSTL(this, UIO.noExt(artistNames[i])+".stl");
}
}

void draw() {
   
}


int [] fieldArray(int[] arrayToFill, String smog) {
  int [] arrayToReturn = new int[song.length];
  for (int i = 0; i<song.length; i++) {  
    XML[] artist1 = song[i].getChildren("artist");  
    XML[] artist2 = artist1[0].getChildren("artist");  
    //println(artist2[0].getContent());
    //println(artist2);
    XML[] smogData = artist2[1].getChildren("smogdata");
    //println(smogData);  
    XML[] wordCountTemp = smogData[0].getChildren(smog);
    // println(wordCount.length);
    String wordCountString = wordCountTemp[0].getContent();
    wordCountString = trim(wordCountString); 
    //char temp[] = wordCountString;
    int wordCountNum = int(wordCountString); 
    arrayToReturn[i] = wordCountNum;  
    //  println(wordCountNum);
  }
  return arrayToReturn;
}

float [] fieldArray(float[] arrayToFill, String smog) {
  float []  arrayToReturn = new float[song.length];
  for (int i = 0; i<song.length; i++) {  
    XML[] artist1 = song[i].getChildren("artist");  
    //println(artist1.length); 
    //println(artist1); 

    XML[] artist2 = artist1[0].getChildren("artist");  
    //println(artist2[0].getContent());
    //println(artist2);
    XML[] smogData = artist2[1].getChildren("smogdata");
    //println(smogData);  
    XML[] wordCountTemp = smogData[0].getChildren(smog);
    // println(wordCount.length);
    String wordCountString = wordCountTemp[0].getContent();
    wordCountString = trim(wordCountString); 
    //char temp[] = wordCountString;
    float wordCountNum = float(wordCountString); 
    arrayToReturn[i] = wordCountNum;  
    //  println(wordCountNum);
  }
  return arrayToReturn;

  //println(smog);
  //println(arrayToFill);
}


