/**
 * Created by Александр on 02.05.2017.
 */
package ru.megains.wod.network.packet.login {
import ru.megains.wod.network.packet.*;

import flash.utils.ByteArray;

public class CPacketLoginStart extends Packet{

    private var email:String ="";
    private var pass:String ="";

    public function CPacketLoginStart(emailIn:String,passIn:String) {
        packetId = 0;
        email = emailIn;
        pass = passIn;
    }

    override public function writePacketData(buf:ByteArray):void {
        buf.writeUTF(email);
        buf.writeUTF(pass);
    }
}
}
