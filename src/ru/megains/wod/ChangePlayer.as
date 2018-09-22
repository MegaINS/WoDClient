package ru.megains.wod {
import flash.display.Sprite;

public class ChangePlayer extends Screen{

    var main:Main;
    public function ChangePlayer(mainIn:Main) {
        main = mainIn;
        var button = new ButtonLogin(mainIn,"Test_1","test@mail.ru","1111");
        button.x = 100;
        button.y = 100;
        addChild(button);

        button = new ButtonLogin(mainIn,"Test_2","aaaa@mail.ru","1111");
        button.x = 200;
        button.y = 100;
        addChild(button);

        button = new ButtonLogin(mainIn,"Test_3","qwer@mail.ru","1111");
        button.x = 100;
        button.y = 200;
        addChild(button);

        button = new ButtonLogin(mainIn,"Test_4","bbbb@mail.ru","1111");
        button.x = 200;
        button.y = 200;
        addChild(button);
    }
}
}
