@echo off

for /f %%x in ('dir /a-d /b *.png *.lay') do mkdir %%~nx & move %%x %%~nx\%%x