
package events {
import flash.events.Event;

import models.CImageItem;

public class CGalleryEvent extends Event {
    public static const IMAGE_CLICKED:String = "image_clicked";
    public static const ADDED_TO_GALLERY:String = "added_to_gallery";
    public static const GALLERY_CONFIGURE_DONE:String = "gallery_configure_done";
    public static const REMOVED_FROM_GALLERY:String = "removed_from_gallery";
    public static const REQUEST_IMAGE:String = "request_image";

    private var mId:int;
    public function CGalleryEvent(type:String, imageId:int = -1, bubbles:Boolean = false, cancelable:Boolean= false) {
        super(type, bubbles, cancelable);
        mId = imageId;
    }

    public function get imageId():int{
        return mId;
    }

    override public function clone():Event {
        return new CGalleryEvent(type, mId, bubbles, cancelable);
    }
}
}
