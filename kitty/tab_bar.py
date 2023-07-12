"""draw kitty tab"""
# pyright: reportMissingImports=false
# pylint: disable=E0401,C0116,C0103,W0603,R0913

import datetime

from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (DrawData, ExtraData, TabBarData, as_rgb, draw_title, \
        TabAccessor)
from kitty.utils import color_as_int

opts = get_options()

ICON: str = " MICHAEL "
ICON_LENGTH: int = len(ICON)
ICON_FG: int = as_rgb(color_as_int(opts.color16))
ICON_BG: int = as_rgb(color_as_int(opts.color1))

CLOCK_FG = as_rgb(color_as_int(opts.color16))
CLOCK_BG = as_rgb(color_as_int(opts.color5))
DATE_FG = as_rgb(color_as_int(opts.color16))
DATE_BG =  as_rgb(color_as_int(opts.color4))

TAB_FG = as_rgb(color_as_int(opts.color0))
TAB_BG = as_rgb(color_as_int(opts.color4))


def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return screen.cursor.x

    fg, bg, bold, italic = (
        screen.cursor.fg,
        screen.cursor.bg,
        screen.cursor.bold,
        screen.cursor.italic,
    )
    screen.cursor.bold, screen.cursor.italic, screen.cursor.fg, screen.cursor.bg = (
        True,
        False,
        ICON_FG,
        ICON_BG,
    )
    screen.draw(ICON)
    screen.cursor.fg = ICON_BG
    # set cursor position
    screen.cursor.x = ICON_LENGTH
    screen.cursor.bg = CLOCK_BG
    screen.draw(' ')
    # restore color style
    screen.cursor.fg, screen.cursor.bg, screen.cursor.bold, screen.cursor.italic = (
        fg,
        bg,
        bold,
        italic,
    )
    return screen.cursor.x


def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    
    tab_bg = screen.cursor.bg
    tab_fg = screen.cursor.fg
    BAR_BG = as_rgb(int(draw_data.default_bg))

    if extra_data.next_tab:
        next_tab_bg = as_rgb(draw_data.tab_bg(extra_data.next_tab))
        needs_soft_separator = next_tab_bg == tab_bg
    else:
        next_tab_bg = BAR_BG
        needs_soft_separator = False

    separator_symbol, soft_separator_symbol = ('', '')
    min_title_length = 1 + 2
    start_draw = 2

    if screen.cursor.x == 0:
        screen.cursor.bg = tab_bg
        screen.draw(' ')
        start_draw = 1

    screen.cursor.bg = tab_bg

    if index == 1:
        screen.draw(' ')
    if min_title_length >= max_tab_length:
        screen.draw('…')
    else:
        draw_title(draw_data, screen, tab, index, max_tab_length)
        extra = screen.cursor.x + start_draw - before - max_tab_length
        if extra > 0 and extra + 1 < screen.cursor.x:
            screen.cursor.x -= extra + 1
            screen.draw('…')

    if not needs_soft_separator:
        screen.draw(' ')
        screen.cursor.fg = tab_bg
        screen.cursor.bg = next_tab_bg
        screen.draw(separator_symbol)
    else:
        prev_fg = screen.cursor.fg
        if tab_bg == tab_fg:
            screen.cursor.fg = BAR_BG
        elif tab_bg != BAR_BG:
            c1 = draw_data.inactive_bg.contrast(draw_data.default_bg)
            c2 = draw_data.inactive_bg.contrast(draw_data.inactive_fg)
            if c1 < c2:
                screen.cursor.fg = BAR_BG
        screen.draw(f' {soft_separator_symbol}')
        screen.cursor.fg = prev_fg

    end = screen.cursor.x
    if end < screen.columns:
        screen.draw(' ')
    return end

##def _get_git_branch(tab: TabBarData) -> str:
#    ta = TabAccessor(tab.tab_id)
#    wd = ta.active_wd()


def _draw_right_status(draw_data: DrawData, screen: Screen, is_last: bool, tab) -> int:
    if not is_last:
        return screen.cursor.x

    cells = [
        (CLOCK_FG, CLOCK_BG, datetime.datetime.now().strftime(" %H:%M ")),
        (DATE_FG, DATE_BG, datetime.datetime.now().strftime(" %Y/%m/%d   ")),
    ]
    BAR_BG = as_rgb(int(draw_data.default_bg))


    right_status_length = 0
    for _, _, cell in cells:
        right_status_length += len(cell)

    draw_spaces = screen.columns - screen.cursor.x - right_status_length
    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)
    
    screen.cursor.bg = BAR_BG
    for fg, bg, cell in cells:
        screen.cursor.fg = bg
        screen.draw("")

        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)

    screen.cursor.fg = 0
    screen.cursor.bg = 0

    screen.cursor.x = max(screen.cursor.x, screen.columns - right_status_length)
    return screen.cursor.x


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:

    _draw_icon(screen, index)
    # Set cursor to where `left_status` ends, instead `right_status`,
    # to enable `open new tab` feature
    end = _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
    )
    _draw_right_status(
        draw_data,
        screen,
        is_last,
        tab
    )
    return end
