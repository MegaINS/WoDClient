/**
 * Created by Александр on 02.05.2017.
 */
package ru.megains.wod.network.packet {
import flash.utils.ByteArray;

import ru.megains.wod.network.packet.ConnectionState;

public class CHandshake extends Packet{

    public var connectionState:ConnectionState;
    public function CHandshake(connectionStateIn:ConnectionState) {
        packetId = 0;
        connectionState = connectionStateIn;
    }

    override public function writePacketData(buf:ByteArray):void {
        buf.writeByte(connectionState.id)
    }
}
}
