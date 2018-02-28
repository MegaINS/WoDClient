/**
 * Created by Александр on 06.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.text.TextField;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.BodySlot;

import ru.megains.wod.Main;
import ru.megains.wod.item.ItemAction;

import ru.megains.wod.item.ItemUser;

import ru.megains.wod.network.packet.Packet;

public class SPacketInventory extends Packet{

    var invType:int;
    public var items:Dictionary = new Dictionary();
    var size:int;
    public function SPacketInventory() {
    }

    override public function readPacketData(buf:ByteArray): void{
        invType = buf.readByte();
        size = buf.readShort();

        for(var i:int = 0;i<size; i++){
            var id:int = buf.readInt();

            var name:String = buf.readUTF();
            var img:String = buf.readUTF();
            var amount:int = buf.readInt();
            var action:ItemAction = ItemAction.get(buf.readByte()) ;
            var slotItem:BodySlot =BodySlot.getSlot(buf.readByte());
            items[id] = new ItemUser(id,name,img,amount,action,slotItem);
        }
    }

    override public function processPacket(handler: Main): void{


        handler.player.backpackItems = items;
        handler.player.drawBackpackItems();
    }
}
}
