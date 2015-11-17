package services {
import events.CImageServiceEvent;

import models.resources.IImgURLResource;

import org.robotlegs.mvcs.Actor;

public class CSimpleImageLoader extends Actor implements IImageLoadService{

    private var mLoaders:Vector.<CImageLoader>;

    public function CSimpleImageLoader() {
        mLoaders = new <CImageLoader>[];
    }

    public function loadImagesFrom(resource:IImgURLResource):void {
        var url:String = resource.first;
        while (url){
            var l:CImageLoader = new CImageLoader(url);
            l.complete.addOnce(onLoadComplete);
            l.error.addOnce(onLoadError)
            mLoaders.push(l)
            url = resource.next;
        }

        mLoaders.forEach(function(l, i:int, v:Vector.<CImageLoader>):void {
            l.load();
        });
    }

    private function onLoadComplete(l:CImageLoader):void {
        dispatch(CImageServiceEvent.createImageLoadedEvent(l.bitmap));
        var index:int = mLoaders.indexOf(l);
        mLoaders.splice(index, 1);
        l.destroy();
    }

    private function onLoadError(l:CImageLoader):void {
        // Ignore error
        var index:int = mLoaders.indexOf(l);
        mLoaders.splice(index, 1);
        l.destroy();
    }

}
}

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;

import org.osflash.signals.Signal;

internal class CImageLoader {
    private var mLoader:Loader;
    private var mRequest:URLRequest;
    private var mSignalComplete:Signal;
    private var mSignalError:Signal;

    public function CImageLoader(url:String){
        mLoader = new Loader();
        mRequest = new URLRequest(url)
        mSignalComplete = new Signal();
        mSignalError = new Signal();
    }

    public function get complete():Signal {
        return mSignalComplete;
    }

    public function get error():Signal {
        return mSignalError;
    }

    public function get url():String {
        return mRequest.url;
    }

    public function load():void {
        mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
        mLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
        mLoader.addEventListener(IOErrorEvent.IO_ERROR, onError);
        mLoader.load(mRequest);
    }

    public function destroy():void{
        if (mLoader.contentLoaderInfo.bytesLoaded != 0)
            mLoader.unload();
        mLoader = null;
        mRequest = null;
        mSignalComplete.removeAll();
        mSignalError.removeAll();
    }

    public function get bitmap():Bitmap{
        return mLoader.content as Bitmap;
    }

    private function onLoadComplete(e:Event):void {
        mSignalComplete.dispatch(this);
    }

    private function onError(e:Event):void {
        mSignalError.dispatch(this);
    }
}