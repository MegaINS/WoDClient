/**
 * Created by Александр on 13.05.2017.
 */
package ru.megains.wod.battle {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;

import ru.megains.wod.Main;
import ru.megains.wod.battle.Battle;
import ru.megains.wod.network.packet.battle.CPacketAttack;

public class Attack extends Sprite{

    var battle:Battle;
    var attack1 = new TextField();
    var attack2 = new TextField();
    var attack3 = new TextField();
    public function Attack(battleIn:Battle) {
        battle = battleIn;




        attack1.text = "attack1";
        attack1.y = 30;
        attack1.background = true;
        attack1.backgroundColor = 0x6F9F71 ;
        attack1.border = true;
        attack1.height = 25;
        attack1.width = 100;
        addChild(attack1);

        attack2.text = "attack2";
        attack2.y = 60;
        attack2.background = true;
        attack2.backgroundColor = 0x6F9F71 ;
        attack2.border = true;
        attack2.height = 25;
        attack2.width = 100;
        addChild(attack2);

        attack3.text = "attack3";
        attack3.y = 90;
        attack3.background = true;
        attack3.backgroundColor = 0x6F9F71 ;
        attack3.border = true;
        attack3.height = 25;
        attack3.width = 100;
        addChild(attack3);
        attack1.addEventListener(MouseEvent.CLICK, clickHandler );
        attack2.addEventListener(MouseEvent.CLICK, clickHandler );
        attack3.addEventListener(MouseEvent.CLICK, clickHandler );
    }

    private function clickHandler(event:MouseEvent):void {

        battle.network.sendPacket(new CPacketAttack(1))

    }

}
}
