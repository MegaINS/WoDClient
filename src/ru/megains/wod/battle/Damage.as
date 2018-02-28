/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.battle {
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;

public class Damage extends Sprite{


    var i = 60;
    var battle:Battle;
    var damage = new TextField();

    public function Damage(battleIn:Battle,dam:int) {
        battle = battleIn;
        damage.text = Number(dam);
        addChild(damage);
        addEventListener(Event.ENTER_FRAME, enterFrameHandler);
    }




    private function enterFrameHandler(event:Event):void {
        i--;
        y--;
        if(i == 0){
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
            battle.removeChild(this);
        }

    }
}
}
