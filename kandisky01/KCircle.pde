public class KCircle{
  private int posX;
  private int posY;
  private int radius;
  private color fill;
  private int inputPin;

  public KCircle(int posX, int posY, int radius, color fill, int inputPin){
    this.posX = posX;
    this.posY = posY;
    this.radius = radius;
    this.fill = fill;
    this.inputPin = inputPin;
  }
  
  public int getPosX(){ return this.posX; }
  public int getPosY(){ return this.posY; }
  public int getRadius(){ return this.radius; }
  public color getFill(){ return this.fill; }
  public int getInputPin(){ return this.inputPin; }

  public void setPosX(int posX){
    this.posX = posX;
  }
  public void setPosY(int posY){
    this.posY = posY;
  }
  public void setRadius(int radius){
    this.radius = radius;
  }
  public void setFill(color fill){
    this.fill = fill;
  }
  public void setInputPin(int inputPin){
    this.inputPin = inputPin;
  }


}

