/**
 * Created by Александр on 08.05.2017.
 */
package ru.megains.wod.item {
import flash.display.Sprite;
import flash.utils.Dictionary;

import ru.megains.wod.ResourceLoader;

public class Item extends Sprite{

    public var id:int;
    public var itemName:String;
    public var imgName:String;
    public var img;
    public var params:Dictionary = new Dictionary();



    public function Item(idIn:int, nameIn:String, imgIn:String,paramsIn:Dictionary) {
        id=idIn;
        itemName=nameIn;
        imgName=imgIn;
        params = paramsIn;
        img = ResourceLoader.loadImg(imgName);
        addChild(img);
    }
}
}
