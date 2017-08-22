
#ifndef _MENU_RENDER_H
#define _MENU_RENDER_H

#include "types.h"
#include "config.h"

#ifdef GUMBOOT
#include "console.h"
#include "string.h"
#include "printf.h"
#else
#include "console_defs.h"
#include <string.h>
#include <stdio.h>

#include "lstrender/virtual_console.h"
#endif

#define HELP_LINES 5
#define BOX_H (CONSOLE_LINES-4-HELP_LINES)

extern int menu_selection;

void draw_box_at(int x, int y, int w, int h);
void menu_draw(int seconds, u16 mini_version_major, u16 mini_version_minor);
void menu_draw_entries(void);

extern const char	*timeout_prompt, *timeout_prompt_term;

#endif // _MENU_RENDER_H
