/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleDamage extends Packet{

    public var hit:int;
    public var id:int;
    public var team:int;
    public function SPacketBattleDamage() {
    }

    override public function readPacketData(buf:ByteArray): void{
        hit = buf.readInt();
        id = buf.readInt();
        team= buf.readByte();
    }

    override public function processPacket(handler:Main): void{
        handler.battle.setDamage(hit,id,team);

    }


}
}
