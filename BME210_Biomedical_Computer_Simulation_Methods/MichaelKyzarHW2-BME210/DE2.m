function dCdt = DE2(t,C)
k1 = 600; k2 = 6000; k3 = 28.8; k4 = 0.288; 
k5 = 600; k6 = 60;   k7 = 0.8;  k8 = 0.8; k9 = 120;
nicCont = NicDelivRate(t)-k9*C(1);
dCdt = [-k1*C(1)*C(2) + k2*C(4) - k5*C(1)*C(3) + k6*C(5) + nicCont; ... % L
       -k1*C(1)*C(2) + k2*C(4) - k7*C(1)*C(2) + k8*C(1)*C(3); ... % R
       -k5*C(1)*C(3) + k6*C(5) - k8*C(1)*C(3) + k7*C(1)*C(2); ... % D
        k1*C(1)*C(2) + k4*C(5) - k2*C(4) - k3*C(4);           ... % LR
        k5*C(1)*C(3) + k3*C(4) - k6*C(5) - k4*C(5)];          ... % LD
end