import flash.display.*;
import flash.events.*;
import flash.media.*;

class Musicclass extends Sprite
{
    public var stepstopother : Int;
    
    public var ambchan : Array<Dynamic> = new Array<Dynamic>();
    
    public var ambchanlen : Int;
    
    public var currentsong : Int;
    
    public var step2playing : Bool;
    
    public var ambchannel : SoundChannel;
    
    public var musicfadein : Int;
    
    public var currentstepchan : Int;
    
    public var currentamb : Int;
    
    public var currentmusicchan : Int;
    
    public var stepchan : Array<Dynamic> = new Array<Dynamic>();
    
    public var musicfade : Int;
    
    public var step1playing : Bool;
    
    public var currentefchan : Int;
    
    public var steptype : Int;
    
    public var ambchancur : Int;
    
    public var playingsteps : Bool;
    
    public var musicchannel : SoundChannel;
    
    public var amb2active : Bool;
    
    public var musicchannel2 : SoundChannel;
    
    public var ambchannel2 : SoundChannel;
    
    public var stepchannel : SoundChannel;
    
    public var musicstopother : Int;
    
    public var currentstep : Int;
    
    public var musicchanlen : Int;
    
    public var stopother : Int;
    
    public var stepchanlen : Int;
    
    public var efchannel : Array<Dynamic> = new Array<Dynamic>();
    
    public var stepchannel2 : SoundChannel;
    
    public var stepchancur : Int;
    
    public var musicchancur : Int;
    
    public var currentambchan : Int;
    
    public var efchan : Array<Dynamic> = new Array<Dynamic>();
    
    public var musicchan : Array<Dynamic> = new Array<Dynamic>();
    
    public function new()
    {
        super();
    }
    
    public function playstep(t : Int) : Void
    {
        if (currentstep != t)
        {
            if (currentstep != -1)
            {
                stepchanlen = 0;
                stepchancur = stepchanlen;
                currentstepchan = 0;
                stepstopother = 0;
                if (step1playing)
                {
                    stepchannel.stop();
                }
                if (step2playing)
                {
                    stepchannel2.stop();
                }
            }
            if (t != -1)
            {
                if (t == 0)
                {
                    stepchanlen = 64;
                }
                if (t == 1)
                {
                    stepchanlen = 52;
                }
                if (t == 2)
                {
                    stepchanlen = 52;
                }
                stepchancur = stepchanlen;
                currentstepchan = 0;
                currentstep = t;
                stepchannel = stepchan[currentstep].play();
                step1playing = true;
                step2playing = false;
            }
            else
            {
                currentstep = -1;
            }
        }
    }
    
    public function initefchannels() : Void
    {
        var i : Int = 0;
        while (i < 16)
        {
            efchannel.push(new SoundChannel());
            i++;
        }
    }
    
    public function changeamb(t : Int) : Void
    {
        if (currentamb != t)
        {
            if (currentamb != -1)
            {
                ambchanlen = 0;
                ambchancur = ambchanlen;
                currentambchan = 0;
                stopother = 0;
                ambchannel.stop();
                if (amb2active)
                {
                    ambchannel2.stop();
                }
            }
            if (t != -1)
            {
                if (t == 0)
                {
                    ambchanlen = 285;
                }
                if (t == 1)
                {
                    ambchanlen = 360;
                }
                if (t == 2)
                {
                    ambchanlen = 120;
                }
                if (t == 3)
                {
                    ambchanlen = 480;
                }
                ambchancur = ambchanlen;
                currentambchan = 0;
                currentamb = t;
                ambchannel = ambchan[currentamb].play();
            }
            else
            {
                currentamb = -1;
            }
        }
    }
    
    public function processmusicfade() : Void
    {
        --musicfade;
        if (musicfade > 0)
        {
            if (currentmusicchan == 0)
            {
                musicchannel.soundTransform = new SoundTransform(musicfade / 60);
            }
            if (currentmusicchan == 1)
            {
                musicchannel2.soundTransform = new SoundTransform(musicfade / 60);
            }
        }
        else
        {
            if (currentmusicchan == 0)
            {
                musicchannel.stop();
            }
            if (currentmusicchan == 1)
            {
                musicchannel2.stop();
            }
            currentsong = -1;
        }
    }
    
    public function processmusic() : Void
    {
        if (musicfade > 0)
        {
            processmusicfade();
        }
        if (musicfadein > 0)
        {
            processmusicfadein();
        }
        --musicstopother;
        if (musicstopother == 1)
        {
            musicstopother = 0;
            if (currentmusicchan == 0)
            {
                musicchannel2.stop();
            }
            if (currentmusicchan == 1)
            {
                musicchannel.stop();
            }
        }
        if (musicstopother < 0)
        {
            musicstopother = 0;
        }
        --musicchancur;
        if (musicchancur <= 0 && currentsong > -1 && musicchanlen > 0)
        {
            musicchancur = musicchanlen;
            if (currentmusicchan == 0)
            {
                musicchannel2 = musicchan[currentsong].play();
                musicstopother = 3;
                currentmusicchan = 1;
            }
            else
            {
                musicchannel = musicchan[currentsong].play();
                musicstopother = 3;
                currentmusicchan = 0;
            }
        }
    }
    
