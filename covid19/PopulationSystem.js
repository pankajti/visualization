let particleCount =1;
 function PersonSystem(nPopulation, position, col){
   this.position = position;
   this.col= col;
   this.Persons = [];
   
   this.addPerson= function (col){
     var speed = createVector(random(-1,5), random(-1,5));
     var acc = createVector(0.0, 0.0);
     pos = this.position.copy();
     var p = new Person(pos, speed, acc, col);
     p.type = 1;
     this.Persons.push(p);
    };
   
   this.run = function(){
       //this.addPerson(this.col);
      for (let i = 0; i < this.Persons.length; i++){
       p = this.Persons[i];
     p.update();
     p.checkObstacle();
     //p.checkCollision();
     p.show();
   if (p.isDead()) {
      this.Persons.splice(i, 1);
    }
     }
   };
   
    for (let i =0;i <nPopulation;i++){
           this.addPerson(this.col);

   }
}
