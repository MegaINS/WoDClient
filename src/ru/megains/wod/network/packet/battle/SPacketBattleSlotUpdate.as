package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.SlotType;
import ru.megains.wod.network.packet.Packet;


public class SPacketBattleSlotUpdate extends Packet{



    public var slot:SlotType;
    public var value:int;
    public function SPacketBattleSlotUpdate() {
    }

    override public function readPacketData(buf:ByteArray): void{

        slot = SlotType.getSlot(buf.readInt());
        value = buf.readInt();

    }

    override public function processPacket(handler: Game): void{

        handler.slots.updateSizeSlot(slot.id-13,value);



    }
}
}
