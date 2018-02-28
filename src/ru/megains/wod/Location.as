/**
 * Created by Александр on 04.05.2017.
 */
package ru.megains.wod {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.Dictionary;

import ru.megains.wod.network.*;
import ru.megains.wod.network.packet.play.CPacketAction;

public class Location extends Sprite{

    var locName:TextField = new TextField();
    var button:Dictionary = new  Dictionary();

    public function Location(name:String, transits:Dictionary, store:Dictionary, mobs:Dictionary) {
        locName.text = name;
        locName.x = 100;
        locName.height = 20;
        locName.background = true;
        locName.backgroundColor = 0x1F7F3F ;
        locName.border = true;
        addChild(locName);
        var i = 0;
        var but:TextField;
        for (var id:* in transits) {
            but = new TextField();
            but.text = transits[id];
            but.x = 100;
            but.y = 40 + i * 20;
            but.background = true;
            but.backgroundColor = 0x8F6F79 ;
            but.border = true;
            but.height = 18;
            but.addEventListener(MouseEvent.CLICK, clickLoc);
            button[but] = id;
            addChild(but);
            i++;
        }
        i++;
        for (var id:* in store) {
            but = new TextField();
            but.text = store[id];
            but.x = 100;
            but.y = 40 + i * 20;
            but.background = true;
            but.backgroundColor = 0x6F9F71 ;
            but.border = true;
            but.height = 18;
            but.addEventListener(MouseEvent.CLICK, clickStore );
            button[but] = id;
            addChild(but);
            i++;
        }
        i++;
        for (var id:* in mobs) {
            but = new TextField();
            but.text = mobs[id];
            but.x = 100;
            but.y = 40 + i * 20;
            but.background = true;
            but.backgroundColor = 0x869574 ;
            but.border = true;
            but.height = 18;
            but.addEventListener(MouseEvent.CLICK, clickAttack );
            button[but] = id;
            addChild(but);
            i++;
        }
    }

    public function clickLoc(event:Event):void{
        var id = button[event.target];
        trace("clickLoc "+event.target.text+" id = "+id );
        NetworkManager.sendPacket(new CPacketAction(Action.MOVELOC,id));
    }
    public function clickStore(event:Event):void{
        var id = button[event.target];
        trace("clickStore "+event.target.text+" id = "+id );
        NetworkManager.sendPacket(new CPacketAction(Action.STORE,id));
    }

    public function clickAttack(event:Event):void{
        var id = button[event.target];
        trace("clickAttack "+event.target.text+" id = "+id );
        NetworkManager.sendPacket(new CPacketAction(Action.ATTACK,id,1));
    }
}
}
