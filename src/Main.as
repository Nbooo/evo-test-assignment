
package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import views.CGCollageView;

[SWF(width=1000, height=800)]
public class Main extends Sprite {
    private var mContext:CApplicationContext;

    public function Main() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        mContext = new CApplicationContext(this);
        addChild(new CGCollageView());
    }

    /* extra merging task */
    private function mergeSorted(a:Array, b:Array):Array {
        if (!a || !b)
            return b ? b : a;
        function isDescending(a:Array):Boolean{
            for (var i:int = 0; i < a.length - 1; i++) {
                if (a[i] > a[i + 1])
                    return true;
            }
            return false;
        }
        var r:Array = [];
        var descending:Boolean = isDescending(a) || isDescending(b);
        var i:int = 0, k:int = 0;
        while(i < a.length && k < b.length){
            if (a[i] == b[k]){
                r.push(a[i++]);
                r.push(b[k++]);
                continue;
            }
            if (descending)
                r.push(a[i] > b[k] ? a[i++] : b[k++]);
            else
                r.push(a[i] < b[k] ? a[i++] : b[k++]);
        }
        while (i < a.length)
            r.push(a[i++]);
        while (k < b.length)
            r.push(b[k++]);
        return r;
    }
}

}
