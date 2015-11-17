package models {
import events.CGalleryEvent;

import flash.utils.Dictionary;

import models.config.IGalleryConfig;

import models.config.IGalleryConfig;

import org.robotlegs.mvcs.Actor;

public class CGalleryModel extends Actor implements IGallery{

    private var mImagesById:Dictionary;
    private var mImages:Vector.<CImageItem>;
    private var mGallery:Vector.<CImageItem>;
    private var mConfig:IGalleryConfig;

    public function CGalleryModel() {
        super();
        mImages = new <CImageItem>[];
        mGallery = new <CImageItem>[];
        mImagesById = new Dictionary();
    }

    public function add(img:CImageItem):void {
        mImages.push(img);
        mImagesById[img.id] = img;
        refreshGallery();
    }

    public function clean():void {
        mImages.length = 0;
        mGallery.length = 0;
        mImagesById = new Dictionary();
    }

    public function configure(config:IGalleryConfig):void {
        mConfig = config;
        dispatch(new CGalleryEvent(CGalleryEvent.GALLERY_CONFIGURE_DONE));
    }

    public function remove(imageId:int):void {
        var index:int = indexOf(imageId, mImages);
        if (index == -1)
            return;
        var img:CImageItem = mImages[index];
        mImages.splice(index, 1);
        index = indexOf(img.id, mGallery);
        if (index == -1)
            return;
        mGallery.splice(index, 1);
        if (mImagesById.hasOwnProperty(String(imageId)))
            delete mImagesById[imageId];
        dispatch(new CGalleryEvent(CGalleryEvent.REMOVED_FROM_GALLERY, imageId))
    }

    public function getImageById(id:int):CImageItem {
        if (mImagesById.hasOwnProperty(String(id)))
            return mImagesById[id];
        return null;
    }

    public function refreshGallery():void {
        if (!mConfig)
            return;
        if (mGallery.length >= mConfig.imageCount)
            return;
        var notInGallery:Vector.<CImageItem> = mImages.filter(filterNotGalleryImages);
        for each (var img:CImageItem in notInGallery){
            mGallery.push(img);
            dispatch(new CGalleryEvent(CGalleryEvent.ADDED_TO_GALLERY, img.id));
            if (mGallery.length >= mConfig.imageCount)
                break;
        }
    }

    public function get gallery():Vector.<CImageItem>{ return mGallery; }
    public function get images():Vector.<CImageItem>{ return mImages; }

    private function filterNotGalleryImages(item:CImageItem, index:int, vec:Vector.<CImageItem>):Boolean {
        return (mGallery.indexOf(item) == -1);
    }

    private function indexOf(id:int, vec:Vector.<CImageItem>):int {
        for (var i:int = 0; i < vec.length; i++)
            if (vec[i].id == id)
                return i;
        return -1;
    }
}
}
