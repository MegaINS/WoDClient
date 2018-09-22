package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class ButtonLogin extends Sprite {

    var main:Main;
    var mail:String ;
    var pass:String;


    public function ButtonLogin(mainIn:Main,name:String,mailIn:String,passIn:String):void {
        main = mainIn;
        mail = mailIn;
        pass = passIn;
        var img:Shape = new Shape();
        img.graphics.lineStyle(1, 0xC57726, 1);
        img.graphics.beginFill(0xC57726,1);
        img.graphics.drawRect(0, 0, 50, 50);
        img.graphics.endFill();
        var text:TextField = new TextField();
        text.text = name;
        text.y = 15;
        text.x = 4;

        addChild(img);
        addChild(text);
        addEventListener(MouseEvent.CLICK, clickHandler );

    }
    public function clickHandler(event:Event):void{
        Main.mail = mail;
        Main.pass = pass;
        main.setScreen(new Game());
    }
}
}
