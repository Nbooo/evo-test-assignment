package {

import commands.CAddToGalleryCommand;
import commands.CGalleryConfigureCommand;
import commands.CLoadImagesCommand;
import commands.CRefreshGalleryCommand;
import commands.CRemoveFromGalleryCommand;

import events.CApplicationEvent;
import events.CGalleryEvent;
import events.CImageServiceEvent;

import flash.display.DisplayObjectContainer;

import models.CGalleryModel;
import models.IGallery;

import org.robotlegs.mvcs.Context;

import services.CSimpleImageLoader;
import services.IImageLoadService;

import views.CCollageMediator;
import views.CGCollageView;
import views.CGImageView;
import views.CImageMediator;
import views.layouts.CCollageLayout;
import views.layouts.ILayoutBuilder;

public class CApplicationContext extends Context{

    public function CApplicationContext(view:DisplayObjectContainer) {
        super(view);
    }

    override public function startup():void {
        injector.mapSingletonOf(ILayoutBuilder, CCollageLayout);
        injector.mapSingletonOf(IImageLoadService, CSimpleImageLoader);
        injector.mapSingletonOf(IGallery, CGalleryModel);

        mediatorMap.mapView(CGCollageView, CCollageMediator);
        mediatorMap.mapView(CGImageView, CImageMediator);

        commandMap.mapEvent(CApplicationEvent.CONTEXT_READY, CGalleryConfigureCommand, CApplicationEvent);
        commandMap.mapEvent(CGalleryEvent.GALLERY_CONFIGURE_DONE, CLoadImagesCommand, CGalleryEvent);
        commandMap.mapEvent(CImageServiceEvent.IMAGE_LOADED, CAddToGalleryCommand, CImageServiceEvent);
        commandMap.mapEvent(CGalleryEvent.IMAGE_CLICKED, CRemoveFromGalleryCommand, CGalleryEvent);
        commandMap.mapEvent(CGalleryEvent.REQUEST_IMAGE, CRefreshGalleryCommand, CGalleryEvent);

        dispatchEvent(new CApplicationEvent(CApplicationEvent.CONTEXT_READY));
    }

}
}
