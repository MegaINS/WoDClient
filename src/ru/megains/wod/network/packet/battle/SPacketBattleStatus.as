/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleStatus extends Packet{

    public var status:int;



    override public function readPacketData(buf:ByteArray): void{
        status = buf.readByte();

    }

    override public function processPacket(handler:Main): void{
        handler.battle.setStatus(status);

    }
    public function SPacketBattleStatus() {
    }
}
}
