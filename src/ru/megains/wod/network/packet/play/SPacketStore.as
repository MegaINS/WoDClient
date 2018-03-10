/**
 * Created by Александр on 08.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.Main;
import ru.megains.wod.store.Store;
import ru.megains.wod.item.Item;
import ru.megains.wod.network.packet.Packet;

public class SPacketStore extends Packet{

    public var nameStore:String;
    public var idStore:int;
    public var sections:Dictionary = new Dictionary();

    public function SPacketStore() {
    }

    override public function readPacketData(buf:ByteArray): void{
        nameStore = buf.readUTF();
        idStore =   buf.readByte();
        var sizeStore:int = buf.readByte();
        var i:int;
        for(i = 0;i<sizeStore; i++){
            var nameSection:String = buf.readUTF();
            var items:Vector.<Item> = new Vector.<Item>();
            sections[nameSection] = items;
            var sizeSection:int = buf.readByte();
            for(var j = 0;j<sizeSection; j++){


                var id:int =  buf.readInt();
                var name:String =  buf.readUTF();
                var img:String =  buf.readUTF();

                var item:Item = new Item(id,name,img);

                items.push(item);
            }

        }



    }

    override public function processPacket(handler: Game): void{

        handler.openStore( new Store(handler,idStore,nameStore,sections));
    }
}
}
