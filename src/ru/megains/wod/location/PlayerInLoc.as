package ru.megains.wod.location {
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

public class PlayerInLoc extends Sprite{

    public var id:int;
    public var nick:String;
    public var lvl:int;
    public function PlayerInLoc(idIn:int,nameIn:String,lvlIn:int) {

        id = idIn;
        nick = nameIn;
        lvl = lvlIn;

        var but = new TextField();
        but.text = nick +" " + lvl;
        but.background = true;
        but.backgroundColor = 0x8F6F79 ;
        but.border = true;
        but.height = 18;
       // but.addEventListener(MouseEvent.CLICK, clickLoc);
        addChild(but);

    }
}
}
