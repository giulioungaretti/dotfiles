#!/bin/env bash
ratpoison -c "select $(ratpoison -c windows | rofi -dmenu -p 'Switch to window:' | cut -c1)"
