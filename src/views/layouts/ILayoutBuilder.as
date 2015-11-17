package views.layouts {
import flash.display.DisplayObject;
import flash.geom.Rectangle;

public interface ILayoutBuilder {
    function arrange(images:Vector.<DisplayObject>, bounds:Rectangle, imageSpacing:int = 1):void;
}
}
