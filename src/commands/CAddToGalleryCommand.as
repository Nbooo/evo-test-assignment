
package commands {

import events.CImageServiceEvent;

import models.CGalleryModel;
import models.CImageItem;
import models.IGallery;

import org.robotlegs.mvcs.Command;

public class CAddToGalleryCommand extends Command {
    [Inject] public var mEvent:CImageServiceEvent;
    [Inject] public var mModel:IGallery;

    public function CAddToGalleryCommand() {
        super();
    }

    override public function execute():void {
        mModel.add(CImageItem.create(mEvent.bitmap));
    }
}
}
