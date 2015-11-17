package models {
import models.config.IGalleryConfig;

public interface IGallery {
    function add(img:CImageItem):void;
    function configure(config:IGalleryConfig):void;
    function remove(id:int):void;
    function clean():void;
    function refreshGallery():void;
    function getImageById(id:int):CImageItem;
    function get images():Vector.<CImageItem>;
    function get gallery():Vector.<CImageItem>;

}
}
