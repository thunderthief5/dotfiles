/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 3;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 1;       /* vertical padding of bar */
static const int sidepad            = 3;       /* horizontal padding of bar */
static const char *fonts[]          = { " ShureTechMono Nerd Font Mono:style=Regular:size=12" };
static const char dmenufont[]       = "Isonorm:size=14";
static const char col_1[]       = "#1b1b1b";
static const char col_2[]       = "#282a36";
static const char col_3[]       = "#6272a4";
static const char col_4[]       = "#bd93f9";
static const char col_5[]       = "#282828";
static const char *colors[][3]      = {
	/*               fg         bg     border   */
	[SchemeNorm] = { col_3,   col_1,   col_5 },
	[SchemeSel]  = { col_4,   col_2,   col_3  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
	{ "URxvt",    NULL,       NULL,       0,            1,           -1 },
        { "Gufw.py",  NULL,       NULL,       0,            1,           -1 },
        { "Popsicle", NULL,       NULL,       0,            1,           -1 },
	{ "Nitrogen", NULL,       NULL,       0,            1,           -1 },
	{ "Eog",      NULL,       NULL,       0,            1,           -1 },
        { "Tor Browser",                     NULL,       NULL,       0,            1,           -1 },
        { "Transmission-gtk",                NULL,       NULL,       0,            1,           -1 },
        { "Xfce4-power-manager-settings",    NULL,       NULL,       0,            1,           -1 },
        { "Xfce4-settings-manager",          NULL,       NULL,       0,            1,           -1 },
        { "SimpleScreenRecorder",            NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "fibonacci.c"

#include "shift-tools.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
  { "[M-S]",      tile },     /* first entry is default */
  { "[FLOAT]",    NULL },    /* no layout function means floating behavior */
  { "[MON]",      monocle },
  { "[SPIRAL]",   spiral },
  { "[BSP]",      dwindle },
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
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_1, "-nf", col_3, "-sb", col_5, "-sf", col_4, NULL };
static const char *termcmd[]  = { "gnome-terminal", NULL };


/*#include "selfrestart.c" */

#include "movestack.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,		        XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_Right,  focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_Left,   focusstack,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_Right,  incnmaster,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_Left,   incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.005} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.005} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
        { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	/*{ MODKEY,                       XK_Return, zoom,           {0} },*/
	/*{ MODKEY,                       XK_Tab,    view,           {0} },*/
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_9,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_9,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
	{ MODKEY|ControlMask,           XK_Right,  shiftview,      { .i = +1 } },
 	{ MODKEY|ControlMask,           XK_Left,   shiftview,      { .i = -1 } },
 	{ MODKEY|ShiftMask,             XK_Right,  shiftboth,      { .i = +1 } },
 	{ MODKEY|ShiftMask,             XK_Left,   shiftboth,      { .i = -1 } }, 
	/*{ MODKEY|ShiftMask,             XK_r,      self_restart,   {0} },*/
	
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	
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
