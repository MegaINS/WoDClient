/**
 * Created by Александр on 09.05.2017.
 */
package ru.megains.wod.store {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldType;

import ru.megains.wod.item.Item;

public class ItemStore extends Sprite{

    var value:TextField = new TextField();
    public var item:Item;
    public var store:Store;
    public function ItemStore(itemIn:Item,storeIn:Store) {
        item = itemIn;
        store= storeIn;
        var img2 = new Shape();


        img2.graphics.lineStyle(1, 0xf5deb3, 1);
        img2.graphics.beginFill(0xA0f0A0,1);
        img2.graphics.drawRect(0, 0, 185, 140);
        img2.graphics.endFill();

        addChild(img2);
        item.x =10;
        item.y =10;
        addChild(item);

        var itemName:TextField = new TextField();
        itemName.text = item.itemName;
        itemName.x = 75;
        addChild(itemName);

        var yy = 20;
        for(var par in item.params ){
            var itemParam:TextField = new TextField();
            itemParam.text = par.name +"   "+ item.params[par];
            itemParam.x = 75;
            itemParam.y = yy;
            addChild(itemParam);
            yy+=15

        }



        value.text ="1";
        value.type = TextFieldType.INPUT;
        value.restrict = "0-9";
        value.maxChars=3;
        value.border = true;
        value.width = 60;
        value.height = 20;
        value.x = 20;
        value.y = 115;
        addChild(value);
       var buy = new ButtonBuy();

        buy.x = 100;
        buy.y = 115;
        addChild(buy);
        buy.addEventListener(MouseEvent.CLICK, clickHandler );


    }
    public function clickHandler(event:Event):void{

        var value1 = Number(value.text);

       store.buyItem(item,value1)
    }
}
}
