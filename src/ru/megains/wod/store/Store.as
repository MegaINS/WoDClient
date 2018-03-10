/**
 * Created by Александр on 08.05.2017.
 */
package ru.megains.wod.store {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.utils.Dictionary;

import ru.megains.wod.Action;

import ru.megains.wod.ButtonExit;
import ru.megains.wod.Game;

import ru.megains.wod.Main;
import ru.megains.wod.item.Item;
import ru.megains.wod.network.NetworkManager;
import ru.megains.wod.network.packet.play.CPacketAction;

public class Store extends Sprite {



    var id:int;
    var nameStore:String;
    var sections:Dictionary = new Dictionary();
    var currentSection;

    public function Store(main:Game, idStore:int, nameStoreIn:String, itemsDic:Dictionary) {
        id = idStore;
        nameStore = nameStoreIn;
        var img2 = new Shape();
        img2.graphics.lineStyle(1, 0xf5deb3, 1);
        img2.graphics.beginFill(0x350e24,1);
        img2.graphics.drawRect(0, 0, 200, 500);
        img2.graphics.endFill();

        addChild(img2);
        var img2 = new Shape();
        img2.graphics.lineStyle(1, 0xf5deb3, 1);
        img2.graphics.beginFill(0xf5deb3,1);
        img2.graphics.drawRect(200, 0, 800, 500);
        img2.graphics.endFill();

        addChild(img2);

        var i = 0;
        for(var name in itemsDic){

            var but = new TextField();
            but.text = name;
            but.x = 20;
            but.y = 40 + i * 40;
            but.textColor = true;
            but.background = true;
            but.backgroundColor = 0xf5deb3 ;
            but.border = true;
            but.height = 38;
            but.width = 160;
            but.addEventListener(MouseEvent.CLICK, click);
            addChild(but);





            var section = new Section(this, itemsDic[name]);
            sections[name] = section;
            if(i == 0){
                currentSection = name;
                addChild(section);
            }

            i++;
        }
        var exit = new ButtonExit(main,this);
        exit.x = 980;
        addChild(exit);
    }
    public function click(event:Event):void{

        trace("clickLoc "+event.target.text);

        var section = event.target.text;
        removeChild( sections[currentSection]);
        addChild(sections[section]);
        currentSection = section;
    }

    public function buyItem(item:Item,value:int){
        NetworkManager.sendPacket(new CPacketAction(Action.STOREBUY,id,item.id,value))
    }

}
}
