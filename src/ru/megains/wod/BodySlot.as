/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.net.registerClassAlias;

public class BodySlot {

    public static const head = new BodySlot(0,"head");
    public static const gloves = new BodySlot(1,"gloves");
    public static const leggings = new BodySlot(2,"leggings");
    public static const boots = new BodySlot(3,"boots");
    public static const hauberk  = new BodySlot(4,"hauberk");
    public static const belt = new BodySlot(5,"belt");
    public static const cuirass = new BodySlot(6,"cuirass");
    public static const shoulders = new BodySlot(7,"shoulders");
    public static const leftHand = new BodySlot(8,"leftHand");
    public static const rightHand = new BodySlot(9,"rightHand");
    public static const none = new BodySlot(10,"none");
    public static const array = [head,gloves,leggings,boots,hauberk,belt,cuirass,shoulders,leftHand,rightHand,none];

    public var id:int;
    public var name;

    public function BodySlot(idIn:int,nameIn:String) {

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
