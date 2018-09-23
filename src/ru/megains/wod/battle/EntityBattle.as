/**
 * Created by Александр on 12.05.2017.
 */
package ru.megains.wod.battle {
import flash.display.Sprite;
import flash.text.TextField;

public class EntityBattle extends Sprite{

    var id:int;
    var nameEnt:String;
    var level:int;
    var hp:int;
    var hpMax:int;
    var status:int;
    var entityName = new TextField();
    var entityHp = new TextField();



    public function EntityBattle(idIn:int,nameIn:String,levelIn:int,hpIn:int,hpMaxIn:int,statusIn:int) {
        id = idIn;
        nameEnt = nameIn;
        level = levelIn;
        hp = hpIn;
        hpMax = hpMaxIn;
        status = statusIn;

        entityName.text = nameEnt +"["+level+"]";

        entityName.background = true;
        entityName.backgroundColor = 0x6F9F71 ;
        entityName.border = true;
        entityName.height = 25;
        entityName.width = 100;
        addChild(entityName);

        entityHp.text = hp+"/"+ hpMax;
        entityHp.y = 30;
        entityHp.background = true;
        entityHp.backgroundColor = 0x6F9F71 ;
        entityHp.border = true;
        entityHp.height = 25;
        entityHp.width = 100;
        addChild(entityHp);




    }

    public function updateHp(hit:int):void {
        hp += hit;
        entityHp.text = hp+"/"+ hpMax;
    }
}
}
