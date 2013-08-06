// read in xml and store in a useful way.
XML xml;
XML [] songs;
String [] artistNames; 

void setup() {
  xml = loadXML("TheBurgerSong.xml");
  XML[] body = xml.getChildren("body");
  println(body.length);
  XML[] results = body[0].getChildren("results");
  println(results.length);
  XML[] songs = results[0].getChildren("songs");
  println(songs.length);
  XML[] song = songs[0].getChildren("song");
  println(song.length);
  artistNames = new String[song.length];

  for (int i = 0; i<song.length; i++) {  
    XML[] artist1 = song[i].getChildren("artist");  
    println(artist1.length); 
    //println(artist1); 

    XML[] artist2 = artist1[0].getChildren("artist");  
    //println(artist2[0].getContent());
    //println(artist2);
    artistNames[i] = artist2[0].getContent();
  }

  println(artistNames.length); 
  println(artistNames); 

  /**  
   for(int i=0; i< children.length; i++){
   songs = children[i].getChildren("html");
   println(songs.length);
   }
   
   for(int i=0; i< songs.length; i++){
   XML[]  artist = songs[i].getChildren("artist");
   println(artist.length);
   }
   */
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

