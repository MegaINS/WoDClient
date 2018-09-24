/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.net.registerClassAlias;

public class SlotType {

    public static var idNext = 0;
    public static const none = new SlotType("none");

    public static const head = new SlotType("head");
    public static const gloves = new SlotType("gloves");
    public static const leggings = new SlotType("leggings");
    public static const boots = new SlotType("boots");
    public static const hauberk  = new SlotType("hauberk");
    public static const belt = new SlotType("belt");
    public static const cuirass = new SlotType("cuirass");
    public static const shoulders = new SlotType("shoulders");
    public static const leftHand = new SlotType("leftHand");
    public static const rightHand = new SlotType("rightHand");
    public static const twoHanded = new SlotType("twoHanded");

    public static const elixir = new SlotType("elixir");


    public static const elixir1 = new SlotType("slot_1");
    public static const elixir2 = new SlotType("slot_2");
    public static const elixir3 = new SlotType("slot_3");
    public static const elixir4 = new SlotType("slot_4");
    public static const elixir5 = new SlotType("slot_5");
    public static const elixir6 = new SlotType("slot_6");
    public static const elixir7 = new SlotType("slot_7");
    public static const elixir8 = new SlotType("slot_8");
    public static const elixir9 = new SlotType("slot_9");
    public static const elixir10 = new SlotType("slot_10");
    public static const food = new SlotType("food");

    public static const array = [none,head,gloves,leggings,boots,hauberk,belt,cuirass,shoulders,leftHand,rightHand,twoHanded,elixir,elixir1,elixir2,elixir3,elixir4,elixir5,elixir6,elixir7,elixir8,elixir9,elixir10,food];

    public var id:int;
    public var name;

    public function SlotType(nameIn:String) {
        id = idNext;
        name=nameIn;
        idNext++;
    }

    public static function getSlot(id:int) {
       return array[id];
    }

    public function getX():int{

        switch (id){
            case 1 :
            case 3 :
            case 4:
            case 7 :
                return 20;
            case 2 :
            case 5 :
            case 6 :
            case 8 :
                return 220;
            case 10 :
                return 88;
            case 9 :
                return 152;
            case 11 :
                return 120;
        }
        return 0;
    }
    public function getY():int{
        switch (id){
            case 1 :
            case 8 :
                return 20;
            case 7 :
            case 2 :
                return 85;
            case 3 :
            case 6 :
                return 150;
            case 4 :
            case 5 :
                return 215;
            case 9 :
            case 10 :
            case 11 :
                return 280;
        }
        return 0;
    }
}
}
