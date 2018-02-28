/**
 * Created by Александр on 03.05.2017.
 */
package ru.megains.wod.network.packet {
import flash.text.TextField;
import flash.utils.ByteArray;

import ru.megains.wod.Main;

public class SPacketDisconnect extends Packet {

    public var msg:String;
    public function SPacketDisconnect() {
    }

    override public function readPacketData(buf:ByteArray): void{

        msg = buf.readUTF();

    }

    override public function processPacket(handler: Main): void{
       var text:TextField = new TextField();
        text.text =msg;
        text.x =100;
        text.y =100;
        handler.addChild(text);
    }
}
}
