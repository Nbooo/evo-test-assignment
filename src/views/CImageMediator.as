
package views {
import events.CGalleryEvent;

import flash.events.Event;
import flash.events.MouseEvent;

import org.robotlegs.mvcs.Mediator;

public class CImageMediator extends Mediator {
    [Inject] public var mView:CGImageView;
    public function CImageMediator() {
        super();
    }

    override public function onRegister():void{
        mView.useHandCursor = mView.buttonMode = true;
        mView.addEventListener(MouseEvent.CLICK, onViewClick);
        super.onRegister();
    }

    override public function onRemove():void{
        mView.removeEventListener(MouseEvent.CLICK, onViewClick);
        super.onRemove();
    }

    private function onViewClick(e:Event):void {
        dispatch(new CGalleryEvent (CGalleryEvent.IMAGE_CLICKED, mView.imageItem.id));
    }


}
}
