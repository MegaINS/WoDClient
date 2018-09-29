package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.SlotType;
import ru.megains.wod.item.ItemAction;
import ru.megains.wod.item.ItemParam;
import ru.megains.wod.item.ItemUser;

import ru.megains.wod.network.packet.Packet;

public class SPacketSlots extends Packet{

    public var items:Dictionary = new Dictionary();
    public var openSlots:int ;
    public function SPacketSlots() {
    }


    override public function readPacketData(buf:ByteArray): void{

        openSlots = buf.readInt();
        var size = buf.readInt();
        for(var i:int = 0;i<size; i++){
            var slot = buf.readInt();

            var id:int = buf.readInt();
            var name:String = buf.readUTF();
            var img:String = buf.readUTF();
            var size:int =  buf.readInt();
            var params:Dictionary = new Dictionary();
            for(var k = 0;k<size; k++){


                var param:ItemParam = ItemParam.get(buf.readInt());
                var value:int =  buf.readInt();
                params[param] = value
            }
            var amount:int = buf.readInt();
            var act:int = buf.readByte();
            var slotItem:SlotType =SlotType.getSlot(buf.readByte());
            var action:ItemAction = ItemAction.takeOff;

            items[slot-1] = new ItemUser(id,name,img,amount,action,SlotType.getSlot(slot+12),params);
        }
    }

    override public function processPacket(handler: Game): void{
        trace('SPacketSlots');
        handler.slots.drawSlots(openSlots, items)

       // handler.player.bodyItems = items;
      //  handler.player.drawBodyItems();


    }
}
}
