import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.ContextMenuEvent;
import flash.events.Event;
import flash.net.URLRequest;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;

class Main extends MovieClip
{
    private var im_loading : Class<Dynamic> = PreloaderImLoading;
    
    public var showctp : Bool;
    
    public var adson : Bool;
    
    public var startgame : Bool;
    
    public var loading : Bitmap;
    
    public function main()
    {
        super();
		trace("preloader has started really");
        adson = false;
        var rc_menu : ContextMenu = new ContextMenu();
        var credit : ContextMenuItem = new ContextMenuItem("Visit distractionware.com");
        credit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, visit_distractionware);
        rc_menu.hideBuiltInItems();
        rc_menu.customItems.push(credit);
        this.contextMenu = rc_menu;
        addEventListener(Event.ENTER_FRAME, checkFrame);
        if (!adson)
        {
            loading = Type.createInstance(im_loading, []);
            loading.x = 320 - loading.width / 2;
            loading.y = 316;
            addChild(loading);
        }
        showctp = false;
        startgame = false;
    }
    
    private function checkFrame(e : Event) : Void
    {
        var w : Int = 0;
        var p : Float = this.loaderInfo.bytesLoaded / this.loaderInfo.bytesTotal;
        if (!adson)
        {
            graphics.clear();
            graphics.beginFill(1114884);
            graphics.drawRect(0, 0, 640, 576);
            graphics.endFill();
            graphics.beginFill(15832473);
            graphics.drawRect(120, 279, 400, 18);
            graphics.endFill();
        }
        if (p < 1)
        {
            if (!adson)
            {
                graphics.beginFill(1114884);
                w = as3hx.Compat.parseInt(Math.round(p * 391));
                graphics.drawRect(125 + w, 283, 391 - w, 10);
                graphics.endFill();
            }
        }
        else if (!showctp)
        {
            showctp = true;
            startgame = true;
        }
        if (currentFrame == totalFrames)
        {
            if (startgame)
            {
                startup();
            }
        }
    }
    
    public function visit_distractionware(e : Event) : Void
    {
        var distractionware_link : URLRequest = new URLRequest("http://www.distractionware.com");
        flash.Lib.getURL(distractionware_link, "_blank");
    }
    
    private function startup() : Void
    {
		trace("Starting up main....");
        removeEventListener(Event.ENTER_FRAME, checkFrame);
        addChild(new Main_really());
    }
}


