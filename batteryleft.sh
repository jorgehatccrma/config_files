#!/bin/bash
pmset -g batt | grep -E -o "\d{1,3}%"
