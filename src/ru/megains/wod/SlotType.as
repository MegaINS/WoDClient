/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.net.registerClassAlias;

public class SlotType {

    public static const head = new SlotType(0,"head");
    public static const gloves = new SlotType(1,"gloves");
    public static const leggings = new SlotType(2,"leggings");
    public static const boots = new SlotType(3,"boots");
    public static const hauberk  = new SlotType(4,"hauberk");
    public static const belt = new SlotType(5,"belt");
    public static const cuirass = new SlotType(6,"cuirass");
    public static const shoulders = new SlotType(7,"shoulders");
    public static const leftHand = new SlotType(8,"leftHand");
    public static const rightHand = new SlotType(9,"rightHand");
    public static const elixir = new SlotType(10,"elixir");
    public static const none = new SlotType(11,"none");
    public static const array = [head,gloves,leggings,boots,hauberk,belt,cuirass,shoulders,leftHand,rightHand,elixir,none];

    public var id:int;
    public var name;

    public function SlotType(idIn:int,nameIn:String) {

        id = idIn;
        name=nameIn;
    }

    public static function getSlot(id:int) {
       return array[id];
    }

    public function getX():int{

        switch (id){
            case 0 :
            case 2 :
            case 3 :
            case 6 :
                return 20;
            case 1 :
            case 4 :
            case 5 :
            case 7 :
                return 220;
        }
        return 0;
    }
    public function getY():int{
        switch (id){
            case 0 :
            case 7 :
                return 20;
            case 6 :
            case 1 :
                return 85;
            case 2 :
            case 5 :
                return 150;
            case 3 :
            case 4 :
                return 215;
        }
        return 0;
    }
}
}
