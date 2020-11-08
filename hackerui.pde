import java.util.*;

Box left;
Box top;
Box middle;
Box bottom;
Box[] boxes;
int phase = 0;
final int HACKING = 0;
final int SEARCHING = 1;
boolean searched = false;
Node n = new Node(5);
Deque<Node> stack = new ArrayDeque<Node>();
int enterFrame;
String fileName = "";
String[] fileNames = new String[] {"main", "main_real", "readme.txt", "I hate my boss.", "all the government secrets.txt", "plague_inc.exe", "minecraft.exe", "SHA_256 breaker.exe", "honestly why are you reading these"};

void setup() {
  fullScreen();
  strokeWeight(5);
  
  String[] possibilities = new String[] {"Connecting to port 192.51.97.85", "P: ******", "Activating phishing attack", "Searching for zombies", "Initializing DDOS"};
  left = new Left(5, 5, displayWidth / 3 - 10, displayHeight - 10);
  top = new Side(displayWidth / 3 + 5, 5, displayWidth / 3 * 2 - 10, displayHeight / 3 - 10, possibilities, 3);
  middle = new Side(displayWidth / 3 + 5, displayHeight / 3 + 5, displayWidth / 3 * 2 - 10, displayHeight / 3 - 10, possibilities, 15);
  bottom = new Side(displayWidth / 3 + 5, displayHeight / 3 * 2 + 5, displayWidth / 3 * 2 - 10, displayHeight / 3 - 10, possibilities, 23);
  boxes = new Box[] {left, top, middle, bottom};
}

void draw() {
  background(0); //<>//
  
  switch (phase) {
    case HACKING:
      //drawing the boxes for the ui
      for (Box b: boxes) b.draw();
      showMessages();
      break;
    case SEARCHING:
      n.display(1, 5, width/2);
      if (stack.size() > 0 && !searched) {
        Node fill = stack.peekFirst();
        fill.display();
        textAlign(LEFT, TOP);
        textSize(50);
        text(fileName, 0, 0);
        if ((frameCount-enterFrame)%5 == 0) {
          stack.pop();
          if (!fill.lastLayer) {
            for (Node i: fill.children) stack.push(i);
          }
          fileName = fileNames[(int) random(0, fileNames.length)];
          if (stack.size() == 0) searched = true;
        }
      }
      if (searched) {
        showMessage("FILE NOT FOUND", color(0, 255, 0), color(255, 0, 0), color(0));
      }
      break;
    default:
      println("bruh");
      exit();
  }
}
