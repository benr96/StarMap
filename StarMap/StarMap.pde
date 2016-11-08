/*StarMap
  Ben Ryan
  C15507277
*/

ArrayList<Star> stars = new ArrayList<Star>();
Table t;

//used for drawing line betwen stars
int check =1;
float x2 = 0;
float y2 =0;
  
void setup()
{
 size(800,800);
 loadData();
 printStars();
}

void draw()
{
   int i = -5;//used for drawing grid
  
  background(0);
  stroke(255,0,255);
  fill(255,0,255);
  
  float lineGap = (width-100)/10;//finding gap between lines of grid
  
  for(int x = 50;x<=width-50;x+=lineGap)//drawing x lines
  {
    line(x,50,x,height-50);
    text(i++,x,10);
  }
  
  for(int y = 50;y<=height-50;y+=lineGap)//drawing y lines
  {
    line(50,y,width-50,y);
    text(i++,10,y);
  }
 
  //for drawing stars
  float x=0;
  float y=0;
  float starSize=0;
  
  //loop through array list finding each stars coordinates and size and drawing it on screen
  for(int k=0;k<stars.size();k++)
  {
   starSize = stars.get(k).AbsMag;
   String starName = stars.get(k).DisplayName;
 
   //scaling xg and yg to size of screen -50 on all sides
   x = map(stars.get(k).Xg,-5,5,50,width-50);
   y = map(stars.get(k).Yg,-5,5,50,height-50);
   
   //drawing cross on star locations
   stroke(255,255,0);
   line(x-5,y,x+5,y);
   line(x,y-5,x,y+5);
   
   //drawing circle around star location
   noFill();
   stroke(255,0,0);
   ellipse(x,y,starSize,starSize);
    
   fill(255);
   text(starName,x+10,y);
    
    //checking if star should have a line drawn from it and storing coordinates in seperate variables
   if(mousePressed)
   {
      if(mouseX > x-starSize && mouseX < x+starSize && mouseY > y-starSize && mouseY < y+starSize && check==1)
      {
         check = 1;
         x2 = x;
         y2 = y;
         drawLine();
      }
    }
  }
}

//for drawing line between stars
int check2 = 1;
float x3=0;
float y3=0;

void drawLine()
{
  float x =0;
  float y =0;
  
  //if mouse is still pressed when out of star coordinates
  if(mousePressed)
  {
    if(check == 1)
    {
      stroke(255,255,0);
      line(x2,y2,mouseX,mouseY); 
    }
    else
    {
      check=0; 
    }
    
    //loop through array list to check if mouse is over another star
    for(int k=0;k<stars.size();k++)
    {
      //finding star variables to draw to
       float starSize = stars.get(k).AbsMag;
       
      x = map(stars.get(k).Xg,-5,5,50,width-50);
      y = map(stars.get(k).Yg,-5,5,50,height-50);
     
     
      if(mouseX > x-starSize && mouseX < x+starSize && mouseY > y-starSize && mouseY < y+starSize && check2==1)
       {
          check2 =1;
          x3 = x;
          y3 = y;
       }
    }
    
   
    line(x3,y3,x,y); 
    
    
  }
  
}
void loadData()
{
  t = loadTable("HabHYG15ly.csv","header");
  
  for(TableRow row: t.rows())
  {
   Star s = new Star(row);
   stars.add(s);
  }
}

void printStars()
{
 for(int i=0;i<stars.size();i++)
 {
  println(stars.get(i)); 
 }
}