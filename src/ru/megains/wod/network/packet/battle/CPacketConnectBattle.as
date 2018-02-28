/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.network.packet.Packet;

public class CPacketConnectBattle extends Packet{

    var id:int;
    public function CPacketConnectBattle(idIn:int) {
        packetId = 0;
        id = idIn;
    }
    override public function writePacketData(buf:ByteArray):void {
        buf.writeInt(id);
    }
}
}
