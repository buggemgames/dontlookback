import bigroom.input.KeyPoll;
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;
import flash.ui.Keyboard;

class RealMain extends Sprite
{
    public var pi : Int;
    
    public var game : Gameclass;
    
    private var im_opt_offline1 : Class<Dynamic> = MainImOptOffline1;
    
    public var dwgfx : Dwgraphicsclass = new Dwgraphicsclass();
    
    public var pj : Int;
    
    private var ef_0 : Class<Dynamic> = MainEf0;
    
    private var ef_1 : Class<Dynamic> = MainEf1;
    
    private var ef_2 : Class<Dynamic> = MainEf2;
    
    private var ef_3 : Class<Dynamic> = MainEf3;
    
    private var ef_4 : Class<Dynamic> = MainEf4;
    
    private var amb_3 : Class<Dynamic> = MainAmb3;
    
    private var ef_6 : Class<Dynamic> = MainEf6;
    
    private var ef_7 : Class<Dynamic> = MainEf7;
    
    private var ef_8 : Class<Dynamic> = MainEf8;
    
    private var ef_9 : Class<Dynamic> = MainEf9;
    
    private var ef_5 : Class<Dynamic> = MainEf5;
    
    public var music : Musicclass = new Musicclass();
    
    private var im_opt_newgame1 : Class<Dynamic> = MainImOptNewgame1;
    
    private var im_opt_newgame2 : Class<Dynamic> = MainImOptNewgame2;
    
    public var clickedlogo : Bool;
    
    private var im_title1 : Class<Dynamic> = MainImTitle1;
    
    private var im_title2 : Class<Dynamic> = MainImTitle2;
    
    public var key : KeyPoll;
    
    public var pixel2 : Int;
    
    private var ef_10 : Class<Dynamic> = MainEf10;
    
    private var ef_11 : Class<Dynamic> = MainEf11;
    
    private var ef_12 : Class<Dynamic> = MainEf12;
    
    private var im_website : Class<Dynamic> = MainImWebsite;
    
    private var ef_14 : Class<Dynamic> = MainEf14;
    
    private var ef_16 : Class<Dynamic> = MainEf16;
    
    private var ef_17 : Class<Dynamic> = MainEf17;
    
    private var ef_18 : Class<Dynamic> = MainEf18;
    
    public var pixel : Int;
    
    private var ef_13 : Class<Dynamic> = MainEf13;
    
    private var ef_15 : Class<Dynamic> = MainEf15;
    
    private var ef_19 : Class<Dynamic> = MainEf19;
    
    public var GAMEMODE(default, never) : Int = 0;
    
    private var music_1 : Class<Dynamic> = MainMusic1;
    
    private var music_2 : Class<Dynamic> = MainMusic2;
    
    private var music_3 : Class<Dynamic> = MainMusic3;
    
    private var im_background_0 : Class<Dynamic> = MainImBackground0;
    
    private var im_background_1 : Class<Dynamic> = MainImBackground1;
    
    private var im_background_2 : Class<Dynamic> = MainImBackground2;
    
    private var im_background_3 : Class<Dynamic> = MainImBackground3;
    
    public var slogo : MovieClip;
    
    private var im_background_5 : Class<Dynamic> = MainImBackground5;
    
    private var im_background_6 : Class<Dynamic> = MainImBackground6;
    
    private var im_background_7 : Class<Dynamic> = MainImBackground7;
    
    private var im_background_8 : Class<Dynamic> = MainImBackground8;
    
    private var im_background_9 : Class<Dynamic> = MainImBackground9;
    
    private var im_background_4 : Class<Dynamic> = MainImBackground4;
    
    private var music_4 : Class<Dynamic> = MainMusic4;
    
    private var im_opt_restore2 : Class<Dynamic> = MainImOptRestore2;
    
    private var ef_22 : Class<Dynamic> = MainEf22;
    
    private var im_opt_restore1 : Class<Dynamic> = MainImOptRestore1;
    
    private var im_tiles : Class<Dynamic> = MainImTiles;
    
    private var im_sponsorwebsite : Class<Dynamic> = MainImSponsorwebsite;
    
    private var ef_21 : Class<Dynamic> = MainEf21;
    
    private var im_bfontmask : Class<Dynamic> = MainImBfontmask;
    
    private var im_creditline1 : Class<Dynamic> = MainImCreditline1;
    
    private var im_creditline2 : Class<Dynamic> = MainImCreditline2;
    
    private var im_presszorup : Class<Dynamic> = MainImPresszorup;
    
    private var ef_20 : Class<Dynamic> = MainEf20;
    
    private var im_bfont : Class<Dynamic> = MainImBfont;
    
    private var im_opt_visitsite2 : Class<Dynamic> = MainImOptVisitsite2;
    
    private var footsteps_1 : Class<Dynamic> = MainFootsteps1;
    
    private var im_opt_visitsite1 : Class<Dynamic> = MainImOptVisitsite1;
    
    private var im_pressxorspace : Class<Dynamic> = MainImPressxorspace;
    
    private var im_background_10 : Class<Dynamic> = MainImBackground10;
    
    private var im_background_11 : Class<Dynamic> = MainImBackground11;
    
    public var obj : Entityclass = new Entityclass();
    
    private var im_background_13 : Class<Dynamic> = MainImBackground13;
    
    private var im_background_14 : Class<Dynamic> = MainImBackground14;
    
    private var im_background_15 : Class<Dynamic> = MainImBackground15;
    
    private var im_background_16 : Class<Dynamic> = MainImBackground16;
    
    private var im_background_17 : Class<Dynamic> = MainImBackground17;
    
    private var im_background_18 : Class<Dynamic> = MainImBackground18;
    
    private var im_background_19 : Class<Dynamic> = MainImBackground19;
    
    private var footsteps_2 : Class<Dynamic> = MainFootsteps2;
    
    private var im_sponsorwebsite2 : Class<Dynamic> = MainImSponsorwebsite2;
    
    private var im_background_12 : Class<Dynamic> = MainImBackground12;
    
    private var footsteps_3 : Class<Dynamic> = MainFootsteps3;
    
    private var im_background_20 : Class<Dynamic> = MainImBackground20;
    
    private var im_pressarrowkeys : Class<Dynamic> = MainImPressarrowkeys;
    
    private var im_background_22 : Class<Dynamic> = MainImBackground22;
    
    private var im_background_23 : Class<Dynamic> = MainImBackground23;
    
