/**
 * Created by Александр on 13.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.network.packet.Packet;

public class CPacketAttack extends Packet{


    var id:int;
    public function CPacketAttack(idIn:int){
        packetId = 1;
        id = idIn;
    }

    override public function writePacketData(buf:ByteArray):void {
        buf.writeInt(id);
    }

}
}
