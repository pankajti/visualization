function CureSystem(nCapacity){
  this.nCapacity=nCapacity;
  this.patients = [];
  
  this.addPatient = function(patient){
    this.patients.push(patient);
  };
  
  this.cure = function(){
    let count =0;
    for (let i=0;i<this.nCapacity;i++){
      count= count+1;
       if (i==this.nCapacity || i>= this.patients.length){
         //this.patients=[];
               count = i;
               break;
             }
             this.patients[i].fillColor= color(0,255,0);
             this.patients[i].type= 1;
             this.patients.splice(i,1);
    }
    return count;
  };
}
