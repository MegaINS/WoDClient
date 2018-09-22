/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class ButtonPlayer extends Sprite{


    var main:Game;

    public function ButtonPlayer(mainIn:Game):void {
        main = mainIn;
        var img = new Shape();
        img.graphics.lineStyle(1, 0xC57726, 1);
        img.graphics.beginFill(0xC57726,1);
        img.graphics.drawRect(0, 0, 50, 50);
        img.graphics.endFill();
        var text = new TextField();
        text.text = "Рюкзак";
        text.y = 15;
        text.x = 4;

        addChild(img);
        addChild(text);
        addEventListener(MouseEvent.CLICK, clickHandler );

    }
    public function clickHandler(event:Event):void{
        main.addChild(main.player)
    }
}
}
