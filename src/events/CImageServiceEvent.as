package events {
import flash.display.Bitmap;
import flash.events.Event;

public class CImageServiceEvent extends Event {

    public static var IMAGE_LOADED:String = "image_loaded";

    public static function createImageLoadedEvent(bmp:Bitmap):CImageServiceEvent {
        var e:CImageServiceEvent = new CImageServiceEvent(IMAGE_LOADED);
        e.mBitmap = bmp;
        return e;
    }

    private var mBitmap:Bitmap;

    public function CImageServiceEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }

    override public function clone():Event {
        switch (type){
            case IMAGE_LOADED:
                return createImageLoadedEvent(mBitmap);
        }
        return null;
    }

    public function get bitmap():Bitmap {
        return mBitmap;
    }


}
}
