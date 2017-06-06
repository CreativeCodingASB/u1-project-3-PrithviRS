class CAGrid //<>//
{
  private int _amtRows;
  private int _amtCols;
  private int _cellSize;
  private int _gen;
  private CACell cells[][];
  private CACell nextGen[][];

  CAGrid()
  {
    _cellSize = 10;
    _amtCols = width/_cellSize;
    _amtRows = height/_cellSize;
    cells = new CACell[_amtRows][_amtCols];
    nextGen = new CACell[_amtRows][_amtCols];
    InitCells();
  }

  CAGrid(CACell grid[][], int rows, int cols)
  {
    _amtRows = rows;
    _amtCols = cols;
    _cellSize = width/rows;
    cells = new CACell[_amtRows][_amtCols];
    nextGen = new CACell[_amtRows][_amtCols];
    CopyGrid (grid);
  }

  private void InitCells()
  {
    for (int i=0; i < _amtRows; i++)
    {
      for (int j=0; j < _amtCols; j++)
      {
        int rnd = (int)random(0, 9);
        cells[i][j] = new CACell(_cellSize);
        cells[i][j].SetPosition(j*_cellSize, i*_cellSize);
        if ( rnd > 1 ) { 
          rnd = 0;
        }
        cells[i][j].SetState( rnd );
        nextGen[i][j] = new CACell(_cellSize);
        nextGen[i][j].SetPosition(j*_cellSize, i*_cellSize);
      }
    }

    /*
    cells[1][1].SetState(1);
     cells[1][3].SetState(1);
     cells[2][2].SetState(1);
     cells[2][3].SetState(1);
     cells[0][3].SetState(1);
     */
  }

  public void Update()
  {
    for (int i=0; i < _amtRows; i++)
    {
      for (int j=0; j < _amtCols; j++)
      {
        UpdateCell (i, j);
      }
    }

    UpdateGeneration();
  }

  public void Draw()
  {
    for (int i=0; i < _amtRows; i++)
    {
      for (int j=0; j < _amtCols; j++)
      {
        cells[i][j].Draw();
      }
    }
  }

  public void UpdateCell(int row, int col)
  {
    /*
        n1 n2 n3
        n4    n5
        n6 n7 n8
     */
    int n1, n2, n3, n4, n5, n6, n7, n8;
    n1=n2=n3=n4=n5=n6=n7=n8=0;
    if ( row == 0 && col == 0 )
    {
      /*
       
       X n5
       n7 n8
       */
      n1=n2=n3=0;
      n4=0;
      n6 = 0;
      n5 = cells[row][col+1].GetState();
      n7 = cells[row+1][col].GetState();
      n8 = cells[row+1][col+1].GetState();
    } else if (col == _amtCols - 1 && row == 0)
    {
      /*
        
       n4 X 
       n6 n7 
       */
      n1=n2=n3=n5=n8=0;
      n4 = cells[row][col-1].GetState();
      n6 = cells[row+1][col-1].GetState();
      n7 = cells[row+1][col].GetState();
    } else if (col == 0 && row == _amtRows-1)
    {
      /*
           n2  n3
       X   n5
       
       */
      n1=n4=n6=n7=n8 =0;
      n2 = cells[row-1][col].GetState();
      n3 = cells[row-1][col+1].GetState();
      n5 = cells[row][col+1].GetState();
    } else if (col == _amtCols -1 && row == _amtRows -1 )
    {
      /*
        n1 n2 
       n4 X  
       
       */
      n3=n5=n6=n7=n8=0;
      n1 = cells[row-1][col-1].GetState();
      n2 = cells[row-1][col].GetState();
      n4 = cells[row][col-1].GetState();
    } else if (row == 0)
    {
      /*
        
       n4 X  n5
       n6 n7 n8
       */
      n1 = n2 = n3 = 0;
      n4 = cells[row][col-1].GetState();
      n5 = cells[row][col+1].GetState();
      n6 = cells[row+1][col-1].GetState();
      n7 = cells[row+1][col].GetState();
      n8 = cells[row+1][col+1].GetState();
    } else if (col == 0)
    {
      /*
          n2 n3
       X  n5
       n7 n8
       */
      n1 = n4 = n6 = 0;
      n2 = cells[row-1][col].GetState();
      n3 = cells[row-1][col+1].GetState();
      n5 = cells[row][col+1].GetState();
      n7 = cells[row+1][col].GetState();
      n8 = cells[row+1][col+1].GetState();
    } else if (row == _amtRows -1)
    {
      /*
        n1 n2 n3
       n4 X  n5
       
       */
      n6 = n7 = n8 = 0;
      n1 = cells[row-1][col-1].GetState();
      n2 = cells[row-1][col].GetState();
      n3 = cells[row-1][col+1].GetState();
      n4 = cells[row][col-1].GetState();
      n5 = cells[row][col+1].GetState();
    } else if (col == _amtCols -1)
    {
      /*
        n1 n2 
       n4  X 
       n6 n7 
       */
      n3=n5=n8=0;
      n1 = cells[row-1][col-1].GetState();
      n2 = cells[row-1][col].GetState();
      n4 = cells[row][col-1].GetState();
      n6 = cells[row+1][col-1].GetState();
      n7 = cells[row+1][col].GetState();
    } else
    {
      /*
        n1 n2 n3
       n4 X  n5
       n6 n7 n8
       */
      n1 = cells[row-1][col-1].GetState();
      n2 = cells[row-1][col].GetState();
      n3 = cells[row-1][col+1].GetState();
      n4 = cells[row][col-1].GetState();
      n5 = cells[row][col+1].GetState();
      n6 = cells[row+1][col-1].GetState();
      n7 = cells[row+1][col].GetState();
      n8 = cells[row+1][col+1].GetState();
    }

    int neighbors = n1+n2+n3+n4+n5+n6+n7+n8;
    if ( cells[row][col].GetState() == 0)
    {
      if ( neighbors == 3)//Babies
      {
        nextGen[row][col].SetState(1);
      }
    } else
    {
      if ( neighbors < 2 ) //Lonliness
      {
        nextGen[row][col].SetState(0);
      } else if ( neighbors == 2 || neighbors == 3) //All Good
      {
        nextGen[row][col].SetState(1);
      } else if ( neighbors > 3) // Overpopulation
      {
        nextGen[row][col].SetState(0);
      }
    }
  }

  public void UpdateGeneration()
  {
    for (int i=0; i < _amtRows; i++)
    {
      for (int j=0; j < _amtCols; j++)
      {
        cells[i][j].SetState(nextGen[i][j].GetState());
      }
    }
    _gen++;
    println("Generation "+_gen);
  }

  private void CopyGrid( CACell grid[][])
  {
    for (int i = 0; i < _amtRows; i++)
    {
      for (int j = 0; j< _amtCols; j++)
      {
        cells[i][j] = grid[i][j];
      }
    }
  }
}