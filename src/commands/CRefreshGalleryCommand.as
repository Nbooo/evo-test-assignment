
package commands {
import models.CGalleryModel;
import models.IGallery;

import org.robotlegs.mvcs.Command;

public class CRefreshGalleryCommand extends Command {
    [Inject] public var mModel:IGallery;

    public function CRefreshGalleryCommand() {
        super();
    }

    override public function execute():void {
        mModel.refreshGallery();
    }
}
}
