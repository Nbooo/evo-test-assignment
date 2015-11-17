
package {

import flash.display.Bitmap;
import flash.events.EventDispatcher;
import models.CGalleryModel;
import models.CImageItem;
import models.config.CSimpleGalleryConfig;
import org.flexunit.asserts.assertEquals;

/**
 * I'm not very good with unit testing;
 * 4 of 5 companies I worked in never used unit tests in production;
 * in one team we used tests only for models and controllers.
 * */
public class CGalleryModelTest {
    private var mGallery:CGalleryModel
    public function CGalleryModelTest() {

    }
    [Before]
    public function setUp():void{
        mGallery = new CGalleryModel()
        mGallery.eventDispatcher = new EventDispatcher();
    }

    [After]
    public function tearDown():void{
        mGallery.clean();
        mGallery = null;
    }

    [Test]
    public function testCleanMethod():void {
        mGallery.configure(CSimpleGalleryConfig.create(1));
        mGallery.add(CImageItem.create(new Bitmap()));
        mGallery.add(CImageItem.create(new Bitmap()));
        mGallery.clean();
        assertEquals(mGallery.images.length, 0);
        assertEquals(mGallery.gallery.length, 0);
    }

    [Test]
    public function testAddMethod():void {
        mGallery.add(CImageItem.create(new Bitmap()));
        var imagesLength:int = mGallery.images.length;
        assertEquals(imagesLength, 1);
    }

    [Test]
    public function testGalleryRefresh():void{
        var imgCount:int = 3;
        mGallery.configure(CSimpleGalleryConfig.create(imgCount));
        mGallery.add(CImageItem.create(new Bitmap()));
        mGallery.add(CImageItem.create(new Bitmap()));
        mGallery.add(CImageItem.create(new Bitmap()));
        assertEquals( mGallery.gallery.length, imgCount);
    }

    [Test]
    public function testGetByIdMethod():void {

        var img:CImageItem = CImageItem.create(new Bitmap());
        var existingId:int = img.id;
        mGallery.add(img);
        assertEquals(mGallery.getImageById(existingId), img);
        var notExistingId:int = -1;
        assertEquals(mGallery.getImageById(notExistingId), null)
    }
}
}