    private var im_background_25 : Class<Dynamic> = MainImBackground25;
    
    private var im_background_26 : Class<Dynamic> = MainImBackground26;
    
    private var im_background_27 : Class<Dynamic> = MainImBackground27;
    
    private var im_background_21 : Class<Dynamic> = MainImBackground21;
    
    private var im_background_29 : Class<Dynamic> = MainImBackground29;
    
    private var im_background_24 : Class<Dynamic> = MainImBackground24;
    
    private var im_background_28 : Class<Dynamic> = MainImBackground28;
    
    private var im_opt_fullscreen1 : Class<Dynamic> = MainImOptFullscreen1;
    
    private var im_opt_fullscreen2 : Class<Dynamic> = MainImOptFullscreen2;
    
    private var im_background_30 : Class<Dynamic> = MainImBackground30;
    
    private var im_background_32 : Class<Dynamic> = MainImBackground32;
    
    private var im_background_34 : Class<Dynamic> = MainImBackground34;
    
    private var im_background_36 : Class<Dynamic> = MainImBackground36;
    
    private var im_background_38 : Class<Dynamic> = MainImBackground38;
    
    private var im_background_33 : Class<Dynamic> = MainImBackground33;
    
    private var im_background_35 : Class<Dynamic> = MainImBackground35;
    
    public var help : Helpclass = new Helpclass();
    
    private var im_background_37 : Class<Dynamic> = MainImBackground37;
    
    private var im_background_31 : Class<Dynamic> = MainImBackground31;
    
    private var im_background_40 : Class<Dynamic> = MainImBackground40;
    
    private var im_background_41 : Class<Dynamic> = MainImBackground41;
    
    private var im_background_43 : Class<Dynamic> = MainImBackground43;
    
    private var im_background_45 : Class<Dynamic> = MainImBackground45;
    
    private var im_background_46 : Class<Dynamic> = MainImBackground46;
    
    private var im_background_47 : Class<Dynamic> = MainImBackground47;
    
    private var im_background_48 : Class<Dynamic> = MainImBackground48;
    
    private var im_background_49 : Class<Dynamic> = MainImBackground49;
    
    private var im_background_44 : Class<Dynamic> = MainImBackground44;
    
    private var im_background_39 : Class<Dynamic> = MainImBackground39;
    
    private var im_background_42 : Class<Dynamic> = MainImBackground42;
    
    private var im_background_50 : Class<Dynamic> = MainImBackground50;
    
    private var im_background_51 : Class<Dynamic> = MainImBackground51;
    
    private var im_background_52 : Class<Dynamic> = MainImBackground52;
    
    private var im_background_53 : Class<Dynamic> = MainImBackground53;
    
    private var im_background_54 : Class<Dynamic> = MainImBackground54;
    
    private var im_background_55 : Class<Dynamic> = MainImBackground55;
    
    private var im_background_56 : Class<Dynamic> = MainImBackground56;
    
    private var im_background_58 : Class<Dynamic> = MainImBackground58;
    
    private var im_background_59 : Class<Dynamic> = MainImBackground59;
    
    private var im_background_57 : Class<Dynamic> = MainImBackground57;
    
    private var im_background_60 : Class<Dynamic> = MainImBackground60;
    
    private var im_sponscreditline1 : Class<Dynamic> = MainImSponscreditline1;
    
    private var im_sponscreditline2 : Class<Dynamic> = MainImSponscreditline2;
    
    public var logoposition : Matrix;
    
    public var gamestate : Int;
    
    private var amb_1 : Class<Dynamic> = MainAmb1;
    
    private var amb_2 : Class<Dynamic> = MainAmb2;
    
    private var amb_4 : Class<Dynamic> = MainAmb4;
    
    private var im_opt_offline2 : Class<Dynamic> = MainImOptOffline2;
    
    public function new()
    {
        super();
        addEventListener(Event.ADDED_TO_STAGE, gameinit);
    }
    
