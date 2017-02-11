 clc;
clear;
a=arduino;
shield=addon(a,'Adafruit/MotorShieldV2');
s=servo(shield,1);
for i=0:.2:1
    writePosition(s,i);
end