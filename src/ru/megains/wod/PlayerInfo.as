/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

public class PlayerInfo extends Sprite {

    public var id:TextField = new TextField();
    public var nick:TextField = new TextField();
    public var level:TextField = new TextField();
    public var exp:TextField = new TextField();
    public var money:TextField = new TextField();

    public function PlayerInfo() {
        id.y = 10;
        nick.y = 20;
        level.y = 30;
        exp.y = 40;
        money.y = 50;

        var img = new Shape();
        img.graphics.lineStyle(1, 0x457510, 1);
        img.graphics.beginFill(0x457510,1);
        img.graphics.drawRect(0, 0, 300, 100);
        img.graphics.endFill();

        addChild(img);
        addChild(id);
        addChild(nick);
        addChild(level);
        addChild(exp);
        addChild(money);
    }
}
}
