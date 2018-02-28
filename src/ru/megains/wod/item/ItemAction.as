/**
 * Created by Александр on 06.05.2017.
 */
package ru.megains.wod.item {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

import ru.megains.wod.Action;

import ru.megains.wod.network.NetworkManager;
import ru.megains.wod.network.packet.play.CPacketAction;

public class ItemAction extends Sprite{


    public static const usE:ItemAction = new ItemAction(0);
    public static const take:ItemAction = new ItemAction(1);
    public static const none:ItemAction = new ItemAction(2);
    public static const info:ItemAction = new ItemAction(3);
    public static const del:ItemAction = new ItemAction(4);
    public static const takeOff:ItemAction = new ItemAction(5);
    public static const array:Array = [usE,take,none,info,del,takeOff];

    public var  img = new Shape();
    public var id:int;
    public function ItemAction(idIn:int) {
        id = idIn;
        var color = 0x000000;
        var x = 0;
        var y = 0;
        switch (id){
            case 0:

                break;
            case 1:
                color =0x0000FF;
                break;
            case 2:
                break;
            case 3:
                x = 40;
                color = 0x259912;
                break;
            case 4:
                x = 40;
                y = 40;
                color =0xFF0000;
                break;
            case 5:
                color =0xFF00FF;
                break;
        }



        img.graphics.lineStyle(1, color, 1);
        img.graphics.beginFill(color,1);
        img.graphics.drawRect(x, y, 20, 20);
        img.graphics.endFill();
        addEventListener(MouseEvent.CLICK, click);
        addChild(img);


    }
    public function click(event:Event):void{
        trace("click "+event.target.id + " "+event.target.parent.itemName);
        switch (id){
            case 1:
                trace("click take "+event.target.id + " "+event.target.parent.slot);
                NetworkManager.sendPacket(new CPacketAction(Action.TAKE,event.target.parent.id));
                break;

            case 5:
                trace("click takeOff "+event.target.id + " "+event.target.parent.slot);
                NetworkManager.sendPacket(new CPacketAction(Action.TAKEOFF,event.target.parent.slot.id));
                break;
            case 4:
                trace("click delete "+event.target.id + " "+event.target.parent.slot);
                NetworkManager.sendPacket(new CPacketAction(Action.DELETE,event.target.parent.id));
                break;
        }

    }

    public static function get(id:int):ItemAction{
       return array[id];
    }

}
}
