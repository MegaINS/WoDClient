/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class ButtonPlayer extends Sprite{


    var main:Main;

    public function ButtonPlayer(mainIn:Main):void {
        main = mainIn;
        var img = new Shape();
        img.graphics.lineStyle(1, 0x942565, 1);
        img.graphics.beginFill(0x942565,1);
        img.graphics.drawRect(0, 0, 50, 50);
        img.graphics.endFill();

        addChild(img);
        addEventListener(MouseEvent.CLICK, clickHandler );

    }
    public function clickHandler(event:Event):void{
        main.addChild(main.player)
    }
}
}
