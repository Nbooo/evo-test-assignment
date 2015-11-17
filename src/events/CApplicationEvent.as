
package events {
import flash.events.Event;

public class CApplicationEvent extends Event {
    public static const CONTEXT_READY:String = "context_ready";

    public function CApplicationEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
    }

    override public function clone():Event {
        return new CApplicationEvent(type, bubbles, cancelable);
    }
}
}
