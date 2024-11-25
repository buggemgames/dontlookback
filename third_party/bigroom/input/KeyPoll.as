package bigroom.input
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   
   public class KeyPoll
   {
      private var states:ByteArray;
      
      public var press:Boolean = false;
      
      public var click:Boolean = false;
      
      public var onscreen:Boolean = true;
      
      public var hasclicked:Boolean = false;
      
      private var dispObj:DisplayObject;
      
      public function KeyPoll(obj:DisplayObject)
      {
         super();
         states = new ByteArray();
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         states.writeUnsignedInt(0);
         dispObj = obj;
         dispObj.addEventListener(KeyboardEvent.KEY_DOWN,keyDownListener,false,0,true);
         dispObj.addEventListener(KeyboardEvent.KEY_UP,keyUpListener,false,0,true);
         dispObj.addEventListener(Event.ACTIVATE,activateListener,false,0,true);
         dispObj.addEventListener(Event.DEACTIVATE,deactivateListener,false,0,true);
         dispObj.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownListener);
         dispObj.addEventListener(MouseEvent.MOUSE_UP,mouseUpListener);
         dispObj.addEventListener(MouseEvent.MOUSE_OUT,mouseOutHandler);
         dispObj.addEventListener(MouseEvent.MOUSE_OVER,mouseOverHandler);
      }
      
      public function mouseOutHandler(e:MouseEvent) : void
      {
         onscreen = false;
      }
      
      public function isUp(keyCode:uint) : Boolean
      {
         return (states[keyCode >>> 3] & 1 << (keyCode & 7)) == 0;
      }
      
      private function activateListener(ev:Event) : void
      {
         for(var i:int = 0; i < 8; i++)
         {
            states[i] = 0;
         }
      }
      
      public function isDown(keyCode:uint) : Boolean
      {
         return (states[keyCode >>> 3] & 1 << (keyCode & 7)) != 0;
      }
      
      private function keyUpListener(ev:KeyboardEvent) : void
      {
         states[ev.keyCode >>> 3] &= ~(1 << (ev.keyCode & 7));
      }
      
      private function deactivateListener(ev:Event) : void
      {
         for(var i:int = 0; i < 8; i++)
         {
            states[i] = 0;
         }
      }
      
      public function mouseOverHandler(e:MouseEvent) : void
      {
         onscreen = true;
      }
      
      public function mouseUpListener(e:MouseEvent) : void
      {
         press = false;
         click = false;
         hasclicked = false;
      }
      
      public function mouseDownListener(e:MouseEvent) : void
      {
         press = true;
         click = true;
         hasclicked = true;
      }
      
      private function keyDownListener(ev:KeyboardEvent) : void
      {
         states[ev.keyCode >>> 3] |= 1 << (ev.keyCode & 7);
      }
   }
}

