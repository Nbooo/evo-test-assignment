package models.resources {
public class CImagesResource implements IImgURLResource{

    /** some hardcoded urls */
    public static function hardcoded():IImgURLResource {
        var r:CImagesResource = new CImagesResource();
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/49/a5/29/49a5295ba5a8862e1d446a244eb5b68e.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/65/2f/a4/652fa4c1e605b9b8735d1f92a1f9a679.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/7f/3c/00/7f3c001d0b35bebf89f2d573e798bbba.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/a9/8f/c6/a98fc6a7ab5e0e9e0fa7b47bc605584f.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/79/f9/bb/79f9bbe9b9721fd26ac034f1ffb737a3.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/46/5e/02/465e0242262f115198e7ec8b1c151761.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/14/b3/7e/14b37e8526cb0eab972dbb4ec0c19c98.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/88/ef/84/88ef84b5c25fec830f53cf57d377de9c.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/3d/ee/ef/3deeef118186465d755079c51b55d9f2.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/60/9a/41/609a41f7b29f1d74aaedcbbe004bd965.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/bf/f0/d7/bff0d72241f95ea21e0b0fab8b617fdd.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/f2/c7/45/f2c745ed258f82c728af39f59f778fb0.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/bb/aa/ab/bbaaab5f7087aeac76bdb18f8eff696b.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/236x/9b/30/f0/9b30f0a08c0ca825008e88678b642ce0.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/e5/0d/d3/e50dd319eac3a57c1d17ba7d81b12b6c.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/f5/3a/01/f53a01c50a759078271b225f39d7d189.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/01/b6/75/01b67541f0da2bc7d3450dc97f5cb1d4.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/92/18/c3/9218c314c34ee1f0d1e0c435dd3916fa.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/dd/6f/56/dd6f56f193e892768424122a54a45158.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/dd/93/4a/dd934a2d4845e109e9bd322c2192e3e9.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/b1/2b/f6/b12bf6046747594857aaf72192808612.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/34/2d/f7/342df7dcc892df205370b84b6b7e24fc.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/df/81/91/df81912d5bc248ecf0eee418d44043fc.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/f7/1f/7d/f71f7da5d5e2368ccb7a1101716843a3.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/cf/9e/79/cf9e79bd02b23cd32ed3484f5e53fa0f.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/8f/e6/69/8fe669e270073f33d2ac08f5eda1a288.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/b1/d1/13/b1d1132fabcafbc27fb00a240aad08b4.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/db/bc/b8/dbbcb88eae5ae8cc31ed1bb3bfcca89c.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/4c/d3/23/4cd32330152e996e85f85ece469807e5.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/cd/9a/32/cd9a3238f10410d5f232cca79a137c1f.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/8f/04/b5/8f04b5c39b6b498cc6e0debb7159a693.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/67/da/25/67da253d5b11a97ddd16ee37beb2ee2a.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/5e/10/e7/5e10e79fe4b10b48c3442e6f47387a6c.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/4d/04/47/4d0447ff5b964a4d5512b87f16d3c9ba.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/cd/c8/77/cdc877b7aee70d8975e8076663888be6.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/59/54/6c/59546c2cf201e676b1c7b9f98df7a63b.jpg");
        r.mUrls.push("https://s-media-cache-ak0.pinimg.com/736x/4c/e9/de/4ce9de6059d04bdb3228b6a565485056.jpg");
        return r;
    }

    private var mUrls:Vector.<String>;
    private var mIndex:int = 0;

    public function CImagesResource() {
        mUrls = new <String>[];
    }

    public function get first():String {
        mIndex = 0;
        if (mUrls.length == 0)
            return null;
        return mUrls[mIndex++];
    }

    public function get next():String {
        if (mIndex < mUrls.length)
            return mUrls[mIndex++];
        return null;
    }

    public function get all():Vector.<String> {
        return mUrls;
    }

    public function get count():int {
        return mUrls.length;
    }
}
}
