/**
 * Created by Александр on 04.05.2017.
 */
package ru.megains.wod {
public class Action {

    public static const MOVELOC:Action = new Action(0);
    public static const TAKEOFF:Action = new Action(1);
    public static const TAKE:Action = new Action(2);
    public static const DELETE:Action = new Action(3);
    public static const STORE:Action = new Action(4);
    public static const STOREBUY:Action = new Action(5);
    public static const ATTACK:Action = new Action(6);
    public static const EXITINLOC:Action = new Action(7);
    public static const LOADOLAYERLOC:Action = new Action(8);
    public static const USE:Action = new Action(9);


    public static const array:Array = [MOVELOC,TAKEOFF,TAKE,DELETE,STORE,STOREBUY,ATTACK,EXITINLOC,LOADOLAYERLOC,USE];
    public var id:int;
    public function Action(idIn:int) {
        id = idIn;

    }
    public static function get(id:int):Action{
        return array[id];
    }
}
}
