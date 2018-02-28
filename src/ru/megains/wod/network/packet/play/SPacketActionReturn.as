/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;

import ru.megains.wod.Action;
import ru.megains.wod.BodySlot;

import ru.megains.wod.Main;
import ru.megains.wod.Status;
import ru.megains.wod.item.ItemAction;

import ru.megains.wod.network.packet.Packet;

public class SPacketActionReturn extends Packet{
    public function SPacketActionReturn() {
    }
    var status:Status;
    var action:Action;
    var value:int;


    override public function readPacketData(buf:ByteArray): void{
        status = Status.get( buf.readByte());
        action = Action.get(buf.readByte()) ;
        value = buf.readInt();




    }

    override public function processPacket(handler: Main): void{
        if(status = Status.success){
            switch (action){

                case Action.TAKEOFF:
                    var slot = BodySlot.getSlot(value);
                    var item = handler.player.bodyItems[slot];

                    item.setItemAction(ItemAction.take);
                    delete handler.player.bodyItems[slot];
                    handler.player.backpackItems[item.id] = item;
                    handler.player.drawBodyItems();
                    handler.player.drawBackpackItems();
                    break;
                case Action.TAKE:
                    var item = handler.player.backpackItems[value];
                    var slot = item.slot;
                    item.setItemAction(ItemAction.takeOff);
                    delete handler.player.backpackItems[item.id];
                    handler.player.bodyItems[slot] = item;
                    handler.player.drawBodyItems();
                    handler.player.drawBackpackItems();
                    break;
                case Action.DELETE:
                    handler.player.removeChil(value) ;
                    handler.player.drawBackpackItems();
                    break;
            }
        }

    }
}
}
