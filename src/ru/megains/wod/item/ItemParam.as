package ru.megains.wod.item {

public class ItemParam{


    public static const hp:ItemParam = new ItemParam(0,"hp");
    public static const pov:ItemParam = new ItemParam(1,"pov");
    public static const mindam:ItemParam = new ItemParam(2,"mindam");
    public static const maxdam:ItemParam = new ItemParam(3,"maxdam");
    public static const inty:ItemParam = new ItemParam(4,"inty");
    public static const pro:ItemParam = new ItemParam(6,"pro");
    public static const agi:ItemParam = new ItemParam(7,"agi");
    public static const vamp:ItemParam = new ItemParam(8,"vamp");
    public static const krit:ItemParam = new ItemParam(9,"krit");
    public static const slotsize:ItemParam = new ItemParam(10,"slotsize");
    public static const timeact:ItemParam = new ItemParam(11,"timeact");
    public var id:int;
    public var name:String;
    public static const array:Array = [hp,pov,mindam,maxdam,inty,pro,agi,vamp,krit,slotsize,timeact];



    public function ItemParam(idIn:int,nameIn:String) {
        id = idIn;
        name = nameIn;
    }

    public static function get(id:int):ItemParam{
        return array[id];
    }
}
}
