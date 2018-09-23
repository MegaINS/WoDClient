/**
 * Created by Александр on 07.05.2017.
 */
package ru.megains.wod {
import flash.display.Shape;
import flash.display.Sprite;
import flash.net.drm.DRMPlaybackTimeWindow;
import flash.text.TextField;

public class PlayerInfo extends Sprite {


    public var id:int;
    public var nick:TextField = new TextField();
    public var level:TextField = new TextField();
    public var exp:TextField = new TextField();
    public var money:TextField = new TextField();

    public var hpText:TextField = new TextField();



    public function PlayerInfo() {
        nick.y = 25;
        level.y = 40;
        exp.y = 55;
        money.y = 70;


        updateHp(0,0);
        hpText.y = 20;
        hpText.x = 150;

        var img = new Shape();
        img.graphics.lineStyle(1, 0x457510, 1);
        img.graphics.beginFill(0x457510,1);
        img.graphics.drawRect(0, 0, 300, 100);
        img.graphics.endFill();

        addChild(img);
        addChild(hpText);
        addChild(nick);
        addChild(level);
        addChild(exp);
        addChild(money);

    }
    public function updateHp(hp:int,hpMax:int):void{
        hpText.text = "HP "+hp+"/"+hpMax;
    }


    public function updateNick(nickIn:String):void{
        nick.text = "Name :"+nickIn;
    }

    public function updateLevel(levelIn:int):void{
        level.text = "Level :"+levelIn;
    }

    public function updateExp(expIn:int):void{
        exp.text = "Exp :"+expIn;
    }

    public function updateMoney(moneyIn:int):void{
        money.text = "Money :"+moneyIn;
    }
}
}
