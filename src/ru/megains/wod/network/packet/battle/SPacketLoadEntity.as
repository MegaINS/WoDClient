/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.network.packet.battle {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.Main;
import ru.megains.wod.battle.EntityBattle;

import ru.megains.wod.network.packet.Packet;

public class SPacketLoadEntity  extends Packet{

    public var team1:Dictionary = new Dictionary();
    public var team2:Dictionary = new Dictionary();
    public function SPacketLoadEntity() {
    }

    override public function readPacketData(buf:ByteArray): void{
        var size = buf.readShort();
        var i;
        var id:int;
        var name:String;
        var level:int;
        var hp:int;
        var hpMax:int;
        var status:int;
        for(i = 0;i<size;i++){
            id = buf.readInt();
            name =  buf.readUTF();
            level =  buf.readInt();
            hp = buf.readInt();
            hpMax = buf.readInt();
            status =  buf.readInt();
            team1[id]= new EntityBattle(id,name,level,hp,hpMax,status)
        }
        size = buf.readShort();
        for(i = 0;i<size;i++){
            id = buf.readInt();
            name =  buf.readUTF();
            level =  buf.readInt();
            hp = buf.readInt();
            hpMax = buf.readInt();
            status =  buf.readInt();
            team2[id]= new EntityBattle(id,name,level,hp,hpMax,status)
        }
    }

    override public function processPacket(handler:Game): void{
        handler.battle.setTeam(team1,team2)

    }

}
}
