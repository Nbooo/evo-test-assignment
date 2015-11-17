package views {
import flash.display.Sprite;

import models.CImageItem;

public class CGImageView extends Sprite {

    private var mImageItem:CImageItem;

    public static function create(imageItem:CImageItem):CGImageView {
        var v:CGImageView = new CGImageView();
        v.mImageItem = imageItem;
        v.addChild(imageItem.bitmap);
        return v;
    }

    public function CGImageView() {
        super();
    }

    public function get imageItem():CImageItem{
        return mImageItem;
    }
}
}
