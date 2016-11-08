ArrayList<Star> stars = new ArrayList<Star>();
Table t;
int check =1;
float x2 = 0;
float y2 =0;
  
void setup()
{
 size(800,800);
 loadData();
 //printStars();
}

void draw()
{
   int i = -5;
  
  background(0);
  stroke(255,0,255);
  fill(255,0,255);
  
  float lineGap = (width-100)/10;
  
  for(int x = 50;x<=width-50;x+=lineGap)
  {
    line(x,50,x,height-50);
    text(i++,x,10);
  }
  
  for(int y = 50;y<=height-50;y+=lineGap)
  {
    line(50,y,width-50,y);
    text(i++,10,y);
  }
 
  float x=0;
  float y=0;
  float starSize=0;

  
  
  for(int k=0;k<stars.size();k++)
  {
   starSize = stars.get(k).AbsMag;
   String starName = stars.get(k).DisplayName;
 
   x = map(stars.get(k).Xg,-5,5,50,width-50);
   y = map(stars.get(k).Yg,-5,5,50,height-50);
   
   stroke(255,255,0);
   line(x-5,y,x+5,y);
   line(x,y-5,x,y+5);
   
   noFill();
   stroke(255,0,0);
   ellipse(x,y,starSize,starSize);
    
   fill(255);
   text(starName,x+10,y);
    
   if(mousePressed)
   {
      if(mouseX > x-starSize && mouseX < x+starSize && mouseY > y-starSize && mouseY < y+starSize && check==1)
      {
         check = 1;
         x2 = x;
         y2 = y;
      }
    }
  }
  
  if(check==1)
  {
   drawLine(); 
  }
  
}
int check2 = 1;
float x3=0;
float y3=0;
void drawLine()
{
  
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
    
    for(int k=0;k<stars.size();k++)
    {
       float starSize = stars.get(k).AbsMag;
       
      float x = map(stars.get(k).Xg,-5,5,50,width-50);
      float y = map(stars.get(k).Yg,-5,5,50,height-50);
     
       if(mouseX > x2-starSize && mouseX < x2+starSize && mouseY > y2-starSize && mouseY < y2+starSize && check2==1)
       {
          check2 =1;
          x3 = x;
          y3 = y;
       }
    }
    

    line(x2,y2,x3,y3); 
    
    
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