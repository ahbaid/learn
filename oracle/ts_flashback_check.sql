select tstsn, tsnam, decode(bitand(tsflg, 8), 8, 'NO', 'YES') FLASHBACK_ENABLED from x$kccts;
