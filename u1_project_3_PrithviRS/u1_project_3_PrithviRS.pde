CAGrid grid;

int i = 0;

void setup()
{
  noCursor();
  fullScreen();
  grid = new CAGrid();
  frameRate(20);
}

void draw()
{
  background(0);
  noStroke();
  grid.Draw();
  grid.Update();
}

void keyReleased()
{
  if (key == 'b')
  {
    saveFrame();
  }
}