/**
 * Created by Александр on 06.05.2017.
 */
package ru.megains.wod.item {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import ru.megains.wod.BodySlot;

import ru.megains.wod.ResourceLoader;

public class ItemUser extends Item{



    public var amount:int;
    public var action:ItemAction;
    public var amountText:TextField;
    public var slot;
    public var active = false;

    public function ItemUser(idIn:int, nameIn:String, imgIn:String, amountIn:int, actionIn:ItemAction,slotIn:BodySlot) {
        super(idIn,nameIn,imgIn);
        amount=amountIn;
        action=actionIn;
        slot = slotIn;


        if(amount>1){
            amountText =  new TextField();
            amountText.x = 2;
            amountText.y = 38;
            amountText.text = amount.toString();
            amountText.background = true;
            amountText.backgroundColor = 0xFFFFFF;
            amountText.width = 23;
            amountText.height = 18;
            addChild(amountText)
        }

        addEventListener(MouseEvent.ROLL_OVER, overItem);
        addEventListener(MouseEvent.ROLL_OUT, outItem);
    }

    public function overItem(event:Event):void{
        active = true;
        trace("over"+event.target);
        addChild(ItemAction.info);

        addChild(action);

        switch (action){
            case ItemAction.take:
                addChild(ItemAction.del);
                break;
        }

    }
    public function outItem(event:Event):void{
        active = false;
        trace("out"+event.target);

        removeChild(ItemAction.info);
        removeChild(action);

        switch (action){
            case ItemAction.take:
                removeChild(ItemAction.del);
                break;
        }
    }
    public function setItemAction(actionIn:ItemAction):void{


        if(active){
            removeChild(action);
            switch (action){
                case ItemAction.take:
                    removeChild(ItemAction.del);
                    break;
            }

            addChild(actionIn);
            switch (actionIn){
                case ItemAction.take:
                    addChild(ItemAction.del);
                    break;
            }
        }
        action = actionIn;
    }


}
}
