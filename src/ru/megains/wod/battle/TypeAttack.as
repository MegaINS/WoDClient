package ru.megains.wod.battle {
public class TypeAttack {
    public static const dodge:TypeAttack = new TypeAttack(0);
    public static const crit:TypeAttack = new TypeAttack(1);
    public static const block:TypeAttack = new TypeAttack(2);
    public static const plain:TypeAttack = new TypeAttack(3);
    public var id:int;
    public static const array:Array = [dodge,crit,block,plain];



    public function TypeAttack(idIn:int) {
        id = idIn;

    }

    public static function get(id:int):TypeAttack{
        return array[id];
    }

}
}
