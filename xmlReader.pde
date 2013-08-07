// read in xml and store in a useful way.
XML xml;
XML [] songs;
String [] artistNames; 
XML [] song;
int [] wordCount;
int [] syllableCount;
int [] polyWordcount;
int [] sentenceCount;
float [] fleschScore;
int [] smogScore;
float [] avgSyllablesword;
//float [] avgLettersword;
float [] avgLetterssyl;
int [] educationLevel;

void setup() {
  xml = loadXML("TheBurgerSong.xml");
  XML[] body = xml.getChildren("body");
  println(body.length);
  XML[] results = body[0].getChildren("results");
  println(results.length);
  XML[] songs = results[0].getChildren("songs");
  println(songs.length);
  song = songs[0].getChildren("song");
  println(song.length);
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
<<<<<<< HEAD
  println(artistNames.length); 
  println(artistNames); 


=======

  fieldArray(syllableCount, "syllable_count");
  fieldArray(polyWordcount, "polysyllabic_word_count");
  fieldArray(sentenceCount, "sentence_count");
  fieldArray(fleschScore, "flesh_score");
  fieldArray(smogScore, "smog_score");
  fieldArray(avgSyllablesword, "average_syllables_per_word");
//  fieldArray(avgLettersword, "average_letters_per_word");
  fieldArray(avgLetterssyl, "average_letters_per_syllable");
  fieldArray(educationLevel, "education_level");

  /**
   //for (int i = 0; i<song.length; i++) {  
   XML[] artist1 = song[0].getChildren("artist");  
   //println(artist1.length); 
   //println(artist1); 
   
   XML[] artist2 = artist1[0].getChildren("artist");  
   //println(artist2[0].getContent());
   //println(artist2);
   XML[] smogData = artist2[1].getChildren("smogdata");
   println(smogData);  
   XML[] SyllableCount = smogData[0].getChildren("syllable_count");
   println(syllableCount.length);
   String syllableCountString = syllableCount[0].getContent();
   syllableCountString = trim(syllableCountString); 
   //char temp[] = syllableCountString;
   int syllableCountNum = int(syllableCountString);  
   println(syllableCountNum);
   
   //  } **/
>>>>>>> d86c5e113d5a00b5965b6150b90816b5de0c8876
}

void draw() {
}

XML [] getElement( String path) {
  String [] pathArray = split(path, "/");
  println(pathArray);
  XML[] toReturn;
  XML[] temp = xml.getChildren(pathArray[0]);
  for (int i =1; i< pathArray.length; i++) {
    for (int j =0; j< temp.length; j++) {
      //toReturn =
    }
  }
  // print(toReturn);
  XML[] children = xml.getChildren("songs");
  return children;
}

void fieldArray(int[] arrayToFill, String smog) {
  arrayToFill = new int[song.length];
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
    int wordCountNum = int(wordCountString); 
    arrayToFill[i] = wordCountNum;  
    //  println(wordCountNum);
  }
  println(smog);
  println(arrayToFill);
}

void fieldArray(float[] arrayToFill, String smog) {
  arrayToFill = new float[song.length];
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
    arrayToFill[i] = wordCountNum;  
    //  println(wordCountNum);
  }
  println(smog);
  println(arrayToFill);
}
