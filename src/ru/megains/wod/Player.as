/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.utils.Dictionary;

import ru.megains.wod.item.ItemUser;

public class Player extends Sprite{

    public var backpackItems:Dictionary;
    public var bodyItems:Dictionary;

    public function Player(main:Main) {
        var img = new Shape();
        img.graphics.lineStyle(1, 0xa3c6c0, 1);
        img.graphics.beginFill(0xa3c6c0,1);
        img.graphics.drawRect(0, 0, 300, 500);
        img.graphics.endFill();

        addChild(img);
        var img2 = new Shape();
        img2.graphics.lineStyle(1, 0xf5deb3, 1);
        img2.graphics.beginFill(0xf5deb3,1);
        img2.graphics.drawRect(300, 0, 500, 500);
        img2.graphics.endFill();

        addChild(img2);


        var exit = new ButtonExit(main,this);
        exit.x = 780;
        addChild(exit);

    }

    public function drawBackpackItems():void{
        var x:int = 320;
        var y:int = 50;
        for(var id:* in backpackItems){
            var item = backpackItems[id];
            item.y = y;
            item.x = x;
            x+=62;
            if((x-320)/62>6){
                x= 320;
                y +=62;
            }
            addChild(item);
        }
    }
    public function drawBodyItems():void{

        for(var slot:* in bodyItems){
            var item = bodyItems[slot];



            item.y = slot.getY();
            item.x = slot.getX();

            addChild(item);

        }
    }

    public function removeChil(id:int){

        removeChild(backpackItems[id]);
        delete backpackItems[id];
    }
}
}
