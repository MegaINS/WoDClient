/**
 * Created by Александр on 02.05.2017.
 */
package ru.megains.wod.network.packet {
import flash.utils.Dictionary;

import ru.megains.wod.network.packet.CHandshake;

import ru.megains.wod.network.packet.Packet;
import ru.megains.wod.network.packet.SPacketDisconnect;
import ru.megains.wod.network.packet.battle.*;
import ru.megains.wod.network.packet.login.SPacketLoginSuccess;

import ru.megains.wod.network.packet.play.*;

public class ConnectionState {

    public static const HANDSHAKING:ConnectionState = new ConnectionState("HANDSHAKING", 0);
    public static const STATUS:ConnectionState = new ConnectionState("STATUS", 1);
    public static const LOGIN:ConnectionState = new ConnectionState("LOGIN", 2);
    public static const PLAY:ConnectionState = new ConnectionState("PLAY", 3);
    public static const BATTLE_SERVER:ConnectionState = new ConnectionState("BATTLE", 4);
    public static const BATTLE:ConnectionState = new ConnectionState("BATTLE", 5);
    public var name:String = "";
    public var id:int = -1;

    public var serverIdPacket:Dictionary = new Dictionary();
    public var serverId:int = 0;
    public var clientPacketId:Dictionary = new Dictionary();
    public var clientId:int = 0;

//    public function registerClientPacket(packet: Class): void  {
//        clientPacketId[packet] =  clientId;
//        clientId++;
//    }
    public function registerServerPacket(packet: Class): void  {
        serverIdPacket[serverId] = packet;
        serverId++;
}

    function ConnectionState(nameIn:String,idIn:int) {
        name =nameIn;
        id = idIn
    }
//    public function getPacketId(packet:Class):int{
//       return clientPacketId[packet];
//    }
    public static function init():void{

        HANDSHAKING.registerServerPacket(SPacketDisconnect);
        STATUS.registerServerPacket(SPacketDisconnect);
        LOGIN.registerServerPacket(SPacketDisconnect);
        PLAY.registerServerPacket(SPacketDisconnect);



       // HANDSHAKING.registerClientPacket(CHandshake);

        LOGIN.registerServerPacket(SPacketLoginSuccess);

        PLAY.registerServerPacket(SPacketPlayerInfo);
        PLAY.registerServerPacket(SPacketLocInfo);
        PLAY.registerServerPacket(SPacketInventory);
        PLAY.registerServerPacket(SPacketBody);
        PLAY.registerServerPacket(SPacketActionReturn);
        PLAY.registerServerPacket(SPacketStore);
        PLAY.registerServerPacket(SPacketInvUpdate);
        PLAY.registerServerPacket(SPacketStartBattle);
        PLAY.registerServerPacket(SPacketPlayerLocation);

      // PLAY.registerClientPacket(CPacketAction);

      //  BATTLE.registerClientPacket(CPacketConnectBattle);
      //  BATTLE.registerClientPacket(CPacketAttack);


        BATTLE.registerServerPacket(SPacketBattleInfo);
        BATTLE.registerServerPacket(SPacketLoadEntity);
        BATTLE.registerServerPacket(SPacketBattleStatus);
        BATTLE.registerServerPacket(SPacketBattleDamage);
        BATTLE.registerServerPacket(SPacketBattleTarget);
        BATTLE.registerServerPacket(SPacketBattleEnd);


    }

    public function getPacket(packetId:int):Packet {
       return new serverIdPacket[packetId]();
    }
}
}
