/**
 * Created with IntelliJ IDEA.
 * User: user0068
 * Date: 17.11.15
 * Time: 12:01
 * To change this template use File | Settings | File Templates.
 */
package commands {
import models.IGallery;
import models.config.CSimpleGalleryConfig;

import org.robotlegs.mvcs.Command;

public class CGalleryConfigureCommand extends Command {
    [Inject] public var mGallery:IGallery;
    public function CGalleryConfigureCommand() {
        super();
    }

    override public function execute():void {
        mGallery.configure(CSimpleGalleryConfig.create(6));
    }
}
}
