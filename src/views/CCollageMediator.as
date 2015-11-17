package views {
import com.greensock.TweenLite;

import events.CGalleryEvent;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.geom.Rectangle;

import models.CGalleryModel;
import models.IGallery;

import org.robotlegs.mvcs.Mediator;

import views.layouts.ILayoutBuilder;

public class CCollageMediator extends Mediator {
    [Inject] public var mGallery:IGallery;
    [Inject] public var mLayoutBuilder:ILayoutBuilder;
    [Inject] public var mView:CGCollageView;
    private var mImages:Vector.<DisplayObject>;

    public function CCollageMediator() {

    }

    override public function onRegister():void {
        mImages = new <DisplayObject>[];
        addContextListener(CGalleryEvent.ADDED_TO_GALLERY, onImageAdded);
        addContextListener(CGalleryEvent.REMOVED_FROM_GALLERY, onImageRemoved);
        mView.addEventListener(Event.RESIZE, onResize);
        super.onRegister();
    }

    override public function onRemove():void {
        removeContextListener(CGalleryEvent.ADDED_TO_GALLERY, onImageAdded);
        removeContextListener(CGalleryEvent.REMOVED_FROM_GALLERY, onImageRemoved);
        mView.removeEventListener(Event.RESIZE, onResize);
        super.onRemove();
    }

    private function onImageAdded(e:CGalleryEvent):void {
        var img:CGImageView = CGImageView.create(mGallery.getImageById(e.imageId));
        mImages.push(img);
        doLayout();
        fadeIn(img);
    }

    private function onImageRemoved(e:CGalleryEvent):void{
        var d:CGImageView = null;
        for each (var img:CGImageView in mImages) {
            if (img.imageItem.id == e.imageId){
                d = img;
                break;
            }
        }
        fadeOut(d);
    }

    private function doLayout():void{
        mLayoutBuilder.arrange(mImages, new Rectangle(0, 0, mView.width, mView.height));
    }

    private function fadeOut(d:DisplayObject):void {
        TweenLite.to(d, 1, {'alpha':0, 'onComplete': onFadeOutComplete, 'onCompleteParams':[d]});
    }

    private function fadeIn(d:DisplayObject):void{
        d.alpha = 0;
        mView.addChild(d);
        TweenLite.to(d, 1, {'alpha':1});
    }

    private function onFadeOutComplete(d:DisplayObject):void {
        var index:int = mImages.indexOf(d);
        mImages.splice(index, 1);
        mView.removeChild(d);
        d = null;
        doLayout();
        dispatch(new CGalleryEvent(CGalleryEvent.REQUEST_IMAGE));
    }

    private function onResize(e:Event):void {
        TweenLite.killDelayedCallsTo(doLayout);
        TweenLite.delayedCall(0.1, doLayout);
    }

}
}
