/**
 * Created by Александр on 02.05.2017.
 */
package ru.megains.wod.network {
import ru.megains.wod.Game;
import ru.megains.wod.Main;
import ru.megains.wod.network.packet.*;

import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.Socket;
import flash.utils.ByteArray;

import ru.megains.wod.network.packet.ConnectionState;
import ru.megains.wod.network.packet.login.CPacketLoginStart;

public class NetworkManager {

    private static var socket:Socket;
    public static var connectionState:ConnectionState = ConnectionState.HANDSHAKING;
    public var main:Game;

    public function NetworkManager(mainIn:Game) {
        main = mainIn;
        ConnectionState.init();
        // укажите хост для создания подключения
        var host:String = 'localhost';
        // укажите порт для создания подключения
        var port:uint = 8080;
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

    public static function sendPacket(packet:Packet):void{
        var buf:ByteArray = new ByteArray();
        buf.writeShort(packet.packetId);
        packet.writePacketData(buf);
        socket.writeInt(buf.length);
        socket.writeBytes(buf);
        socket.flush();


    }


    /**
     * Обработчик события об успешном подключении к серверу
     */
    private function connectHandler(event:Event):void
    {
        trace('соединение установлено');
        sendPacket(new CHandshake(ConnectionState.LOGIN));
        connectionState = ConnectionState.LOGIN;
        sendPacket(new CPacketLoginStart(Main.mail,Main.pass))

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
