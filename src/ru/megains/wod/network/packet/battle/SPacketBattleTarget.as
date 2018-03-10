/**
 * Created by Александр on 13.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.text.TextField;
import flash.utils.ByteArray;

import ru.megains.wod.Game;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleTarget extends Packet{

    public var id:int;

    public function SPacketBattleTarget() {
    }

    override public function readPacketData(buf:ByteArray): void{
        id = buf.readInt();

    }

    override public function processPacket(handler:Game): void{
        handler.battle.setTarget(id);
    }


}
}
