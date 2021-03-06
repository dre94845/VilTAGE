part of viltage;

class State {
  List<CharNode> charNodes = new List<CharNode>();
  
  render(int x, int y, List<List<CharNode>> charArray) {
    for(int i = 0; i < charNodes.length; i++) {
      if(y+charNodes[i].y < charArray.length && y+charNodes[i].y >= 0 &&
         x+charNodes[i].x < charArray[0].length  && x+charNodes[i].x >= 0) {
        charArray[y+charNodes[i].y][x+charNodes[i].x] = charNodes[i];
      }
    }
  }
  
  CharNode createCharNode(int x, int y, String text) {
    CharNode cn;
    String charText = text;
    cn = new CharNode(x, y, charText);
    charNodes.add(cn);
    return cn;
  }
  
  List<CharNode> createCharNodeLine(int x, int y, bool horizontal, String text) {
    List<CharNode> charNodes = new List<CharNode>();
    for(int i = 0; i < text.length; i++) {
      CharNode cn;
      if(horizontal) cn = new CharNode(x + i, y, text[i]);
      else cn = new CharNode(x, y + i, text[i]);
      charNodes.add(cn);
      this.charNodes.add(cn);
    }
    return charNodes;
  }
  
  List<List<CharNode>> createCharNodeRect(int x, int y, List<String> text) {
    List<List<CharNode>> charNodes = new List<List<CharNode>>();
    for(int i = 0; i < text.length; i++) {
      charNodes.add(new List<CharNode>());
      for(int j = 0; j < text[i].length; j++) {
        CharNode cn = new CharNode(x + j, y + i, text[i][j]);
        charNodes[i].add(cn);
        this.charNodes.add(cn);
      }
    }
    return charNodes;
  }
}