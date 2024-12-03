import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.net.*;

class Entityclass extends Sprite
{
    public var flags : Array<Dynamic> = new Array<Dynamic>();
    
    public var restartcounter : Int;
    
    public var temph : Int;
    
    public var tempw : Int;
    
    public var tempx : Int;
    
    public var tempy : Int;
    
    public var restartmode : Int;
    
    public var temprect : Rectangle;
    
    public var norestartsound : Bool;
    
    public var entities : Array<Dynamic> = new Array<Dynamic>();
    
    public var onladder : Bool;
    
    public var nentity : Int;
    
    public var temp : Int;
    
    public var temp2 : Int;
    
    public var removeentity : Bool;
    
    public var restartroom : Bool;
    
    public var activetrigger : Int;
    
    public function new()
    {
        super();
    }
    
    public function updateentities(i : Int, help : Helpclass, game : Gameclass, music : Musicclass) : Bool
    {
        var qaz : Int = 0;
        var wsx : Int = 0;
        var ti : Int = 0;
        var tj : Int = 0;
        var wi : Int = 0;
        var qqaz : Int = 0;
        var qwsx : Int = 0;
        removeentity = false;
        if (entities[i].statedelay <= 0)
        {
            var _sw0_ = (entities[i].type);            

            switch (_sw0_)
            {
                case 0:
                    if (entities[i].state == 1)
                    {
                        entities[i].state = 2;
                        for (qaz in 0...2)
                        {
                            for (wsx in 0...10)
                            {
                                createentity(entities[i].xp + 8 + qaz, entities[i].yp + 3 + wsx, 30);
                            }
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        --entities[i].life;
                        if (entities[i].life <= 8)
                        {
                            entities[i].invis = true;
                        }
                        entities[i].vx = 0;
                        entities[i].vy = 0;
                    }
                case 1:
                    if (entities[i].state == 0)
                    {
                        if (entities[i].xp < -30)
                        {
                            entities[i].state = 1;
                        }
                        if (entities[i].xp > 190)
                        {
                            entities[i].state = 1;
                        }
                        if (entities[i].yp < -30)
                        {
                            entities[i].state = 1;
                        }
                        if (entities[i].yp > 174)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        removeentity = true;
                        if (entities[i].vx <= 0)
                        {
                            createentity(entities[i].xp + 1, entities[i].yp, 16, 3, -Math.random() * 2);
                        }
                        else
                        {
                            createentity(entities[i].xp + 1, entities[i].yp, 16, -3, -Math.random() * 2);
                        }
                    }
                case 2:
                    if (entities[i].state == 0)
                    {
                        temp = getplayer();
                        entities[i].vx = 0;
                        entities[i].vy = 0;
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].vx = 1;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].vx = -1;
                        }
                        if (entities[i].yp + 1 < entities[temp].yp + 5)
                        {
                            entities[i].vy = 1;
                        }
                        if (entities[i].yp - 1 > entities[temp].yp + 5)
                        {
                            entities[i].vy = -1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        game.incenemycount();
                        flags[entities[i].flag] = 2;
                        music.playef(5, 50);
                        createentity(entities[i].xp, entities[i].yp, 3, entities[i].bulletvel, -5);
                        removeentity = true;
                    }
                case 4:
                    if (entities[i].state == 0)
                    {
                        --entities[i].life;
                        if (entities[i].life <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        if (entities[i].yp > 30)
                        {
                            if (Math.random() < 0.5)
                            {
                                createentity(entities[i].xp, entities[i].yp + 5, 5, Math.random() + 1, -4);
                            }
                            else
                            {
                                createentity(entities[i].xp, entities[i].yp + 5, 5, -Math.random() - 1, -4);
                            }
                        }
                        removeentity = true;
                    }
                case 5:
                    if (entities[i].state == 0)
                    {
                        --entities[i].life;
                        if (entities[i].life <= 0)
                        {
                            entities[i].state = 2;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        if (!entities[i].bounce)
                        {
                            entities[i].state = 0;
                            entities[i].life -= 8;
                            if (entities[i].life <= 0)
                            {
                                removeentity = true;
                            }
                            entities[i].ay = -2;
                            entities[i].jumping = true;
                            entities[i].jumpframe = 2;
                            entities[i].bounce = true;
                            entities[i].onwall = 0;
                        }
                        else
                        {
                            removeentity = true;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        removeentity = true;
                    }
                case 6:
                    if (entities[i].state == 1)
                    {
                        temp = getplayer();
                        entities[i].vx *= 0.95;
                        if (cast(entities[temp].onground, Bool) && cast(entities[i].onground, Bool))
                        {
                            if (entities[i].xp + 1 < entities[temp].xp + 2)
                            {
                                entities[i].vx = 4;
                            }
                            if (entities[i].xp - 1 > entities[temp].xp + 2)
                            {
                                entities[i].vx = -4;
                            }
                            entities[i].dir = 1;
                            if (entities[i].vx > 0)
                            {
                                entities[i].dir = 0;
                            }
                        }
                        entities[i].onxwall = 2;
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].vx = 0;
                        entities[i].state = 1;
                        entities[i].onxwall = 0;
                    }
                    else if (entities[i].state == 3)
                    {
                        --entities[i].hp;
                        if (entities[i].hp <= 0)
                        {
                            game.incenemycount();
                            flags[entities[i].flag] = 2;
                            music.playef(5, 50);
                            createentity(entities[i].xp, entities[i].yp, 7, entities[i].bulletvel, -5);
                            removeentity = true;
                        }
                        else
                        {
                            entities[i].vx = entities[i].bulletvel;
                            entities[i].vy = -5;
                            entities[i].state = 1;
                        }
                    }
                case 9:
                    if (entities[i].state == 0)
                    {
                        temp = getplayer();
                        if (Math.abs(entities[i].xp - entities[temp].xp) < 50)
                        {
                            entities[i].state = 1;
                            entities[i].tile = 94;
                            entities[i].drawframe = 94;
                            entities[i].gravity = true;
                        }
                    }
                    else if (entities[i].state != 1)
                    {
                        if (entities[i].state == 2)
                        {
                            temp = getplayer();
                            entities[i].onywall = 0;
                            entities[i].onwall = 0;
                            entities[i].state = 3;
                            entities[i].tile = 89;
                            if (entities[i].xp + 1 < entities[temp].xp + 2)
                            {
                                entities[i].state = 4;
                            }
                            if (entities[i].xp - 1 > entities[temp].xp + 2)
                            {
                                entities[i].state = 3;
                            }
                        }
                        else if (entities[i].state == 3)
                        {
                            entities[i].onxwall = 4;
                            entities[i].vx = -2;
                            entities[i].dir = 1;
                            if (entities[i].xp < 0)
                            {
                                entities[i].state = 4;
                            }
                        }
                        else if (entities[i].state == 4)
                        {
                            entities[i].onxwall = 3;
                            entities[i].vx = 2;
                            entities[i].dir = 0;
                            if (entities[i].xp > 145)
                            {
                                entities[i].state = 3;
                            }
                        }
                        else if (entities[i].state == 10)
                        {
                            game.incenemycount();
                            flags[entities[i].flag] = 2;
                            music.playef(5, 50);
                            createentity(entities[i].xp, entities[i].yp, 10, entities[i].bulletvel, -5);
                            removeentity = true;
                        }
                    }
                case 11:
                    if (entities[i].state == 0)
                    {
                        temp = getplayer();
                        if (Math.abs(entities[i].xp - entities[temp].xp) < 25)
                        {
                            entities[i].state = 1;
                            entities[i].gravity = true;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        ++entities[i].yp;
                    }
                    else if (entities[i].state == 2)
                    {
                        createentity(entities[i].xp + 2, entities[i].yp + 13, 5, Math.random(), -8);
                        createentity(entities[i].xp + 2, entities[i].yp + 13, 5, -Math.random(), -8);
                        createentity(entities[i].xp + 2, entities[i].yp + 13, 5, Math.random() + 1, -6);
                        createentity(entities[i].xp + 2, entities[i].yp + 13, 5, -Math.random() - 1, -6);
                        music.playef(7, 50);
                        removeentity = true;
                    }
                case 12:
                    if (entities[i].state == 0)
                    {
                        temp = getplayer();
                        if (Math.abs(entities[i].xp - entities[temp].xp) < 100)
                        {
                            if (Math.abs(entities[i].yp - entities[temp].yp) < 50)
                            {
                                entities[i].onywall = 2;
                            }
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onywall = 0;
                        entities[i].vx *= 0.4;
                        entities[i].state = 3;
                        entities[i].statedelay = 6;
                    }
                    else if (entities[i].state == 3)
                    {
                        entities[i].onywall = 2;
                        entities[i].state = 1;
                        entities[i].ay = -4 - Math.random() * 5;
                        entities[i].jumping = true;
                        entities[i].jumpframe = 7 + Math.random() * 6;
                        temp = getplayer();
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].vx = 2;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].vx = -2;
                        }
                    }
                    else if (entities[i].state == 10)
                    {
                        --entities[i].hp;
                        if (entities[i].hp <= 0)
                        {
                            game.incenemycount();
                            music.playef(14);
                            flags[entities[i].flag] = 2;
                            if (entities[i].vx <= 0)
                            {
                                createentity(entities[i].xp, entities[i].yp, 13, entities[i].bulletvel, -5);
                            }
                            if (entities[i].vx > 0)
                            {
                                createentity(entities[i].xp, entities[i].yp, 14, entities[i].bulletvel, -5);
                            }
                            removeentity = true;
                        }
                        else
                        {
                            music.playef(5);
                            entities[i].vx = entities[i].bulletvel;
                            entities[i].vy = -1;
                            entities[i].state = 1;
                            entities[i].onywall = 2;
                        }
                    }
                case 15:
                    if (entities[i].state == 0)
                    {
                        if (entities[i].xp < -10)
                        {
                            removeentity = true;
                        }
                        if (entities[i].xp > 170)
                        {
                            removeentity = true;
                        }
                        if (entities[i].yp < -10)
                        {
                            removeentity = true;
                        }
                        if (entities[i].yp > 154)
                        {
                            removeentity = true;
                        }
                        if (entities[i].vx < -0.5)
                        {
                            if (Math.random() < 0.9 && nentity < 40)
                            {
                                createentity(entities[i].xp + 4, entities[i].yp + 1, 16, Math.random(), -Math.random());
                            }
                            if (Math.random() < 0.9)
                            {
                                createentity(entities[i].xp + 4, entities[i].yp + 4, 16, Math.random(), -Math.random());
                            }
                        }
                        else if (entities[i].vx > 0.5)
                        {
                            if (Math.random() < 0.9 && nentity < 40)
                            {
                                createentity(entities[i].xp - 2, entities[i].yp + 1, 16, Math.random(), -Math.random());
                            }
                            if (Math.random() < 0.9)
                            {
                                createentity(entities[i].xp - 2, entities[i].yp + 4, 16, Math.random(), -Math.random());
                            }
                        }
                        else
                        {
                            if (Math.random() < 0.9 && nentity < 40)
                            {
                                createentity(entities[i].xp + 2, entities[i].yp + 1, 16, 0.5 - Math.random(), -Math.random());
                            }
                            if (Math.random() < 0.9)
                            {
                                createentity(entities[i].xp + 3, entities[i].yp + 1, 16, 0.5 - Math.random(), -Math.random());
                            }
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        removeentity = true;
                    }
                case 17:
                    if (entities[i].state == 0)
                    {
                        if (!entities[i].roar)
                        {
                            music.playef(11);
                            entities[i].roar = true;
                        }
                        temp = getplayer();
                        entities[i].onbullet = 10;
                        entities[i].state = 1;
                        entities[i].vx = 0;
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].state = 2;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].state = 1;
                        }
                        entities[i].statedelay = 10;
                    }
                    else if (entities[i].state == 1)
                    {
                        entities[i].onxwall = 2;
                        entities[i].vx = -1;
                        entities[i].dir = 1;
                        if (entities[i].xp < 0)
                        {
                            entities[i].state = 2;
                        }
                        temp = getplayer();
                        if (Math.abs(entities[i].yp - entities[temp].yp) < 30)
                        {
                            --entities[i].charge;
                            if (entities[i].charge <= 0)
                            {
                                entities[i].state = 3;
                            }
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onxwall = 1;
                        entities[i].vx = 1;
                        entities[i].dir = 0;
                        if (entities[i].xp > 135)
                        {
                            entities[i].state = 1;
                        }
                        temp = getplayer();
                        if (Math.abs(entities[i].yp - entities[temp].yp) < 30)
                        {
                            --entities[i].charge;
                            if (entities[i].charge <= 0)
                            {
                                entities[i].state = 3;
                            }
                        }
                    }
                    else if (entities[i].state == 3)
                    {
                        entities[i].charge = 40;
                        entities[i].state = 4;
                        entities[i].vx = 0;
                        temp = getplayer();
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].dir = 0;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].dir = 1;
                        }
                    }
                    else if (entities[i].state == 4)
                    {
                        entities[i].state = 0;
                        entities[i].statedelay = 5;
                        if (entities[i].dir == 1)
                        {
                            createentity(entities[i].xp - 5, entities[i].yp + 14, 15, -4, 0.5 - Math.random());
                        }
                        if (entities[i].dir == 0)
                        {
                            createentity(entities[i].xp + 5, entities[i].yp + 14, 15, 4, 0.5 - Math.random());
                        }
                        music.playef(8);
                    }
                    else if (entities[i].state == 10)
                    {
                        --entities[i].hp;
                        if (entities[i].hp <= 0)
                        {
                            game.incenemycount();
                            flags[entities[i].flag] = 2;
                            music.playef(13);
                            music.playef(8);
                            createentity(entities[i].xp, entities[i].yp + 14, 15, -2, -1);
                            createentity(entities[i].xp, entities[i].yp + 14, 15, -1, -2);
                            createentity(entities[i].xp, entities[i].yp + 14, 15, 0, -2.4);
                            createentity(entities[i].xp, entities[i].yp + 14, 15, 2, -1);
                            createentity(entities[i].xp, entities[i].yp + 14, 15, 1, -2);
                            removeentity = true;
                            game.screenshake = 10;
                        }
                        else
                        {
                            music.playef(14);
                            entities[i].vx = 0;
                            entities[i].state = 3;
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                            createentity(entities[i].xp + 6 + Math.random() * 24, entities[i].yp + 6 + Math.random() * 16, 29);
                        }
                    }
                case 19:
                    if (entities[i].state == 0)
                    {
                        entities[i].state = 1;
                    }
                    else if (entities[i].state == 1)
                    {
                        entities[i].onywall = 2;
                        entities[i].vy = 4;
                        if (entities[i].yp > 128)
                        {
                            entities[i].state = 2;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onywall = 1;
                        entities[i].vy = -4;
                        if (entities[i].yp <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 3)
                    {
                        removeentity = true;
                    }
                case 20:
                    if (entities[i].state == 0)
                    {
                        entities[i].state = 1;
                    }
                    else if (entities[i].state == 1)
                    {
                        entities[i].onxwall = 2;
                        entities[i].vx = 4;
                        if (entities[i].xp > 144)
                        {
                            entities[i].state = 2;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onxwall = 1;
                        entities[i].vx = -4;
                        if (entities[i].xp <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 3)
                    {
                        removeentity = true;
                    }
                case 21:
                    if (entities[i].state == 0)
                    {
                        entities[i].state = 1;
                    }
                    else if (entities[i].state == 1)
                    {
                        entities[i].onxwall = 2;
                        entities[i].onywall = 0;
                        entities[i].vx = 3;
                        entities[i].vy = 0;
                        if (entities[i].xp > 151)
                        {
                            entities[i].state = 2;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onxwall = 0;
                        entities[i].onywall = 3;
                        entities[i].vx = 0;
                        entities[i].vy = 3;
                        if (entities[i].yp > 135)
                        {
                            entities[i].state = 3;
                        }
                    }
                    else if (entities[i].state == 3)
                    {
                        entities[i].onxwall = 4;
                        entities[i].onywall = 0;
                        entities[i].vx = -3;
                        entities[i].vy = 0;
                        if (entities[i].xp <= 0)
                        {
                            entities[i].state = 4;
                        }
                    }
                    else if (entities[i].state == 4)
                    {
                        entities[i].onxwall = 0;
                        entities[i].onywall = 1;
                        entities[i].vx = 0;
                        entities[i].vy = -3;
                        if (entities[i].yp <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 10)
                    {
                        removeentity = true;
                    }
                case 22:
                    if (entities[i].state == 0)
                    {
                        ++entities[i].framedelay;
                        if (entities[i].framedelay > 90)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        createentity(entities[i].xp + 2, entities[i].yp - 4, 18, 0, 0);
                        music.playef(8);
                        entities[i].state = 0;
                        entities[i].framedelay = 0;
                    }
                case 23:
                    if (entities[i].state == 0)
                    {
                        game.removeblockat(help, entities[i].xp, entities[i].yp);
                        game.createblock(entities[i].xp, entities[i].yp, entities[i].cw, entities[i].ch);
                        entities[i].state = 1;
                        entities[i].invis = false;
                        entities[i].tile = 33;
                        entities[i].drawframe = 33;
                    }
                    else if (entities[i].state == 1)
                    {
                        ++entities[i].framedelay;
                        if (entities[i].framedelay > 60)
                        {
                            entities[i].state = 2;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].state = 3;
                        entities[i].statedelay = 5;
                        entities[i].tile = 34;
                        entities[i].drawframe = 34;
                    }
                    else if (entities[i].state == 3)
                    {
                        entities[i].state = 4;
                        entities[i].statedelay = 5;
                        entities[i].tile = 35;
                        entities[i].drawframe = 35;
                    }
                    else if (entities[i].state == 4)
                    {
                        entities[i].framedelay = 0;
                        entities[i].state = 5;
                        entities[i].statedelay = 5;
                        entities[i].tile = 36;
                        entities[i].drawframe = 36;
                    }
                    else if (entities[i].state == 5)
                    {
                        entities[i].invis = true;
                        game.removeblockat(help, entities[i].xp, entities[i].yp);
                        ++entities[i].framedelay;
                        if (entities[i].framedelay > 45)
                        {
                            entities[i].state = 6;
                        }
                    }
                    else if (entities[i].state == 6)
                    {
                        game.createblock(entities[i].xp, entities[i].yp, entities[i].cw, entities[i].ch);
                        entities[i].invis = false;
                        entities[i].framedelay = 0;
                        entities[i].tile = 36;
                        entities[i].drawframe = 36;
                        entities[i].state = 7;
                        entities[i].statedelay = 5;
                    }
                    else if (entities[i].state == 7)
                    {
                        entities[i].state = 8;
                        entities[i].statedelay = 5;
                        entities[i].tile = 35;
                        entities[i].drawframe = 35;
                    }
                    else if (entities[i].state == 8)
                    {
                        entities[i].state = 0;
                        entities[i].statedelay = 5;
                        entities[i].tile = 34;
                        entities[i].drawframe = 34;
                    }
                case 24:
                    if (entities[i].state == 0)
                    {
                        game.createblock(entities[i].xp, entities[i].yp + 1, entities[i].cw, entities[i].ch);
                        entities[i].state = 1;
                    }
                    else if (entities[i].state != 1)
                    {
                        if (entities[i].state == 2)
                        {
                            entities[i].onplayer = 0;
                            music.playef(9);
                            entities[i].state = 3;
                            entities[i].statedelay = 5;
                            entities[i].tile = 53;
                            entities[i].drawframe = 53;
                            createentity(entities[i].xp + 4 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 8 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                        }
                        else if (entities[i].state == 3)
                        {
                            entities[i].onplayer = 0;
                            entities[i].state = 4;
                            entities[i].statedelay = 5;
                            entities[i].tile = 54;
                            entities[i].drawframe = 54;
                            createentity(entities[i].xp + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 12 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                        }
                        else if (entities[i].state == 4)
                        {
                            entities[i].state = 5;
                            entities[i].statedelay = 5;
                            entities[i].tile = 55;
                            entities[i].drawframe = 55;
                            createentity(entities[i].xp + 4 + Math.random() * 4, entities[i].yp + 5, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 8 + Math.random() * 4, entities[i].yp + 5, 5, 0, 1 + Math.random() * 2);
                        }
                        else if (entities[i].state == 5)
                        {
                            entities[i].framedelay = 0;
                            entities[i].state = 6;
                            entities[i].statedelay = 5;
                            entities[i].tile = 56;
                            entities[i].drawframe = 56;
                            createentity(entities[i].xp + Math.random() * 4, entities[i].yp + 5, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 12 + Math.random() * 4, entities[i].yp + 5, 5, 0, 1 + Math.random() * 2);
                        }
                        else if (entities[i].state == 6)
                        {
                            game.removeblockat(help, entities[i].xp, entities[i].yp + 1);
                            removeentity = true;
                            createentity(entities[i].xp + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 4 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 8 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                            createentity(entities[i].xp + 12 + Math.random() * 4, entities[i].yp + 4, 5, 0, 1 + Math.random() * 2);
                        }
                    }
                case 26:
                    if (entities[i].state == 0)
                    {
                        entities[i].harmdelay = 0;
                        entities[i].onbullet = 10;
                        if (entities[i].onground)
                        {
                            entities[i].vx *= 0.2;
                        }
                        if (entities[i].hp == 3)
                        {
                            --entities[i].attackdelay;
                            entities[i].onywall = 0;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].onywall = 3;
                                entities[i].attackdelay = 25;
                            }
                        }
                        else if (entities[i].hp == 2)
                        {
                            --entities[i].attackdelay;
                            entities[i].onywall = 0;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].onywall = 4;
                                entities[i].attackdelay = 20;
                            }
                        }
                        else
                        {
                            temp = getplayer();
                            if (cast(entities[i].onground, Bool) && entities[i].attackdelay <= 6)
                            {
                                if (entities[i].xp - entities[temp].xp > 0)
                                {
                                    entities[i].dir = 1;
                                }
                                else
                                {
                                    entities[i].dir = 0;
                                }
                            }
                            --entities[i].attackdelay;
                            entities[i].onywall = 0;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].onywall = 4;
                                entities[i].attackdelay = 30;
                            }
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        if (entities[i].vx < -1 && entities[i].xp < 10)
                        {
                            entities[i].vx = -entities[i].vx;
                            entities[i].dir = 0;
                        }
                        if (entities[i].vx > 1 && entities[i].xp > 135)
                        {
                            entities[i].vx = -entities[i].vx;
                            entities[i].dir = 1;
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].onywall = 0;
                        entities[i].state = 0;
                    }
                    else if (entities[i].state == 3)
                    {
                        if (Math.random() * 100 > 50)
                        {
                            if (Math.random() * 100 > 80)
                            {
                                music.playef(10);
                            }
                            else
                            {
                                music.playef(21);
                            }
                        }
                        entities[i].onywall = 2;
                        entities[i].state = 1;
                        entities[i].ay = -6;
                        entities[i].jumping = true;
                        entities[i].jumpframe = 8;
                        temp = getplayer();
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].vx = 2;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].vx = -2;
                        }
                        entities[i].dir = 0;
                        if (entities[i].vx < 0)
                        {
                            entities[i].dir = 1;
                        }
                    }
                    else if (entities[i].state == 4)
                    {
                        if (Math.random() * 100 > 50)
                        {
                            if (Math.random() * 100 > 80)
                            {
                                music.playef(10);
                            }
                            else
                            {
                                music.playef(21);
                            }
                        }
                        entities[i].onywall = 2;
                        entities[i].state = 1;
                        entities[i].ay = -6;
                        if (entities[i].hp == 1)
                        {
                            entities[i].ay = -2;
                        }
                        entities[i].jumping = true;
                        entities[i].jumpframe = 8;
                        temp = getplayer();
                        if (entities[i].xp + 1 < entities[temp].xp + 2)
                        {
                            entities[i].vx = 3;
                        }
                        if (entities[i].xp - 1 > entities[temp].xp + 2)
                        {
                            entities[i].vx = -3;
                        }
                        if (entities[i].hp == 1)
                        {
                            if (entities[i].xp + 1 < entities[temp].xp + 2)
                            {
                                entities[i].vx = 4;
                            }
                            if (entities[i].xp - 1 > entities[temp].xp + 2)
                            {
                                entities[i].vx = -4;
                            }
                        }
                        entities[i].dir = 0;
                        if (entities[i].vx < 0)
                        {
                            entities[i].dir = 1;
                        }
                    }
                    else if (entities[i].state == 8)
                    {
                        entities[i].onbullet = 0;
                        --entities[i].harmdelay;
                        if (entities[i].onground)
                        {
                            entities[i].vx *= 0.2;
                        }
                        entities[i].oxp = entities[i].xp;
                        entities[i].oyp = entities[i].yp;
                        entities[i].xp = entities[i].oxp + Math.random() * 2 - 1;
                        entities[i].yp = entities[i].oyp - Math.random();
                        if (entities[i].harmdelay == 80)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 40)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 20)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 2)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        createentity(entities[i].xp + 2 + Math.random() * 10, entities[i].yp + 6 + Math.random() * 3, 29);
                        createentity(entities[i].xp + 2 + Math.random() * 10, entities[i].yp + 6 + Math.random() * 3, 29);
                        if (entities[i].harmdelay <= 0)
                        {
                            flags[entities[i].flag] = 2;
                            for (ti in 0...6)
                            {
                                for (tj in 0...4)
                                {
                                    createentity(entities[i].xp + 2 + ti * 2, entities[i].yp + 2 + tj * 3, 29);
                                }
                            }
                            game.flashlight = 4;
                            game.state = 12;
                            removeentity = true;
                            music.playef(14);
                        }
                    }
                    else if (entities[i].state == 9)
                    {
                        entities[i].onbullet = 0;
                        --entities[i].harmdelay;
                        if (entities[i].onground)
                        {
                            entities[i].vx *= 0.2;
                        }
                        entities[i].oxp = entities[i].xp;
                        entities[i].oyp = entities[i].yp;
                        entities[i].xp = entities[i].oxp + Math.random() * 2 - 1;
                        entities[i].yp = entities[i].oyp - Math.random();
                        createentity(entities[i].xp + 2 + Math.random() * 10, entities[i].yp + 6 + Math.random() * 3, 29);
                        if (entities[i].harmdelay <= 0)
                        {
                            entities[i].state = 0;
                            entities[i].harmdelay = 0;
                            entities[i].attackdelay = 15;
                            temp = getplayer();
                            if (entities[i].onground)
                            {
                                if (entities[i].xp - entities[temp].xp > 0)
                                {
                                    entities[i].dir = 1;
                                }
                                else
                                {
                                    entities[i].dir = 0;
                                }
                            }
                        }
                    }
                    else if (entities[i].state == 10)
                    {
                        if (entities[i].dir == 1 && entities[i].bulletvel < 0 || entities[i].dir == 0 && entities[i].bulletvel > 0)
                        {
                            entities[i].harmdelay = 45;
                            --entities[i].hp;
                            --game.currenthp;
                            game.flashlight = 4;
                            game.screenshake = 45;
                            if (entities[i].hp <= 0)
                            {
                                game.incenemycount();
                                music.playef(12);
                                entities[i].vx = entities[i].bulletvel;
                                entities[i].vy = -1;
                                entities[i].state = 8;
                                entities[i].onywall = 0;
                                entities[i].harmdelay = 120;
                                game.screenshake = 120;
                                music.fadeout();
                                entities[i].harmful = false;
                            }
                            else
                            {
                                if (entities[i].hp == 2)
                                {
                                    music.playef(11);
                                }
                                else
                                {
                                    music.playef(11);
                                }
                                entities[i].vx = entities[i].bulletvel;
                                entities[i].vy = -1;
                                entities[i].state = 9;
                                entities[i].onywall = 0;
                            }
                        }
                        else
                        {
                            music.playef(22);
                            entities[i].state = 0;
                        }
                    }
                case 27:
                    if (entities[i].state == 0)
                    {
                        music.play(2);
                        if (!entities[i].roar)
                        {
                            music.playef(16);
                            entities[i].roar = true;
                        }
                        entities[i].xp = 90;
                        entities[i].yp = 30;
                        if (entities[i].framedelay <= 0)
                        {
                            entities[i].tile = 180;
                        }
                        entities[i].harmdelay = 0;
                        entities[i].onbullet = 100;
                        if (entities[i].hp >= 5)
                        {
                            --entities[i].attackdelay;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].attackdelay = 60;
                                temp = as3hx.Compat.parseInt(Math.random() * 40);
                                if (temp < 10)
                                {
                                    entities[i].state = 1;
                                }
                                else
                                {
                                    temp -= 10;
                                    if (temp < 10)
                                    {
                                        entities[i].state = 3;
                                    }
                                    else
                                    {
                                        temp -= 10;
                                        if (temp < 10)
                                        {
                                            entities[i].state = 5;
                                        }
                                        else
                                        {
                                            entities[i].state = 6;
                                        }
                                    }
                                }
                            }
                        }
                        else if (entities[i].hp == 4)
                        {
                            --entities[i].attackdelay;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].attackdelay = 55;
                                temp = as3hx.Compat.parseInt(Math.random() * 40);
                                if (temp < 10)
                                {
                                    entities[i].state = 2;
                                }
                                else
                                {
                                    temp -= 10;
                                    if (temp < 10)
                                    {
                                        entities[i].state = 3;
                                    }
                                    else
                                    {
                                        temp -= 10;
                                        if (temp < 10)
                                        {
                                            entities[i].state = 6;
                                        }
                                        else
                                        {
                                            entities[i].state = 5;
                                        }
                                    }
                                }
                            }
                        }
                        else if (entities[i].hp == 3)
                        {
                            --entities[i].attackdelay;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].attackdelay = 50;
                                temp = as3hx.Compat.parseInt(Math.random() * 40);
                                if (temp < 10)
                                {
                                    entities[i].state = 7;
                                }
                                else
                                {
                                    temp -= 10;
                                    if (temp < 10)
                                    {
                                        entities[i].state = 8;
                                    }
                                    else
                                    {
                                        temp -= 10;
                                        if (temp < 10)
                                        {
                                            entities[i].state = 3;
                                        }
                                        else
                                        {
                                            entities[i].state = 2;
                                        }
                                    }
                                }
                            }
                        }
                        else if (entities[i].hp == 2)
                        {
                            --entities[i].attackdelay;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].attackdelay = 50;
                                temp = as3hx.Compat.parseInt(Math.random() * 40);
                                if (temp < 10)
                                {
                                    entities[i].state = 9;
                                }
                                else
                                {
                                    temp -= 10;
                                    if (temp < 10)
                                    {
                                        entities[i].state = 10;
                                    }
                                    else
                                    {
                                        temp -= 10;
                                        if (temp < 10)
                                        {
                                            entities[i].state = 11;
                                        }
                                        else
                                        {
                                            entities[i].state = 4;
                                        }
                                    }
                                }
                            }
                        }
                        else if (entities[i].hp == 1)
                        {
                            --entities[i].attackdelay;
                            if (entities[i].attackdelay <= 0)
                            {
                                entities[i].attackdelay = 50;
                                temp = as3hx.Compat.parseInt(Math.random() * 40);
                                if (temp < 10)
                                {
                                    entities[i].state = 1;
                                }
                                else
                                {
                                    temp -= 10;
                                    if (temp < 10)
                                    {
                                        entities[i].state = 2;
                                    }
                                    else
                                    {
                                        temp -= 10;
                                        if (temp < 10)
                                        {
                                            entities[i].state = 12;
                                        }
                                        else
                                        {
                                            entities[i].state = 10;
                                        }
                                    }
                                }
                            }
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        entities[i].tile = 180 + 8;
                        entities[i].framedelay = 15;
                        entities[i].state = 0;
                        temp = as3hx.Compat.parseInt(Math.random() * 40);
                        if (temp < 10)
                        {
                            createentity(25, 0, 11);
                        }
                        else
                        {
                            temp -= 10;
                            if (temp < 10)
                            {
                                createentity(42, 0, 11);
                            }
                            else
                            {
                                temp -= 10;
                                if (temp < 10)
                                {
                                    createentity(65, 0, 11);
                                }
                                else
                                {
                                    createentity(90, 0, 11);
                                }
                            }
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].tile = 180 + 4;
                        entities[i].framedelay = 15;
                        entities[i].state = 0;
                        temp = as3hx.Compat.parseInt(Math.random() * 30);
                        if (temp < 10)
                        {
                            createentity(60, -10, 9);
                        }
                        else
                        {
                            temp -= 10;
                            if (temp < 10)
                            {
                                createentity(60, -10, 9);
                            }
                            else
                            {
                                createentity(60, -10, 9);
                            }
                        }
                    }
                    else if (entities[i].state == 3)
                    {
                        entities[i].tile = 180 + 4;
                        entities[i].framedelay = 15;
                        entities[i].state = 0;
                        temp = as3hx.Compat.parseInt(Math.random() * 20);
                        if (temp < 10)
                        {
                            createentity(128, 30, 2);
                        }
                        else
                        {
                            createentity(138, 60, 2);
                        }
                    }
                    else if (entities[i].state == 4)
                    {
                        entities[i].tile = 180 + 4;
                        entities[i].framedelay = 15;
                        entities[i].state = 0;
                        createentity(70, -10, 9);
                        createentity(80, -20, 9);
                        createentity(90, -10, 9);
                    }
                    else if (entities[i].state == 5)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 12;
                            entities[i].framedelay = 15;
                            entities[i].state = 0;
                            createentity(105, 80, 15, -3, 0);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 6)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 8;
                            entities[i].framedelay = 15;
                            entities[i].state = 0;
                            createentity(95, 60, 15, -3, 0);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 7)
                    {
                        entities[i].tile = 180 + 12;
                        entities[i].framedelay = 15;
                        entities[i].state = 6;
                        entities[i].statedelay = 10;
                        createentity(105, 80, 15, -3, 0);
                        music.playef(8);
                    }
                    else if (entities[i].state == 8)
                    {
                        entities[i].tile = 180 + 8;
                        entities[i].framedelay = 15;
                        entities[i].state = 5;
                        entities[i].statedelay = 10;
                        createentity(95, 60, 15, -3, 0);
                        music.playef(8);
                    }
                    else if (entities[i].state == 9)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 4;
                            entities[i].framedelay = 15;
                            entities[i].state = 0;
                            createentity(95, 40, 15, -2, 0);
                            createentity(95, 40, 15, -2, 1);
                            createentity(95, 40, 15, -1.6, 1.6);
                            createentity(95, 40, 15, -1, 2);
                            createentity(95, 40, 15, 0, 2);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 10)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 8;
                            entities[i].framedelay = 15;
                            entities[i].state = 0;
                            createentity(93, 60, 15, 0, -2);
                            createentity(93, 60, 15, -1.6, -1.6);
                            createentity(93, 60, 15, -2, 0);
                            createentity(93, 60, 15, -1.6, 1.6);
                            createentity(93, 60, 15, 0, 2);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 11)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 12;
                            entities[i].framedelay = 15;
                            entities[i].state = 0;
                            createentity(105, 80, 15, 0, -2);
                            createentity(105, 80, 15, -1, -2);
                            createentity(105, 80, 15, -1.6, -1.6);
                            createentity(105, 80, 15, -2, -1);
                            createentity(105, 80, 15, -2, 0);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 12)
                    {
                        if (entities[i].framedelay < 5)
                        {
                            entities[i].tile = 180 + 4;
                            entities[i].framedelay = 15;
                            entities[i].state = 11;
                            createentity(95, 40, 15, -2, 0);
                            createentity(95, 40, 15, -2, 1);
                            createentity(95, 40, 15, -1.6, 1.6);
                            createentity(95, 40, 15, -1, 2);
                            createentity(95, 40, 15, 0, 2);
                            music.playef(8);
                        }
                    }
                    else if (entities[i].state == 80)
                    {
                        entities[i].onbullet = 0;
                        --entities[i].harmdelay;
                        entities[i].xp = 90 + Math.random() * 8 - 4;
                        entities[i].yp = 30 - Math.random() * 4;
                        if (entities[i].harmdelay == 80)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 40)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 20)
                        {
                            music.playef(13);
                            game.flashlight = 4;
                        }
                        if (entities[i].harmdelay == 2)
                        {
                            music.playef(13);
                            game.flashlight = 45;
                        }
                        createentity(entities[i].xp + 28 + Math.random() * 30, entities[i].yp + 36 + Math.random() * 3, 29);
                        createentity(entities[i].xp + 28 + Math.random() * 30, entities[i].yp + 36 + Math.random() * 3, 29);
                        if (entities[i].harmdelay <= 0)
                        {
                            game.flashlight = 10;
                            game.bg = 59;
                            game.state = 13;
                            removeentity = true;
                            music.playef(14);
                        }
                    }
                    else if (entities[i].state == 90)
                    {
                        entities[i].onbullet = 0;
                        --entities[i].harmdelay;
                        entities[i].xp = 90 + Math.random() - 0.5;
                        entities[i].yp = 30 - Math.random();
                        createentity(entities[i].xp + 28 + Math.random() * 30, entities[i].yp + 36 + Math.random() * 3, 29);
                        if (entities[i].harmdelay <= 0)
                        {
                            entities[i].state = 0;
                            entities[i].harmdelay = 0;
                            entities[i].attackdelay = 0;
                        }
                    }
                    else if (entities[i].state == 100)
                    {
                        entities[i].tile = 180 + 16;
                        entities[i].framedelay = 45;
                        entities[i].harmdelay = 45;
                        --entities[i].hp;
                        --game.currenthp;
                        game.flashlight = 4;
                        game.screenshake = 45;
                        if (entities[i].hp <= 0)
                        {
                            music.fadeout();
                            music.playef(18);
                            entities[i].state = 80;
                            entities[i].harmdelay = 120;
                            entities[i].framedelay = 120;
                            game.createblock(100, -10, 5, 110);
                            game.screenshake = 120;
                            while (wi < nentity)
                            {
                                if (entities[wi].type == 9)
                                {
                                    entities[wi].state = 10;
                                }
                                else if (entities[wi].type == 2)
                                {
                                    entities[wi].state = 1;
                                }
                                wi++;
                            }
                        }
                        else
                        {
                            music.playef(17);
                            entities[i].state = 90;
                        }
                    }
                case 28:
                    if (entities[i].state == 0)
                    {
                        if (game.eurydicemode)
                        {
                            temp = getplayer();
                            entities[i].vx *= 0.75;
                            if (entities[i].xp > entities[temp].xp + 20)
                            {
                                entities[i].vx = -2;
                            }
                            if (entities[i].xp < entities[temp].xp + 12)
                            {
                                entities[i].vx = 2;
                            }
                            entities[i].vy *= 0.75;
                            if (entities[i].yp > entities[temp].yp - 4)
                            {
                                entities[i].vy = -2;
                            }
                            if (entities[i].yp < entities[temp].yp - 12)
                            {
                                entities[i].vy = 2;
                            }
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        music.playef(19);
                        entities[i].state = 2;
                        for (qqaz in 0...2)
                        {
                            for (qwsx in 0...10)
                            {
                                createentity(entities[i].xp + 8 + qqaz, entities[i].yp + 3 + qwsx, 30);
                            }
                        }
                    }
                    else if (entities[i].state == 2)
                    {
                        entities[i].drawframe = 19;
                        --entities[i].life;
                        if (entities[i].life <= 8)
                        {
                            entities[i].invis = true;
                        }
                        entities[i].vx = 0;
                        entities[i].vy = 0;
                    }
                case 29:
                    if (entities[i].state == 0)
                    {
                        entities[i].yp -= 3;
                        entities[i].xp += Math.random() * 6 - 3;
                        --entities[i].life;
                        if (entities[i].life <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        removeentity = true;
                    }
                case 30:
                    if (entities[i].state == 0)
                    {
                        --entities[i].yp;
                        entities[i].xp += Math.random() * 4 - 1;
                        --entities[i].life;
                        if (entities[i].life <= 0)
                        {
                            entities[i].state = 1;
                        }
                    }
                    else if (entities[i].state == 1)
                    {
                        removeentity = true;
                    }
            }
        }
        else
        {
            --entities[i].statedelay;
            if (entities[i].statedelay < 0)
            {
                entities[i].statedelay = 0;
            }
        }
        if (removeentity)
        {
            help.removeObject(entities[i], entities);
            --nentity;
            return false;
        }
        return true;
    }
    
    public function init() : Void
    {
        var t : Int = 0;
        restartroom = false;
        norestartsound = false;
        nentity = 0;
        for (i in 0...300)
        {
            t = 0;
            flags.push(t);
        }
    }
    
    public function gettype(t : Int) : Bool
    {
        var i : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == t)
            {
                return true;
            }
        }
        return false;
    }
    
    public function resetflags() : Void
    {
        for (i in 0...300)
        {
            if (flags[i] == 2)
            {
                flags[i] = 0;
            }
        }
    }
    
    public function changeflag(t : Int, s : Int) : Void
    {
        flags[t] = s;
    }
    
    public function removeentitytype(help : Helpclass, t : Int) : Void
    {
		var i : Int = 0;
        while (i < nentity) {
            if (entities[i].type == t)
            {
                removeanentity(help, i);
                i--;
            }
			i++;
        }
    }
    
    public function animateentities(i : Int, help : Helpclass, game : Gameclass) : Void
    {
        if (entities[i].statedelay <= 0)
        {
            var _sw1_ = (entities[i].type);            

            switch (_sw1_)
            {
                case 0:
                    --entities[i].framedelay;
                    if (entities[i].dir == 1)
                    {
                        entities[i].drawframe = 0;
                    }
                    else
                    {
                        entities[i].drawframe = 20;
                    }
                    if (game.shotdelay > 0 && entities[i].pickupmode == 0 && entities[i].onground && entities[i].vx == 0 && !onladder && entities[i].bigfallframe == 0)
                    {
                        if (game.isshooting)
                        {
                            if (entities[i].dir == 1)
                            {
                                entities[i].drawframe = 37;
                            }
                            else
                            {
                                entities[i].drawframe = 38;
                            }
                        }
                    }
                    if (entities[i].pickupmode == 0)
                    {
                        if (entities[i].vx != 0 && cast(entities[i].onground, Bool))
                        {
                            if (entities[i].framedelay <= 0)
                            {
                                entities[i].framedelay = 2;
                                ++entities[i].walkingframe;
                                if (entities[i].walkingframe > 8)
                                {
                                    entities[i].walkingframe = 0;
                                }
                            }
                            entities[i].drawframe += entities[i].walkingframe + 1;
                        }
                        if (!entities[i].onground)
                        {
                            if (entities[i].jumping)
                            {
                                entities[i].drawframe += 1;
                            }
                            else
                            {
                                entities[i].drawframe += 2;
                            }
                        }
                        else if (onladder)
                        {
                            if (entities[i].dir == 1)
                            {
                                entities[i].drawframe = 12;
                            }
                            else
                            {
                                entities[i].drawframe = 32;
                            }
                        }
                        else if (entities[i].bigfallframe > 0)
                        {
                            if (entities[i].bigfallframe == 4)
                            {
                                entities[i].bigfallframe = 3;
                                entities[i].bigfallframedelay = 2;
                            }
                            --entities[i].bigfallframedelay;
                            if (entities[i].bigfallframedelay <= 0)
                            {
                                entities[i].bigfallframedelay = 3;
                                --entities[i].bigfallframe;
                            }
                            if (entities[i].bigfallframe > 0)
                            {
                                if (entities[i].dir == 1)
                                {
                                    if (entities[i].bigfallframe == 3)
                                    {
                                        entities[i].drawframe = 10;
                                    }
                                    if (entities[i].bigfallframe == 2)
                                    {
                                        entities[i].drawframe = 11;
                                    }
                                    if (entities[i].bigfallframe == 1)
                                    {
                                        entities[i].drawframe = 10;
                                    }
                                }
                                else
                                {
                                    if (entities[i].bigfallframe == 3)
                                    {
                                        entities[i].drawframe = 30;
                                    }
                                    if (entities[i].bigfallframe == 2)
                                    {
                                        entities[i].drawframe = 31;
                                    }
                                    if (entities[i].bigfallframe == 1)
                                    {
                                        entities[i].drawframe = 30;
                                    }
                                }
                            }
                        }
                    }
                    else if (entities[i].pickupmode == 1)
                    {
                        if (entities[i].framedelay <= 0)
                        {
                            entities[i].framedelay = 2;
                            ++entities[i].pickupframe;
                            if (entities[i].pickupframe > 2)
                            {
                                entities[i].pickupframe = 2;
                                entities[i].pickupmode = 2;
                            }
                        }
                        entities[i].drawframe = 14 + entities[i].pickupframe;
                    }
                    else if (entities[i].pickupmode == 2)
                    {
                        if (entities[i].framedelay <= 0)
                        {
                            entities[i].framedelay = 2;
                            --entities[i].pickupframe;
                            if (entities[i].pickupframe < 0)
                            {
                                entities[i].pickupframe = 0;
                                entities[i].pickupmode = 0;
                            }
                        }
                        entities[i].drawframe = 14 + entities[i].pickupframe;
                    }
                case 2:
                    --entities[i].framedelay;
                    entities[i].drawframe = entities[i].tile;
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 2;
                        ++entities[i].walkingframe;
                        if (entities[i].walkingframe > 3)
                        {
                            entities[i].walkingframe = 0;
                        }
                    }
                    entities[i].drawframe += entities[i].walkingframe;
                case 6:
                    --entities[i].framedelay;
                    if (entities[i].dir == 1)
                    {
                        entities[i].drawframe = entities[i].tile;
                    }
                    else
                    {
                        entities[i].drawframe = entities[i].tile + 4;
                    }
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 2;
                        ++entities[i].walkingframe;
                        if (entities[i].walkingframe > 3)
                        {
                            entities[i].walkingframe = 0;
                        }
                    }
                    if (Math.abs(entities[i].vx) > 1)
                    {
                        entities[i].drawframe += entities[i].walkingframe;
                    }
                case 9:
                    if (entities[i].tile == 89)
                    {
                        --entities[i].framedelay;
                        if (entities[i].framedelay <= 0)
                        {
                            entities[i].framedelay = 2;
                            ++entities[i].walkingframe;
                            if (entities[i].walkingframe > 3)
                            {
                                entities[i].walkingframe = 0;
                            }
                        }
                        if (Math.abs(entities[i].vx) > 1)
                        {
                            entities[i].drawframe = 89 + entities[i].walkingframe;
                        }
                        else
                        {
                            entities[i].drawframe = 89;
                        }
                    }
                case 12:
                    if (entities[i].state == 0)
                    {
                        entities[i].drawframe = entities[i].tile;
                    }
                    else if (entities[i].onground)
                    {
                        entities[i].drawframe = entities[i].tile + 1;
                    }
                    else
                    {
                        entities[i].drawframe = entities[i].tile + 2;
                    }
                case 17:
                    --entities[i].framedelay;
                    if (entities[i].dir == 1)
                    {
                        entities[i].drawframe = entities[i].tile;
                    }
                    else
                    {
                        entities[i].drawframe = entities[i].tile + 40;
                    }
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 2;
                        ++entities[i].walkingframe;
                        if (entities[i].walkingframe > 6)
                        {
                            entities[i].walkingframe = 0;
                        }
                    }
                    if (Math.abs(entities[i].vx) >= 1)
                    {
                        entities[i].drawframe += 2 + entities[i].walkingframe * 2;
                    }
                case 19, 20:
                    --entities[i].framedelay;
                    entities[i].drawframe = entities[i].tile;
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 1;
                        ++entities[i].walkingframe;
                        if (entities[i].walkingframe > 1)
                        {
                            entities[i].walkingframe = 0;
                        }
                    }
                    entities[i].drawframe += entities[i].walkingframe;
                case 25:
                    --entities[i].framedelay;
                    entities[i].drawframe = entities[i].tile;
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 15;
                        ++entities[i].walkingframe;
                        if (entities[i].walkingframe > 1)
                        {
                            entities[i].walkingframe = 0;
                        }
                    }
                    entities[i].drawframe += entities[i].walkingframe;
                case 26:
                    --entities[i].framedelay;
                    if (entities[i].dir == 1)
                    {
                        entities[i].drawframe = entities[i].tile;
                    }
                    else
                    {
                        entities[i].drawframe = entities[i].tile + 4;
                    }
                    if (entities[i].harmdelay > 0)
                    {
                        entities[i].drawframe += 3;
                    }
                    else if (!entities[i].onground)
                    {
                        if (entities[i].vy < 0)
                        {
                            entities[i].drawframe += 2;
                        }
                        else
                        {
                            entities[i].drawframe += 1;
                        }
                    }
                    if (Math.abs(entities[i].vx) > 1)
                    {
                        entities[i].drawframe += entities[i].walkingframe;
                    }
                case 27:
                    --entities[i].framedelay;
                    if (entities[i].framedelay <= 0)
                    {
                        entities[i].framedelay = 0;
                    }
                    entities[i].drawframe = entities[i].tile;
                default:
                    entities[i].drawframe = entities[i].tile;
            }
        }
        else
        {
            --entities[i].statedelay;
            if (entities[i].statedelay < 0)
            {
                entities[i].statedelay = 0;
            }
        }
    }
    
    public function checkladder(game : Gameclass) : Bool
    {
        var i : Int = 0;
        var j : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == 0)
            {
                tempx = as3hx.Compat.parseInt(entities[i].xp + entities[i].cx);
                tempy = as3hx.Compat.parseInt(entities[i].yp + entities[i].cy);
                tempw = entities[i].cw;
                temph = entities[i].ch;
                temprect = new Rectangle(tempx, tempy, tempw, temph);
                j = 0;
                while (j < game.nblocks)
                {
                    if (game.blocks[j].type == 2)
                    {
                        if (game.blocks[j].rect.intersects(temprect))
                        {
                            return true;
                        }
                    }
                    j++;
                }
            }
        }
        return false;
    }
    
    public function checktrigger(game : Gameclass) : Bool
    {
        var i : Int = 0;
        var j : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == 0)
            {
                tempx = as3hx.Compat.parseInt(entities[i].xp + entities[i].cx);
                tempy = as3hx.Compat.parseInt(entities[i].yp + entities[i].cy);
                tempw = entities[i].cw;
                temph = entities[i].ch;
                temprect = new Rectangle(tempx, tempy, tempw, temph);
                j = 0;
                while (j < game.nblocks)
                {
                    if (game.blocks[j].type == 1)
                    {
                        if (game.blocks[j].rect.intersects(temprect))
                        {
                            activetrigger = game.blocks[j].trigger;
                            return true;
                        }
                    }
                    j++;
                }
            }
        }
        return false;
    }
    
    public function getplayer() : Int
    {
        var i : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == 0)
            {
                return i;
            }
        }
        return -1;
    }
    
    public function testwallsx(game : Gameclass, t : Int, tx : Int, ty : Int) : Bool
    {
        var i : Int = 0;
        tempx = as3hx.Compat.parseInt(tx + entities[t].cx);
        tempy = as3hx.Compat.parseInt(ty + entities[t].cy);
        tempw = entities[t].cw;
        temph = entities[t].ch;
        temprect = new Rectangle(tempx, tempy, tempw, temph);
        if (checkwall(game))
        {
            if (entities[t].vx > 1)
            {
                --entities[t].vx;
                entities[t].newxp = entities[t].xp + entities[t].vx;
                return testwallsx(game, t, entities[t].newxp, entities[t].yp);
            }
            if (entities[t].vx < -1)
            {
                ++entities[t].vx;
                entities[t].newxp = entities[t].xp + entities[t].vx;
                return testwallsx(game, t, entities[t].newxp, entities[t].yp);
            }
            entities[t].vx = 0;
            return false;
        }
        return true;
    }
    
    public function testwallsy(game : Gameclass, t : Int, tx : Int, ty : Int) : Bool
    {
        var i : Int = 0;
        tempx = as3hx.Compat.parseInt(tx + entities[t].cx);
        tempy = as3hx.Compat.parseInt(ty + entities[t].cy);
        tempw = entities[t].cw;
        temph = entities[t].ch;
        temprect = new Rectangle(tempx, tempy, tempw, temph);
        if (checkwall(game))
        {
            if (entities[t].vy > 1)
            {
                --entities[t].vy;
                entities[t].newyp = entities[t].yp + entities[t].vy;
                return testwallsy(game, t, entities[t].xp, entities[t].newyp);
            }
            if (entities[t].vy < -1)
            {
                ++entities[t].vy;
                entities[t].newyp = entities[t].yp + entities[t].vy;
                return testwallsy(game, t, entities[t].xp, entities[t].newyp);
            }
            entities[t].vy = 0;
            return false;
        }
        return true;
    }
    
    public function confirmflags() : Void
    {
        for (i in 0...300)
        {
            if (flags[i] == 2)
            {
                flags[i] = 1;
            }
        }
    }
    
    public function checkwall(game : Gameclass) : Bool
    {
        var i : Int = 0;
        i = 0;
        while (i < game.nblocks)
        {
            if (game.blocks[i].type == 0)
            {
                if (game.blocks[i].rect.intersects(temprect))
                {
                    return true;
                }
            }
            i++;
        }
        return false;
    }
    
    public function removeanentity(help : Helpclass, t : Int) : Void
    {
        help.removeObject(entities[t], entities);
        --nentity;
    }
    
    public function removeallentities(help : Helpclass) : Void
    {
        while (nentity > 0)
        {
            removeanentity(help, 0);
        }
    }
    
    public function createentity(xp : Float, yp : Float, t : Int, vx : Float = 0, vy : Float = 0, para : Int = 0) : Void
    {
        var entity : Dynamic = null;
        if (para == 0 || flags[para] == 0 || t == 23 || t == 22)
        {
            entity = {};
            switch (t)
            {
                case 0:
                    entity.type = 0;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.onground = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.gravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 6;
                    entity.cy = 0;
                    entity.cw = 5;
                    entity.ch = 16;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 0;
                    entity.life = 15;
                    entity.framedelay = 0;
                    entity.drawframe = 0;
                    entity.walkingframe = 0;
                    entity.dir = 0;
                    entity.bigfallframe = 0;
                    entity.bigfallframedelay = 0;
                    entity.bigfallcounter = 0;
                    entity.pickupmode = 0;
                    entity.pickupframe = 0;
                case 1:
                    entity.type = 1;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 6;
                    entity.ch = 3;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 40;
                    entity.drawframe = 40;
                case 2:
                    entity.type = 2;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 1;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 2;
                    entity.cy = 0;
                    entity.cw = 7;
                    entity.ch = 5;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 60;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 60;
                    entity.walkingframe = 0;
                case 3:
                    entity.type = 3;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 11;
                    entity.ch = 5;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 64;
                    entity.framedelay = 0;
                    entity.drawframe = 64;
                    entity.walkingframe = 0;
                case 4:
                    entity.type = 4;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 2;
                    entity.ch = 6;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.life = 20;
                    entity.tile = 42;
                    entity.drawframe = 42;
                case 5:
                    entity.type = 5;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 1;
                    entity.ch = 1;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 41;
                    entity.framedelay = 0;
                    entity.drawframe = 41;
                    entity.life = 20;
                case 6:
                    entity.type = 6;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 2;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 3;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.hp = 3;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 5;
                    entity.cy = 5;
                    entity.cw = 9;
                    entity.ch = 11;
                    entity.gravity = true;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 1;
                    entity.statedelay = 0;
                    entity.tile = 80;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 80;
                    entity.walkingframe = 0;
                case 7:
                    entity.type = 3;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 16;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 88;
                    entity.framedelay = 0;
                    entity.drawframe = 88;
                    entity.walkingframe = 0;
                case 8:
                    entity.type = 8;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 5;
                    entity.ch = 4;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 43;
                    entity.framedelay = 0;
                    entity.drawframe = 43;
                    entity.walkingframe = 0;
                case 9:
                    entity.type = 9;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 2;
                    entity.onentity = true;
                    entity.onbullet = 10;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 2;
                    entity.cy = 0;
                    entity.cw = 12;
                    entity.ch = 8;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 93;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 93;
                    entity.walkingframe = 0;
                case 10:
                    entity.type = 3;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 12;
                    entity.ch = 6;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 95;
                    entity.framedelay = 0;
                    entity.drawframe = 95;
                    entity.walkingframe = 0;
                case 11:
                    entity.type = 11;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 2;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 5;
                    entity.ch = 16;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 65;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 65;
                    entity.walkingframe = 0;
                case 12:
                    entity.type = 12;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 10;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.hp = 3;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 1;
                    entity.cy = 3;
                    entity.cw = 6;
                    entity.ch = 13;
                    entity.gravity = true;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 66;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 66;
                    entity.walkingframe = 0;
                case 13:
                    entity.type = 3;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 16;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 69;
                    entity.framedelay = 0;
                    entity.drawframe = 69;
                    entity.walkingframe = 0;
                case 14:
                    entity.type = 3;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 16;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 70;
                    entity.framedelay = 0;
                    entity.drawframe = 70;
                    entity.walkingframe = 0;
                case 15:
                    entity.type = 15;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 1;
                    entity.cy = 1;
                    entity.cw = 4;
                    entity.ch = 4;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 44;
                    entity.drawframe = 44;
                case 16:
                    entity.type = 5;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 1;
                    entity.ch = 1;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 50;
                    entity.framedelay = 0;
                    entity.drawframe = 50;
                    entity.life = 4;
                case 17:
                    entity.type = 17;
                    entity.size = 1;
                    entity.onwall = 0;
                    entity.onxwall = 1;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 10;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.hp = 4;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 10;
                    entity.cy = 0;
                    entity.cw = 12;
                    entity.ch = 32;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 100;
                    entity.charge = 40;
                    entity.bulletvel = 0;
                    entity.roar = false;
                    entity.framedelay = 0;
                    entity.drawframe = 100;
                    entity.walkingframe = 0;
                case 18:
                    entity.type = 15;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.gravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = -6;
                    entity.ay = -16;
                    entity.jumping = true;
                    entity.jumpframe = 24;
                    entity.cx = 1;
                    entity.cy = 1;
                    entity.cw = 4;
                    entity.ch = 4;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 44;
                    entity.drawframe = 44;
                case 19:
                    entity.type = 19;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 2;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 1;
                    entity.cy = 0;
                    entity.cw = 2;
                    entity.ch = 16;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 47;
                    entity.drawframe = 47;
                    entity.framedelay = 0;
                    entity.walkingframe = 0;
                case 20:
                    entity.type = 20;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onywall = 0;
                    entity.onxwall = 2;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 4;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 45;
                    entity.drawframe = 45;
                    entity.framedelay = 0;
                    entity.walkingframe = 0;
                case 21:
                    entity.type = 21;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onywall = 0;
                    entity.onxwall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = 0;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 9;
                    entity.ch = 9;
                    entity.state = vx;
                    entity.statedelay = 0;
                    entity.tile = 49;
                    entity.drawframe = 49;
                    entity.framedelay = 0;
                    entity.walkingframe = 0;
                case 22:
                    entity.type = 22;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onywall = 0;
                    entity.onxwall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 8;
                    entity.ch = 3;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 51;
                    entity.drawframe = 51;
                    entity.framedelay = para;
                    entity.walkingframe = 0;
                case 23:
                    entity.type = 23;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onywall = 0;
                    entity.onxwall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 4;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 33;
                    entity.drawframe = 33;
                    entity.framedelay = para;
                    entity.walkingframe = 0;
                case 24:
                    entity.type = 24;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onywall = 0;
                    entity.onxwall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.onplayer = 2;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 5;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 53;
                    entity.drawframe = 53;
                    entity.framedelay = 0;
                    entity.walkingframe = 0;
                case 25:
                    entity.type = 25;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.harmful = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.cx = 1;
                    entity.cy = 0;
                    entity.cw = 2;
                    entity.ch = 16;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 47;
                    entity.drawframe = 47;
                    entity.framedelay = 0;
                    entity.walkingframe = vx;
                case 26:
                    entity.type = 26;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 10;
                    entity.harmful = true;
                    entity.hp = 3;
                    entity.oxp = 0;
                    entity.oyp = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 4;
                    entity.cy = 5;
                    entity.cw = 12;
                    entity.ch = 11;
                    entity.gravity = true;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 71;
                    entity.bulletvel = 0;
                    entity.framedelay = 0;
                    entity.drawframe = 71;
                    entity.walkingframe = 0;
                    entity.attackdelay = 0;
                    entity.harmdelay = 0;
                case 27:
                    entity.type = 27;
                    entity.size = 2;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 100;
                    entity.harmful = true;
                    entity.flag = para;
                    entity.hp = 5;
                    entity.onground = false;
                    entity.gravity = true;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 32;
                    entity.cy = 0;
                    entity.cw = 16;
                    entity.ch = 80;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 180;
                    entity.charge = 40;
                    entity.bulletvel = 0;
                    entity.roar = false;
                    entity.framedelay = 0;
                    entity.drawframe = 180;
                    entity.walkingframe = 0;
                    entity.attackdelay = 30;
                    entity.harmdelay = 0;
                case 28:
                    entity.type = 28;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = true;
                    entity.onbullet = 0;
                    entity.harmful = false;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 4;
                    entity.cy = 2;
                    entity.cw = 8;
                    entity.ch = 14;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 18;
                    entity.bulletvel = 0;
                    entity.life = 15;
                    entity.framedelay = 0;
                    entity.drawframe = 18;
                    entity.walkingframe = 0;
                case 29:
                    entity.type = 29;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = false;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 1;
                    entity.ch = 1;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 50;
                    entity.life = 40;
                    entity.framedelay = 0;
                    entity.drawframe = 50;
                case 30:
                    entity.type = 30;
                    entity.size = 0;
                    entity.onwall = 1;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onground = false;
                    entity.gravity = false;
                    entity.xgravity = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 0;
                    entity.cy = 0;
                    entity.cw = 1;
                    entity.ch = 1;
                    entity.vx = vx;
                    entity.vy = vy;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 50;
                    entity.life = 40;
                    entity.framedelay = 0;
                    entity.drawframe = 50;
                case 31:
                    entity.type = 31;
                    entity.size = 0;
                    entity.onwall = 0;
                    entity.onxwall = 0;
                    entity.onywall = 0;
                    entity.onentity = false;
                    entity.onbullet = 0;
                    entity.onground = false;
                    entity.jumping = false;
                    entity.jumpframe = 0;
                    entity.gravity = true;
                    entity.ax = 0;
                    entity.ay = 0;
                    entity.xp = xp;
                    entity.yp = yp;
                    entity.cx = 6;
                    entity.cy = 0;
                    entity.cw = 5;
                    entity.ch = 16;
                    entity.vx = 0;
                    entity.vy = 0;
                    entity.state = 0;
                    entity.statedelay = 0;
                    entity.tile = 20;
                    entity.life = 15;
                    entity.framedelay = 0;
                    entity.drawframe = 20;
                    entity.walkingframe = 0;
                    entity.dir = 0;
                    entity.bigfallframe = 0;
                    entity.bigfallframedelay = 0;
                    entity.bigfallcounter = 0;
                    entity.pickupmode = 0;
                    entity.pickupframe = 0;
            }
            entities.push(entity);
            ++nentity;
        }
    }
    
    public function applyfriction(t : Int, xrate : Float, yrate : Float) : Void
    {
        if (entities[t].xgravity)
        {
            if (Math.abs(entities[t].vx) <= xrate)
            {
                entities[t].vx = 0;
            }
        }
        if (Math.abs(entities[t].vy) <= yrate)
        {
            entities[t].vy = 0;
        }
        if (entities[t].xgravity)
        {
            if (entities[t].vx > 0)
            {
                entities[t].vx -= xrate;
            }
        }
        if (entities[t].xgravity)
        {
            if (entities[t].vx < 0)
            {
                entities[t].vx += xrate;
            }
        }
        if (entities[t].vy > 0)
        {
            entities[t].vy -= yrate;
        }
        if (entities[t].vy < 0)
        {
            entities[t].vy += yrate;
        }
        if (entities[t].vy > 4)
        {
            entities[t].vy = 4;
        }
        if (entities[t].vy < -3)
        {
            entities[t].vy = -3;
        }
        if (entities[t].vx > 3)
        {
            entities[t].vx = 3;
        }
        if (entities[t].vx < -3)
        {
            entities[t].vx = -3;
        }
    }
    
    public function entitycollidefloor(game : Gameclass, t : Int) : Bool
    {
        tempx = as3hx.Compat.parseInt(entities[t].xp + entities[t].cx);
        tempy = as3hx.Compat.parseInt(entities[t].yp + entities[t].cy + 1);
        tempw = entities[t].cw;
        temph = entities[t].ch;
        temprect = new Rectangle(tempx, tempy, tempw, temph);
        if (checkwall(game))
        {
            return true;
        }
        return false;
    }
    
    public function geteurydice() : Int
    {
        var i : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == 28)
            {
                return i;
            }
        }
        return -1;
    }
    
    public function checkdamage(game : Gameclass) : Bool
    {
        var i : Int = 0;
        var j : Int = 0;
        for (i in 0...nentity)
        {
            if (entities[i].type == 0)
            {
                tempx = as3hx.Compat.parseInt(entities[i].xp + entities[i].cx);
                tempy = as3hx.Compat.parseInt(entities[i].yp + entities[i].cy);
                tempw = entities[i].cw;
                temph = entities[i].ch;
                temprect = new Rectangle(tempx, tempy, tempw, temph);
                j = 0;
                while (j < game.nblocks)
                {
                    if (game.blocks[j].type == 3)
                    {
                        if (game.blocks[j].rect.intersects(temprect))
                        {
                            return true;
                        }
                    }
                    j++;
                }
            }
        }
        return false;
    }
    
    public function entitycollide(a : Int, b : Int) : Bool
    {
        tempx = as3hx.Compat.parseInt(entities[a].xp + entities[a].cx);
        tempy = as3hx.Compat.parseInt(entities[a].yp + entities[a].cy);
        tempw = entities[a].cw;
        temph = entities[a].ch;
        temprect = new Rectangle(tempx, tempy, tempw, temph);
        tempx = as3hx.Compat.parseInt(entities[b].xp + entities[b].cx);
        tempy = as3hx.Compat.parseInt(entities[b].yp + entities[b].cy);
        tempw = entities[b].cw;
        temph = entities[b].ch;
        if (temprect.intersects(new Rectangle(tempx, tempy, tempw, temph)))
        {
            return true;
        }
        return false;
    }
}


