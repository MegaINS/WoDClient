/**
 * Created by Александр on 09.05.2017.
 */
package ru.megains.wod.store {
import flash.display.Sprite;

import ru.megains.wod.item.Item;

public class Section extends Sprite{


    var store:Store;

    public function Section(storeIn:Store, items:Vector.<Item>) {
        store = storeIn;

        var x:int = 220;
        var y:int = 40;
        for(var i:String in items){
            var itemStore =  new  ItemStore(items[i],store);
            itemStore.y = y;
            itemStore.x = x;
            x+=190;
            if((x-320)/190>3){
                x= 220;
                y +=145;
            }
            addChild(itemStore);
        }
    }
}
}
