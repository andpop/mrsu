#!/bin/bash
echo select * from users limit 10
echo ==========================================
sqlite3 movies_rating.db "select * from users limit 10"
echo ==========================================
