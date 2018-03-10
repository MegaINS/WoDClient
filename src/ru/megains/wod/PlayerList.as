package ru.megains.wod {
import flash.display.Sprite;
import flash.utils.Dictionary;

import ru.megains.wod.location.PlayerInLoc;

public class PlayerList extends Sprite{

    var game:Game;
    var players:Dictionary;
    var i = 0;

    public function PlayerList(gameIn:Game) {
        game = gameIn;
    }

    public function addPlayer(playersIn:Dictionary):void {

        for (var id:* in playersIn) {
            if( players[id]== null){
                var player:PlayerInLoc = playersIn[id];
                players[id] = player;
                player.x = 50;
                player.y =  i * 20;
                addChild(player);
                i++;
            }
        }
    }

    public function removePlayer(playersIn:Dictionary):void {

        for (var id:* in playersIn) {
            if( players[id]!= null){
                removeChild(players[id]);
                players[id] = null;
            }
        }
    }

    public function loadPlayer(playersIn:Dictionary):void {

        for (var id:* in players) {
            removeChild(players[id]);

        }

        players = playersIn;
        i= 0;
        for (var id:* in players) {
            var player:PlayerInLoc = players[id];
            player.x = 50;
            player.y =  i * 20;
            addChild(player);
            i++;
        }

    }
}
}
