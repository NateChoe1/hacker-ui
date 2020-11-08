class Node {
  Node[] children;
  int x;
  int y;
  boolean lastLayer;
  Node(int remaining) {
    if (remaining <= 0) return;
    children = new Node[(int) random(2, 4)];
    for (int i = 0; i < children.length; i++) children[i] = new Node(remaining-1);
  }
  void display(int layer, int layers, int xpos) {
    if (layer > layers) {
      return;
    }
    if (layer == layers) lastLayer = true; //<>//
    int ypos = (height/(layers+1))*layer;
    int partitions = (int) pow(3, layer+1);
    int dist = width/partitions*3;
    int left = xpos-dist;
    int right = xpos+dist;
    int j = 0;
    for (int i = left; i <= right; i+= (right-left)/(children.length-1)) {
      strokeWeight(3);
      stroke(searched? color(255, 0, 0):color(0, 255, 0));
      if (!lastLayer) line(xpos, ypos, i, (height/(layers+1))*(layer+1));
      children[j].display(layer+1, layers, i);
      j++;
    }
    fill(0);
    strokeWeight(5);
    stroke(searched? color(255, 0, 0):color(0, 255, 0));
    ellipse(xpos, ypos, 20, 20);
    x = xpos;
    y = ypos;
  }
  void display() {
    strokeWeight(5);
    fill(0, 255, 0);
    ellipse(x, y, 20, 20);
  }
}
