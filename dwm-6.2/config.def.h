/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const char *upvol[]   = { "amixer", "set", "Master", "3+",     NULL };
static const char *downvol[] = { "amixer", "set", "Master", "3-",     NULL };
static const char *mutevol[] = { "/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL };
static const char *brupcmd[] = { "brightnessctl", "set", "3%+", NULL };
static const char *brdowncmd[] = { "brightnessctl", "set", "3%-", NULL };
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Font Awesome Bold:size=13" };
static const char dmenufont[]       = "Source Code Pro Black:size=14";
static const char col_white[]       = "#ffffff";
static const char col_black[]       = "#000000";
static const char col_gray0[]       = "#121212";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#00ffff";
static const char col_red[]        = "#ffff00";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_black, col_gray1 },
	[SchemeSel]  = { col_cyan, col_gray0,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_black, "-nf", col_white, "-sb", col_black, "-sf", col_cyan, NULL };
//static const char *termcmd[]  = { "st", "-f", "Droid Sans Mono:size=13", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *webcmd[]  = { "brave", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,                            XF86XK_PowerOff,                togglebar,      {0} },
	{ 0,                            XF86XK_AudioMute,               spawn,          {.v = mutevol } },
	{ 0,                            XF86XK_AudioLowerVolume,        spawn,          {.v = downvol } },
	{ 0,                            XF86XK_AudioRaiseVolume,        spawn,          {.v = upvol   } },
    { 0,                            XF86XK_MonBrightnessUp,         spawn,          {.v = brupcmd} },
    { 0,                            XF86XK_MonBrightnessDown,       spawn,          {.v = brdowncmd} },
	{ MODKEY,                       XK_s,                           spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,                           spawn,          {.v = webcmd } },
	{ MODKEY,                       XK_j,                           focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,                           focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,                           incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_v,                           incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,                           setmfact,       {.f = -0.01} },
	{ MODKEY,                       XK_l,                           setmfact,       {.f = +0.01} },
	{ MODKEY,                       XK_t,                           setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_Return,                      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,                           setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_q,                           killclient,     {0} },
	{ MODKEY,                       XK_f,                           zoom,           {0} },
	{ MODKEY,                       XK_Tab,                         view,           {0} },

// SHELL COMMANDS
    { MODKEY,                       XK_w,                           spawn,          SHCMD("feh --randomize --bg-scale /home/zim/pictures/*")},
    { 0,                            XK_Print,                       spawn,          SHCMD("scrot 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots && xclip -selection clipboard -t image/png -i ~/screenshots/`ls -1 -t ~/screenshots | head -1`'")},
    { ShiftMask,                    XK_Print,                       spawn,          SHCMD("scrot -s 'screenshot_%Y%m%d_%H%M%S.png' -e 'mkdir -p ~/screenshots && mv $f ~/screenshots && xclip -selection clipboard -t image/png -i ~/screenshots/`ls -1 -t ~/screenshots | head -1`'")},
	{ MODKEY,                       XK_d,                           spawn,          SHCMD("rofi -icon-theme 'Papirus' -show-icons -font 'Hack 13' -modi window,drun,run -show drun -sidebar-mode -terminal st -color-window '#000000, #000000, #000000' -color-normal '#000000, #b3e774, #000000, #b3e774, #000000' -color-active '#000000, #b3e774, #000000, #b3e774, #000000' -color-urgent '#000000, #b3e774, #000000, #b3e774, #000000'")},
	{ MODKEY,                       XK_p,                           spawn,          SHCMD("bash ~/.config/picom/picom-toggle.sh")},

// CENTERED MASTER LAYOUT
	{ MODKEY,                       XK_u,                           setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_o,                           setlayout,      {.v = &layouts[4]} },

	{ MODKEY,                       XK_space,                       setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,                       togglefloating, {0} },
	{ MODKEY,                       XK_0,                           view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,                           tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,                       focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,                      focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,                       tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,                      tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                                           0)
	TAGKEYS(                        XK_2,                                           1)
	TAGKEYS(                        XK_3,                                           2)
	TAGKEYS(                        XK_4,                                           3)
	TAGKEYS(                        XK_5,                                           4)
	TAGKEYS(                        XK_6,                                           5)
	TAGKEYS(                        XK_7,                                           6)
	TAGKEYS(                        XK_8,                                           7)
	TAGKEYS(                        XK_9,                                           8)
	{ MODKEY|ShiftMask,             XK_q,                           quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