    private function gameinit(e : Event = null) : Void
    {
        var tempbmp : Bitmap = null;
        var rc_menu : ContextMenu = null;
        var credit : ContextMenuItem = null;
        removeEventListener(Event.ADDED_TO_STAGE, gameinit);
        if (sitelock())
        {
            rc_menu = new ContextMenu();
            credit = new ContextMenuItem("Visit distractionware.com");
            credit.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, visit_distractionware);
            rc_menu.hideBuiltInItems();
            rc_menu.customItems.push(credit);
            this.contextMenu = rc_menu;
            gamestate = GAMEMODE;
            obj.init();
            help.init();
            key = new KeyPoll(stage);
            SoundMixer.soundTransform = new SoundTransform(1);
            music.currentamb = -1;
            music.currentsong = -1;
            music.musicfade = 0;
            music.step1playing = false;
            music.step2playing = false;
            music.stepchanlen = 0;
            music.initefchannels();
            music.currentefchan = 0;
            music.musicchan.push(Type.createInstance(music_1, []));
            music.musicchan.push(Type.createInstance(music_2, []));
            music.musicchan.push(Type.createInstance(music_3, []));
            music.musicchan.push(Type.createInstance(music_4, []));
            music.ambchan.push(Type.createInstance(amb_1, []));
            music.ambchan.push(Type.createInstance(amb_2, []));
            music.ambchan.push(Type.createInstance(amb_3, []));
            music.ambchan.push(Type.createInstance(amb_4, []));
            music.stepchan.push(Type.createInstance(footsteps_1, []));
            music.stepchan.push(Type.createInstance(footsteps_2, []));
            music.stepchan.push(Type.createInstance(footsteps_3, []));
            music.efchan.push(Type.createInstance(ef_0, []));
            music.efchan.push(Type.createInstance(ef_1, []));
            music.efchan.push(Type.createInstance(ef_2, []));
            music.efchan.push(Type.createInstance(ef_3, []));
            music.efchan.push(Type.createInstance(ef_4, []));
            music.efchan.push(Type.createInstance(ef_5, []));
            music.efchan.push(Type.createInstance(ef_6, []));
            music.efchan.push(Type.createInstance(ef_7, []));
            music.efchan.push(Type.createInstance(ef_8, []));
            music.efchan.push(Type.createInstance(ef_9, []));
            music.efchan.push(Type.createInstance(ef_10, []));
            music.efchan.push(Type.createInstance(ef_11, []));
            music.efchan.push(Type.createInstance(ef_12, []));
            music.efchan.push(Type.createInstance(ef_13, []));
            music.efchan.push(Type.createInstance(ef_14, []));
            music.efchan.push(Type.createInstance(ef_15, []));
            music.efchan.push(Type.createInstance(ef_16, []));
            music.efchan.push(Type.createInstance(ef_17, []));
            music.efchan.push(Type.createInstance(ef_18, []));
            music.efchan.push(Type.createInstance(ef_19, []));
            music.efchan.push(Type.createInstance(ef_20, []));
            music.efchan.push(Type.createInstance(ef_21, []));
            music.efchan.push(Type.createInstance(ef_22, []));
            game = new Gameclass(obj, help, music);
            game.standaloneversion = true;
            dwgfx.init();
            tempbmp = Type.createInstance(im_tiles, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.maketilearray();
            tempbmp = Type.createInstance(im_bfont, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfont();
            tempbmp = Type.createInstance(im_bfontmask, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfontmask();
            tempbmp = Type.createInstance(im_pressxorspace, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_pressarrowkeys, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_presszorup, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_title1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_title2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_creditline1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_creditline2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_newgame1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_newgame2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_offline1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_offline2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_visitsite1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_visitsite2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_fullscreen1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_fullscreen2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_website, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_restore1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_opt_restore2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_sponsorwebsite, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_sponscreditline1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_sponscreditline2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_sponsorwebsite2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addimage();
            tempbmp = Type.createInstance(im_background_0, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_1, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_2, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_3, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_4, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_5, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_6, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_7, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_8, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_9, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_10, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_11, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_12, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_13, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_14, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_15, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_16, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_17, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_18, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_19, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_20, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_21, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_22, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_23, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_24, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_25, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_26, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_27, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_28, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_29, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_30, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_31, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_32, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_33, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_34, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_35, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_36, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_37, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_38, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_39, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_40, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_41, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_42, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_43, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_44, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_45, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_46, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_47, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_48, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_49, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_50, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_51, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_52, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_53, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_54, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_55, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_56, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_57, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_58, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_59, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            tempbmp = Type.createInstance(im_background_60, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.addbackground();
            dwgfx.buffer = new BitmapData(160, 144, false, 0);
            addChild(dwgfx);
            music.changeamb(0);
            music.steptype = 0;
            addEventListener(Event.ENTER_FRAME, mainloop);
        }
        else
        {
            dwgfx.init();
            addChild(dwgfx);
            tempbmp = Type.createInstance(im_bfont, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfont();
            tempbmp = Type.createInstance(im_bfontmask, []);
            dwgfx.buffer = tempbmp.bitmapData;
            dwgfx.makebfontmask();
            dwgfx.buffer = new BitmapData(160, 144, false, 0);
            addEventListener(Event.ENTER_FRAME, lockedloop);
        }
    }
    
    public function gamerender(key : KeyPoll, dwgfx : Dwgraphicsclass, game : Gameclass, obj : Entityclass, help : Helpclass) : Void
    {
        var i : Int = 0;
        dwgfx.backbuffer.lock();
        dwgfx.drawbackground(game.bg);
        if (game.showblocks)
        {
            i = 0;
            while (i < game.nblocks)
            {
                if (game.blocks[i].type == 0)
                {
                    dwgfx.backbuffer.fillRect(game.blocks[i].rect, 11184810);
                }
                else if (game.blocks[i].type == 1)
                {
                    dwgfx.backbuffer.fillRect(game.blocks[i].rect, 170);
                }
                else if (game.blocks[i].type == 2)
                {
                    dwgfx.backbuffer.fillRect(game.blocks[i].rect, 43520);
                }
                else if (game.blocks[i].type == 3)
                {
                    dwgfx.backbuffer.fillRect(game.blocks[i].rect, 16711680);
                }
                i++;
            }
        }
        dwgfx.drawentities(obj, help);
        if (game.totalhp > 0)
        {
            dwgfx.drawbossmeter(game);
        }
        if (obj.restartroom && obj.restartmode > -1)
        {
            dwgfx.backbuffer.fillRect(new Rectangle(0, 0, 160, 8 * obj.restartcounter), 1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(0, 144 - 8 * obj.restartcounter, 160, 180), 1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(0, 0, 9 * obj.restartcounter, 144), 1114884);
            dwgfx.backbuffer.fillRect(new Rectangle(160 - 9 * obj.restartcounter, 0, 190, 144), 1114884);
        }
        if (game.showimage > 0)
        {
            --game.showimage;
            if (game.showimage > 130)
            {
                dwgfx.drawimage(game.currentimage, 0, 140 - game.showimage, true);
            }
            else if (game.showimage < 20)
            {
                dwgfx.drawimage(game.currentimage, 0, game.showimage - 10, true);
            }
            else
            {
                dwgfx.drawimage(game.currentimage, 0, 10, true);
            }
        }
        if (game.showcreditline > 1)
        {
            if (game.kongversion)
            {
                dwgfx.drawimage(20, 0, 8, true);
            }
            else
            {
                dwgfx.drawimage(6, 0, 16, true);
            }
        }
        else if (game.showcreditline == 1)
        {
            if (game.kongversion)
            {
                dwgfx.drawimage(19, 0, 8, true);
            }
            else
            {
                dwgfx.drawimage(5, 0, 16, true);
            }
        }
        if (game.showtitle > 1)
        {
            dwgfx.drawimage(4, 0, 8, true);
        }
        else if (game.showtitle == 1)
        {
            dwgfx.drawimage(3, 0, 8, true);
        }
        if (game.showmenu > 0)
        {
            if (game.standaloneversion)
            {
                if (game.savepoint > 0)
                {
                    if (game.newgamehighlighted)
                    {
                        dwgfx.drawimage(7, 0, 32, true);
                    }
                    else
                    {
                        dwgfx.drawimage(8, 0, 32, true);
                    }
                    if (game.restorehighlighted)
                    {
                        dwgfx.drawimage(16, 0, 42, true);
                    }
                    else
                    {
                        dwgfx.drawimage(17, 0, 42, true);
                    }
                    if (game.visithighlighted)
                    {
                        dwgfx.drawimage(11, 0, 52, true);
                    }
                    else
                    {
                        dwgfx.drawimage(12, 0, 52, true);
                    }
                }
                else
                {
                    if (game.newgamehighlighted)
                    {
                        dwgfx.drawimage(7, 0, 37, true);
                    }
                    else
                    {
                        dwgfx.drawimage(8, 0, 37, true);
                    }
                    if (game.visithighlighted)
                    {
                        dwgfx.drawimage(11, 0, 47, true);
                    }
                    else
                    {
                        dwgfx.drawimage(12, 0, 47, true);
                    }
                }
                dwgfx.drawimage(13, 0, 128, true);
                dwgfx.drawimage(15, 0, 136, true);
            }
            else
            {
                if (game.savepoint > 0)
                {
                    if (game.newgamehighlighted)
                    {
                        dwgfx.drawimage(7, 0, 28, true);
                    }
                    else
                    {
                        dwgfx.drawimage(8, 0, 28, true);
                    }
                    if (game.restorehighlighted)
                    {
                        dwgfx.drawimage(16, 0, 37, true);
                    }
                    else
                    {
                        dwgfx.drawimage(17, 0, 37, true);
                    }
                    if (game.offlinehighlighted)
                    {
                        dwgfx.drawimage(9, 0, 46, true);
                    }
                    else
                    {
                        dwgfx.drawimage(10, 0, 46, true);
                    }
                    if (game.visithighlighted)
                    {
                        dwgfx.drawimage(11, 0, 55, true);
                    }
                    else
                    {
                        dwgfx.drawimage(12, 0, 55, true);
                    }
                }
                else
                {
                    if (game.newgamehighlighted)
                    {
                        dwgfx.drawimage(7, 0, 32, true);
                    }
                    else
                    {
                        dwgfx.drawimage(8, 0, 32, true);
                    }
                    if (game.offlinehighlighted)
                    {
                        dwgfx.drawimage(9, 0, 42, true);
                    }
                    else
                    {
                        dwgfx.drawimage(10, 0, 42, true);
                    }
                    if (game.visithighlighted)
                    {
                        dwgfx.drawimage(11, 0, 52, true);
                    }
                    else
                    {
                        dwgfx.drawimage(12, 0, 52, true);
                    }
                }
                if (game.kongversion)
                {
                    if (game.my > 134)
                    {
                        dwgfx.drawimage(21, 0, 135, true);
                    }
                    else
                    {
                        dwgfx.drawimage(18, 0, 135, true);
                    }
                }
                else
                {
                    dwgfx.drawimage(15, 0, 136, true);
                }
            }
        }
        if (game.standaloneversion)
        {
            if (game.savepoint > 0)
            {
                if (game.newgamehighlighted)
                {
                    dwgfx.drawimage(7, 0, 32, true);
                }
                if (game.restorehighlighted)
                {
                    dwgfx.drawimage(16, 0, 42, true);
                }
                if (game.visithighlighted)
                {
                    dwgfx.drawimage(11, 0, 52, true);
                }
            }
            else
            {
                if (game.newgamehighlighted)
                {
                    dwgfx.drawimage(7, 0, 37, true);
                }
                if (game.visithighlighted)
                {
                    dwgfx.drawimage(11, 0, 47, true);
                }
            }
        }
        else if (game.savepoint > 0)
        {
            if (game.newgamehighlighted)
            {
                dwgfx.drawimage(7, 0, 28, true);
            }
            if (game.restorehighlighted)
            {
                dwgfx.drawimage(16, 0, 37, true);
            }
            if (game.offlinehighlighted)
            {
                dwgfx.drawimage(9, 0, 46, true);
            }
            if (game.visithighlighted)
            {
                dwgfx.drawimage(11, 0, 55, true);
            }
        }
        else
        {
            if (game.newgamehighlighted)
            {
                dwgfx.drawimage(7, 0, 32, true);
            }
            if (game.offlinehighlighted)
            {
                dwgfx.drawimage(9, 0, 42, true);
            }
            if (game.visithighlighted)
            {
                dwgfx.drawimage(11, 0, 52, true);
            }
        }
        if (game.test)
        {
            dwgfx.print(2, 2, game.teststring, 255, 255, 255);
        }
        if (game.debugmode)
        {
            dwgfx.backbuffer.fillRect(new Rectangle(game.lastx, game.lasty, as3hx.Compat.parseInt(mouseX / 4) - game.lastx, as3hx.Compat.parseInt(mouseY / 4) - game.lasty), 10066329);
            dwgfx.print(2, 134, Std.string(game.lastx) + "," + Std.string(game.lasty) + ": " + Std.string(as3hx.Compat.parseInt(mouseX / 4) - game.lastx) + "," + Std.string(as3hx.Compat.parseInt(mouseY / 4) - game.lasty), 255, 255, 255);
        }
        if (game.flashlight > 0)
        {
            --game.flashlight;
            dwgfx.flashlight();
        }
        if (game.screenshake > 0)
        {
            --game.screenshake;
            dwgfx.screenshake();
            dwgfx.backbuffer.unlock();
        }
        else
        {
            dwgfx.render();
            dwgfx.backbuffer.unlock();
        }
    }
    
    public function gamelogic(key : KeyPoll, dwgfx : Dwgraphicsclass, game : Gameclass, obj : Entityclass, help : Helpclass, music : Musicclass) : Void
    {
        var zi : Int = 0;
        var i : Int = 0;
        var j : Int = 0;
        var qwei : Int = 0;
        music.processmusic();
        music.processamb();
        music.processstep();
        help.updateglow();
        if (obj.checkdamage(game) && !obj.restartroom)
        {
            obj.restartroom = true;
            obj.restartmode = 0;
            obj.restartcounter = 0;
        }
        if (obj.restartroom)
        {
            if (obj.restartmode == -1)
            {
                zi = 0;
                while (zi < obj.nentity)
                {
                    if (obj.entities[zi].type == 28 || obj.entities[zi].type == 30)
                    {
                        obj.updateentities(zi, help, game, music);
                        obj.entities[zi].newxp = obj.entities[zi].xp + obj.entities[zi].vx;
                        obj.entities[zi].newyp = obj.entities[zi].yp + obj.entities[zi].vy;
                        obj.entities[zi].xp = obj.entities[zi].newxp;
                        obj.entities[zi].yp = obj.entities[zi].newyp;
                    }
                    zi++;
                }
                ++obj.restartcounter;
                if (obj.restartcounter == 30)
                {
                    obj.restartcounter = 0;
                    obj.restartmode = 0;
                }
            }
            else if (obj.restartmode == 0)
            {
                game.screenshake = 0;
                if (obj.restartcounter == 0)
                {
                    if (obj.norestartsound == false)
                    {
                        music.playef(6, 200);
                    }
                    obj.norestartsound = false;
                }
                ++obj.restartcounter;
                if (obj.restartcounter == 10)
                {
                    obj.restartmode = 1;
                }
            }
            else if (obj.restartmode == 1)
            {
                ++obj.restartcounter;
                if (obj.restartcounter == 12)
                {
                    obj.restartmode = 2;
                    obj.restartcounter = 10;
                    if (game.startspecial)
                    {
                        help.globaltemp = obj.getplayer();
                        help.globaltemp2 = obj.entities[help.globaltemp].dir;
                        game.gotoroom(game.startroom, obj, help, music);
                        obj.createentity(game.startx, game.starty, 0);
                        if (game.eurydicemode)
                        {
                            obj.createentity(game.entx + 18, game.enty, 28);
                        }
                        help.globaltemp = obj.getplayer();
                        obj.entities[help.globaltemp].dir = help.globaltemp2;
                    }
                    else
                    {
                        game.gotoroom(game.currentroom, obj, help, music);
                        obj.createentity(game.entx, game.enty, 0);
                        if (game.eurydicemode)
                        {
                            obj.createentity(game.entx + 18, game.enty, 28);
                        }
                        help.globaltemp = obj.getplayer();
                        obj.entities[help.globaltemp].vx = game.entvx;
                        obj.entities[help.globaltemp].vy = game.entvy;
                        obj.entities[help.globaltemp].dir = game.entdir;
                    }
                }
            }
            else if (obj.restartmode == 2)
            {
                --obj.restartcounter;
                if (obj.restartcounter == 0)
                {
                    obj.restartmode = 0;
                    obj.restartroom = false;
                    game.shotdelay = 10;
                }
            }
        }
        else
        {
            game.updaterain(obj);
            game.updatestate(obj, help, music);
            obj.onladder = false;
            if (obj.checkladder(game))
            {
                obj.onladder = true;
            }
            i = 0;
            while (i < obj.nentity)
            {
                obj.entities[i].vx += obj.entities[i].ax;
                obj.entities[i].vy += obj.entities[i].ay;
                obj.entities[i].ax = 0;
                if (obj.entities[i].jumping)
                {
                    if (obj.entities[i].ay < 0)
                    {
                        ++obj.entities[i].ay;
                    }
                    if (obj.entities[i].ay > -1)
                    {
                        obj.entities[i].ay = 0;
                    }
                    --obj.entities[i].jumpframe;
                    if (obj.entities[i].jumpframe <= 0)
                    {
                        obj.entities[i].jumping = false;
                    }
                }
                else if (obj.onladder)
                {
                    if (obj.entities[i].type == 0)
                    {
                        obj.entities[i].vy /= 2;
                        obj.entities[i].bigfallcounter = 0;
                        obj.entities[i].onground = true;
                        obj.entities[i].ay = 0;
                        obj.entities[i].jumpframe = 0;
                        obj.entities[i].jumping = false;
                    }
                    else if (obj.entities[i].gravity)
                    {
                        obj.entities[i].ay = 1;
                    }
                }
                else if (obj.entities[i].gravity)
                {
                    obj.entities[i].ay = 1;
                }
                if (obj.entities[i].gravity)
                {
                    obj.applyfriction(i, 0.15, 0.5);
                }
                obj.entities[i].newxp = obj.entities[i].xp + obj.entities[i].vx;
                obj.entities[i].newyp = obj.entities[i].yp + obj.entities[i].vy;
                if (obj.entities[i].type == 0 && game.currentroom == 0)
                {
                    if (obj.entities[i].newxp < 30)
                    {
                        obj.entities[i].newxp = 30;
                        obj.entities[i].vx = 0;
                    }
                }
                if (obj.entities[i].type != 28)
                {
                    if (obj.testwallsx(game, i, obj.entities[i].newxp, obj.entities[i].yp))
                    {
                        obj.entities[i].xp = obj.entities[i].newxp;
                    }
                    else
                    {
                        if (obj.entities[i].onwall > 0)
                        {
                            obj.entities[i].state = obj.entities[i].onwall;
                        }
                        if (obj.entities[i].onxwall > 0)
                        {
                            obj.entities[i].state = obj.entities[i].onxwall;
                        }
                    }
                    if (obj.testwallsy(game, i, obj.entities[i].xp, obj.entities[i].newyp))
                    {
                        obj.entities[i].yp = obj.entities[i].newyp;
                    }
                    else
                    {
                        if (obj.entities[i].onwall > 0)
                        {
                            obj.entities[i].state = obj.entities[i].onwall;
                        }
                        if (obj.entities[i].onywall > 0)
                        {
                            obj.entities[i].state = obj.entities[i].onywall;
                        }
                        obj.entities[i].jumpframe = 0;
                    }
                    if (!obj.testwallsx(game, i, obj.entities[i].xp, obj.entities[i].yp))
                    {
                        if (obj.entities[i].type != 1 && obj.entities[i].type != 23 && obj.entities[i].type != 24 && obj.entities[i].type != 25 && obj.entities[i].type != 2 && obj.entities[i].type != 16 && obj.entities[i].type != 15 && obj.entities[i].type != 22 && obj.entities[i].type != 17 && obj.entities[i].type != 14 && obj.entities[i].type != 14)
                        {
                            if (game.toggledeath)
                            {
                                obj.restartroom = true;
                                obj.restartmode = 0;
                                obj.restartcounter = 0;
                            }
                            else
                            {
                                obj.entities[i].yp -= 3;
                            }
                        }
                    }
                    obj.animateentities(i, help, game);
                    j = as3hx.Compat.parseInt(i + 1);
                    while (j < obj.nentity)
                    {
                        if (i != j)
                        {
                            if (obj.entities[i].onentity)
                            {
                                if (obj.entitycollide(i, j))
                                {
                                    if (obj.entities[i].type == 1 && obj.entities[i].state == 0)
                                    {
                                        if (obj.entities[j].onbullet > 0)
                                        {
                                            if (obj.entities[j].type == 27)
                                            {
                                                if (obj.entities[i].yp < 52)
                                                {
                                                    obj.entities[j].state = obj.entities[j].onbullet;
                                                }
                                                else
                                                {
                                                    music.playef(22);
                                                }
                                                obj.entities[j].bulletvel = obj.entities[i].vx;
                                                obj.entities[i].state = 1;
                                            }
                                            else
                                            {
                                                obj.entities[j].state = obj.entities[j].onbullet;
                                                obj.entities[j].bulletvel = obj.entities[i].vx;
                                                obj.entities[i].state = 1;
                                            }
                                        }
                                        else
                                        {
                                            obj.entities[i].state = 1;
                                        }
                                    }
                                    if (obj.entities[j].type == 1 && obj.entities[j].state == 0)
                                    {
                                        if (obj.entities[i].onbullet > 0)
                                        {
                                            if (obj.entities[i].type == 27)
                                            {
                                                if (obj.entities[j].yp < 52)
                                                {
                                                    obj.entities[i].state = obj.entities[i].onbullet;
                                                }
                                                obj.entities[i].bulletvel = obj.entities[j].vx;
                                                obj.entities[j].state = 1;
                                            }
                                            else
                                            {
                                                obj.entities[i].state = obj.entities[i].onbullet;
                                                obj.entities[i].bulletvel = obj.entities[j].vx;
                                                obj.entities[j].state = 1;
                                            }
                                        }
                                        else
                                        {
                                            obj.entities[j].state = 1;
                                        }
                                    }
                                }
                            }
                            if (obj.entities[i].type == 0 || obj.entities[j].type == 0)
                            {
                                if (obj.entities[j].harmful || obj.entities[i].harmful)
                                {
                                    if (obj.entitycollide(i, j))
                                    {
                                        if (obj.entities[i].size == 0 && obj.entities[j].size == 0)
                                        {
                                            if (dwgfx.tiles[obj.entities[i].drawframe].hitTest(new Point(obj.entities[i].xp, obj.entities[i].yp), 1, dwgfx.tiles[obj.entities[j].drawframe], new Point(obj.entities[j].xp, obj.entities[j].yp), 1) == true)
                                            {
                                                obj.restartroom = true;
                                                obj.restartmode = 0;
                                                obj.restartcounter = 0;
                                            }
                                        }
                                        else
                                        {
                                            obj.restartroom = true;
                                            obj.restartmode = 0;
                                            obj.restartcounter = 0;
                                        }
                                    }
                                }
                                if (obj.entities[j].onplayer > 0 || obj.entities[i].onplayer > 0)
                                {
                                    if (obj.entitycollide(i, j))
                                    {
                                        if (obj.entities[i].onplayer > 0)
                                        {
                                            obj.entities[i].state = obj.entities[i].onplayer;
                                        }
                                        if (obj.entities[j].onplayer > 0)
                                        {
                                            obj.entities[j].state = obj.entities[j].onplayer;
                                        }
                                    }
                                }
                            }
                        }
                        j++;
                    }
                }
                else
                {
                    obj.entities[i].xp = obj.entities[i].newxp;
                    obj.entities[i].yp = obj.entities[i].newyp;
                }
                if (obj.entitycollidefloor(game, i))
                {
                    obj.entities[i].bigfallcounter = 0;
                    obj.entities[i].onground = true;
                    if (obj.entities[i].bigfallframe == -1)
                    {
                        obj.entities[i].bigfallframe = 3;
                        if (obj.entities[i].type == 0)
                        {
                            music.playef(music.steptype);
                        }
                    }
                    if (game.ongroundlasttime && obj.entities[i].type == 0)
                    {
                        game.ongroundlasttime = false;
                        music.playef(music.steptype);
                    }
                }
                else if (!obj.onladder)
                {
                    if (obj.entities[i].type == 0)
                    {
                        game.ongroundlasttime = true;
                    }
                    obj.entities[i].onground = false;
                    ++obj.entities[i].bigfallcounter;
                    if (obj.entities[i].bigfallcounter > 25)
                    {
                        obj.entities[i].bigfallframe = -1;
                    }
                }
                i++;
            }
            obj.activetrigger = -1;
            if (obj.checktrigger(game))
            {
                game.state = obj.activetrigger;
            }
            if (!obj.restartroom)
            {
                qwei = 0;
                while (qwei < obj.nentity)
                {
                    if (!obj.updateentities(qwei, help, game, music))
                    {
                        qwei--;
                    }
                    qwei++;
                }
                help.globaltemp = obj.getplayer();
                if (obj.entities[help.globaltemp] != null) {
                    if (obj.entities[help.globaltemp].xp < -7 && game.door_left >= -1)
                    {
                        if (game.door_left == -1)
                        {
                            if (!obj.restartroom)
                            {
                                obj.restartroom = true;
                                obj.restartmode = 0;
                                obj.restartcounter = 0;
                            }
                        }
                        else
                        {
                            game.enty = obj.entities[help.globaltemp].yp;
                            game.entdir = obj.entities[help.globaltemp].dir;
                            game.entvx = obj.entities[help.globaltemp].vx;
                            game.entvy = obj.entities[help.globaltemp].vy;
                            help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                            game.gotoroom(game.door_left, obj, help, music);
                            game.entx = 152;
                            obj.createentity(game.entx, game.enty, 0);
                            if (game.eurydicemode)
                            {
                                obj.createentity(game.entx + 18, game.enty, 28);
                            }
                            help.globaltemp = obj.getplayer();
                            obj.entities[help.globaltemp].dir = game.entdir;
                            obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                            obj.restartroom = false;
                        }
                    }
                    else if (obj.entities[help.globaltemp].xp > 153 && game.door_right >= -1)
                    {
                        if (game.door_right == -1)
                        {
                            if (!obj.restartroom)
                            {
                                obj.restartroom = true;
                                obj.restartmode = 0;
                                obj.restartcounter = 0;
                            }
                        }
                        else
                        {
                            game.enty = obj.entities[help.globaltemp].yp;
                            game.entdir = obj.entities[help.globaltemp].dir;
                            game.entvx = obj.entities[help.globaltemp].vx;
                            game.entvy = obj.entities[help.globaltemp].vy;
                            help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                            game.gotoroom(game.door_right, obj, help, music);
                            game.entx = -6;
                            obj.createentity(game.entx, game.enty, 0);
                            if (game.eurydicemode)
                            {
                                obj.createentity(game.entx + 18, game.enty, 28);
                            }
                            help.globaltemp = obj.getplayer();
                            obj.entities[help.globaltemp].dir = game.entdir;
                            obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                            obj.restartroom = false;
                        }
                    }
                    else if (obj.entities[help.globaltemp].yp < -4 && game.door_up >= -1)
                    {
                        if (game.door_up == -1)
                        {
                            if (!obj.restartroom)
                            {
                                obj.restartroom = true;
                                obj.restartmode = 0;
                                obj.restartcounter = 0;
                            }
                        }
                        else
                        {
                            game.entx = obj.entities[help.globaltemp].xp;
                            game.entdir = obj.entities[help.globaltemp].dir;
                            game.entvx = obj.entities[help.globaltemp].vx;
                            game.entvy = obj.entities[help.globaltemp].vy;
                            help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                            game.gotoroom(game.door_up, obj, help, music);
                            game.enty = 137;
                            obj.createentity(game.entx, game.enty, 0);
                            if (game.eurydicemode)
                            {
                                obj.createentity(game.entx + 18, game.enty, 28);
                            }
                            help.globaltemp = obj.getplayer();
                            obj.entities[help.globaltemp].vy = game.entvy;
                            obj.entities[help.globaltemp].dir = game.entdir;
                            obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                            obj.restartroom = false;
                        }
                    }
                    else if (obj.entities[help.globaltemp].yp > 138 && game.door_down >= -1)
                    {
                        if (game.door_down == -1)
                        {
                            if (!obj.restartroom)
                            {
                                obj.restartroom = true;
                                obj.restartmode = 0;
                                obj.restartcounter = 0;
                            }
                        }
                        else
                        {
                            game.entx = obj.entities[help.globaltemp].xp;
                            game.entdir = obj.entities[help.globaltemp].dir;
                            game.entvx = obj.entities[help.globaltemp].vx;
                            game.entvy = obj.entities[help.globaltemp].vy;
                            help.globaltemp2 = obj.entities[help.globaltemp].bigfallcounter;
                            game.gotoroom(game.door_down, obj, help, music);
                            game.enty = -3;
                            obj.createentity(game.entx, game.enty, 0);
                            if (game.eurydicemode)
                            {
                                obj.createentity(game.entx + 18, game.enty, 28);
                            }
                            help.globaltemp = obj.getplayer();
                            obj.entities[help.globaltemp].vy = game.entvy;
                            obj.entities[help.globaltemp].dir = game.entdir;
                            obj.entities[help.globaltemp].bigfallcounter = help.globaltemp2;
                            obj.restartroom = false;
                        }
                    }
                }
            }
        }
    }
    
    public function lockedloop(e : Event) : Void
    {
        // We are being denied :(
        dwgfx.backbuffer.lock();
        dwgfx.bprint(5, 57, "Sorry! This version of", 255, 177, 181, true);
        dwgfx.bprint(5, 67, "the game cannot be", 255, 177, 181, true);
        dwgfx.bprint(5, 77, "played online!", 255, 177, 181, true);
        dwgfx.render();
        dwgfx.backbuffer.unlock();
        help.updateglow();
    }
    
    public function sitelock() : Bool
    {
        /*var currUrl : String = stage.loaderInfo.url.toLowerCase();
        if (currUrl.indexOf("file:///") < 0 || currUrl.indexOf("http") == 0)
        {
            return false;
        }*/
        // Keep the handling of the original, but just ignore it. Sitelock should always return true in this case, as this port is multiplatform
        return true;
    }
    
    public function gameinput(key : KeyPoll, dwgfx : Dwgraphicsclass, game : Gameclass, obj : Entityclass, help : Helpclass, music : Musicclass) : Void
    {
        var vci : Int = 0;
        var distractionware_link : URLRequest = null;
        var offline_link : URLRequest = null;
        var site_link : URLRequest = null;
        var mysite_link : URLRequest = null;
        var t : Int = 0;
        game.mx = as3hx.Compat.parseInt(mouseX / 4);
        game.my = as3hx.Compat.parseInt(mouseY / 4);
        if (game.showmenu > 0)
        {
            game.newgamehighlighted = false;
            game.offlinehighlighted = false;
            game.visithighlighted = false;
            game.restorehighlighted = false;
            if (game.standaloneversion)
            {
                if (game.savepoint > 0)
                {
                    if (game.my >= 31 && game.my <= 37)
                    {
                        game.newgamehighlighted = true;
                    }
                    if (game.my >= 41 && game.my <= 47)
                    {
                        game.restorehighlighted = true;
                    }
                    if (game.my >= 51 && game.my <= 57)
                    {
                        game.visithighlighted = true;
                    }
                }
                else
                {
                    if (game.my >= 36 && game.my <= 42)
                    {
                        game.newgamehighlighted = true;
                    }
                    if (game.my >= 46 && game.my <= 52)
                    {
                        game.visithighlighted = true;
                    }
                }
            }
            else if (game.savepoint > 0)
            {
                if (game.my >= 27 && game.my <= 33)
                {
                    game.newgamehighlighted = true;
                }
                if (game.my >= 37 && game.my <= 42)
                {
                    game.restorehighlighted = true;
                }
                if (game.my >= 45 && game.my <= 51)
                {
                    game.offlinehighlighted = true;
                }
                if (game.my >= 54 && game.my <= 60)
                {
                    game.visithighlighted = true;
                }
            }
            else
            {
                if (game.my >= 31 && game.my <= 37)
                {
                    game.newgamehighlighted = true;
                }
                if (game.my >= 41 && game.my <= 47)
                {
                    game.offlinehighlighted = true;
                }
                if (game.my >= 51 && game.my <= 57)
                {
                    game.visithighlighted = true;
                }
            }
            if (key.click)
            {
                if (game.newgamehighlighted)
                {
                    vci = 0;
                    while (vci < 300)
                    {
                        obj.flags[vci] = 0;
                        vci++;
                    }
                    game.toggledeath = false;
                    game.flashlight = 0;
                    game.screenshake = 0;
                    game.eurydicemode = false;
                    game.rain = true;
                    game.hasgun = false;
                    game.createtrigger(130, 0, 10, 150, 8);
                    game.offlinehighlighted = false;
                    game.visithighlighted = false;
                    game.restorehighlighted = false;
                    game.state = 24;
                    game.showmenu = 0;
                }
                if (game.restorehighlighted)
                {
                    game.offlinehighlighted = false;
                    game.visithighlighted = false;
                    game.newgamehighlighted = false;
                    game.state = 33;
                    game.showmenu = 0;
                }
                if (game.visithighlighted)
                {
                    distractionware_link = new URLRequest("http://www.distractionware.com");
                    flash.Lib.getURL(distractionware_link, "_blank");
                }
                if (game.offlinehighlighted)
                {
                    offline_link = new URLRequest("http://www.distractionware.com/games/flash/dontlookback/offline/");
                    flash.Lib.getURL(offline_link, "_blank");
                }
                if (game.showmenu > 0)
                {
                    if (game.my >= 134 && game.my <= 142)
                    {
                        if (game.kongversion)
                        {
                            site_link = new URLRequest("http://www.kongregate.com/?gamereferral=dontlookback");
                            flash.Lib.getURL(site_link, "_blank");
                        }
                        else
                        {
                            mysite_link = new URLRequest("http://www.distractionware.com");
                            flash.Lib.getURL(mysite_link, "_blank");
                        }
                    }
                }
            }
        }
        var i : Int = 0;
        while (i < obj.nentity)
        {
            if (obj.entities[i].type == 0)
            {
                if (obj.entities[i].bigfallframe <= 0)
                {
                    if (game.hascontrol)
                    {
                        if (key.isDown(Keyboard.LEFT) || key.isDown(65))
                        {
                            music.playstep(music.steptype);
                            obj.entities[i].vx = -2;
                            obj.entities[i].dir = 0;
                        }
                        else if (key.isDown(Keyboard.RIGHT) || key.isDown(68))
                        {
                            if (game.eurydicemode && !obj.restartroom)
                            {
                                if (obj.entities[i].onground)
                                {
                                    music.playstep(music.steptype);
                                }
                                obj.restartroom = true;
                                obj.restartmode = -1;
                                obj.restartcounter = 0;
                                obj.entities[i].dir = 1;
                                obj.entities[obj.geteurydice()].state = 1;
                                obj.animateentities(i, help, game);
                            }
                            else
                            {
                                if (obj.entities[i].onground)
                                {
                                    music.playstep(music.steptype);
                                }
                                obj.entities[i].vx = 2;
                                obj.entities[i].dir = 1;
                            }
                        }
                        else
                        {
                            obj.entities[i].vx = 0;
                            music.stopstep();
                        }
                        if (!obj.entities[i].onground)
                        {
                            music.stopstep();
                        }
                        if (obj.restartroom)
                        {
                            music.stopstep();
                        }
                        if (obj.onladder)
                        {
                            game.jumpheld = false;
                            if (key.isDown(Keyboard.UP) || key.isDown(90) || key.isDown(87))
                            {
                                if (cast(obj.entities[i].onground, Bool) && !obj.entities[i].jumping)
                                {
                                    obj.entities[i].ay = -2;
                                    obj.entities[i].jumping = true;
                                    obj.entities[i].jumpframe = 2;
                                }
                            }
                            else if (key.isDown(Keyboard.DOWN) || key.isDown(83))
                            {
                                obj.entities[i].vy = 4;
                            }
                        }
                        else
                        {
                            if (key.isUp(Keyboard.UP) && key.isUp(90) && key.isUp(87))
                            {
                                game.jumpheld = false;
                            }
                            if ((key.isDown(Keyboard.UP) || key.isDown(90) || key.isDown(87)) && !game.jumpheld)
                            {
                                game.jumpheld = true;
                                if (cast(obj.entities[i].onground, Bool) && !obj.entities[i].jumping)
                                {
                                    obj.entities[i].ay = -5;
                                    obj.entities[i].jumping = true;
                                    obj.entities[i].jumpframe = 10;
                                }
                            }
                        }
                        if (key.isDown(Keyboard.SPACE) || key.isDown(88))
                        {
                            game.isshooting = true;
                        }
                        else
                        {
                            game.isshooting = false;
                        }
                        if (game.hasgun && !obj.restartroom)
                        {
                            --game.shotdelay;
                            if (game.shotdelay <= 0)
                            {
                                game.shotdelay = 0;
                            }
                            if ((key.isDown(Keyboard.SPACE) || key.isDown(88)) && game.shotdelay <= 0)
                            {
                                music.playef(4);
                                game.shotdelay = 12;
                                t = obj.getplayer();
                                if (t > -1)
                                {
                                    if (obj.entities[t].dir == 0)
                                    {
                                        obj.createentity(obj.entities[t].xp + 6, obj.entities[t].yp + 6, 1, -7 + obj.entities[t].vx, 0);
                                    }
                                    if (obj.entities[t].dir == 1)
                                    {
                                        obj.createentity(obj.entities[t].xp + 4, obj.entities[t].yp + 6, 1, 7 + obj.entities[t].vx, 0);
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        obj.entities[i].vx = 0;
                    }
                }
                else
                {
                    obj.entities[i].vx /= 2;
                }
            }
            i++;
        }
    }
    
    public function visit_distractionware(e : Event) : Void
    {
        var distractionware_link : URLRequest = new URLRequest("http://www.distractionware.com");
        flash.Lib.getURL(distractionware_link, "_blank");
    }
    
    public function getsite() : String
    {
        return stage.loaderInfo.url.toLowerCase();
    }
    
    public function mainloop(e : Event) : Void
    {
        if (game.paused || !game.infocus)
        {
            if (game.globalsound > 0)
            {
                game.globalsound = 0;
                SoundMixer.soundTransform = new SoundTransform(0);
            }
            dwgfx.backbuffer.lock();
            dwgfx.backbuffer.fillRect(new Rectangle(0, 0, 160, 144), 1114884);
            dwgfx.bprint(5, 60, "[Game paused]", 253, 196, 195, true);
            dwgfx.bprint(5, 70, "Click to resume", 253, 196, 195, true);
            dwgfx.bprint(5, 134, "[Press M to Mute in game]", 253, 196, 195, true);
            dwgfx.render();
            dwgfx.backbuffer.unlock();
            music.processmusic();
            music.processamb();
            music.processstep();
        }
        else
        {
            gamerender(key, dwgfx, game, obj, help);
            gameinput(key, dwgfx, game, obj, help, music);
            gamelogic(key, dwgfx, game, obj, help, music);
            if (key.isDown(77) && game.mutebutton <= 0)
            {
                game.mutebutton = 8;
                if (game.muted)
                {
                    game.muted = false;
                }
                else
                {
                    game.muted = true;
                }
            }
            if (game.mutebutton > 0)
            {
                --game.mutebutton;
            }
            if (game.muted)
            {
                if (game.globalsound == 1)
                {
                    game.globalsound = 0;
                    SoundMixer.soundTransform = new SoundTransform(0);
                }
            }
            if (!game.muted && game.globalsound == 0)
            {
                game.globalsound = 1;
                SoundMixer.soundTransform = new SoundTransform(1);
            }
        }
        if (key.hasclicked)
        {
            key.click = false;
        }
    }
}


