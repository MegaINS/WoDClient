package ru.megains.wod {
import flash.display.Sprite;

[SWF(width="1200", height="800", frameRate="31", backgroundColor="#FFFFFF")]
public class Main extends Sprite{

    var lastScreen:Screen;
    public static var mail:String;
    public static var pass:String;

    public function Main() {
        setScreen(new ChangePlayer(this));

    }

    public function setScreen(screen:Screen):void{
        if(lastScreen!= null)
            removeChild(lastScreen);
        lastScreen = screen;
        addChild(lastScreen);
        lastScreen.init()

    }
}
}
