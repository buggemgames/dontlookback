import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.ContextMenuEvent;
import flash.events.Event;
import flash.net.URLRequest;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;
import flash.Lib;

class Preloader extends MovieClip
{
    private var im_loading : Class<Dynamic> = PreloaderImLoading;
    
    public var showctp : Bool;
    
    public var adson : Bool;
    
    public var startgame : Bool;
    
    public var loading : Bitmap;
    
    public function new()
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
        startup(); //lol idc
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

class Main extends Sprite {
    public function new() {
        super();
        
        var preloader:Preloader = new Preloader();
        addChild(preloader);
    }
    
    public static function main() {
        Lib.current.addChild(new Main());
    }
}
