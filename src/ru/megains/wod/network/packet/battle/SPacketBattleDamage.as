/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.Game;

import ru.megains.wod.Main;
import ru.megains.wod.battle.TypeAttack;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleDamage extends Packet{

    public var hit:int;
    public var id:int;
    public var typeAttack:TypeAttack;
    public var team:int;
    public function SPacketBattleDamage() {
    }

    override public function readPacketData(buf:ByteArray): void{
        id = buf.readInt();
        team= buf.readByte();
        typeAttack= TypeAttack.get( buf.readByte());
        hit = buf.readInt();

    }

    override public function processPacket(handler:Game): void{
        handler.battle.setDamage(hit,id,team,typeAttack);

    }


}
}
