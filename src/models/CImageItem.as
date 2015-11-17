package models {
import flash.display.Bitmap;

import org.robotlegs.mvcs.Actor;

public class CImageItem extends Actor {

    private static var id:int = 1;
    public static function create(bmp:Bitmap):CImageItem {
        var img:CImageItem = new CImageItem(new TLock());
        img.mBitmap = bmp;
        img.mId = id++;
        return img;
    }

    private var mBitmap:Bitmap;
    private var mId:int;

    public function CImageItem(l:TLock) {
        if (!l)
            throw new Error("Use factory method to create and configure an image");
    }

    public function get bitmap():Bitmap {
        return mBitmap;
    }

    public function get id():int {
        return mId;
    }

}
}

internal class TLock {}
