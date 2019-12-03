
class SolarSystemDataReader{
void readSolarSystemData(){
  Table solarSystemTable = loadTable("solar_system.csv", "header");
  for (TableRow tr : solarSystemTable.rows()){
    String name = tr.getString("Name");
    
    float distance= tr.getFloat("Mean Distance from Sun (AU)");
    float radius = tr.getFloat("Diameter (km)")/2;
    PImage img = loadImage(tr.getString("Image"));
    Planet p = new Planet(radius, distance, name,img);
    float orbitSpeed = 1/tr.getFloat("Orbital Period (years)");
    p.setOrbitSpeed(orbitSpeed);
    p.img=img;
    if (name.equals("Sun")){
      p.orbitSpeed=0;
            //continue;
    }
    planets.add(p);
  }
}
}
