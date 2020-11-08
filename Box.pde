class Box { //<>//
  int x;
  int y;
  int w;
  int h;
  
  Box(int xx, int yy, int ww, int hh) {
    x = xx;
    y = yy;
    w = ww;
    h = hh;
  }
  
  void draw() {
    fill(0);
    stroke(0, 255, 0);
    strokeWeight(5);
    rect(x, y, w, h);
  }
}

class Left extends Box {
  ArrayList<Drawing> figures = new ArrayList<Drawing>();
  Left(int xx, int yy, int ww, int hh) {
    super(xx, yy, ww, hh);
  }
  
  void draw() {
    fill(0);
    stroke(0, 255, 0);
    strokeWeight(5);
    rect(x, y, w, h);
    if (!showEntered) figures.add(new Drawing((int) random(x, x + w - 10), (int) pow(random(0, sqrt(h)), 2) + y));
    for (int i = figures.size() - 1; i >= 0; i--) {
      figures.get(i).draw();
      if (!showEntered) {
        figures.get(i).y += 5;
        if (figures.get(i).y > y + h - 10) figures.remove(i);
      }
    }
  }
}

class Drawing {
  boolean[][] grid = new boolean[10][10];
  int x;
  int y;
  
  Drawing(int xx, int yy) {
    x = xx;
    y = yy;
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        grid[i][j] = random(1) < 0.5;
      }
    }
  }
  
  void draw() {
    noStroke();
    fill(0, 255, 0);
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        fill(0, grid[i][j]? 255:0, 0);
        rect(x + i, y + j, 1, 1);
      }
    }
  }
}

class Side extends Box {
  String[] rows = new String[h / 20];
  String[] possibilities;
  int offset;
  
  Side(int xx, int yy, int ww, int hh, String[] p, int o) {
    super(xx, yy, ww, hh);
    for (int i = 0; i < rows.length; i++) rows[i] = "";
    rows[rows.length - 1] = "Initializing interface";
    possibilities = p;
    offset = o;
  }
  
  void draw() {
    fill(0);
    stroke(0, 255, 0);
    strokeWeight(5);
    rect(x, y, w, h);
    textSize(20);
    fill(0, 255, 0);
    textAlign(CORNER, CORNER);
    for (int i = 0; i < rows.length; i++) {
      text(rows[i], x + 5, i * 20 + y + 20);
    }
    if (frameCount % 30 == offset && !showEntered) {
      for (int i = 0; i < rows.length - 1; i++) {
        rows[i] = new String(rows[i + 1]);
      }
      rows[rows.length - 1] = new String(possibilities[(int) random(0, possibilities.length)]);
    }
  }
}
