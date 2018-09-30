package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.SlotType;

import ru.megains.wod.network.packet.Packet;


public class CPacketSlotUse extends Packet{


    var id:SlotType;
    public function CPacketSlotUse(idIn:SlotType){
        packetId = 2;
        id = idIn;
    }

    override public function writePacketData(buf:ByteArray):void {
        buf.writeInt(id.id);
    }

}
}
