/**
 * Created by Александр on 04.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;

import ru.megains.wod.Action;
import ru.megains.wod.network.packet.Packet;

public class CPacketAction extends Packet{

    var action:Action;
    var id:int;
    var value1:int;
    var value2:int;
    public function CPacketAction(actionIn:Action,idIn:int,value1In:int = 0,value2In:int = 0) {
        packetId = 0;
        action = actionIn;
        id = idIn;
        value1 = value1In;
        value2 = value2In;
    }
    override public function writePacketData(buf:ByteArray):void {
        buf.writeByte(action.id);
        buf.writeInt(id);
        buf.writeInt(value1);
        buf.writeInt(value2);
    }
}
}
