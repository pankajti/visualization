let system ;
let population_slider;
let cure_rate_slider;
let cs;
let input, button, greeting;
PersonSystems = [];
function setup() {
  
  createCanvas(1600,900);
  cs = new CureSystem(12);
  system = new PersonSystem(500,createVector( width/10, height/2), color(0,255,0)); 
  PersonSystems.push(system);
      textSize(20);

button = createButton('Remove');
button.position( 100 , 100);
button.mousePressed(removeFromSys);
button1 = createButton('Add New Population');
button1.position( 200 , 100);
button1.mousePressed(addToSys);
button2 = createButton('Spread Virus');
button2.position( 350 , 100);
button2.mousePressed(initDecease);
button3 = createButton('Lock Down Population Movement');
button3.position( 580 , 100);
button3.mousePressed(pause);

button4 = createButton('Release Lock Down');
button4.position( 780 , 100);
button4.mousePressed(release);

population_slider = createSlider(0, 300, 100);
  population_slider.position(500, 10);
  population_slider.style('width', '300px');
  cure_rate_slider = createSlider(0, 300, 10);
  cure_rate_slider.position(500, 40);
  cure_rate_slider.style('width', '300px');
}

function draw() {
    let allPersons = [];
    let infected_count =0;
    textSize(20);
  cs.nCapacity=cure_rate_slider.value();
   background(0,123,255);
  //text("Adjust cure Rate " , 200, 40);
  text("Person Per Population System "+ population_slider.value(), 150, 20);
  text("Cure Rate "+ cure_rate_slider.value(), 350, 60);
  for (let i =0; i < PersonSystems.length; i++ ){
    system = PersonSystems[i];
       allPersons= allPersons.concat(system.Persons);
        
   system.run();
  } 
   text("Total  Population:: "+  allPersons.length, 80, 80);
   text("Infection Rate:: "+  " Max", 380, 80);
   for (let j =0; j < allPersons.length; j++ ){
    for (let k =j+1; k < allPersons.length; k++ ){
    p = allPersons[j];
    o = allPersons[k];
    infected = p.checkCollision(o);
    infected_count = infected_count+infected;

  }  
  } 
  cured = cs.cure();
  text("Total Infected::  "+ cs.patients.length + " cured :: " + cured, 890, 80);
  textSize(25);
  //fill(255,84,230);
  text("Virus Spread ", 1300, 40);
  text("Adjust Cure Rate ", 1300, 80);
  text("Make it zero to see spread ", 1300, 120);
}

function pause(){
  for (let i =0; i < PersonSystems.length; i++ ){
    system = PersonSystems[i];
        for (let k =0; k < system.Persons.length; k++ ){
          p= system.Persons[k];
          p.speed = createVector(0,0);
        }
  }
}

function release(){
  for (let i =0; i < PersonSystems.length; i++ ){
    system = PersonSystems[i];
        for (let k =0; k < system.Persons.length; k++ ){
          p= system.Persons[k];
          p.speed = createVector(random(-3,3),random(-3,3));
        }
  }
}

function initDecease(){
    cs.nCapacity = cure_rate_slider.value();
  system = PersonSystems[0];  
  var speed = createVector(random(-1,4), random(-1,2));
     var acc = createVector(0.0, 0.0);
    var p = new Person(createVector( width/10, height/2), speed,acc, color(255,0,0));
     p.type = 2;
     //p.lifeSpan=4;
     system.Persons.push(p);
     cs.addPatient(p);
}

function addToSys(){
 s = new PersonSystem(population_slider.value(), createVector( random(100, width/2), random(200, height/2)), color(0,255,0));
   //system.addPerson();
  PersonSystems.push(s);
}
function removeFromSys(){
  PersonSystems.splice(0,1);
}
