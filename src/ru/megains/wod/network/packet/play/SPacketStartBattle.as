/**
 * Created by Александр on 11.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketStartBattle extends Packet{

    public var id:int;

    public function SPacketStartBattle() {
    }

    override public function readPacketData(buf:ByteArray): void{
        id = buf.readInt();

    }

    override public function processPacket(handler: Main): void{
        handler.startBattle(id)

    }
}
}
