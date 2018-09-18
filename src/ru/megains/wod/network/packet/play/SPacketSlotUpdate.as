package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.SlotType;
import ru.megains.wod.item.ItemAction;
import ru.megains.wod.item.ItemUser;

import ru.megains.wod.network.packet.Packet;

public class SPacketSlotUpdate extends Packet{



    public var slot:int;
    public var item:ItemUser;
    public function SPacketSlotUpdate() {
    }

    override public function readPacketData(buf:ByteArray): void{

        slot = buf.readInt();
        var isItem = buf.readBoolean();

        if(isItem){
            var id:int = buf.readInt();
            var name:String = buf.readUTF();
            var img:String = buf.readUTF();
            var amount:int = buf.readInt();
            var act:int = buf.readByte();
            var slotItem:SlotType =SlotType.getSlot(buf.readByte());
            var action:ItemAction = ItemAction.takeOff;

            item = new ItemUser(id,name,img,amount,action,slotItem);
        }
    }

    override public function processPacket(handler: Game): void{

       handler.slots.updateSlot(slot,item);

      //  handler.player.bodyItems = items;
        //handler.player.drawBodyItems();


    }
}
}
