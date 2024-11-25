package
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.ContextMenuEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import flash.utils.getDefinitionByName;
   
   public dynamic class Preloader extends MovieClip
   {
      private var im_loading:Class = Preloader_im_loading;
      
      public var showctp:Boolean;
      
      public var adson:Boolean;
      
      public var startgame:Boolean;
      
      public var loading:Bitmap;
      
      public function Preloader()
      {
         super();
         adson = false;
         var rc_menu:ContextMenu = new ContextMenu();
         var credit:ContextMenuItem = new ContextMenuItem("Visit distractionware.com");
         credit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,visit_distractionware);
         rc_menu.hideBuiltInItems();
         rc_menu.customItems.push(credit);
         this.contextMenu = rc_menu;
         addEventListener(Event.ENTER_FRAME,checkFrame);
         if(!adson)
         {
            loading = new im_loading();
            loading.x = 320 - loading.width / 2;
            loading.y = 316;
            addChild(loading);
         }
         showctp = false;
         startgame = false;
      }
      
      private function checkFrame(e:Event) : void
      {
         var w:int = 0;
         var p:Number = this.loaderInfo.bytesLoaded / this.loaderInfo.bytesTotal;
         if(!adson)
         {
            graphics.clear();
            graphics.beginFill(1114884);
            graphics.drawRect(0,0,640,576);
            graphics.endFill();
            graphics.beginFill(15832473);
            graphics.drawRect(120,279,400,18);
            graphics.endFill();
         }
         if(p < 1)
         {
            if(!adson)
            {
               graphics.beginFill(1114884);
               w = int(Math.round(p * 391));
               graphics.drawRect(125 + w,283,391 - w,10);
               graphics.endFill();
            }
         }
         else if(!showctp)
         {
            showctp = true;
            startgame = true;
         }
         if(currentFrame == totalFrames)
         {
            if(startgame)
            {
               startup();
            }
         }
      }
      
      public function visit_distractionware(e:Event) : void
      {
         var distractionware_link:URLRequest = new URLRequest("http://www.distractionware.com");
         navigateToURL(distractionware_link,"_blank");
      }
      
      private function startup() : void
      {
         removeEventListener(Event.ENTER_FRAME,checkFrame);
         var mainClass:Class = getDefinitionByName("Main") as Class;
         addChild(new mainClass() as DisplayObject);
      }
   }
}

