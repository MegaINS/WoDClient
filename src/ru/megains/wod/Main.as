package ru.megains.wod {

import flash.display.Sprite;
 import flash.text.ime.CompositionAttributeRange
import flash.text.TextFieldAutoSize;
import flash.utils.Dictionary;
import flash.utils.getDefinitionByName;

import ru.megains.wod.battle.Battle;

import ru.megains.wod.store.Store;



import ru.megains.wod.network.NetworkManager;
import ru.megains.wod.network.packet.login.SPacketLoginSuccess;

[SWF(width="1200", height="800", frameRate="31", backgroundColor="#FFFFFF")]
public class Main extends Sprite {


    public var networkManager:NetworkManager;
    public var userInfo:PlayerInfo;
    public var player:Player;
    public var buttonPlayer;
    public var store:Store;
    public var battle:Battle;


    public var location:Sprite;
    public function Main() {
        networkManager = new NetworkManager(this);
        userInfo = new PlayerInfo();
        player = new Player(this);
        buttonPlayer = new ButtonPlayer(this);
        player.x =150;
        player.y = 150;
        buttonPlayer.x = 400;

        addChild(buttonPlayer);
        addChild(userInfo)
    }

    public function setLoc(locationIn:Location):void {

        locationIn.x = 400;
        locationIn.y = 200;

        addChild(locationIn);
        if(location!=null){
            removeChild(location);
        }
        location = locationIn;
    }

    public function openStore(storeIn:Store):void {
        store = storeIn;
        store.x = 100;
        store.y = 100;
        addChild(store)
    }

    public function startBattle(id:int):void {
        battle = new Battle(id,this);
        battle.x = 100;
        battle.y = 100;
        addChild(battle);
    }
}
}
