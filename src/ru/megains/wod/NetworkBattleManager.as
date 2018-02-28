/**
 * Created by Александр on 11.05.2017.
 */
package ru.megains.wod {
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.Socket;
import flash.utils.ByteArray;

import ru.megains.wod.network.packet.CHandshake;

import ru.megains.wod.network.packet.ConnectionState;
import ru.megains.wod.network.packet.Packet;
import ru.megains.wod.network.packet.battle.CPacketConnectBattle;
import ru.megains.wod.network.packet.login.CPacketLoginStart;

public class NetworkBattleManager {

    private  var socket:Socket;
    public  var connectionState:ConnectionState = ConnectionState.BATTLE;
    public var main:Main;

    public function NetworkBattleManager(mainIn:Main) {
        main = mainIn;
        ConnectionState.init();
        // укажите хост для создания подключения
        var host:String = 'localhost';
        // укажите порт для создания подключения
        var port:uint = 11000;
        //
        // создаем объект-сокет
        socket = new Socket();
        // слушаем события
        socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
        socket.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        socket.addEventListener(Event.CONNECT, connectHandler);
        socket.addEventListener(Event.CLOSE, closeHandler);
        socket.addEventListener(ProgressEvent.SOCKET_DATA, dataHandler);
        // устанавливаем соединение по указанному хосту и порту
        socket.connect(host, port);

    }

    private function errorHandler(event:ErrorEvent):void
    {
        trace('Ошибка. error type='+event.type);
        switch (event.type) {
            case IOErrorEvent.IO_ERROR:

                trace('Ошибка возникает когда по указанному хосту не удается найти сокет-сервер');
                break;
            case SecurityErrorEvent.SECURITY_ERROR:

                trace('Ошибка возникает когда срабатывает политика безопасности флешки. Сокет-сервер должен вернуть полиси-файл.');
                break;
        }
    }

    public function sendPacket(packet:Packet):void{
        var buf:ByteArray = new ByteArray();
        var id = packet.packetId;
        buf.writeShort(id);
        packet.writePacketData(buf);
        socket.writeInt(buf.length);
        socket.writeBytes(buf);
        socket.flush();

        trace("Encoder "+connectionState.name+", packet "+packet.toString()+", id "+id+", size "+buf.length);


    }


    /**
     * Обработчик события об успешном подключении к серверу
     */
    private function connectHandler(event:Event):void
    {
        trace('соединение установлено');
        sendPacket(new CHandshake(ConnectionState.BATTLE));
        connectionState = ConnectionState.BATTLE;
        sendPacket(new CPacketConnectBattle(Number(main.userInfo.id.text)))

    }
    private function closeHandler(event:Event):void
    {
        trace('соединение потеряно');
    }
    /**
     * Обработчик получения данных от сервера
     */
    internal var currentPackSize:uint = 0;
    private function dataHandler(event:ProgressEvent):void {
        trace('Получены новые данные');
        while((currentPackSize == 0 && socket.bytesAvailable >= 4) ||
        (currentPackSize != 0 && socket.bytesAvailable >= currentPackSize)) {

            if (currentPackSize == 0) {
                currentPackSize = socket.readInt();
            } else {
                var buf:ByteArray = new ByteArray();
                socket.readBytes(buf,0,currentPackSize);
                var packetId:int = buf.readShort();
                var packet:Packet = connectionState.getPacket(packetId);
                trace("Decoder "+connectionState.name+", ru.megains.wod.network.packet "+packet.toString()+", id "+packetId+", size "+currentPackSize);
                packet.readPacketData(buf);
                packet.processPacket(main);

                currentPackSize = 0;
            }
        }
    }
}
}
