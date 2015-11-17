
package services {
import models.resources.IImgURLResource;

public interface IImageLoadService {
    function loadImagesFrom(resource:IImgURLResource):void;
}
}
