ArrayList<Star> stars = new ArrayList<Star>();
Table t;

void setup()
{
 size(800,800);
 loadData();
}

void draw()
{
  
}

void loadData()
{
  t = loadTable("HabHYG15ly.csv","header");
  
  for(TableRow row: t.rows())
  {
   Star s = new Star(row);
   stars.add(s);
   println(s);
  }
}