package views {
import flash.display.Sprite;
import flash.events.Event;

public class CGCollageView extends Sprite {
    public function CGCollageView() {
        super();
        if (stage)
            stage.addEventListener(Event.RESIZE, onResize);
        else
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    /* easy way in our case to handle stage resizes */
    override public function get width():Number {
        if (stage)
            return stage.stageWidth;
        return 0;
    }
    override public function get height():Number {
        if (stage)
            return stage.stageHeight;
        return 0;
    }

    private function onAddedToStage(e:Event):void{
        stage.addEventListener(Event.RESIZE, onResize);

    }
    private function onRemovedFromStage(e:Event):void{
        stage.removeEventListener(Event.RESIZE, onResize);
        removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
        removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage)
    }

    private function onResize(e:Event):void{
        dispatchEvent(e);
    }
}
}
