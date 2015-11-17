package models.resources {
public interface IImgURLResource {
    function get next():String;
    function get first():String;
    function get all():Vector.<String>;
    function get count():int;
}
}
