package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Action;
import ru.megains.wod.Game;
import ru.megains.wod.Main;
import ru.megains.wod.location.PlayerInLoc;

import ru.megains.wod.network.packet.Packet;

public class SPacketPlayerLocation extends Packet  {

    public var action:Action;
    public var players:Dictionary = new Dictionary();

    public function SPacketPlayerLocation() {
    }

    override public function readPacketData(buf:ByteArray): void{
        action = Action.get(buf.readInt());
        var length:int = buf.readInt();
        switch (action){
            case Action.MOVELOC:
            case Action.LOADOLAYERLOC:
                for(var i:int = 0; i< length;i++){
                    var id:int = buf.readInt();
                    var name:String = buf.readUTF();
                    var lvl:int = buf.readInt();
                    players[id] = new PlayerInLoc(id,name,lvl);
                }
                break;
            case Action.EXITINLOC:
                for(var i:int = 0; i< length;i++){
                    var id:int = buf.readInt();
                    players[id] = new PlayerInLoc(id,"",0);
                }
                break;

        }



    }

    override public function processPacket(handler: Game): void{

        switch(action){
            case Action.MOVELOC:
                handler.playerList.addPlayer(players);
                break;
            case Action.EXITINLOC:
                handler.playerList.removePlayer(players);
                break;
            case Action.LOADOLAYERLOC:
                handler.playerList.loadPlayer(players);
                break;

        }




        trace("============");
        trace("action = "+ action.id);
        trace("-------");
        for (var obj:* in players) {
            var player:PlayerInLoc = players[obj];
            trace("id = "+obj);
            trace("-------");
            trace("name = "+ player.nick);
            trace("lvl = "+ player.lvl);

        }
    }
}
}
