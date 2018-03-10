/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class ButtonExit extends Sprite{

    var main:Game;
    var target:Sprite;

    public function ButtonExit(mainIn:Game,targetIn:Sprite) {
        main =mainIn;
        target = targetIn;
        var img:Shape = new Shape();
        img.graphics.lineStyle(1, 0x234524, 1);
        img.graphics.beginFill(0x000000,1);
        img.graphics.drawRect(0, 0, 20, 20);
        img.graphics.endFill();

        addChild(img);
        addEventListener(MouseEvent.CLICK, clickHandler );
    }
    public function clickHandler(event:Event):void{
        main.removeChild(target)
    }
}
}
