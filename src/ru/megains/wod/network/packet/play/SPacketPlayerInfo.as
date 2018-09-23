/**
 * Created by Александр on 03.05.2017.
 */
package ru.megains.wod.network.packet.play {

import flash.utils.ByteArray;

import ru.megains.wod.Game;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.Packet;

public class SPacketPlayerInfo extends Packet{

    public var id:int;
    public var nick:String;
    public var level:int;
    public var exp:int;
    public var money:int;
    public var hp:int;
    public var hpMax:int;

    public function SPacketPlayerInfo() {
    }

    override public function readPacketData(buf:ByteArray): void{
        id = buf.readInt();
        nick = buf.readUTF();
        level = buf.readInt();
        exp = buf.readInt();
        money = buf.readInt();
        hp = buf.readInt();
        hpMax = buf.readInt();
    }

    override public function processPacket(handler: Game): void{
        handler.userInfo.id = id;
        handler.userInfo.updateNick(nick);
        handler.userInfo.updateLevel(level);
        handler.userInfo.updateExp(exp);
        handler.userInfo.updateMoney(money);
        handler.userInfo.updateHp(hp,hpMax);
    }

}
}
