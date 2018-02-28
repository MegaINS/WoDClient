/**
 * Created by Александр on 14.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleEnd extends Packet{

    public var win:Boolean;

    public function SPacketBattleEnd() {
    }

    override public function readPacketData(buf:ByteArray): void{
        win = buf.readBoolean();

    }

    override public function processPacket(handler:Main): void{
        handler.battle.end(win);

    }



}
}
