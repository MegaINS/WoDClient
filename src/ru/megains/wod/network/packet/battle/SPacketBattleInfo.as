/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;

import ru.megains.wod.Game;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketBattleInfo extends Packet{

    public var id:int;
    public var team:int;

    public function SPacketBattleInfo() {
    }
    override public function readPacketData(buf:ByteArray): void{
        id = buf.readInt();
        team = buf.readInt();
    }

    override public function processPacket(handler:Game): void{
        handler.battle.playerId = id ;
        handler.battle.team = team;
        handler.battle.teamTarget = team == 0 ? 1 : 0
    }

}
}
