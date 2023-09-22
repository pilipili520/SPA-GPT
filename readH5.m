h5disp('1-CARD_RSA.h5');
data = h5read('1-CARD_RSA.h5','/traces/CARD_RSA_for_paper');
plot(data);