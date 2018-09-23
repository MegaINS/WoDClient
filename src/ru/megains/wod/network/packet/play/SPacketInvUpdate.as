/**
 * Created by Александр on 10.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.SlotType;
import ru.megains.wod.Game;
import ru.megains.wod.Main;
import ru.megains.wod.SlotType;

import ru.megains.wod.item.ItemAction;
import ru.megains.wod.item.ItemUser;

import ru.megains.wod.network.packet.Packet;

public class SPacketInvUpdate extends Packet{

    var invType:int;
    var test:int;
    public var items:Dictionary = new Dictionary();
    var size:int;
    public function SPacketInvUpdate() {
    }

    override public function readPacketData(buf:ByteArray): void{

        test = buf.readByte();
        invType = buf.readByte();
        size = buf.readShort();

        for(var i:int = 0;i<size; i++){
            var id:int = buf.readInt();

            var name:String = buf.readUTF();
            var img:String = buf.readUTF();
            var amount:int = buf.readInt();
            var action:ItemAction = ItemAction.get(buf.readByte()) ;
            var slotItem:SlotType =SlotType.getSlot(buf.readByte());
            items[id] = new ItemUser(id,name,img,amount,action,slotItem);
        }
    }

    override public function processPacket(handler: Game): void{


        switch (invType){
            case 0:
                switch (test){
                    case 0:
                        for(var id in   items){
                            handler.player.backpackItems[id] =  items[id]
                        }
                        break;
                    case  1:
                        for(var id in items){
                            var itemB = handler.player.backpackItems[id] ;
                            var item = items[id];
                            itemB.amount = item.amount;
                            itemB.amountText.text = item.amount;
                        }
                        break
                    case  3:
                        for(var it in items){
                            handler.player.removeChil(it) ;
                            handler.player.drawBackpackItems();
                        }
                        break
                }

                handler.player.drawBackpackItems();
                break;
            case 1:


                break;
        }






    }

}
}
