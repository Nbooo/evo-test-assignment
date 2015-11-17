package commands {
import models.resources.CImagesResource;

import org.robotlegs.mvcs.Command;

import services.IImageLoadService;

public class CLoadImagesCommand extends Command {
    [Inject] public var mService:IImageLoadService;

    public function CLoadImagesCommand() {
        super();
    }

    override public function execute():void {
        mService.loadImagesFrom(CImagesResource.hardcoded());
    }
}
}
