/**
 * Created by Александр on 04.05.2017.
 */
package ru.megains.wod.network.packet.play {
import flash.display.Sprite;
import flash.text.TextField;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import ru.megains.wod.Game;

import ru.megains.wod.Main;

import ru.megains.wod.Location;

import ru.megains.wod.network.packet.Packet;

public class SPacketLocInfo extends Packet{

    public var nameLoc:String;
    public var transits:Dictionary = new Dictionary();
    public var store:Dictionary = new Dictionary();
    public var mobs:Dictionary = new Dictionary();
    public function SPacketLocInfo() {
    }

    override public function readPacketData(buf:ByteArray): void{
        nameLoc = buf.readUTF();
        var size:int = buf.readByte();
        var i:int;
        var id:int;
        for(i = 0;i<size; i++){
            id = buf.readShort();
            transits[id] = buf.readUTF();
        }
        size = buf.readByte();
        for(i = 0;i<size; i++){
            id = buf.readShort();
            store[id] = buf.readUTF();
        }
        size = buf.readByte();
        for(i = 0;i<size; i++){
            id = buf.readInt();
            mobs[id] = buf.readUTF()+"["+buf.readShort()+"]";
        }
    }

    override public function processPacket(handler:Game): void{

        handler.setLoc( new Location(nameLoc,transits,store,mobs));
    }
}
}
