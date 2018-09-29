/**
 * Created by Александр on 11.05.2017.
 */
package ru.megains.wod.battle {
import flash.text.TextField;
import flash.utils.Dictionary;

import ru.megains.wod.*;

import flash.display.Shape;
import flash.display.Sprite;

public class Battle extends Sprite {


    var battleId:int;
    var main:Game;
    public var network:NetworkBattleManager;
    public var playerId:int;
    public var team:int;
    public var teamTarget:int;
    public var lastStatus:int =-1;
    var teams:Array;
    var player:EntityBattle;
    var target:EntityBattle;
    var playerName = new TextField();
    var playerHp = new TextField();
    var targetName = new TextField();
    var targetHp = new TextField();
    var attack:Attack;

    var targetTurn = new TextField();
    var noTarget = new TextField();
    var dead = new TextField();
    var win = new TextField();
    public function Battle(idIn:int, mainIn:Game) {

        battleId = idIn;
        main = mainIn;
        var img2 = new Shape();
        img2.graphics.lineStyle(1, 0xf5deb3, 1);
        img2.graphics.beginFill(0xf5deb3, 1);
        img2.graphics.drawRect(0, 0, 1000, 500);
        img2.graphics.endFill();
        var img3 = new Shape();
        img3.graphics.lineStyle(1, 0xf5deb3, 1);
        img3.graphics.beginFill(0x12deb3, 1);
        img3.graphics.drawRect(200, 0, 600, 500);
        img3.graphics.endFill();
        addChild(img2);
        addChild(img3);
        network = new NetworkBattleManager(mainIn);
        addChild(new ButtonExit(mainIn, this));



        draw()
    }

    public function setTeam(team1In:Dictionary, team2In:Dictionary):void {
        teams = new Array(2);
        teams[0] = team1In;
        teams[1] = team2In;
        player = teams[team][playerId];
        playerName.text = player.nameEnt +"["+player.level+"]";
        playerHp.text = player.hp+"/"+ player.hpMax;
        drawTeams()
    }

    public function draw():void {

        playerName.x = 300;
        playerName.y = 40;
        playerName.background = true;
        playerName.backgroundColor = 0x6F9F71 ;
        playerName.border = true;
        playerName.height = 25;
        playerName.width = 100;
        addChild(playerName);



        playerHp.x = 300;
        playerHp.y = 70;
        playerHp.background = true;
        playerHp.backgroundColor = 0x6F9F71 ;
        playerHp.border = true;
        playerHp.height = 25;
        playerHp.width = 100;
        addChild(playerHp);




        targetName.x = 600;
        targetName.y = 40;
        targetName.background = true;
        targetName.backgroundColor = 0x6F9F71 ;
        targetName.border = true;
        targetName.height = 25;
        targetName.width = 100;

        addChild(targetName);

        targetHp.x = 600;
        targetHp.y = 70;
        targetHp.background = true;
        targetHp.backgroundColor = 0x6F9F71 ;
        targetHp.border = true;
        targetHp.height = 25;
        targetHp.width = 100;
        addChild(targetHp);


        attack = new Attack(this);
        attack.x = 300;
        attack.y = 200;

        targetTurn.text = "Ход противника";
        targetTurn.x = 500;
        targetTurn.y = 250;
        targetTurn.background = true;
        targetTurn.backgroundColor = 0x6F9F71 ;
        targetTurn.border = true;
        targetTurn.height = 25;
        targetTurn.width = 100;

        noTarget.text = "Ожидание противника";
        noTarget.x = 500;
        noTarget.y = 250;
        noTarget.background = true;
        noTarget.backgroundColor = 0x6F9F71 ;
        noTarget.border = true;
        noTarget.height = 25;
        noTarget.width = 100;


        dead.text = "Вы погибли";
        dead.x = 500;
        dead.y = 250;
        dead.background = true;
        dead.backgroundColor = 0x6F9F71 ;
        dead.border = true;
        dead.height = 25;
        dead.width = 100;



        win.x = 500;
        win.y = 250;
        win.background = true;
        win.backgroundColor = 0x6F9F71 ;
        win.border = true;
        win.height = 25;
        win.width = 100;


    }


    public function drawTeams(){

        var x = 50;
        var y = 20;
        for(var id:* in  teams[team] ){
            var entity = teams[team][id];
            entity.x = x;
            entity.y = y;
            addChild(entity);
            y+=60;
            if(y>1200){
                break;
            }
        }
        x = 850;
        y = 20;
        for(var id:* in  teams[teamTarget] ){
            var entity = teams[teamTarget][id];
            entity.x = x;
            entity.y = y;
            addChild(entity);
            y+=60;
            if(y>1200){
                break;
            }
        }

    }


    public function setStatus(status:int):void {
        switch (lastStatus){
            case 0:
                removeChild(attack);
                break;
            case 1:
                removeChild(targetTurn);
                break;
            case 2:
                removeChild(noTarget);
                break;
            case 3:
                removeChild(dead);
                break;
        }
        lastStatus = status;
        switch (lastStatus){
            case 0:
                addChild(attack);
                break;
            case 1:
                addChild(targetTurn);
                break;
            case 2:
                addChild(noTarget);
                setTarget(-1);
                break;
            case 3:
                addChild(dead);
                setTarget(-1);
                break;
        }
    }

    public function setDamage(hit:int, id:int,teamIn:int,typeAttack:TypeAttack):void {

        if(teams==null) return;


        teams[teamIn][id].updateHp(hit);

        if(player.id == id ){
            var damage =new Damage(this,hit,typeAttack);
            damage.y = 180;
            damage.x = 350;
            playerHp.text = player.hp+"/"+ player.hpMax;
            addChild(damage);
        }else if(target!=null && target.id == id){
            var damage =new Damage(this,hit,typeAttack);
            damage.y = 180;
            damage.x = 550;
            targetHp.text = target.hp+"/"+ target.hpMax;
            addChild(damage);
        }

    }

    public function setTarget(id:int){
        if(id!= -1){
            target = teams[teamTarget][id];
            targetHp.text = target.hp+"/"+ target.hpMax;
            targetName.text = target.nameEnt +"["+target.level+"]";

        }else{
            target = null;
            targetHp.text = "";
            targetName.text = "";
        }

    }

    public function end(winIn:Boolean):void {
        if(winIn){
            win.text = "Победа";
        }else{
            win.text = "Поражение";
        }
          addChild(win)
    }
}
}
