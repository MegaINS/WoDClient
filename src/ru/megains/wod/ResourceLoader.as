/**
 * Created by Александр on 06.05.2017.
 */
package ru.megains.wod {
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLRequest;
import flash.net.registerClassAlias;

public class ResourceLoader {


    public function ResourceLoader() {
    }


    public static function loadImg(name:String){
        var fl_Loader = new Loader();
        fl_Loader.load(new URLRequest("http://localhost/images/items/"+name));
        fl_Loader.addEventListener( IOErrorEvent.IO_ERROR,error);

        return fl_Loader;
    }
    public static function error(name:IOErrorEvent){
        trace(name.text);
    }
}
}
