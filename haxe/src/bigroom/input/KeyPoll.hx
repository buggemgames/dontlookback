package bigroom.input;

import flash.display.DisplayObject;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.utils.ByteArray;

class KeyPoll
{
    private var states : ByteArray;
    
    public var press : Bool = false;
    
    public var click : Bool = false;
    
    public var onscreen : Bool = true;
    
    public var hasclicked : Bool = false;
    
    private var dispObj : DisplayObject;
    
    public function new(obj : DisplayObject)
    {
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
        dispObj.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener, false, 0, true);
        dispObj.addEventListener(KeyboardEvent.KEY_UP, keyUpListener, false, 0, true);
        dispObj.addEventListener(Event.ACTIVATE, activateListener, false, 0, true);
        dispObj.addEventListener(Event.DEACTIVATE, deactivateListener, false, 0, true);
        dispObj.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownListener);
        dispObj.addEventListener(MouseEvent.MOUSE_UP, mouseUpListener);
        dispObj.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
        dispObj.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
    }
    
    public function mouseOutHandler(e : MouseEvent) : Void
    {
        onscreen = false;
    }
    
    public function isUp(keyCode : Int) : Bool
    {
        return (states[keyCode >>> 3] & as3hx.Compat.parseInt(1 << (keyCode & 7))) == 0;
    }
    
    private function activateListener(ev : Event) : Void
    {
        for (i in 0...8)
        {
            states[i] = 0;
        }
    }
    
    public function isDown(keyCode : Int) : Bool
    {
        return (states[keyCode >>> 3] & as3hx.Compat.parseInt(1 << (keyCode & 7))) != 0;
    }
    
    private function keyUpListener(ev : KeyboardEvent) : Void
    {
        states[ev.keyCode >>> 3] = states[ev.keyCode >>> 3] & as3hx.Compat.parseInt(~(1 << (ev.keyCode & 7)));
    }
    
    private function deactivateListener(ev : Event) : Void
    {
        for (i in 0...8)
        {
            states[i] = 0;
        }
    }
    
    public function mouseOverHandler(e : MouseEvent) : Void
    {
        onscreen = true;
    }
    
    public function mouseUpListener(e : MouseEvent) : Void
    {
        press = false;
        click = false;
        hasclicked = false;
    }
    
    public function mouseDownListener(e : MouseEvent) : Void
    {
        press = true;
        click = true;
        hasclicked = true;
    }
    
    private function keyDownListener(ev : KeyboardEvent) : Void
    {
        states[ev.keyCode >>> 3] = states[ev.keyCode >>> 3] | 1 << (ev.keyCode & 7);
    }
}


