/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;

import ru.megains.wod.item.ItemAction;

public class Status {



    public static const success:Status = new Status(0);
    public static const failed:Status = new Status(1);
    public static const array:Array = [success,failed];


    public var id:int;

    public function Status(idIn:int) {
        id = idIn;
    }
    public static function get(id:int):Status{
        return array[id];
    }
}

}
