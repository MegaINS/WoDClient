/**
 * Created by Александр on 06.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.text.TextField;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.SlotType;
import ru.megains.wod.Game;

import ru.megains.wod.Main;
import ru.megains.wod.SlotType;
import ru.megains.wod.item.ItemAction;
import ru.megains.wod.item.ItemParam;

import ru.megains.wod.item.ItemUser;

import ru.megains.wod.network.packet.Packet;

public class SPacketInventory extends Packet{

    var invType:int;
    public var items:Dictionary = new Dictionary();
    public function SPacketInventory() {
    }

    override public function readPacketData(buf:ByteArray): void{
        invType = buf.readByte();
        var sizeArr = buf.readShort();

        for(var i:int = 0;i<sizeArr; i++){
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
            var action:ItemAction = ItemAction.get(buf.readByte()) ;
            var slotItem:SlotType =SlotType.getSlot(buf.readByte());
            items[id] = new ItemUser(id,name,img,amount,action,slotItem,params);
        }
    }

    override public function processPacket(handler: Game): void{


        handler.player.backpackItems = items;
        handler.player.drawBackpackItems();
    }
}
}
