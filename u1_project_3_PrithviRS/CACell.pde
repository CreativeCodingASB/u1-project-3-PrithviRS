class CACell
{
  private int _posX;
  private int _posY;
  private int _w;
  private int _h;
  private color _col;
  private int _state;
  
  //default constructor
  CACell()
  {
    _posX = _posY = 0;
    _w = _h = 0;
    _col = color(255,255,255);
    _state = 0;
  }
  
  //overloaded constructor
  CACell(int cellSize)
  {
    _posX = _posY = 0;
    _w = _h = cellSize;
    _col = color(255,255,255);
    _state = 0;
  }
  
  public void SetPosition (int x, int y)
  {
    _posX = x;
    _posY = y;
  }
  
  public void SetColor(color col)
  {
    _col = col;
  }
  
  public void SetColor(int r, int g, int b)
  {
    _col = color(r,g,b);
  }
  
  public void Draw()
  {
    if (_state == 1)
    {
      fill(_col);
      rect(_posX, _posY, _w, _h);
    }
  }
  
  public int GetState()
  {
    return _state;
  }
  
  public void SetState (int state)
  {
    _state = state;
  }
}