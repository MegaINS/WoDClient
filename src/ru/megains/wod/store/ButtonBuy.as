/**
 * Created by Александр on 09.05.2017.
 */
package ru.megains.wod.store {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import ru.megains.wod.Main;
import ru.megains.wod.network.NetworkManager;

public class ButtonBuy extends Sprite{


    public function ButtonBuy():void {
        var img = new Shape();
        img.graphics.lineStyle(1, 0x942565, 1);
        img.graphics.beginFill(0x948565,1);
        img.graphics.drawRect(0, 0, 30, 20);
        img.graphics.endFill();

        addChild(img);
         var text = new TextField();
        text.text ="Buy";
        text.x =5;
        addChild(text);


    }

}
}
