prec:"system P";
syms:`AAPL`GOOG`IBM`MSFT`DELL`HP`NVDA`TSLA;
initpx:syms!120 110 210 320 250 190 690 720;
generateTradesTable:{[dt;n]
    st:dt+09:00:00;
    et:dt+15:00:00;
    tm:st+asc n?`long$et-st;
    sym:n?`AAPL`GOOG`IBM`MSFT`DELL`HP`NVDA`TSLA;
    exch:n?`N`L`Q`O;
    side:n?"BS";
    price:n chgpx[;`IBM]\ initpx[`IBM];
    size:n?5000;
    system"P ",string prec;
    ([] time:tm;sym:sym;exch:exch;side:side;price:price;size:size)
    };

chgpx:{system"P 5";newval:x*(1+chg:(rand 1 -1)*0.001*rand 100);$[.1<abs[newval-initpx[y]]%initpx[y];:x*1+neg chg;:newval]}