    public function play(t : Int) : Void
    {
        if (currentsong != t)
        {
            if (currentsong != -1)
            {
                musicchanlen = 0;
                musicchancur = musicchanlen;
                currentmusicchan = 0;
                musicstopother = 0;
                musicchannel.stop();
                musicchannel2.stop();
            }
            if (t != -1)
            {
                musicchanlen = -1;
                if (t == 2)
                {
                    musicchanlen = 1231;
                }
                if (t == 3)
                {
                    musicchanlen = 3280;
                }
                musicchancur = musicchanlen;
                currentmusicchan = 0;
                currentsong = t;
                if (currentsong == 3)
                {
                    musicfadein = 61;
                    musicchannel = musicchan[currentsong].play(0, 0, new SoundTransform(0));
                }
                else
                {
                    musicchannel = musicchan[currentsong].play();
                }
                if (musicchanlen < 0)
                {
                    musicchannel.addEventListener(Event.SOUND_COMPLETE, stopmusic);
                }
            }
            else
            {
                currentsong = -1;
            }
        }
    }
    
    public function processmusicfadein() : Void
    {
        --musicfadein;
        if (musicfadein > 0)
        {
            musicchannel.soundTransform = new SoundTransform((60 - musicfadein) / 60);
        }
        else
        {
            musicchannel.soundTransform = new SoundTransform(1);
        }
    }
    
    public function processstep() : Void
    {
        --stepstopother;
        if (stepstopother == 1)
        {
            stepstopother = 0;
            if (currentstepchan == 0)
            {
                stepchannel2.stop();
                step2playing = false;
            }
            if (currentstepchan == 1)
            {
                stepchannel.stop();
                step1playing = false;
            }
        }
        if (stepstopother < 0)
        {
            stepstopother = 0;
        }
        --stepchancur;
        if (stepchancur <= 0 && currentstep > -1 && stepchanlen > 0)
        {
            stepchancur = stepchanlen;
            if (currentstepchan == 0)
            {
                stepchannel2 = stepchan[currentstep].play();
                step2playing = true;
                stepstopother = 3;
                currentstepchan = 1;
            }
            else
            {
                stepchannel = stepchan[currentstep].play();
                step1playing = true;
                stepstopother = 3;
                currentstepchan = 0;
            }
        }
    }
    
    public function fadeout() : Void
    {
        if (currentsong == 2 || currentsong == 3)
        {
            if (musicfade == 0)
            {
                musicchannel.removeEventListener(Event.SOUND_COMPLETE, stopmusic);
                musicfade = 61;
            }
        }
        else if (currentsong == 0)
        {
            if (musicfade == 0)
            {
                musicfade = 61;
            }
        }
    }
    
    public function stopstep() : Void
    {
        if (step1playing)
        {
            stepchannel.stop();
            step1playing = false;
        }
        if (step2playing)
        {
            stepchannel2.stop();
            step2playing = false;
        }
        currentstep = -1;
    }
    
    public function playef(t : Int, offset : Int = 0) : Void
    {
        efchannel[currentefchan] = efchan[t].play(offset);
        ++currentefchan;
        if (currentefchan > 15)
        {
            currentefchan -= 16;
        }
    }
    
    public function loopamb1(e : Event) : Void
    {
        ambchannel.removeEventListener(Event.SOUND_COMPLETE, loopamb1);
        ambchannel = ambchan[currentamb].play(0, 0, new SoundTransform(0.5));
        ambchannel.addEventListener(Event.SOUND_COMPLETE, loopamb1);
    }
    
    public function loopamb2(e : Event) : Void
    {
        ambchannel.removeEventListener(Event.SOUND_COMPLETE, loopamb2);
        ambchannel2 = ambchan[currentamb].play(0, 0, new SoundTransform(0.5));
        ambchannel2.addEventListener(Event.SOUND_COMPLETE, loopamb2);
    }
    
    public function stopmusic(e : Event) : Void
    {
        musicchannel.removeEventListener(Event.SOUND_COMPLETE, stopmusic);
        musicchannel.stop();
        currentsong = -1;
    }
    
    public function processamb() : Void
    {
        --stopother;
        if (stopother == 1)
        {
            stopother = 0;
            if (currentambchan == 0)
            {
                ambchannel2.stop();
            }
            if (currentambchan == 1)
            {
                ambchannel.stop();
            }
        }
        if (stopother < 0)
        {
            stopother = 0;
        }
        --ambchancur;
        if (ambchancur <= 0 && currentamb > -1)
        {
            ambchancur = ambchanlen;
            if (currentambchan == 0)
            {
                amb2active = true;
                ambchannel2 = ambchan[currentamb].play();
                stopother = 3;
                if (currentamb == 3)
                {
                    stopother = 20;
                }
                currentambchan = 1;
            }
            else
            {
                ambchannel = ambchan[currentamb].play();
                stopother = 3;
                if (currentamb == 3)
                {
                    stopother = 20;
                }
                currentambchan = 0;
            }
        }
    }
}


