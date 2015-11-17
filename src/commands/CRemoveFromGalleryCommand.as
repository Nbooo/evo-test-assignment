
package commands {
import events.CGalleryEvent;

import models.CGalleryModel;
import models.IGallery;

import org.robotlegs.mvcs.Command;

public class CRemoveFromGalleryCommand extends Command {
    [Inject] public var mEvent:CGalleryEvent;
    [Inject] public var mModel:IGallery;

    public function CRemoveFromGalleryCommand() {
        super();
    }

    override public function execute():void{
        mModel.remove(mEvent.imageId);
    }
}
}
