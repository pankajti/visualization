/**

From the Sketch
Monty Pythons Flying Circus Season 3 Episode 12 A Book at Bedtime
https://www.dailymotion.com/video/x3djb7n
From 17:07 minute of the video
or
https://www.dailymotion.com/video/x5v0vod
19:42 of the video
I could not find a create a shorter clip just depicting that portion of video.
Five type personalities and one looney are created using their own class.
The parent class is 
an abstract class with an abstract method perform. Each class is responsible for drawing itself.
The parent class contains one common draw methid. The looney overrides draw method to retain its position 
which is not random. This help us identify when looney image is clicked.
We identify Looney class runtime to revert color of its image.

*/


//Uncomment the library import and intialization for sound to play if the video library is installed.

//import processing.video.*;
//Movie myMovie;

PImage looney_img ;
PImage katy_boyle_img;
PImage anthony_barber_politician;
PImage edgar_allan_poe_writer;
PImage reginald_maudling_politician;
PImage tony_jacklin_golfer;
float  x = 0;
float  y = 0;
  
ArrayList<Personality > personalities = new ArrayList<Personality>();
void setup(){
  frameRate(1);
  size(600,800);
  // uncomment below for sound
  //myMovie = new Movie(this, "spot_the_looney.mp4");
  //myMovie.play();
  //Personality actor = new Actor();
  looney_img = loadImage("looney.jpg");
  Personality looney = new Looney("I. M. Looney", looney_img);
  personalities.add(looney);
  katy_boyle_img = loadImage("katy_boyle_actress.png");
  Personality actor = new Actor("Katy Boyle" , katy_boyle_img);
  personalities.add(actor);
  anthony_barber_politician = loadImage("anthony_barber_politician.png");
  Personality politician = new Politician("Anthony Barber ", anthony_barber_politician );
  personalities.add(politician);
  edgar_allan_poe_writer = loadImage("edgar_allan_poe_writer.png");
  Personality writer = new Writer("Edgar Allan ", edgar_allan_poe_writer);
  personalities.add(writer);
  reginald_maudling_politician = loadImage("reginald_maudling_politician.png");
  Personality politician1 = new Politician("Reginald Maudling", reginald_maudling_politician);
  personalities.add(politician1);
  tony_jacklin_golfer = loadImage("tony_jacklin_golfer.png");
  Personality golfer = new Golfer("Tony Jacklin ", tony_jacklin_golfer);
  personalities.add(golfer);
}

void draw(){
 background(123, 244,12);
 fill(0);
       text("  Spot the looney", 10,20);
        //image(myMovie,0,0);

  for (Personality p : personalities){
    p.drawImage();
    
  }
}

int count =0;
void mouseClicked(){
  if(mouseX > x && mouseX< x+looney_img.width && mouseY > y && mouseY<y+ looney_img.height){ //<>//
    println("you spotted the looney " + count++ + " times" +  mouseX+ " "+ mouseY);
    fill(255,123,0);
    textSize(30);
    text("Congratulations!! \n You Spotted the looney", 10,20);
        noLoop();
    for (Personality p : personalities){
      if( p instanceof Looney){
        PImage img = p.img;
        img.loadPixels();
      // Begin loop for columns
      for (int i = 0; i < img.pixels.length; i++){
        color c = img.pixels[i];
        color new_c =   color(255-red(c),255-blue(c),255-green(c));
          img.pixels[i]= new_c;
      }
      img.updatePixels();
      image(img, width-x, 30);      
      }
  }
  }
}
 
