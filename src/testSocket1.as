/**
 * Created by Александр on 02.05.2017.
 */
package
{
import flash.display.Sprite;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.Socket;
import flash.text.TextField;
import flash.utils.ByteArray;

public class testSocket1 extends Sprite
{
    private var socket:Socket;

    public function testSocket1()
    {


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

    /**
     * Обработчик событий об ошибках
     */
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

    /**
     * Обработчик события об успешном подключении к серверу
     */
    private function connectHandler(event:Event):void
    {
        trace('соединение установлено');
        var array:ByteArray = new ByteArray();
        array.writeInt(0);
        array.writeInt(2);

        socket.writeInt(array.length);
        socket.writeBytes(array);

        socket.flush();
        array.clear();
        array.writeInt(0);
        array.writeUTF("MegaINS");
        socket.writeInt(array.length);
        socket.writeBytes(array);
        trace(array.length);
        socket.flush();

    }
    private function closeHandler(event:Event):void
    {
        trace('соединение потеряно');
    }
    /**
     * Обработчик получения данных от сервера
     */
    private function dataHandler(event:ProgressEvent):void {
        trace('Получены новые данные');
    }

//    public function writeVarIntToBuffer( value:int):void {
//        while ((value & -128) != 0) {
//            writeByte(value & 127 | 128);
//            value >>>= 7;
//        }
//        writeByte(value);
//    }
}
}
