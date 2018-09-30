package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.utils.Dictionary;

import ru.megains.wod.item.Item;
import ru.megains.wod.item.ItemAction;
import ru.megains.wod.item.ItemUser;

public class Slots extends Sprite {

    public var items:Array = new Array(10);

    public function Slots(game:Game) {
        var img = new Shape();
        img.graphics.lineStyle(1, 0xa3c6c0, 1);
        img.graphics.beginFill(0xa3c6c0, 1);
        img.graphics.drawRect(0, 0, 100, 400);
        img.graphics.endFill();
        addChild(img);
    }

    public function drawSlots(openSlots:int, dictionary:Dictionary):void {
        var img = new Shape();
        for (var i:int = 0; i < openSlots; i++) {
            items[i] = dictionary[i];
            img.graphics.lineStyle(1, 0xd3d5d9, 1);
            img.graphics.beginFill(0xd3d5d9, 1);
            img.graphics.drawRect(20, 15 + i * 62, 60, 60);
            img.graphics.endFill();

        }
        addChild(img);
        for (var i:int = 0; i < openSlots; i++) {
            if (items[i] != null) {
                items[i].x = 20;
                items[i].y = 15 + i * 62;
                addChild(items[i]);
            }
        }

    }

    public function updateSlot(slot:int, item:ItemUser):void {
        if (item == null) {
            removeChild(items[slot]);
            items[slot] = null;
        } else {
            item.x = 20;
            item.y = 15 + slot * 62;
            addChild(item);
            items[slot] = item;
        }
    }

    public function updateSizeSlot(slot:int, value:int):void {
        if (value == 0) {
            removeChild(items[slot]);
            items[slot] = null;
        } else {

            var item:ItemUser = items[slot];
            item.amount = value;
            item.amountText.text =String( item.amount);
        }
    }
    public function startBattle():void {
        for (var i:int = 0; i < 10; i++) {
            if (items[i] != null) {
                items[i].action = ItemAction.usE
            }
        }
    }
    public function endBattle():void {
        for (var i:int = 0; i < 10; i++) {
            if (items[i] != null) {
                items[i].action = ItemAction.takeOff
            }
        }
    }
}
}
