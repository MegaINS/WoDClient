package ru.megains.wod {
import flash.display.Sprite;

public class ChangePlayer extends Screen{

    var main:Main;
    public function ChangePlayer(mainIn:Main) {
        main = mainIn;
        var button = new ButtonLogin(mainIn,"test@mail.ru","1111");
        button.x = 100;
        button.y = 100;
        addChild(button);

        button = new ButtonLogin(mainIn,"aaaa@mail.ru","1111");
        button.x = 200;
        button.y = 100;
        addChild(button);

        button = new ButtonLogin(mainIn,"qwer@mail.ru","1111");
        button.x = 100;
        button.y = 200;
        addChild(button);

        button = new ButtonLogin(mainIn,"bbbb@mail.ru","1111");
        button.x = 200;
        button.y = 200;
        addChild(button);
    }
}
}
