function nic = NicDelivRate(t)
if (t>0)&&(t<=(0.5/60))
    nic = 36 + 15/(0.5/60);
elseif (t<1)&&(t<=(1+0.5/60))
    nic = 36 + 15/(0.5/60);
elseif (t<2)&&(t<=(2+0.5/60))
    nic = 36 + 15/(0.5/60);
else
    nic = 36;
end
