package models.config {
public class CSimpleGalleryConfig implements IGalleryConfig {


    public static function create(number:int):IGalleryConfig{
        var c:CSimpleGalleryConfig = new CSimpleGalleryConfig();
        c.mImageCount = number;
        return c
    }

    private var mImageCount:int = 1;
    public function CSimpleGalleryConfig() {
    }

    public function get imageCount():int {
        return mImageCount;
    }
}
}
