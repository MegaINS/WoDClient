/**
 * Created by Александр on 03.05.2017.
 */
package ru.megains.wod.network.packet.login {
import ru.megains.wod.Game;
import ru.megains.wod.network.packet.*;

import flash.utils.ByteArray;

import ru.megains.wod.Main;

import ru.megains.wod.network.packet.ConnectionState;
import ru.megains.wod.network.NetworkManager;

public class SPacketLoginSuccess extends Packet {
    public function SPacketLoginSuccess() {
    }

    override public function processPacket(handler: Game): void{
        NetworkManager.connectionState = ConnectionState.PLAY
    }
}
}
