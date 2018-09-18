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

    public var id1:TextField = new TextField();
    public var nick1:TextField = new TextField();
    public var level1:TextField = new TextField();
    public var exp1:TextField = new TextField();
    public var money1:TextField = new TextField();

    public function PlayerInfo() {
        id1.y = 10;
        nick1.y = 25;
        level1.y = 40;
        exp1.y = 55;
        money1.y = 70;
        id1.text = "Id :";
        nick1.text = "Name :";
        level1.text = "Level :";
        exp1.text = "Exp :";
        money1.text = "Money :";

        id.y = 10;
        nick.y = 25;
        level.y = 40;
        exp.y = 55;
        money.y = 70;

        id.x = 30;
        nick.x = 40;
        level.x = 40;
        exp.x = 40;
        money.x = 50;

        var img = new Shape();
        img.graphics.lineStyle(1, 0x457510, 1);
        img.graphics.beginFill(0x457510,1);
        img.graphics.drawRect(0, 0, 300, 100);
        img.graphics.endFill();

        addChild(img);
        addChild(id1);
        addChild(nick1);
        addChild(level1);
        addChild(exp1);
        addChild(money1);
        addChild(id);
        addChild(nick);
        addChild(level);
        addChild(exp);
        addChild(money);
    }
}
}
