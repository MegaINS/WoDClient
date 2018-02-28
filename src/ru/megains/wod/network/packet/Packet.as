/**
 * Created by Александр on 02.05.2017.
 */
package ru.megains.wod.network.packet {
import flash.display.Sprite;
import flash.utils.ByteArray;

import ru.megains.wod.Main;

public class Packet extends Sprite {

    public var packetId = -1;

    public function readPacketData(buf:ByteArray): void{

    }

    public function writePacketData(buf: ByteArray): void{

    }



    public function processPacket(handler: Main): void{

    }
}
}
