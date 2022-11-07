//EVENT BOJE
#define COLOR_RED 0xAA3333AA
#define COLOR_LIGHTRED 0xFF6347AA
#define SVIJETLOPLAVA 0x33CCFFAA
#define COLOR_WHITE 0xFFFFFFAA

#define DIALOG_EVENTI          342
#define DIALOG_EVENTPORT       344

//event system
new event = 0;
new slotovi = 0;
new ecp[MAX_PLAYERS];
new mjesta = 0;
new prisustvuje[MAX_PLAYERS];
new eecp[MAX_PLAYERS];
new lsdok[3];
new KartO[4];
new Relly1[4];
new ddrive[20];
new srace[4];
new eventa[15];
new bool:Prisustvuje[MAX_PLAYERS];
new vorcp[MAX_PLAYERS] = 0;
new bool:auts;

stock IsAEvent(carid)
{
	for(new i = 0; i < sizeof(eventa); i++)
	{
		if(carid == eventa[i])	return 1;
	}
	return 0;
}

forward ProxDetectorS(Float:radi, playerid, targetid);
public ProxDetectorS(Float:radi, playerid, targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		GetPlayerPos(targetid, posx, posy, posz);
		tempposx = (oldposx -posx);
		tempposy = (oldposy -posy);
		tempposz = (oldposz -posz);
		//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

public vcount4(playerid)
{
	foreach (Player, i)
	{
		if(ProxDetectorS(15.0, playerid, i))
		{
			GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~p~ ~p~ 4 ~g~ ",1000,3);
			GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~p~ ~p~ 4 ~g~ ",1000,3);
		}
	}
	return 1;
}
public vcount3(playerid)
{
	foreach (Player, i)
	{
		if(ProxDetectorS(15.0, playerid, i))
		{
			GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~ ~y~ 3 ~g~ ",1000,3);
			GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~ ~y~ 3 ~g~ ",1000,3);
		}
	}
	return 1;
}
public vcount2(playerid)
{
	foreach (Player, i)
	{
		if(ProxDetectorS(15.0, playerid, i))
		{
			GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~b~ ~b~ 2 ~g~ ",1000,3);
			GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~b~ ~b~ 2 ~g~ ",1000,3);
		}
	}
	return 1;
}
public vcount1(playerid)
{
	foreach (Player, i)
	{
		if(ProxDetectorS(15.0, playerid, i))
		{
			GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~b~ ~g~ 1 ~g~ ",1000,3);
			GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~b~ ~g~ 1 ~g~ ",1000,3);
		}
	}
	return 1;
}
public vcountgo(playerid)
{
	foreach (Player, i)
	{
		if(ProxDetectorS(15.0, playerid, i))
		{
	   		GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~ ~y~]~g~ ~w~START~g~ ]~g~",1000,3);
	   		GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~ ~y~]~g~ ~w~START~g~ ]~g~",1000,3);
		}
	}
	return 1;
}

public count4()
{
	foreach (Player, i)
	{
		if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
		{
			GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~ 4 ~g~-",1000,3);
		}
   	}
}
public count3()
{
	foreach (Player, i)
	{
		if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
		{
	   		GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~ 3 ~g~-",1000,3);
		}
   	}
}
public count2()
{
	foreach (Player, i)
	{
		if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
		{
	   		GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~ 2 ~g~-",1000,3);
		}
   	}
}
public count1()
{
	foreach (Player, i)
	{
		if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
		{
	   		GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~ 1 ~g~-",1000,3);
		}
   	}
}
public countgo()
{
	foreach (Player, i)
	{
		if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
		{
		   	//new Float:X, Float:Y, Float:Z;
			mjesta = 0;
        	vorcp[i] = 0;
		   	GetPlayerPos(i, X,Y,Z);
	   		GameTextForPlayer(i,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~]~g~-~g~START~g~-~y~]~g~-",1000,3);
	   		PlayerPlaySound(i,1057,X,Y,Z);
			DestroyDynamicObject(lsdok[2]); DestroyDynamicObject(ddrive[0]); DestroyDynamicObject(srace[3]); DestroyDynamicObject(KartO[0]); DestroyDynamicObject(Relly1[0]); DestroyDynamicObject(Relly1[1]);
			TogglePlayerControllable(i, 1);
		}
		if(ecp[i] == 18)
		{
			PlayerInfo[i][pCistacX] = gNRG[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gNRG[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gNRG[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 5.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 17)
		{
			PlayerInfo[i][pCistacX] = gSacnchez2[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gSacnchez2[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gSacnchez2[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 5.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 16)
		{
			PlayerInfo[i][pCistacX] = gMorski[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gMorski[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gMorski[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 15)
		{
			PlayerInfo[i][pCistacX] = gKruzna[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gKruzna[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gKruzna[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 14)
		{
			PlayerInfo[i][pCistacX] = gKART[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gKART[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gKART[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 5.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 13)
		{
			PlayerInfo[i][pCistacX] = gQUAD2[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gQUAD2[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gQUAD2[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 5.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 12)
		{
			PlayerInfo[i][pCistacX] = gQUAD[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gQUAD[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gQUAD[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 5.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 11)
		{
			PlayerInfo[i][pCistacX] = gRelly2[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gRelly2[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gRelly2[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 10)
		{
			PlayerInfo[i][pCistacX] = gRelly[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gRelly[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gRelly[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 9)
		{
			PlayerInfo[i][pCistacX] = gJETMAX[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gJETMAX[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gJETMAX[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 10.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 8)
		{
			PlayerInfo[i][pCistacX] = gRACE[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gRACE[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gRACE[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 7)
		{
			PlayerInfo[i][pCistacX] = gDRIFT2[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gDRIFT2[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gDRIFT2[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 6)
		{
			PlayerInfo[i][pCistacX] = gDRIFT1[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gDRIFT1[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gDRIFT1[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 5)
		{
			PlayerInfo[i][pCistacX] = gVORTEX[vorcp[i]][0];
			PlayerInfo[i][pCistacY] = gVORTEX[vorcp[i]][1];
			PlayerInfo[i][pCistacZ] = gVORTEX[vorcp[i]][2];
	        SetPlayerCheckpoint(i, PlayerInfo[i][pCistacX], PlayerInfo[i][pCistacY],PlayerInfo[i][pCistacZ], 8.0);
	        vorcp[i] = vorcp[i]+1;
		}
		if(ecp[i] == 4)
		{
			SetPlayerCheckpoint(i,-2443.6187,-574.5956,129.1409,10.0);
	       	eecp[i] = 53;
		}
		if(ecp[i] == 3)
		{
			SetPlayerCheckpoint(i,-325.1706,-2248.8979,33.5046,10.0);
	       	eecp[i] = 36;
		}
		if(ecp[i] == 2)
		{
			SetPlayerCheckpoint(i,-464.9647,2590.2058,50.2128,10.0);
	       	eecp[i] = 11;
		}
	}
}

OnPlayerConnect(playerid)
{
    prisustvuje[playerid] = 0;
}


new Float:gVORTEX[32][3] = {
{-2877.4558,327.9842,12.6793},
{-2893.1685,-356.1097,2.8224},
{-2929.5166,-752.6310,10.4297},
{-2911.3472,-908.7932,0.2907},
{-2949.9851,-1150.6403,0.8198},
{-3014.4448,-1365.0945,1.0526},
{-2960.2625,-1942.9016,0.4052},
{-2705.3147,-2156.6187,0.5942},
{-2659.2449,-2270.4944,5.6990},
{-2685.5054,-2403.3340,2.2550},
{-2657.9233,-2501.5227,11.3892},
{-2655.5059,-2634.7820,6.9508},
{-2444.3433,-2767.8281,2.6271},
{-2337.1096,-2790.8848,8.8936},
{-2103.7961,-2818.8181,2.2550},
{-1920.7834,-2759.3245,8.9217},
{-1687.4009,-2891.8101,0.1844},
{-1286.4886,-3015.4622,1.0432},
{-1145.7498,-2846.7651,0.4213},
{-1201.6666,-2579.3792,0.4448},
{-1244.7169,-2422.0369,0.4374},
{-1149.9225,-2193.6377,0.4852},
{-1264.2650,-1980.3899,0.4475},
{-1415.6458,-1687.0181,0.3931},
{-1645.6625,-1624.4104,0.3807},
{-1854.6431,-1497.9126,0.4457},
{-2080.1599,-1230.3290,0.2997},
{-2260.7571,-1024.9904,0.3936},
{-2432.2666,-870.3289,0.3304},
{-2639.8987,-971.8152,0.3809},
{-2749.3191,-1078.5820,15.0394},
{-2926.1597,-1207.9789,8.5278}
};

new Float:gDRIFT1[37][3] = {
{-331.4726,1317.1892,51.8621},
{-388.9670,1404.5604,40.6689},
{-428.2535,1443.3492,33.9389},
{-430.6893,1650.9321,35.5219},
{-404.2908,1910.7819,57.6953},
{-431.4308,1764.4843,71.6829},
{-477.5445,1946.8467,85.6874},
{-388.5322,2046.3987,62.5370},
{-410.0191,2075.7761,61.3117},
{-492.7551,1990.8907,59.8480},
{-617.9631,2053.7939,59.8461},
{-842.6879,2029.3726,59.8440},
{-865.7452,1892.6287,59.9326},
{-887.5961,1798.5608,59.9279},
{-1028.1371,1857.6259,60.1298},
{-1103.2057,1812.1613,43.7448},
{-1248.8043,1913.3915,42.4227},
{-1341.0527,2050.2566,52.9225},
{-1403.4902,2294.2556,54.8760},
{-1503.7133,2368.9651,49.5635},
{-1620.4043,2381.7000,49.8600},
{-1716.4526,2316.7710,31.7084},
{-1706.0095,2355.5789,49.5391},
{-1733.8942,2429.3440,68.4156},
{-1673.2996,2460.9170,84.7630},
{-1651.8269,2594.6787,81.2864},
{-1714.9331,2674.2024,62.1298},
{-1767.8363,2706.5618,59.0696},
{-1895.1704,2629.8252,49.6909},
{-2264.1536,2679.6121,54.9692},
{-2605.4282,2671.7380,75.5066},
{-2771.3796,2432.6541,90.6333},
{-2723.0281,2354.7314,71.4807},
{-2535.5720,2457.1843,17.9005},
{-2539.9397,2397.3694,14.3638},
{-2539.9282,2281.0752,4.4934},
{-2424.0762,2227.1582,4.6430}
};

new Float:gNRG[10][3] = {
{1408.9570,-1352.5127,8.1252},
{1368.6074,-1570.6552,8.2455},
{1362.9183,-1699.4833,8.1343},
{1596.7728,-1761.6859,3.5142},
{1849.2413,-1822.2478,3.5445},
{2070.7402,-1852.0706,3.5536},
{2533.4043,-1851.8652,2.7504},
{2599.5464,-1716.2312,1.2018},
{2622.2646,-1501.0272,15.6871},
{2804.4028,-1420.5986,15.8120}
};

new Float:gSacnchez2[2][3] = {
{-2361.7668,-2189.4280,33.5759},
{-2320.2327,-1638.2820,483.7031}
};

new Float:gMorski[24][3] = {
{705.6152,-3195.8086,14.3372},
{795.7244,-3225.8345,13.4520},
{1033.4116,-3369.5874,13.5679},
{627.1729,-3693.3452,14.4340},
{646.5905,-3605.0674,14.3910},
{711.2781,-3361.7334,14.3695},
{705.6152,-3195.8086,14.3372},
{795.7244,-3225.8345,13.4520},
{1033.4116,-3369.5874,13.5679},
{627.1729,-3693.3452,14.4340},
{646.5905,-3605.0674,14.3910},
{711.2781,-3361.7334,14.3695},
{705.6152,-3195.8086,14.3372},
{795.7244,-3225.8345,13.4520},
{1033.4116,-3369.5874,13.5679},
{627.1729,-3693.3452,14.4340},
{646.5905,-3605.0674,14.3910},
{711.2781,-3361.7334,14.3695},
{705.6152,-3195.8086,14.3372},
{795.7244,-3225.8345,13.4520},
{1033.4116,-3369.5874,13.5679},
{627.1729,-3693.3452,14.4340},
{646.5905,-3605.0674,14.3910},
{711.2781,-3361.7334,14.3695}
};

new Float:gKruzna[15][3] = {
{4091.6804,-1928.3624,2.5385},
{4091.0676,-2143.1062,2.5357},
{4007.8320,-1958.6887,2.5697},
{4091.6804,-1928.3624,2.5385},
{4091.0676,-2143.1062,2.5357},
{4007.8320,-1958.6887,2.5697},
{4091.6804,-1928.3624,2.5385},
{4091.0676,-2143.1062,2.5357},
{4007.8320,-1958.6887,2.5697},
{4091.6804,-1928.3624,2.5385},
{4091.0676,-2143.1062,2.5357},
{4007.8320,-1958.6887,2.5697},
{4091.6804,-1928.3624,2.5385},
{4091.0676,-2143.1062,2.5357},
{4007.8320,-1958.6887,2.5697}
};


new Float:gKART[35][3] = {
{-2274.1938,2352.5476,4.0997},
{-2363.8984,2430.2944,7.4285},
{-2383.4006,2473.1328,7.4920},
{-2400.1353,2501.2561,11.0642},
{-2470.3337,2501.0813,16.2938},
{-2486.2439,2481.3159,17.3399},
{-2459.2007,2476.2468,15.4992},
{-2435.4556,2462.3354,13.0727},
{-2466.7288,2433.7344,14.6326},
{-2489.0862,2393.2292,14.3896},
{-2483.5537,2332.8862,4.1198},
{-2515.4727,2358.3237,4.2686},
{-2551.7661,2351.2964,4.2683},
{-2580.0408,2331.3950,4.6010},
{-2615.1348,2300.5581,7.4864},
{-2626.4421,2264.9475,7.4376},
{-2606.0857,2254.5269,7.4947},
{-2560.7739,2285.4609,4.2682},
{-2477.9700,2240.3501,4.1276},
{-2427.7073,2212.5151,4.2678},
{-2373.9365,2214.7458,4.2683},
{-2414.0410,2225.1902,4.2683},
{-2430.5337,2299.7407,4.2675},
{-2350.4492,2359.5750,4.3553},
{-2400.6064,2432.6118,10.1244},
{-2434.1228,2460.1130,13.0696},
{-2435.0007,2513.7168,13.3286},
{-2510.3181,2525.5264,17.9716},
{-2519.9104,2513.7273,18.1082},
{-2512.3062,2502.5886,18.1744},
{-2400.8547,2501.6636,11.1243},
{-2396.1592,2479.9033,9.5646},
{-2260.8237,2373.0591,4.3424},
{-2224.6191,2348.5139,4.2700},
{-2188.1765,2408.2825,4.2545}
};

new Float:gQUAD2[27][3] = {
{-2546.1438,-1496.1924,358.7686},
{-2574.0737,-1502.2365,358.6871},
{-2555.1948,-1447.6212,354.9184},
{-2421.9507,-1355.9407,336.7443},
{-2344.4485,-1321.7269,311.0970},
{-2340.3748,-1288.7635,309.1430},
{-2499.6794,-1271.2932,274.5565},
{-2563.3723,-1349.7533,265.3881},
{-2653.3127,-1386.3483,256.4097},
{-2662.5291,-1339.0300,245.3289},
{-2612.5952,-1231.6809,209.4556},
{-2575.0330,-1166.4513,187.3108},
{-2518.3350,-1136.3287,177.9933},
{-2533.3945,-1114.2214,176.5538},
{-2619.7085,-1157.5526,169.6420},
{-2747.0645,-1374.9272,143.9963},
{-2768.8694,-1639.5679,141.0767},
{-2778.1550,-1699.2267,141.2497},
{-2820.5291,-1806.6600,138.6241},
{-2813.6135,-1860.8002,122.0320},
{-2760.1284,-1912.9965,114.3252},
{-2671.9614,-1983.0370,94.0523},
{-2638.8979,-2170.7583,70.1853},
{-2514.1204,-2134.3914,53.9275},
{-2394.3562,-2139.8757,53.5083},
{-2335.4263,-2162.0896,42.0341},
{-2368.4395,-2192.3345,33.1349}
};

new Float:gQUAD[28][3] = {
{-2563.8455,-1507.4001,358.5058},
{-2577.2019,-1472.7889,358.4970},
{-2513.9290,-1419.9513,347.7614},
{-2439.1836,-1381.5688,335.2477},
{-2305.6624,-1345.7375,297.0228},
{-2249.7014,-1341.1055,274.7868},
{-2292.0691,-1279.2002,256.9989},
{-2338.9463,-1251.2589,240.0871},
{-2252.8416,-1284.5221,226.4850},
{-2427.0210,-1160.4713,184.2305},
{-2524.1409,-1130.9763,177.9583},
{-2599.3843,-1176.3071,192.4554},
{-2666.7781,-1348.5331,247.3667},
{-2710.1404,-1485.2551,291.3923},
{-2599.8997,-1615.8002,341.9313},
{-2583.7813,-1657.2732,350.6854},
{-2544.8586,-1801.1155,373.1238},
{-2549.8921,-1766.8033,382.0579},
{-2556.7839,-1675.7717,397.2978},
{-2516.8867,-1743.1743,401.4614},
{-2441.7839,-1809.5182,409.8407},
{-2458.7390,-1740.1329,425.2882},
{-2419.8137,-1751.5237,433.0191},
{-2280.1406,-1723.9487,470.9093},
{-2305.6597,-1662.7915,483.1450},
{-2312.6543,-1633.3802,483.1811},
{-2291.4580,-1655.2102,482.5912},
{-2269.5078,-1695.5411,479.5316}
};

new Float:gRelly2[39][3] = {
{313.0738,-683.9000,6.1852},
{330.1048,-548.5929,11.5119},
{365.4064,-442.8465,24.9220},
{335.5322,-363.5023,11.6408},
{417.3832,-301.5121,7.7668},
{518.6606,-219.6527,15.2768},
{767.9618,-136.6013,20.5243},
{997.1193,-80.3451,21.6477},
{1199.5204,-90.5920,38.8528},
{1260.3523,-147.0946,38.3409},
{1363.4813,-210.4161,7.6579},
{1550.2976,-144.1666,17.3716},
{1534.3289,91.0788,29.0576},
{1498.4419,159.3525,30.7005},
{1170.3807,304.6570,18.0901},
{987.2738,164.4669,28.1538},
{796.9722,215.5409,35.7512},
{532.2614,155.4615,23.8305},
{545.3138,-16.3393,27.4382},
{719.8311,-2.4567,35.5716},
{891.2003,10.7466,91.1057},
{1090.9237,2.1184,70.1712},
{1260.2560,83.5434,21.8747},
{1445.0236,188.4951,22.9688},
{1587.2749,263.3284,16.0987},
{1756.9965,202.8558,25.4233},
{2097.7024,98.8158,30.6302},
{2210.9553,87.4579,25.9307},
{2388.6055,85.9599,26.2005},
{2608.5203,38.1451,26.1500},
{2710.3118,-65.2907,42.1138},
{2654.2920,-328.8899,47.2968},
{2736.6240,-511.3683,50.0167},
{2762.0603,-652.1751,62.9565},
{2757.0615,-841.1254,38.8759},
{2655.2402,-963.4670,78.7171},
{2531.4172,-971.1289,81.6214},
{2405.5537,-973.1158,75.9478},
{2337.8755,-1036.5385,52.8025}
};

new Float:gRelly[65][3] = {
{-1925.1014,-2435.2253,30.3305},
{-1835.5861,-2349.0774,32.5943},
{-1693.8379,-2300.3840,43.5644},
{-1683.4353,-2121.6892,36.7781},
{-1823.7947,-2089.1387,55.7092},
{-1964.8224,-2056.9670,73.6673},
{-1984.5386,-2008.2151,80.9230},
{-1927.5936,-1936.8187,78.6125},
{-1705.5056,-1915.0463,98.5352},
{-1559.1273,-1890.2921,81.1248},
{-1532.4099,-1823.2727,64.4761},
{-1479.9725,-1781.4946,50.7670},
{-1442.7535,-1838.7336,41.0056},
{-1421.8889,-2000.7012,9.1428},
{-1389.2802,-2059.7949,7.7629},
{-1312.1051,-2070.0608,22.3254},
{-1285.0177,-2209.2229,21.7494},
{-1242.2401,-2312.6433,19.1646},
{-1128.6604,-2370.6001,29.7160},
{-960.3499,-2355.9724,61.6178},
{-959.5837,-2284.2332,53.4012},
{-952.9464,-2199.4082,39.2915},
{-885.0292,-2183.5425,28.0226},
{-807.5110,-2172.4399,21.4337},
{-802.2761,-2083.5737,24.3619},
{-856.1570,-1955.7111,14.3752},
{-778.4379,-1873.4130,11.5694},
{-676.8055,-1875.7080,8.5544},
{-675.7490,-1963.7230,19.9979},
{-642.0883,-2024.3364,29.4884},
{-528.6448,-2030.6731,51.5415},
{-448.7393,-1975.9550,25.6154},
{-406.9102,-1917.5901,5.7078},
{-334.4812,-1911.4904,11.5391},
{-272.0948,-1980.5378,29.2870},
{-261.1133,-2078.4768,37.0462},
{-248.7042,-2153.8889,28.9903},
{-233.8040,-2234.1248,28.8711},
{-253.6564,-2254.6606,27.9900},
{-304.9010,-2252.5256,29.2257},
{-380.4303,-2256.1030,43.8299},
{-476.2809,-2267.9802,41.8371},
{-588.9582,-2381.5872,27.7255},
{-665.3437,-2501.3513,39.4040},
{-732.0746,-2648.8586,82.8434},
{-815.5640,-2682.1406,92.3543},
{-885.3950,-2667.1790,94.5925},
{-989.8499,-2680.0063,59.7413},
{-1132.1111,-2659.2417,16.3824},
{-1218.3339,-2637.4268,9.5742},
{-1344.5605,-2630.7556,19.9803},
{-1491.7957,-2633.7671,45.3364},
{-1589.2501,-2631.2759,53.0222},
{-1717.1071,-2573.7612,18.3893},
{-1822.7600,-2464.8191,24.7051},
{-1887.2577,-2428.8916,32.5469},
{-1945.8682,-2462.2087,30.5747},
{-2010.6201,-2493.7712,32.6850},
{-2044.3848,-2490.7297,30.3790},
{-2088.7827,-2485.0208,30.1769},
{-2133.0249,-2530.4453,30.173},
{-2191.9924,-2490.6191,30.1742},
{-2238.8662,-2527.2397,31.2115},
{-2308.1685,-2706.1106,43.7541},
{-2347.8745,-2783.7485,9.4183}
};


new Float:gJETMAX[23][3] = {
{1878.5844,-77.7029,-0.5101},
{1726.0803,-13.9029,-0.4865},
{1612.6638,-115.7606,-0.4212},
{1417.7321,-251.2797,-0.4623},
{1174.0161,-116.1315,-0.5025},
{966.9347,-121.9781,-0.4247},
{737.8581,-200.9102,-0.5107},
{542.7610,-245.2343,-0.4960},
{360.1682,-307.2303,-0.5391},
{148.2456,-418.3948,-0.4673},
{-41.5266,-600.1201,-0.4558},
{-174.1612,-719.3446,-0.4707},
{-99.3364,-889.5696,-0.5035},
{37.2309,-906.4547,-0.5338},
{65.8771,-1056.3616,-0.3118},
{58.9911,-1278.8127,-0.4429},
{45.8067,-1353.7440,-0.4870},
{43.0755,-1545.7151,-0.4829},
{-76.9635,-1646.9235,-0.3451},
{-209.1236,-1841.7670,-0.4358},
{-299.8962,-1857.9659,-0.4059},
{-365.2315,-1864.7280,-0.3665},
{-446.6908,-1883.3351,-0.5839}
};

new Float:gRACE[56][3] = {
{-1557.3826,926.5211,6.9337},
{-1656.3866,925.1031,22.8082},
{-1752.3472,924.1346,24.6409},
{-1794.0951,1007.4344,24.6289},
{-1793.4614,1078.0341,44.3836},
{-1794.0876,1147.0785,34.8955},
{-1862.1740,1178.4789,43.5002},
{-1934.1008,1176.8026,45.1914},
{-1966.4216,1135.8920,49.8814},
{-1972.5553,1074.3538,55.4648},
{-1994.6687,1048.1876,55.4612},
{-2007.2377,948.8363,45.1914},
{-2037.6505,946.7137,49.6644},
{-2088.9919,941.4039,69.5086},
{-2131.4646,919.3971,79.7463},
{-2140.5645,1098.4977,79.7410},
{-2212.4500,1177.8737,55.4725},
{-2262.0771,1109.7119,77.6827},
{-2260.2617,644.1404,49.1905},
{-2053.3967,563.3163,34.9098},
{-2004.1913,793.5469,45.1912},
{-1946.3163,843.1717,40.9009},
{-1900.0808,765.1602,44.2578},
{-1973.6628,732.8857,45.1914},
{-2065.1147,732.5994,64.0983},
{-2088.0103,703.3538,69.2866},
{-2087.7983,622.9579,52.0773},
{-2025.9307,565.6592,34.9101},
{-1995.8201,598.8995,34.9168},
{-1810.5465,605.5506,34.9101},
{-1740.1923,607.3470,24.6368},
{-1713.7831,713.6169,24.6326},
{-1666.0315,731.2742,18.4941},
{-1559.3718,688.7055,6.9336},
{-1561.6752,515.7045,6.9257},
{-1706.4926,348.3598,6.9256},
{-1792.5792,354.4253,16.6145},
{-1853.4481,407.4475,16.9058},
{-1972.4189,345.0302,34.2372},
{-2006.4377,249.2237,29.7934},
{-2038.2186,109.5417,28.3212},
{-2220.8262,103.7289,35.2149},
{-2254.0591,176.3750,35.0664},
{-2132.3562,208.3339,35.1885},
{-2041.0281,220.3917,35.4842},
{-1954.8378,225.9915,32.8679},
{-1891.1798,147.6028,38.0984},
{-1864.7363,166.2910,38.1566},
{-1825.9028,315.5803,20.3818},
{-1739.4420,288.3435,7.0820},
{-1754.5166,187.9117,3.4481},
{-1750.1827,35.9556,3.4492},
{-1749.8472,-112.4061,3.4492},
{-1801.2119,-199.8998,15.0665},
{-1823.5304,-541.9139,15.3304},
{-1617.0463,-504.9920,8.6179}
};


new Float:gDRIFT2[57][3] = {
{-2437.1638,-585.8436,130.8380},
{-2460.0820,-515.1210,110.5789},
{-2535.0454,-489.0289,82.7235},
{-2609.7407,-500.9760,72.1585},
{-2571.8699,-470.4286,67.8751},
{-2455.7256,-427.5012,83.4474},
{-2366.4736,-448.6220,81.0073},
{-2320.2849,-446.4856,79.4737},
{-2374.8574,-383.0163,76.3888},
{-2571.1953,-368.2228,49.1926},
{-2673.5061,-416.7704,31.8886},
{-2669.3218,-496.8978,20.3238},
{-2730.0325,-522.0938,8.2047},
{-2819.9963,-445.3162,6.7661},
{-2817.7910,-356.7486,6.7583},
{-2740.1023,-322.0146,6.7661},
{-2659.5835,-242.2678,5.4538},
{-2656.1477,-118.3424,3.7717},
{-2516.6963,-71.1651,23.4989},
{-2418.4883,-22.5155,34.8989},
{-2455.0735,79.9970,30.7860},
{-2563.8271,93.1236,7.0332},
{-2603.6045,115.1935,3.9106},
{-2561.4004,187.6986,5.4310},
{-2658.9836,218.2783,3.9068},
{-2706.8940,244.8471,3.9068},
{-2779.1187,287.5506,6.2395},
{-2852.8838,356.3065,4.0786},
{-2826.7825,563.3486,5.1149},
{-2867.4043,765.2027,32.2411},
{-2828.7385,952.3882,43.6409},
{-2813.1948,1267.2654,5.1804},
{-2514.5994,1373.6814,6.7661},
{-2457.4426,1297.9852,19.2879},
{-2539.5588,1248.0157,34.7427},
{-2712.5984,1101.8197,45.1441},
{-2753.3340,909.5503,62.8618},
{-2753.0718,767.3282,53.9614},
{-2748.0400,540.4747,12.5986},
{-2710.3250,490.8701,5.4419},
{-2793.9573,466.7638,5.1423},
{-2856.2949,378.1397,4.0786},
{-2811.2673,285.5636,6.7583},
{-2823.9724,-397.7095,6.7661},
{-2730.0325,-522.0938,8.2047},
{-2669.3218,-496.8978,20.3238},
{-2673.5061,-416.7704,31.8886},
{-2571.1953,-368.2228,49.1926},
{-2374.8574,-383.0163,76.3888},
{-2320.2849,-446.4856,79.4737},
{-2366.4736,-448.6220,81.0073},
{-2455.7256,-427.5012,83.4474},
{-2571.8699,-470.4286,67.8751},
{-2609.7407,-500.9760,72.1585},
{-2535.0454,-489.0289,82.7235},
{-2460.0820,-515.1210,110.5789},
{-2437.1638,-585.8436,130.8380}
};


public OnPlayerEnterCheckpoint(playerid)
{

	//eventi
	//vortex
	new string[300];
	new CID = GetPlayerVehicleID(playerid);
	if(ecp[playerid] == 18)
	{
        if(IsAEvent(CID) &&(GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 10)
				{
					PlayerInfo[playerid][pCistacX] = gNRG[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gNRG[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gNRG[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 5.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 18)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
			      		mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			      		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| NRG Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
						vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 17)
	{
        if(IsAEvent(CID) &&(GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 2)
				{
					PlayerInfo[playerid][pCistacX] = gSacnchez2[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gSacnchez2[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gSacnchez2[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 5.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 17)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
		      		    {
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Mount Chiliad Vrh | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 16)
	{
        if(IsAEvent(CID) &&(GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 24)
				{
					PlayerInfo[playerid][pCistacX] = gMorski[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gMorski[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gMorski[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 16)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
		      			{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Morski Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
                        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 15)
	{
        if(IsAEvent(CID) &&(GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 15)
				{
					PlayerInfo[playerid][pCistacX] = gKruzna[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gKruzna[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gKruzna[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 15)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
		      			{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Kruzna Trka | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 14)
	{
        if(IsAEvent(CID) &&(GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 35)
				{
					PlayerInfo[playerid][pCistacX] = gKART[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gKART[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gKART[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 5.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 14)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
					    mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Karting Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 13 && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
        if(IsAEvent(CID))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 27)
				{
					PlayerInfo[playerid][pCistacX] = gQUAD2[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gQUAD2[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gQUAD2[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 5.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 13)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Sanchez Race 2 | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 12 && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
        if(IsAEvent(CID))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 28)
				{
					PlayerInfo[playerid][pCistacX] = gQUAD[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gQUAD[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gQUAD[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 5.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 12)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Quad Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 11 && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
        if(IsAEvent(CID))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 38)
				{
					PlayerInfo[playerid][pCistacX] = gRelly2[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gRelly2[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gRelly2[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 11)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Rally 2 | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 10 && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
        if(IsAEvent(CID))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 64)
				{
					PlayerInfo[playerid][pCistacX] = gRelly[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gRelly[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gRelly[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 10)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Rally | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 9)
	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 23)
				{
					PlayerInfo[playerid][pCistacX] = gJETMAX[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gJETMAX[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gJETMAX[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 10.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 9)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Jetmax | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 8)
	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 56)
				{
					PlayerInfo[playerid][pCistacX] = gRACE[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gRACE[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gRACE[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 8)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| EuroGaming Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 7)
	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 57)
				{
					PlayerInfo[playerid][pCistacX] = gDRIFT2[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gDRIFT2[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gDRIFT2[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 7)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Drift2 | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 6)
	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 37)
				{
					PlayerInfo[playerid][pCistacX] = gDRIFT1[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gDRIFT1[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gDRIFT1[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 6)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Drift | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	else if(ecp[playerid] == 5)
	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
        {
	 		if(IsPlayerInRangeOfPoint(playerid, 15.0, PlayerInfo[playerid][pCistacX],PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ]))
		  	{
	            PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	            DisablePlayerCheckpoint(playerid);
				if(vorcp[playerid] < 32)
				{
					PlayerInfo[playerid][pCistacX] = gVORTEX[vorcp[playerid]][0];
					PlayerInfo[playerid][pCistacY] = gVORTEX[vorcp[playerid]][1];
					PlayerInfo[playerid][pCistacZ] = gVORTEX[vorcp[playerid]][2];
			        SetPlayerCheckpoint(playerid, PlayerInfo[playerid][pCistacX], PlayerInfo[playerid][pCistacY],PlayerInfo[playerid][pCistacZ], 8.0);
			        vorcp[playerid] = vorcp[playerid]+1;
				}
				else
				{
			   		if(event == 5)
					{
						DisablePlayerCheckpoint(playerid);
			      		ecp[playerid] = 0;
			   			new ciljime[MAX_PLAYER_NAME];
					    GetPlayerName(playerid, ciljime, sizeof(ciljime));
						mjesta++;
			      		new novac;
			      		if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
					  	}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
						format(string,sizeof(string),"| Vortex | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
						if(mjesta < 4)
						{
							SendClientMessageToAll(COLOR_RED,string);
						}
	                    vorcp[playerid] = 0;
						DisablePlayerCheckpoint(playerid);
				   		PlayerInfo[playerid][pCistacX] = 0;
				        PlayerInfo[playerid][pCistacY] = 0;
				        PlayerInfo[playerid][pCistacZ] = 0;
				        return 1;
					}
				}
			}
			else
			{
   				vorcp[playerid] = 0;
     			ecp[playerid] = 0;
				DisablePlayerCheckpoint(playerid);
		   		PlayerInfo[playerid][pCistacX] = 0;
		        PlayerInfo[playerid][pCistacY] = 0;
		        PlayerInfo[playerid][pCistacZ] = 0;
				SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
			 	DisablePlayerCheckpoint(playerid);
			 	return 1;
			}
        }
	    return 1;
	}
	//event 2 (Desert Drive)
 	else if(eecp[playerid] == 11 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-464.9647,2590.2058,50.2128))
	  	{
            eecp[playerid] = 12;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -378.0200,2559.1409,39.6213,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
		 	return 1;

	 	}
  	}
  	else if(eecp[playerid] == 12 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-378.0200,2559.1409,39.6213))
	  	{
            eecp[playerid] = 13;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -354.1865,2509.5281,36.1661,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
		 	return 1;

		}
 	}
 	else if(eecp[playerid] == 13 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-354.1865,2509.5281,36.1661))
	  	{
            eecp[playerid] = 14;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -487.9483,2437.4766,52.3001,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
		 	return 1;
		}
 	}
 	else if(eecp[playerid] == 14 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-487.9483,2437.4766,52.3001))
	  	{
            eecp[playerid] = 15;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -694.4960,2517.3049,75.0215,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
		 	return 1;
		}
 	}
 	else if(eecp[playerid] == 15 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-694.4960,2517.3049,75.0215))
	  	{
            eecp[playerid] = 16;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -722.6255,2661.4148,60.2633,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
		 	return 1;

		}
 	}
 	else if(eecp[playerid] == 16 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-722.6255,2661.4148,60.2633))
	  	{
            eecp[playerid] = 17;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -699.6299,2693.2786,55.5243,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 17 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -699.6299,2693.2786,55.5243))
	  	{
            eecp[playerid] = 18;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -770.9343,2699.2280,46.5509,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
  	else if(eecp[playerid] == 18 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -770.9343,2699.2280,46.5509))
	  	{
            eecp[playerid] = 19;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -863.2164,2728.9233,45.3915,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 19 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-863.2164,2728.9233,45.3915))
	  	{
            eecp[playerid] = 20;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1250.0481,2677.7410,47.0962,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 20 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1250.0481,2677.7410,47.0962))
	  	{
            eecp[playerid] = 21;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1439.6582,2447.8940,59.4194,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 21 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1439.6582,2447.8940,59.4194))
	  	{
            eecp[playerid] = 22;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1351.1957,2155.3284,47.2228,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 22 && IsAEvent(CID))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1351.1957,2155.3284,47.2228))
	  	{
            eecp[playerid] = 23;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1217.5916,1868.7471,40.5118,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 23 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1217.5916,1868.7471,40.5118))
	  	{
            eecp[playerid] = 24;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1052.0552,1841.4481,53.6045,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);

		}
 	}
  	else if(eecp[playerid] == 24 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1052.0552,1841.4481,53.6045))
	  	{
            eecp[playerid] = 25;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -890.9316,1792.3468,59.6843,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 25 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -890.9316,1792.3468,59.6843))
	  	{
            eecp[playerid] = 26;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -835.3023,2014.1450,59.7518,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 26 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -835.3023,2014.1450,59.7518))
	  	{
            eecp[playerid] = 27;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -449.0349,2030.1443,60.1912,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 27 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-449.0349,2030.1443,60.1912))
	  	{
            eecp[playerid] = 28;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -380.6185,2064.7151,60.5565,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 28 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -380.6185,2064.7151,60.5565))
	  	{
            eecp[playerid] = 29;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -482.7137,1937.0267,86.1542,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 29 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -482.7137,1937.0267,86.1542))
	  	{
            eecp[playerid] = 30;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -432.8048,1759.6516,71.6326,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
  	else if(eecp[playerid] == 30 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -432.8048,1759.6516,71.6326))
	  	{
            eecp[playerid] = 31;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -412.7090,1915.2793,57.2441,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 31 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -412.7090,1915.2793,57.2441))
	  	{
            eecp[playerid] = 32;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -398.2184,1760.8228,43.2969,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 32 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -398.2184,1760.8228,43.2969))
	  	{
            eecp[playerid] = 33;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -306.2119,1734.5758,42.2557,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 33 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -306.2119,1734.5758,42.2557))
	  	{
            eecp[playerid] = 34;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -296.0934,1776.4517,42.2443,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 34 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -296.0934,1776.4517,42.2443))
	  	{
            eecp[playerid] = 35;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -296.0934,1776.4517,42.2443,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 35 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
		if(event == 2)
		{
			eecp[playerid] = 34+1;
			DisablePlayerCheckpoint(playerid);
      		ecp[playerid] = 0;
        	eecp[playerid] = 0;
   			new ciljime[MAX_PLAYER_NAME];
		    GetPlayerName(playerid, ciljime, sizeof(ciljime));
			mjesta++;
 			new novac;
  			if(mjesta == 1)
   			{
				novac = (400 + random(100));
                GivePlayerMoney(playerid,novac);
	  		}
	  		else if(mjesta == 2)
	  		{
				novac = (320 + random(80));
    			GivePlayerMoney(playerid,novac);
			}
			else if(mjesta == 3)
  			{
				novac = (270 + random(30));
    			GivePlayerMoney(playerid,novac);
			}
			format(string,sizeof(string),"| Desert Drive | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
			if(mjesta < 4)
			{
				SendClientMessageToAll(COLOR_RED,string);
			}
            return 1;
		}
	}
	//Suna Race
 	else if(eecp[playerid] == 36 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-325.1706,-2248.8979,33.5046))
	  	{
            eecp[playerid] = 37;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -597.4570,-2404.4929,29.3132,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
	 	}
  	}
  	else if(eecp[playerid] == 37 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-597.4570,-2404.4929,29.3132))
	  	{
            eecp[playerid] = 38;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -681.2627,-2546.2275,51.1518,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 38 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-681.2627,-2546.2275,51.1518))
	  	{
            eecp[playerid] = 39;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -766.5535,-2682.4795,83.7735,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 39 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-766.5535,-2682.4795,83.7735))
	  	{
            eecp[playerid] = 40;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1177.0337,-2637.6208,11.3035,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 40 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1177.0337,-2637.6208,11.3035))
	  	{
            eecp[playerid] = 41;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1687.8584,-2597.5212,32.5742,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 41 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1687.8584,-2597.5212,32.5742))
	  	{
            eecp[playerid] = 42;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1886.6205,-2405.4514,32.2512,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 42 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1886.6205,-2405.4514,32.2512))
	  	{
            eecp[playerid] = 43;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1625.6265,-2150.3423,26.2773,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
  	else if(eecp[playerid] == 43 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1625.6265,-2150.3423,26.2773))
	  	{
            eecp[playerid] = 44;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1282.6255,-2211.9915,21.9021,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 44 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1282.6255,-2211.9915,21.9021))
	  	{
            eecp[playerid] = 45;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1138.4730,-2370.8696,27.4629,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 45 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1138.4730,-2370.8696,27.4629))
	  	{
            eecp[playerid] = 46;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -960.0324,-2298.9758,55.6061,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 46 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-960.0324,-2298.9758,55.6061))
	  	{
            eecp[playerid] = 47;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -881.0465,-2182.2312,27.3002,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 47 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-881.0465,-2182.2312,27.3002))
	  	{
            eecp[playerid] = 48;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -743.7061,-2126.2551,24.9449,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 48 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -743.7061,-2126.2551,24.9449))
	  	{
            eecp[playerid] = 49;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -585.3354,-2027.5360,44.8629,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
  	else if(eecp[playerid] == 49 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -585.3354,-2027.5360,44.8629))
	  	{
            eecp[playerid] = 50;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -436.9301,-1926.6368,6.6865,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 50 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -436.9301,-1926.6368,6.6865))
	  	{
            eecp[playerid] = 51;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -312.1693,-1913.2491,12.7382,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 51 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -312.1693,-1913.2491,12.7382))
	  	{
            eecp[playerid] = 52;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -312.1693,-1913.2491,12.7382,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 52 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
		if(event == 3)
		{
			eecp[playerid] = 51+1;
			DisablePlayerCheckpoint(playerid);
      		ecp[playerid] = 0;
        	eecp[playerid] = 0;
   			new ciljime[MAX_PLAYER_NAME];
		    GetPlayerName(playerid, ciljime, sizeof(ciljime));
			mjesta++;
 			new novac;
  			if(mjesta == 1)
			{
				novac = (400 + random(100));
    			GivePlayerMoney(playerid,novac);
	  		}
		  	else if(mjesta == 2)
		  	{
				novac = (320 + random(80));
    			GivePlayerMoney(playerid,novac);
			}
  			else if(mjesta == 3)
		  	{
				novac = (270 + random(30));
  				GivePlayerMoney(playerid,novac);
			}
			format(string,sizeof(string),"| Suma Race | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
			if(mjesta < 4)
			{
				SendClientMessageToAll(COLOR_RED,string);
			}
            return 1;
		}
	}
	//EuroGaming drift
 	else if(eecp[playerid] == 53 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2443.6187,-574.5956,129.1409))
	  	{
            eecp[playerid] = 54;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2478.2944,-483.9623,99.3577,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Niste isli putanjom eventa, diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
	 	}
  	}
  	else if(eecp[playerid] == 54 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2478.2944,-483.9623,99.3577))
	  	{
            eecp[playerid] = 55;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2628.0479,-495.5981,69.9107,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 55 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2628.0479,-495.5981,69.9107))
	  	{
            eecp[playerid] = 56;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2326.9888,-458.8922,79.7254,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 56 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2326.9888,-458.8922,79.7254))
	  	{
            eecp[playerid] = 57;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2544.0840,-367.0291,54.0064,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 57 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2544.0840,-367.0291,54.0064))
	  	{
            eecp[playerid] = 58;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2670.6326,-411.1651,31.8645,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 58 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2670.6326,-411.1651,31.8645))
	  	{
            eecp[playerid] = 59;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2690.6035,-528.4266,14.8388,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 59 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2690.6035,-528.4266,14.8388))
	  	{
            eecp[playerid] = 60;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2768.2585,-464.8586,6.7569,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
//77
 	else if(eecp[playerid] == 60 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2768.2585,-464.8586,6.7569))
	  	{
            eecp[playerid] = 77;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2121.7278,-336.4850,35.0769,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
//-2121.7278,-336.4850,35.0769
//
  	else if(eecp[playerid] == 77 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2121.7278,-336.4850,35.0769))
	  	{
            eecp[playerid] = 61;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2017.4413,-364.3195,35.3545,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 61 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-2017.4413,-364.3195,35.3545))
	  	{
            eecp[playerid] = 62;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1910.9196,-847.5000,44.6581,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 62 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1910.9196,-847.5000,44.6581))
	  	{
            eecp[playerid] = 63;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1917.1376,-1206.4265,39.1836,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 63 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1917.1376,-1206.4265,39.1836))
	  	{
            eecp[playerid] = 64;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1987.9019,-1178.8926,39.1899,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 64 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0,-1987.9019,-1178.8926,39.1899))
	  	{
            eecp[playerid] = 65;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1998.4188,-1100.9287,31.5853,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 65 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1998.4188,-1100.9287,31.5853))
	  	{
            eecp[playerid] = 66;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1839.2584,-1162.3041,33.7973,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
  	else if(eecp[playerid] == 66 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1839.2584,-1162.3041,33.7973))
	  	{
            eecp[playerid] = 67;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1876.4980,-1241.5223,39.1838,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 67 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1876.4980,-1241.5223,39.1838))
	  	{
            eecp[playerid] = 68;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -1929.3359,-1363.7573,40.0579,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 68 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -1929.3359,-1363.7573,40.0579))
	  	{
            eecp[playerid] = 69;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2105.3196,-1102.6649,29.8719,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 69 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2105.3196,-1102.6649,29.8719))
	  	{
            eecp[playerid] = 70;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2209.4568,-984.0900,37.7013,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 70 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2209.4568,-984.0900,37.7013))
	  	{
            eecp[playerid] = 71;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2192.8350,-793.7011,60.5372,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 71 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2192.8350,-793.7011,60.5372))
	  	{
            eecp[playerid] = 72;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2239.6279,-748.4210,67.3935,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 72 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2239.6279,-748.4210,67.3935))
	  	{
            eecp[playerid] = 73;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2342.9885,-789.4672,93.4291,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 73 && IsAEvent(CID)  && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2342.9885,-789.4672,93.4291))
	  	{
            eecp[playerid] = 74;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2344.7322,-689.1230,113.8417,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	else if(eecp[playerid] == 74 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2344.7322,-689.1230,113.8417))
	  	{
            eecp[playerid] = 75;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2421.8689,-609.4372,132.2674,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
	else if(eecp[playerid] == 75 && IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
  	{
  		if(IsPlayerInRangeOfPoint(playerid, 25.0, -2421.8689,-609.4372,132.2674))
	  	{
            eecp[playerid] = 76;
		  	DisablePlayerCheckpoint(playerid);
		 	SetPlayerCheckpoint(playerid, -2421.8689,-609.4372,132.2674,10.0);
		}
		else
	 	{
			SendClientMessage(playerid, 0x9A6735FF, "Otisli ste sa putanje,diskvalificirani ste!");
		 	DisablePlayerCheckpoint(playerid);
            return 1;
		}
 	}
 	if(eecp[playerid] == 76)
  	{
        if(IsAEvent(CID) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
		{
   			if(event == 4)
			{
				eecp[playerid] = 75+1;
				DisablePlayerCheckpoint(playerid);
	      		ecp[playerid] = 0;
	        	eecp[playerid] = 0;
	   			new ciljime[MAX_PLAYER_NAME];
			    GetPlayerName(playerid, ciljime, sizeof(ciljime));
				mjesta++;
	 			new novac;
	  			if(mjesta == 1)
			       		{
							novac = (400 + random(100));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 2)
					  	{
							novac = (320 + random(80));
                            GivePlayerMoney(playerid,novac);
						}
					  	else if(mjesta == 3)
					  	{
							novac = (270 + random(30));
                            GivePlayerMoney(playerid,novac);
						}
				format(string,sizeof(string),"| EuroGaming Drift | Cilj: %s | Pozicija: %d | Nagrada: %d",ciljime,mjesta,novac);
				if(mjesta < 4)
				{
					SendClientMessageToAll(COLOR_RED,string);
				}
                return 1;
			}
		}
	}
	
}



public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_EVENTI)
    {
	if(!response) return SendClientMessage(playerid, 0xFFFFFFFF, "Odustali ste od organizovanja eventa.");
	if(response)
	{
	new id = strval(inputtext);
	if(!id || id > 19)
	{
	ShowPlayerDialog(playerid,225,DIALOG_STYLE_INPUT,"{F3FF02}[EVENTI GRESKA] Taj ID eventa ne postoji!","Event ID-ovi su:\n2 - Desert Drive\n3 - Suma Race\n4 - EuroGaming Drift\n5 - Vortex\n6 - Drift1\n7 - Drift2\n8 - EuroGaming Race\n9 - JetMax\n10 - Rally1\n11 - Rally2\n12 - Quad Race\n13 - Sanchez Race\n14 - Kart Race\n15 - Kruzna Trka\n16 - Morski Race\n17 - MC Vrh\n18 - NRG Race\nUnesi id eventa:","Unesi","Izlaz");
	return 1;
	}
	if(id == 2)
	{
	eventa[0] = AddStaticVehicleEx(495,-539.58489990,2583.02270508,53.97413635,270.00000000,-1,-1,15); //Sandking
	eventa[1] = AddStaticVehicleEx(495,-539.48999023,2577.98754883,53.97550201,270.00000000,6,6,15); //Sandking
	eventa[2] = AddStaticVehicleEx(495,-539.62109375,2572.98730469,53.97550201,270.00000000,1,1,15); //Sandking
	eventa[3] = AddStaticVehicleEx(495,-539.56427002,2568.23730469,53.97550201,270.00000000,3,3,15); //Sandking
	eventa[4] = AddStaticVehicleEx(495,-539.56811523,2563.48730469,53.97550201,270.00000000,2,2,15); //Sandking
	eventa[5] = AddStaticVehicleEx(495,-539.13836670,2603.90576172,53.97550201,270.00000000,1,6,15); //Sandking
	eventa[6] = AddStaticVehicleEx(495,-539.11914062,2608.65527344,53.97550201,270.00000000,3,-1,15); //Sandking
	eventa[7] = AddStaticVehicleEx(495,-539.04028320,2613.40527344,53.97550201,270.00000000,79,79,15); //Sandking
	eventa[8] = AddStaticVehicleEx(495,-538.89233398,2618.40527344,53.97550201,270.00000000,65,65,15); //Sandking
	eventa[9] = AddStaticVehicleEx(495,-538.63067627,2623.14599609,53.97550201,270.00000000,1,1,15); //Sandking
	eventa[10] = AddStaticVehicleEx(495,-539.85668945,2558.49707031,53.97550201,270.00000000,8,8,15); //Sandking
	eventa[11] = AddStaticVehicleEx(495,-539.70965576,2588.45629883,53.97550201,270.00000000,2,2,15); //Sandking
	eventa[12] = AddStaticVehicleEx(495,-538.72601318,2628.39550781,53.97550201,270.00000000,1,1,15); //Sandking
	eventa[13] = AddStaticVehicleEx(495,-538.80798340,2632.89550781,53.97550201,270.00000000,1,1,15); //Sandking
	eventa[14] = AddStaticVehicleEx(495,-539.32440186,2598.35278320,53.97413635,270.00000000,3,3,15); //Sandking
	ddrive[0] = CreateDynamicObject(975,-499.10000610,2593.10009766,52.29999924,0.00000000,0.00000000,268.50000000); //object(columbiangate) (1)
	ddrive[1] = CreateDynamicObject(983,-502.29998779,2588.19995117,53.20000076,0.75000000,0.00000000,270.75000000); //object(fenceshit3) (2)
	ddrive[2] = CreateDynamicObject(982,-519.70001221,2546.60009766,53.20000076,0.00000000,0.00000000,269.74499512); //object(fenceshit) (2)
	ddrive[3] = CreateDynamicObject(984,-506.60000610,2556.19995117,53.09999847,0.00000000,0.00000000,358.00000000); //object(fenceshit2) (1)
	ddrive[4] = CreateDynamicObject(984,-506.70001221,2553.00000000,53.09999847,0.00000000,0.00000000,357.99499512); //object(fenceshit2) (2)
	ddrive[5] = CreateDynamicObject(984,-537.29998779,2546.69995117,53.09999847,0.00000000,0.00000000,269.49499512); //object(fenceshit2) (3)
	ddrive[6] = CreateDynamicObject(982,-543.29998779,2559.60009766,53.20000076,0.00000000,0.00000000,357.99499512); //object(fenceshit) (3)
	ddrive[7] = CreateDynamicObject(982,-554.70001221,2577.10009766,53.20000076,0.00000000,0.00000000,68.24499512); //object(fenceshit) (4)
	ddrive[8] = CreateDynamicObject(982,-550.50000000,2612.80004883,53.20000076,0.00000000,0.00000000,134.24157715); //object(fenceshit) (5)
	ddrive[9] = CreateDynamicObject(984,-541.09997559,2628.10009766,53.09999847,0.00000000,0.00000000,357.99499512); //object(fenceshit2) (4)
	ddrive[10] = CreateDynamicObject(982,-528.00000000,2639.30004883,53.09999847,0.00000000,0.00000000,270.24182129); //object(fenceshit) (6)
	ddrive[11] = CreateDynamicObject(983,-540.90002441,2636.10009766,53.09999847,0.74707031,0.00000000,179.49707031); //object(fenceshit3) (3)
	ddrive[12] = CreateDynamicObject(984,-510.60000610,2639.39990234,53.00000000,0.00000000,0.00000000,270.24499512); //object(fenceshit2) (6)
	ddrive[13] = CreateDynamicObject(982,-504.60000610,2626.60009766,53.09999847,0.00000000,0.00000000,178.24169922); //object(fenceshit) (7)
	ddrive[14] = CreateDynamicObject(984,-505.10000610,2607.39990234,53.00000000,0.00000000,0.00000000,178.99169922); //object(fenceshit2) (7)
	ddrive[15] = CreateDynamicObject(983,-505.20001221,2601.00000000,53.00000000,359.99707031,0.00000000,179.24707031); //object(fenceshit3) (4)
	ddrive[16] = CreateDynamicObject(983,-502.00000000,2597.80004883,53.09999847,0.74707031,0.00000000,270.24707031); //object(fenceshit3) (6)
	ddrive[17] = CreateDynamicObject(982,-505.89999390,2575.39990234,53.20000076,0.00000000,0.00000000,358.00000000); //object(fenceshit) (1)
	ddrive[18] = CreateDynamicObject(9131,-499.20001221,2588.39990234,52.90000153,0.00000000,0.00000000,0.00000000); //object(shbbyhswall13_lvs) (1)
	ddrive[19] = CreateDynamicObject(9131,-499.00000000,2597.69995117,52.90000153,0.00000000,0.00000000,0.25000000);
	SCM(playerid, SVIJETLOPLAVA, "Event Desert Drive pokrenut");
	event = 2;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Desert Drive~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 3)
	{
	eventa[0] = AddStaticVehicleEx(471,-255.89941406,-2191.79980469,28.50000000,113.99951172,1,44,15); //Quad
	eventa[1] = AddStaticVehicleEx(471,-255.19921875,-2193.50000000,28.50000000,111.99462891,1,61,15); //Quad
	eventa[2] = AddStaticVehicleEx(471,-256.79980469,-2190.00000000,28.50000000,115.99365234,1,53,15); //Quad
	eventa[3] = AddStaticVehicleEx(471,-254.39941406,-2195.19921875,28.50000000,113.49426270,1,13,15); //Quad
	eventa[4] = AddStaticVehicleEx(471,-253.59960938,-2196.79980469,28.60000038,113.99414062,1,30,15); //Quad
	eventa[5] = AddStaticVehicleEx(471,-252.79980469,-2198.39941406,28.60000038,115.99365234,1,126,15); //Quad
	eventa[6] = AddStaticVehicleEx(471,-251.89941406,-2200.00000000,28.60000038,114.49401855,1,123,15); //Quad
	eventa[7] = AddStaticVehicleEx(471,-256.69921875,-2197.89941406,28.50000000,113.99414062,1,6,15); //Quad
	eventa[8] = AddStaticVehicleEx(471,-257.50000000,-2196.19921875,28.50000000,113.99414062,1,22,15); //Quad
	eventa[9] = AddStaticVehicleEx(471,-258.19921875,-2194.39941406,28.50000000,113.99414062,1,43,15); //Quad
	eventa[10] = AddStaticVehicleEx(471,-258.80963135,-2193.02978516,28.50000000,113.99414062,1,93,15); //Quad
	eventa[11] = AddStaticVehicleEx(471,-259.60400391,-2191.19335938,28.50000000,113.99414062,1,86,15); //Quad
	eventa[12] = AddStaticVehicleEx(471,-255.90478516,-2199.73535156,28.50000000,113.99414062,1,5,15); //Quad
	eventa[13] = AddStaticVehicleEx(471,-255.33381653,-2201.38964844,28.50000000,113.99414062,1,3,15); //Quad
	eventa[14] = AddStaticVehicleEx(471,-260.31576538,-2199.62744141,28.50000000,113.99414062,1,-1,15); //Quad
	srace[0] = CreateDynamicObject(982,-267.89999390,-2193.89990234,28.39999962,0.50000000,0.25000000,293.74780273); //object(fenceshit) (1)
	srace[1] = CreateDynamicObject(982,-262.20001221,-2205.39990234,28.39999962,0.99987793,0.24722290,293.7098); //object(fenceshit) (2)
	srace[2] = CreateDynamicObject(984,-253.39999390,-2194.50000000,28.50000000,359.50000000,359.25000000,26.24343872); //object(fenceshit2) (1)
	srace[3] = CreateDynamicObject(984,-276.79998779,-2204.80004883,28.20000076,0.24456787,0.49746704,26.24536133);
	SCM(playerid, SVIJETLOPLAVA, "Event Suma Race pokrenut");
	event = 3;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Suma Race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 4)
	{
	eventa[0] = AddStaticVehicleEx(477,-2399.78613281,-613.05255127,132.49844360,34.00000000,-1,-1,15); //ZR-350
	eventa[1] = AddStaticVehicleEx(477,-2397.27539062,-611.40893555,132.49844360,33.99719238,1,1,15); //ZR-350
	eventa[2] = AddStaticVehicleEx(477,-2394.55541992,-609.62847900,132.49844360,33.99719238,2,2,15); //ZR-350
	eventa[3] = AddStaticVehicleEx(477,-2392.04394531,-607.98510742,132.49844360,33.99719238,3,3,15); //ZR-350
	eventa[4] = AddStaticVehicleEx(477,-2391.10986328,-601.67333984,132.49844360,126.00000000,6,6,15); //ZR-350
	eventa[5] = AddStaticVehicleEx(477,-2392.76733398,-599.31805420,132.49844360,125.99719238,79,79,15); //ZR-350
	eventa[6] = AddStaticVehicleEx(477,-2394.53735352,-596.88348389,132.49844360,125.99670410,65,65,15); //ZR-350
	eventa[7] = AddStaticVehicleEx(477,-2396.30786133,-594.44891357,132.49844360,125.99670410,53,53,15); //ZR-350
	eventa[8] = AddStaticVehicleEx(477,-2397.95361328,-592.03723145,132.49844360,125.99670410,3,3,15); //ZR-350
	eventa[9] = AddStaticVehicleEx(477,-2399.63793945,-589.59375000,132.49844360,125.99670410,22,22,15); //ZR-350
	eventa[10] = AddStaticVehicleEx(477,-2401.45117188,-587.32666016,132.49844360,125.99670410,126,126,15); //ZR-350
	eventa[11] = AddStaticVehicleEx(477,-2403.20019531,-584.89013672,132.49844360,125.99670410,44,44,15); //ZR-350
	eventa[12] = AddStaticVehicleEx(477,-2409.30419922,-583.54968262,132.49844360,215.99609375,90,90,15); //ZR-350
	eventa[13] = AddStaticVehicleEx(477,-2411.77490234,-585.38348389,132.49844360,215.99121094,99,99,15); //ZR-350
	eventa[14] = AddStaticVehicleEx(477,-2414.40673828,-587.14849854,132.49844360,215.99121094,123,124,15); //ZR-350
	lsdok[0] = CreateDynamicObject(983,-2423.63305664,-590.59375000,132.45610046,0.00000000,0.00000000,36.00000000); //object(fenceshit3) (1)
	lsdok[1] = CreateDynamicObject(983,-2402.29003906,-617.69360352,132.45610046,0.00000000,0.00000000,43.99670410); //object(fenceshit3) (2)
	lsdok[2] = CreateDynamicObject(982,-2413.19604492,-604.30035400,132.24604797,0.00000000,0.00000000,38.00000000); //object(fenceshit) (1)
	SCM(playerid, SVIJETLOPLAVA, "Event EuroGaming drift pokrenut");
	event = 4;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~EuroGaming Drift~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 5)
	{
	lsdok[0] = CreateDynamicObject(983,-2866.32055664,412.58685303,4.41167355,0.00000000,0.00000000,0.00000000); //object(fenceshit3) (1)
	lsdok[1] = CreateDynamicObject(983,-2928.42333984,412.78186035,3.33090496,0.00000000,0.00000000,0.00000000); //object(fenceshit3) (2)
	lsdok[2] = CreateDynamicObject(10402,-2898.85131836,409.40045166,2.86385202,0.00000000,358.00000000,0.00000000); //object(hc_secfence_sfs) (1)
	eventa[0] = AddStaticVehicleEx(539,-2926.61010742,413.91159058,3.43939662,182.00000000,-1,-1,15); //Vortex
	eventa[1] = AddStaticVehicleEx(539,-2922.56835938,413.88867188,3.43939662,181.99951172,1,1,15); //Vortex
	eventa[2] = AddStaticVehicleEx(539,-2918.56835938,413.85888672,3.43939662,181.99951172,2,2,15); //Vortex
	eventa[3] = AddStaticVehicleEx(539,-2914.55468750,413.88897705,3.43939662,181.99951172,3,3,15); //Vortex
	eventa[4] = AddStaticVehicleEx(539,-2910.36108398,413.70620728,3.88735938,181.99951172,4,4,15); //Vortex
	eventa[5] = AddStaticVehicleEx(539,-2906.21069336,413.75421143,3.74948382,181.99951172,5,5,15); //Vortex
	eventa[6] = AddStaticVehicleEx(539,-2901.84741211,413.60070801,3.84992576,181.99951172,6,6,15); //Vortex
	eventa[7] = AddStaticVehicleEx(539,-2897.34667969,413.55883789,3.84992576,181.99951172,7,7,15); //Vortex
	eventa[8] = AddStaticVehicleEx(539,-2892.84667969,413.45941162,3.84992576,181.99951172,82,82,15); //Vortex
	eventa[9] = AddStaticVehicleEx(539,-2888.63452148,413.61218262,3.84992576,181.99951172,9,9,15); //Vortex
	eventa[10] = AddStaticVehicleEx(539,-2884.34960938,413.57479858,3.84992576,181.99951172,1,1,15); //Vortex
	eventa[11] = AddStaticVehicleEx(539,-2880.60302734,413.52664185,3.84992576,181.99951172,-1,-1,15); //Vortex
	eventa[12] = AddStaticVehicleEx(539,-2876.34960938,413.49935913,3.84992576,181.99951172,106,106,15); //Vortex
	eventa[13] = AddStaticVehicleEx(539,-2872.58691406,413.51165771,3.84992576,181.99951172,6,6,15); //Vortex
	eventa[14] = AddStaticVehicleEx(539,-2868.57714844,413.77502441,3.84992576,181.99951172,3,3,15); //Vortex
	SCM(playerid, SVIJETLOPLAVA, "Vortex event pokrenut");
	event = 5;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Vortex~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 6)
	{
	SCM(playerid, SVIJETLOPLAVA, "Drift event pokrenut");
	event = 6;
	slotovi = 15;
	eventa[0] = AddStaticVehicleEx(562,-287.33776855,1324.82153320,54.19244385,83.99597168,1,1,15); //Elegy
	eventa[1] = AddStaticVehicleEx(562,-287.48080444,1321.40441895,54.10952759,81.99645996,44,44,15); //Elegy
	eventa[2] = AddStaticVehicleEx(562,-288.43347168,1315.00439453,53.93434906,81.99645996,2,2,15); //Elegy
	eventa[3] = AddStaticVehicleEx(562,-288.86474609,1312.00195312,53.84280014,81.99645996,126,126,15); //Elegy
	eventa[4] = AddStaticVehicleEx(562,-289.24249268,1308.93127441,53.75569916,81.99645996,86,86,15); //Elegy
	eventa[5] = AddStaticVehicleEx(562,-289.76129150,1306.02331543,53.64820480,81.99645996,6,6,15); //Elegy
	eventa[6] = AddStaticVehicleEx(562,-291.21972656,1296.19433594,53.52655792,81.99645996,43,43,15); //Elegy
	eventa[7] = AddStaticVehicleEx(562,-291.75488281,1292.48242188,53.41165161,83.99597168,53,53,15); //Elegy
	eventa[8] = AddStaticVehicleEx(562,-286.95874023,1327.95629883,54.27618027,83.99597168,-1,-1,15); //Elegy
	eventa[9] = AddStaticVehicleEx(562,-287.95840454,1318.11254883,54.02265930,81.99096680,3,3,15); //Elegy
	eventa[10] = AddStaticVehicleEx(562,-289.98193359,1303.03125000,53.64820480,81.99645996,22,22,15); //Elegy
	eventa[11] = AddStaticVehicleEx(562,-290.54968262,1299.57739258,53.64820480,81.99645996,61,61,15); //Elegy
	eventa[12] = AddStaticVehicleEx(562,-307.38552856,1293.76440430,53.08210373,359.99584961,13,13,15); //Elegy
	eventa[13] = AddStaticVehicleEx(562,-307.29190063,1301.90148926,53.32653046,359.99450684,30,30,15); //Elegy
	eventa[14] = AddStaticVehicleEx(562,-304.22738647,1293.49902344,53.12705231,359.99450684,65,65,15); //Elegy
	lsdok[2] = CreateDynamicObject(982,-310.26800537,1318.65917969,53.63610077,2.00000000,0.00000000,354.00000000); //object(fenceshit) (1)
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Drift~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 7)
	{
	SCM(playerid, SVIJETLOPLAVA, "Drift2 event pokrenut");
	event = 7;
	slotovi = 15;
	eventa[0] = AddStaticVehicleEx(411,-2399.63208008,-613.44195557,132.44844055,36.00000000,-1,-1,15); //Infernus
	eventa[1] = AddStaticVehicleEx(411,-2394.55664062,-609.86035156,132.44844055,35.99670410,3,3,15); //Infernus
	eventa[2] = AddStaticVehicleEx(411,-2391.93701172,-608.01959229,132.44844055,35.99670410,2,2,15); //Infernus
	eventa[3] = AddStaticVehicleEx(411,-2390.95141602,-601.53637695,132.44844055,126.00000000,6,6,15); //Infernus
	eventa[4] = AddStaticVehicleEx(411,-2392.69433594,-599.09277344,132.44844055,125.99670410,86,86,15); //Infernus
	eventa[5] = AddStaticVehicleEx(411,-2394.35742188,-596.74218750,132.44844055,125.99670410,1,1,15); //Infernus
	eventa[6] = AddStaticVehicleEx(411,-2396.17578125,-594.38085938,132.44844055,125.99670410,123,123,15); //Infernus
	eventa[7] = AddStaticVehicleEx(411,-2397.70800781,-591.95898438,132.44844055,125.99670410,79,79,15); //Infernus
	eventa[8] = AddStaticVehicleEx(411,-2399.49121094,-589.53320312,132.44844055,125.99670410,30,30,15); //Infernus
	eventa[9] = AddStaticVehicleEx(411,-2401.23437500,-587.08984375,132.44844055,125.99670410,61,61,15); //Infernus
	eventa[10] = AddStaticVehicleEx(411,-2402.87890625,-584.75195312,132.44844055,125.99670410,22,22,15); //Infernus
	eventa[11] = AddStaticVehicleEx(411,-2409.49707031,-583.22851562,132.44844055,215.99670410,13,13,15); //Infernus
	eventa[12] = AddStaticVehicleEx(411,-2411.97460938,-584.94824219,132.44844055,215.99670410,126,126,15); //Infernus
	eventa[13] = AddStaticVehicleEx(411,-2414.51464844,-586.75390625,132.44844055,215.99670410,43,43,15); //Infernus
	eventa[14] = AddStaticVehicleEx(411,-2417.09863281,-588.43457031,132.44844055,215.99670410,44,44,15); //Infernus

    ddrive[3] = CreateDynamicObject(983,-2401.94018555,-618.39410400,132.42610168,0.00000000,0.00000000,46.00000000); //object(fenceshit3) (3)
    ddrive[4] = CreateDynamicObject(983,-2424.61547852,-589.19335938,132.42610168,0.00000000,0.00000000,35.99975586); //object(fenceshit3) (4)
    ddrive[5] = CreateDynamicObject(983,-2422.72998047,-591.76525879,132.39601135,0.00000000,0.00000000,35.99670410); //object(fenceshit3) (5)

    lsdok[2] = CreateDynamicObject(982,-2412.85180664,-605.32604980,132.24604797,0.00000000,0.00000000,36.00000000); //object(fenceshit) (2)
    SendClientMessageToAll(COL_NARANDZASTA,"Event ~Drift2 - EuroGaming~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
    }
    if(id == 8)
	{
	SCM(playerid, SVIJETLOPLAVA, "EuroGaming Race event pokrenut");
	event = 8;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~EuroGaming Race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");

    eventa[0] = AddStaticVehicleEx(503,-1496.57031250,996.47460938,7.15699053,90.00000000,-1,1,15); //Hotring Racer B
    eventa[1] = AddStaticVehicleEx(503,-1496.35021973,993.22778320,7.15699053,90.00000000,126,1,15); //Hotring Racer B
    eventa[2] = AddStaticVehicleEx(503,-1496.50585938,989.96435547,7.16940594,90.00000000,106,1,15); //Hotring Racer B
    eventa[3] = AddStaticVehicleEx(503,-1496.52954102,986.96398926,7.16940594,90.00000000,3,1,15); //Hotring Racer B
    eventa[4] = AddStaticVehicleEx(503,-1496.40551758,983.72802734,7.16940594,90.00000000,6,1,15); //Hotring Racer B
    eventa[5] = AddStaticVehicleEx(503,-1496.47277832,980.71875000,7.16940594,90.00000000,53,1,15); //Hotring Racer B
	eventa[6] = AddStaticVehicleEx(503,-1496.50744629,977.73266602,7.16940594,90.00000000,22,1,15); //Hotring Racer B
	eventa[7] = AddStaticVehicleEx(503,-1496.71386719,974.74053955,7.16940594,90.00000000,44,1,15); //Hotring Racer B
	eventa[8] = AddStaticVehicleEx(503,-1496.55468750,971.71191406,7.16940594,90.00000000,13,1,15); //Hotring Racer B
	eventa[9] = AddStaticVehicleEx(503,-1496.57324219,968.47949219,7.16940594,90.00000000,30,1,15); //Hotring Racer B
	eventa[10] = AddStaticVehicleEx(503,-1496.63281250,965.25000000,7.16940594,90.00000000,86,1,15); //Hotring Racer B
	eventa[11] = AddStaticVehicleEx(503,-1496.69433594,961.99902344,7.16940594,90.00000000,65,1,15); //Hotring Racer B
	eventa[12] = AddStaticVehicleEx(503,-1496.84570312,958.75292969,7.16940594,90.00000000,123,1,15); //Hotring Racer B
	eventa[13] = AddStaticVehicleEx(503,-1496.62207031,955.54492188,7.16940594,90.00000000,43,1,15); //Hotring Racer B
	eventa[14] = AddStaticVehicleEx(503,-1496.67675781,952.27929688,7.16940594,90.00000000,16,1,15); //Hotring Racer B

    ddrive[4] = CreateDynamicObject(983,-1496.07763672,950.58520508,6.87105465,0.00000000,0.00000000,90.00000000); //object(fenceshit3) (6)
    ddrive[5] = CreateDynamicObject(983,-1496.07812500,998.03417969,6.87105465,0.00000000,0.00000000,90.00000000); //object(fenceshit3) (7)

    lsdok[2] = CreateDynamicObject(10402,-1500.48352051,983.27526855,8.22199535,0.00000000,0.00000000,270.00000000); //object(hc_secfence_sfs) (2)

    }
    if(id == 9)
    {
    SCM(playerid, SVIJETLOPLAVA, "Jetmax event pokrenut");
    event = 9;
    slotovi = 15;
    eventa[0] = AddStaticVehicleEx(493,2227.06567383,-244.04663086,0.00000000,71.99291992,123,123,15); //Jetmax
    eventa[1] = AddStaticVehicleEx(493,2239.49145508,-208.50761414,0.00000000,71.98999023,43,43,15); //Jetmax
    eventa[2] = AddStaticVehicleEx(493,2253.10253906,-166.40301514,0.00000000,73.99096680,126,126,15); //Jetmax
    eventa[3] = AddStaticVehicleEx(493,2248.60888672,-182.42330933,0.00000000,71.98999023,6,6,15); //Jetmax
    eventa[4] = AddStaticVehicleEx(493,2231.92968750,-229.88908386,0.00000000,71.99145508,13,13,15); //Jetmax
	eventa[5] = AddStaticVehicleEx(493,2237.59765625,-214.12541199,0.00000000,71.99047852,22,22,15); //Jetmax
	eventa[6] = AddStaticVehicleEx(493,2236.19848633,-219.00708008,0.00000000,71.99096680,61,61,15); //Jetmax
	eventa[7] = AddStaticVehicleEx(493,2241.29711914,-202.59222412,0.00000000,71.99047852,53,53,15); //Jetmax
	eventa[8] = AddStaticVehicleEx(493,2249.88574219,-176.83708191,0.00000000,71.99047852,3,3,15); //Jetmax
	eventa[9] = AddStaticVehicleEx(493,2251.48559570,-171.55006409,0.00000000,71.99597168,106,106,15); //Jetmax
	eventa[10] = AddStaticVehicleEx(493,2246.92749023,-187.63131714,0.00000000,73.99597168,86,86,15); //Jetmax
	eventa[11] = AddStaticVehicleEx(493,2244.60424805,-192.73759460,0.00000000,71.99597168,-1,-1,15); //Jetmax
	eventa[12] = AddStaticVehicleEx(493,2229.69433594,-236.14974976,0.00000000,71.99743652,44,44,15); //Jetmax
	eventa[13] = AddStaticVehicleEx(493,2243.54687500,-197.68214417,0.00000000,71.99145508,1,1,15); //Jetmax
	eventa[14] = AddStaticVehicleEx(493,2234.13012695,-224.28451538,0.00000000,71.98645020,126,126,15); //Jetmax
	lsdok[2] = CreateDynamicObject(7371,2215.43579102,-245.20257568,-0.33074951,0.00000000,0.00000000,162.00000000); //object(vgsnelec_fence_02) (1)
    SendClientMessageToAll(COL_NARANDZASTA,"Event ~JetMax~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 10)
	{
	SCM(playerid, SVIJETLOPLAVA, "Relly 1 - Sultan event pokrenut");
	event = 10;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Relly 1 - Sultan~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	eventa[0] = AddStaticVehicleEx(560,-1950.28540039,-2478.68481445,30.73694611,43.99475098,-1,-1,15); //Sultan
	eventa[1] = AddStaticVehicleEx(560,-1947.93640137,-2476.06420898,30.92996979,43.99475098,13,13,15); //Sultan
	eventa[2] = AddStaticVehicleEx(560,-1945.41503906,-2473.27734375,31.00284958,43.99475098,2,2,15); //Sultan
	eventa[3] = AddStaticVehicleEx(560,-1942.90270996,-2470.70166016,30.93362999,43.99475098,43,43,15); //Sultan
	eventa[4] = AddStaticVehicleEx(560,-1940.22875977,-2467.68554688,30.85259247,43.99475098,22,22,15); //Sultan
	eventa[5] = AddStaticVehicleEx(560,-1963.86767578,-2464.73315430,30.42997551,225.99377441,-1,-1,15); //Sultan
	eventa[6] = AddStaticVehicleEx(560,-1961.39160156,-2462.13183594,30.42997551,227.99377441,44,44,15); //Sultan
	eventa[7] = AddStaticVehicleEx(560,-1937.77038574,-2465.26171875,30.78746796,43.99475098,6,6,15); //Sultan
	eventa[8] = AddStaticVehicleEx(560,-1958.72167969,-2459.51171875,30.42997551,227.99377441,123,123,15); //Sultan
	eventa[9] = AddStaticVehicleEx(560,-1956.26098633,-2456.63793945,30.44233322,227.99377441,3,3,15); //Sultan
	eventa[10] = AddStaticVehicleEx(560,-1953.57299805,-2453.80590820,30.42997551,227.99377441,125,125,15); //Sultan
	eventa[11] = AddStaticVehicleEx(560,-1951.73779297,-2450.93383789,30.42997551,227.99377441,6,6,15); //Sultan
	eventa[12] = AddStaticVehicleEx(560,-1949.27685547,-2448.75927734,30.42997551,227.99377441,30,30,15); //Sultan
	eventa[13] = AddStaticVehicleEx(560,-1935.60913086,-2462.51928711,30.71378136,43.99475098,1,1,15); //Sultan
	eventa[14] = AddStaticVehicleEx(560,-1956.82604980,-2470.45312500,30.42997551,313.99377441,126,126,15); //Sultan
	Relly1[0] = CreateDynamicObject(982,-1941.18530273,-2454.12207031,30.36674118,0.00000000,0.00000000,43.99926758); //object(fenceshit) (5)
	Relly1[1] = CreateDynamicObject(982,-1958.39660645,-2473.36914062,30.36674118,0.00000000,0.00000000,43.99475098); //object(fenceshit) (6)

	Relly1[2] = CreateDynamicObject(982,-1958.73339844,-2454.56542969,30.30855560,0.00000000,0.00000000,318.00000000); //object(fenceshit) (3)
	Relly1[3] = CreateDynamicObject(982,-1940.51196289,-2472.98706055,30.87361526,0.00000000,0.00000000,317.99926758); //object(fenceshit) (4)
	}
	if(id == 11)
	{
	SCM(playerid, SVIJETLOPLAVA, "Relly 2 - Bandito event pokrenut");
	event = 11;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Relly 2 - Bandito~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	eventa[0] = AddStaticVehicleEx(568,285.37884521,-713.87841797,4.66370916,0.00000000,-1,-1,15); //Bandito
	eventa[1] = AddStaticVehicleEx(568,288.27725220,-713.96636963,4.80195951,0.00000000,-1,-1,15); //Bandito
	eventa[2] = AddStaticVehicleEx(568,291.17199707,-714.19354248,4.94776487,0.00000000,-1,-1,15); //Bandito
	eventa[3] = AddStaticVehicleEx(568,294.29531860,-714.28057861,5.09890699,0.00000000,-1,-1,15); //Bandito
	eventa[4] = AddStaticVehicleEx(568,297.10568237,-714.36328125,5.23490477,0.00000000,-1,-1,15); //Bandito
	eventa[5] = AddStaticVehicleEx(568,299.85626221,-714.30499268,5.36804724,0.00000000,-1,-1,15); //Bandito
	eventa[6] = AddStaticVehicleEx(568,302.71575928,-714.40826416,5.50419188,0.00000000,-1,-1,15); //Bandito
	eventa[7] = AddStaticVehicleEx(568,305.49932861,-714.47882080,5.70663404,0.00000000,-1,-1,15); //Bandito
	eventa[8] = AddStaticVehicleEx(568,308.53314209,-714.52215576,5.98633528,0.00000000,-1,-1,15); //Bandito
	eventa[9] = AddStaticVehicleEx(568,311.40234375,-714.62927246,6.25083113,359.79089355,-1,-1,15); //Bandito
	eventa[10] = AddStaticVehicleEx(568,314.18975830,-714.62615967,6.50783682,359.78576660,-1,-1,15); //Bandito
	eventa[11] = AddStaticVehicleEx(568,317.12606812,-714.38922119,6.55076361,359.78576660,-1,-1,15); //Bandito
	eventa[12] = AddStaticVehicleEx(568,320.38537598,-714.42687988,7.05076361,359.78576660,-1,-1,15); //Bandito
	eventa[13] = AddStaticVehicleEx(568,323.38281250,-714.50097656,7.30076361,359.78576660,-1,-1,15); //Bandito
	eventa[14] = AddStaticVehicleEx(568,326.36914062,-714.71093750,7.63075972,359.78576660,-1,-1,15); //Bandito
	Relly1[2] = CreateDynamicObject(10402,295.20111084,-718.53833008,4.32807636,1.98852539,355.98999023,0.13732910); //object(hc_secfence_sfs) (4)
	Relly1[3] = CreateDynamicObject(983,327.85644531,-715.37207031,7.47617054,0.00000000,0.00000000,0.00000000); //object(fenceshit3) (8)
	Relly1[0] = CreateDynamicObject(10402,295.19042969,-710.78027344,3.82807636,1.99401855,355.99548340,358.13732910); //object(hc_secfence_sfs) (3)
	}
	if(id == 12)
	{
	SCM(playerid, SVIJETLOPLAVA, "Quad race event pokrenut");
	event = 12;
	slotovi = 15;
	eventa[0] = AddStaticVehicleEx(471,-2524.87573242,-1470.46252441,360.51330566,133.99475098,43,43,15); //Quad
	eventa[1] = AddStaticVehicleEx(471,-2523.11230469,-1472.11657715,360.57659912,133.99475098,13,13,15); //Quad
	eventa[2] = AddStaticVehicleEx(471,-2526.10400391,-1468.79492188,360.56491089,133.99475098,61,61,15); //Quad
	eventa[3] = AddStaticVehicleEx(471,-2525.29516602,-1473.85144043,360.44778442,133.99475098,22,22,15); //Quad
	eventa[4] = AddStaticVehicleEx(471,-2526.80712891,-1472.16625977,360.41723633,133.99475098,30,30,15); //Quad
	eventa[5] = AddStaticVehicleEx(471,-2528.17675781,-1470.65490723,360.46389771,133.99475098,2,2,15); //Quad
	eventa[6] = AddStaticVehicleEx(471,-2527.20605469,-1475.52734375,360.34442139,133.99475098,86,86,15); //Quad
	eventa[7] = AddStaticVehicleEx(471,-2528.82470703,-1474.08398438,360.31365967,133.99475098,44,44,15); //Quad
	eventa[8] = AddStaticVehicleEx(471,-2530.09716797,-1472.58044434,360.34832764,133.99475098,1,1,15); //Quad
	eventa[9] = AddStaticVehicleEx(471,-2528.99584961,-1477.08740234,360.53485107,133.99475098,6,6,15); //Quad
	eventa[10] = AddStaticVehicleEx(471,-2530.63354492,-1475.78686523,360.22000122,133.99475098,-1,-1,15); //Quad
	eventa[11] = AddStaticVehicleEx(471,-2531.98315430,-1474.20507812,360.26342773,133.99475098,3,3,15); //Quad
	eventa[12] = AddStaticVehicleEx(471,-2531.20410156,-1479.27832031,360.14306641,133.99475098,65,65,15); //Quad
	eventa[13] = AddStaticVehicleEx(471,-2532.60937500,-1477.70800781,360.11431885,133.99475098,53,53,15); //Quad
	eventa[14] = AddStaticVehicleEx(471,-2534.12304688,-1476.22656250,360.14782715,133.99475098,126,126,15); //Quad
	Relly1[2] = CreateDynamicObject(983,-2523.78881836,-1469.68176270,360.49868774,0.00000000,0.00000000,43.99279785); //object(fenceshit3) (12)
	Relly1[3] = CreateDynamicObject(984,-2526.00292969,-1476.49707031,360.16143799,1.99401855,0.00000000,313.99475098); //object(fenceshit2) (3)
	ddrive[4] = CreateDynamicObject(984,-2530.68457031,-1471.87695312,360.16143799,1.98852539,0.00000000,313.98925781); //object(fenceshit2) (4)
	Relly1[0] = CreateDynamicObject(983,-2533.10839844,-1478.90332031,359.99868774,0.00000000,0.00000000,45.99523926); //object(fenceshit3) (9)
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Quad race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	}
	if(id == 13)
	{
	SCM(playerid, SVIJETLOPLAVA, "Sanchez race event pokrenut");
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Sanchez race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	event = 13;
	slotovi = 15;
	eventa[0] = AddStaticVehicleEx(468,-2534.79980469,-1481.12329102,360.14608765,133.99475098,116,116,15); //Sanchez
	eventa[1] = AddStaticVehicleEx(468,-2535.92871094,-1479.94042969,360.14978027,133.99475098,-1,3,15); //Sanchez
	eventa[2] = AddStaticVehicleEx(468,-2537.04492188,-1478.78417969,360.14898682,133.99475098,6,3,15); //Sanchez
	eventa[3] = AddStaticVehicleEx(468,-2539.26831055,-1481.36853027,359.83773804,133.99475098,75,3,15); //Sanchez
	eventa[4] = AddStaticVehicleEx(468,-2538.10986328,-1482.52404785,359.77017212,133.99475098,7,3,15); //Sanchez
	eventa[5] = AddStaticVehicleEx(468,-2536.99609375,-1483.62792969,359.75085449,133.99475098,118,118,15); //Sanchez
	eventa[6] = AddStaticVehicleEx(468,-2535.83276367,-1484.62622070,359.84020996,133.99475098,-1,-1,15); //Sanchez
	eventa[7] = AddStaticVehicleEx(468,-2541.21679688,-1483.66174316,359.46044922,137.99475098,125,3,15); //Sanchez
	eventa[8] = AddStaticVehicleEx(468,-2540.00439453,-1484.61694336,359.39511108,135.99475098,65,3,15); //Sanchez
	eventa[9] = AddStaticVehicleEx(468,-2538.82421875,-1485.70410156,359.35482788,135.99426270,7,3,15); //Sanchez
	eventa[10] = AddStaticVehicleEx(468,-2537.62670898,-1486.76220703,359.44155884,139.99475098,6,3,15); //Sanchez
	eventa[11] = AddStaticVehicleEx(468,-2540.59887695,-1488.14636230,359.19561768,135.99426270,1,3,15); //Sanchez
	eventa[12] = AddStaticVehicleEx(468,-2542.09912109,-1487.14697266,359.20513916,135.99426270,2,3,15); //Sanchez
	eventa[13] = AddStaticVehicleEx(468,-2543.27368164,-1486.19885254,359.26342773,135.99426270,3,3,15); //Sanchez
	eventa[14] = AddStaticVehicleEx(468,-2539.20703125,-1489.23535156,359.26757812,135.99426270,-1,-1,15); //Sanchez					SendClientMessageToAll(-1,"Event ~Sanchez race~ pokrenut! Broj mjesta na eventu je: 10!  Da se pridruzite kucajte \"/join\"");
	Relly1[0] = CreateDynamicObject(983,-2533.97143555,-1479.44396973,359.99868774,0.00000000,356.00000000,47.98974609); //object(fenceshit3) (10)
	Relly1[0] = CreateDynamicObject(983,-2542.24096680,-1488.85595703,358.99868774,0.00000000,0.00000000,51.99523926); //object(fenceshit3) (11)
	Relly1[2] = CreateDynamicObject(984,-2540.54199219,-1482.04687500,359.41143799,5.99853516,0.00000000,317.99926758); //object(fenceshit2) (1)
	Relly1[3] = CreateDynamicObject(984,-2535.64355469,-1486.29101562,359.41143799,5.99853516,0.00000000,317.99377441); //object(fenceshit2) (2)
	}
	if(id == 14)
	{
	SCM(playerid, SVIJETLOPLAVA, "Karting race event pokrenut");
	event = 14;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Karting race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	eventa[0] = AddStaticVehicleEx(571,-2274.97094727,2284.22998047,4.15249538,0.00000000,3,1,15); //Kart
	eventa[1] = AddStaticVehicleEx(571,-2273.16577148,2284.14306641,4.15249538,0.00000000,1,22,15); //Kart
	eventa[2] = AddStaticVehicleEx(571,-2271.26660156,2284.11791992,4.15249538,0.00000000,-1,22,15); //Kart
	eventa[3] = AddStaticVehicleEx(571,-2267.64428711,2284.14819336,4.15249538,0.00000000,125,22,15); //Kart
	eventa[4] = AddStaticVehicleEx(571,-2259.02343750,2284.18652344,4.15249538,0.00000000,6,22,15); //Kart
	eventa[5] = AddStaticVehicleEx(571,-2257.12963867,2284.21289062,4.15249538,0.00000000,125,22,15); //Kart
	eventa[6] = AddStaticVehicleEx(571,-2255.24511719,2284.12915039,4.15249538,0.00000000,3,22,15); //Kart
	eventa[7] = AddStaticVehicleEx(571,-2253.43725586,2284.16113281,4.15249538,0.00000000,-1,-1,15); //Kart
	eventa[8] = AddStaticVehicleEx(571,-2251.55102539,2284.17822266,4.15249538,0.00000000,1,1,15); //Kart
	eventa[9] = AddStaticVehicleEx(571,-2249.73437500,2284.16333008,4.15249538,0.00000000,6,22,15); //Kart
	eventa[10] = AddStaticVehicleEx(571,-2262.12670898,2284.16723633,4.15249538,0.00000000,2,22,15); //Kart
	eventa[11] = AddStaticVehicleEx(571,-2265.77563477,2284.16528320,4.15249538,0.00000000,3,22,15); //Kart
	eventa[12] = AddStaticVehicleEx(571,-2260.62597656,2284.22509766,4.15249538,0.00000000,2,22,15); //Kart
	eventa[13] = AddStaticVehicleEx(571,-2269.64355469,2284.13769531,4.15249538,0.00000000,125,22,15); //Kart
	eventa[14] = AddStaticVehicleEx(571,-2263.87597656,2284.18066406,4.15249538,0.00000000,2,22,15); //Kart
	KartO[0] = CreateDynamicObject(982,-2262.36132812,2286.95800781,3.75376797,0.00000000,0.00000000,90.00000000); //object(fenceshit) (7)
	KartO[1] = CreateDynamicObject(982,-2262.16992188,2282.96191406,4.25376797,0.00000000,0.00000000,90.00000000); //object(fenceshit) (8)
	KartO[2] = CreateDynamicObject(983,-2275.98730469,2285.66210938,4.15341568,0.00000000,0.00000000,0.00000000); //object(fenceshit3) (13)
	KartO[3] = CreateDynamicObject(983,-2248.48339844,2286.03906250,4.15341568,0.00000000,0.00000000,0.00000000); //object(fenceshit3) (14)
	}
	if(id == 15)
	{
	SCM(playerid, SVIJETLOPLAVA, "Kruzna trka event pokrenut");
	event = 15;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Kruzna Trka~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	lsdok[2] = CreateDynamicObject(10402,3992.61914062,-2066.39697266,1.87723041,0.00000000,0.00000000,2.00000000); //object(hc_secfence_sfs) (5)
	eventa[0] = AddStaticVehicleEx(451,4032.60839844,-1973.55285645,2.49404716,0.00000000,53,53,15); //Turismo
	eventa[1] = AddStaticVehicleEx(451,4038.35498047,-1973.31311035,2.49404716,0.00000000,53,53,15); //Turismo
	eventa[2] = AddStaticVehicleEx(451,4032.38940430,-2014.18408203,2.49404716,0.00000000,-1,-1,15); //Turismo
	eventa[3] = AddStaticVehicleEx(451,4038.14062500,-2014.36315918,2.49404716,0.00000000,-1,-1,15); //Turismo
	eventa[4] = AddStaticVehicleEx(451,4032.43750000,-2054.26269531,2.49404716,0.00000000,6,6,15); //Turismo
	eventa[5] = AddStaticVehicleEx(451,4038.43750000,-2054.19921875,2.49404716,0.00000000,6,6,15); //Turismo
	eventa[6] = AddStaticVehicleEx(451,4032.26538086,-2094.06860352,2.49404716,0.00000000,3,3,15); //Turismo
	eventa[7] = AddStaticVehicleEx(451,4038.52172852,-2094.08715820,2.49404716,0.00000000,3,3,15); //Turismo
	eventa[8] = AddStaticVehicleEx(451,4038.35498047,-2034.08715820,2.49404716,0.00000000,22,22,15); //Turismo
	eventa[9] = AddStaticVehicleEx(451,4032.58544922,-2034.09667969,2.49404716,0.00000000,22,22,15); //Turismo
	eventa[10] = AddStaticVehicleEx(451,4038.49804688,-2074.00146484,2.49404716,0.00000000,126,126,15); //Turismo
	eventa[11] = AddStaticVehicleEx(451,4032.24804688,-2074.04907227,2.49404716,0.00000000,126,126,15); //Turismo
	eventa[12] = AddStaticVehicleEx(451,4038.35668945,-1994.07116699,2.49404716,0.00000000,86,86,15); //Turismo
	eventa[13] = AddStaticVehicleEx(451,4032.35644531,-1994.07324219,2.49404716,0.00000000,86,86,15); //Turismo
	eventa[14] = AddStaticVehicleEx(451,4032.45776367,-1953.06274414,2.49404716,0.00000000,1,1,15); //Turismo
	}
	if(id == 16)
	{
	SCM(playerid, SVIJETLOPLAVA, "Morski race event pokrenut");
	event = 16;
	slotovi = 15;
	lsdok[2] = CreateDynamicObject(10402,714.23864746,-3311.00585938,15.64466190,0.00000000,0.00000000,0.00000000); //object(hc_secfence_sfs) (1)
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Morski Race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	eventa[0] = AddStaticVehicleEx(411,682.98284912,-3370.13720703,14.43459988,0.00000000,126,126,10000); //Infernus
	eventa[1] = AddStaticVehicleEx(411,683.15093994,-3360.36987305,14.43459988,0.00000000,6,6,15); //Infernus
	eventa[2] = AddStaticVehicleEx(411,725.32904053,-3367.30419922,14.43459988,0.00000000,126,126,10000); //Infernus
	eventa[3] = AddStaticVehicleEx(411,725.40264893,-3357.23388672,14.43459988,0.00000000,6,6,10000); //Infernus
	eventa[4] = AddStaticVehicleEx(411,725.51147461,-3377.30273438,14.43459988,0.00000000,86,86,10000); //Infernus
	eventa[5] = AddStaticVehicleEx(411,725.54089355,-3387.05273438,14.43459988,0.00000000,3,3,10000); //Infernus
	eventa[6] = AddStaticVehicleEx(411,725.64465332,-3397.06298828,14.43459988,0.00000000,140,150,10000); //Infernus
	eventa[7] = AddStaticVehicleEx(411,725.70996094,-3407.07275391,14.43459988,0.00000000,22,22,10000); //Infernus
	eventa[8] = AddStaticVehicleEx(411,725.75402832,-3417.15063477,14.43459988,0.00000000,53,53,10000); //Infernus
	eventa[9] = AddStaticVehicleEx(411,725.42443848,-3427.17211914,14.43459988,0.00000000,61,61,10000); //Infernus
	eventa[10] = AddStaticVehicleEx(411,683.19812012,-3380.13647461,14.43459988,0.00000000,86,86,10000); //Infernus
	eventa[11] = AddStaticVehicleEx(411,683.16693115,-3390.14111328,14.43459988,0.00000000,3,3,10000); //Infernus
	eventa[12] = AddStaticVehicleEx(411,683.14855957,-3400.14257812,14.43459988,0.00000000,14,15,10000); //Infernus
	eventa[13] = AddStaticVehicleEx(411,683.19580078,-3410.14086914,14.43459988,0.00000000,22,22,10000); //Infernus
	eventa[14] = AddStaticVehicleEx(411,683.34118652,-3420.14062500,14.43459988,0.00000000,53,53,10000); //Infernus
	}
	if(id == 17)
	{
	SCM(playerid, SVIJETLOPLAVA, "MC vrh event pokrenut");
	event = 17;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~Mounth Chiliad Vrh~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	eventa[0] = AddStaticVehicleEx(468,-2394.57934570,-2176.03369141,33.04906082,173.99597168,44,44,15); //Sanchez
	eventa[1] = AddStaticVehicleEx(468,-2406.28491211,-2170.23974609,33.04906082,173.99969482,86,86,15); //Sanchez
	eventa[2] = AddStaticVehicleEx(468,-2397.83081055,-2170.77294922,33.04906082,173.99597168,53,53,15); //Sanchez
	eventa[3] = AddStaticVehicleEx(468,-2394.50488281,-2170.40966797,33.04906082,173.99597168,53,53,15); //Sanchez
	eventa[4] = AddStaticVehicleEx(468,-2390.49316406,-2170.24658203,33.04906082,173.99597168,117,117,15); //Sanchez
	eventa[5] = AddStaticVehicleEx(468,-2402.44506836,-2170.68432617,33.04906082,173.99597168,-1,-1,15); //Sanchez
	eventa[6] = AddStaticVehicleEx(468,-2390.35546875,-2175.62207031,33.04906082,173.99597168,22,22,15); //Sanchez
	eventa[7] = AddStaticVehicleEx(468,-2398.04833984,-2175.97265625,33.04906082,173.99597168,3,3,15); //Sanchez
	eventa[8] = AddStaticVehicleEx(468,-2402.16894531,-2176.11840820,33.04906082,173.99597168,106,106,15); //Sanchez
	eventa[9] = AddStaticVehicleEx(468,-2394.88647461,-2180.71191406,33.04906082,173.99597168,1,1,15); //Sanchez
	eventa[10] = AddStaticVehicleEx(468,-2406.33911133,-2176.39965820,33.04906082,173.99597168,106,106,15); //Sanchez
	eventa[11] = AddStaticVehicleEx(468,-2398.64306641,-2180.94140625,33.04906082,173.99597168,126,126,15); //Sanchez
	eventa[12] = AddStaticVehicleEx(468,-2390.78198242,-2180.64355469,33.04906082,173.99597168,6,6,15); //Sanchez
	eventa[13] = AddStaticVehicleEx(468,-2406.14111328,-2181.05834961,33.04906082,173.99597168,44,44,15); //Sanchez
	eventa[14] = AddStaticVehicleEx(468,-2402.56445312,-2180.40747070,33.04906082,173.99597168,13,13,15); //Sanchez
	lsdok[2] = CreateDynamicObject(983,-2376.54467773,-2196.51538086,33.02426147,0.00000000,0.00000000,26.00000000); //object(fenceshit3) (15)
	}
	if(id == 18)
	{
	SCM(playerid, SVIJETLOPLAVA, "NRG race event pokrenut");
	event = 18;
	slotovi = 15;
	SendClientMessageToAll(COL_NARANDZASTA,"Event ~NRG Race~ pokrenut! Broj mjesta na eventu je: 15!  Da se pridruzite kucajte \"/join\"");
	lsdok[2] = CreateDynamicObject(984,1409.36511230,-1323.84814453,8.20035934,0.00000000,0.00000000,270.00000000); //object(fenceshit2) (1)
	eventa[0] = AddStaticVehicleEx(522,1407.05566406,-1304.55920410,8.62742138,234.00000000,-1,-1,15); //NRG-500
	eventa[1] = AddStaticVehicleEx(522,1406.73156738,-1306.24865723,8.55903339,233.99780273,6,6,15); //NRG-500
	eventa[2] = AddStaticVehicleEx(522,1406.64489746,-1307.86218262,8.54613972,233.99780273,126,126,15); //NRG-500
	eventa[3] = AddStaticVehicleEx(522,1406.79101562,-1309.70349121,8.54909325,233.99780273,3,3,15); //NRG-500
	eventa[4] = AddStaticVehicleEx(522,1406.65026855,-1311.71191406,8.42255402,233.99780273,86,86,15); //NRG-500
	eventa[5] = AddStaticVehicleEx(522,1406.62194824,-1313.89111328,8.32170010,233.99780273,1,1,15); //NRG-500
	eventa[6] = AddStaticVehicleEx(522,1406.66931152,-1316.00305176,8.27493000,233.99780273,53,53,15); //NRG-500
	eventa[7] = AddStaticVehicleEx(522,1413.95178223,-1304.41625977,9.27403164,125.99743652,108,108,15); //NRG-500
	eventa[8] = AddStaticVehicleEx(522,1414.02844238,-1306.07861328,9.14538479,123.99279785,22,22,15); //NRG-500
	eventa[9] = AddStaticVehicleEx(522,1414.00695801,-1307.54724121,9.01398277,123.99279785,111,111,15); //NRG-500
	eventa[10] = AddStaticVehicleEx(522,1413.96142578,-1309.40539551,8.96673965,125.99279785,44,44,15); //NRG-500
	eventa[11] = AddStaticVehicleEx(522,1413.93920898,-1311.27404785,9.08499908,125.99121094,43,43,15); //NRG-500
	eventa[12] = AddStaticVehicleEx(522,1414.08666992,-1313.25109863,9.17232704,125.99121094,30,30,15); //NRG-500
	eventa[13] = AddStaticVehicleEx(522,1414.08752441,-1315.13452148,9.25588799,125.99121094,1,1,15); //NRG-500
	eventa[14] = AddStaticVehicleEx(468,-2402.56445312,-2180.40747070,33.04906082,173.99597168,13,13,15); //Sanchez
	Relly1[2] = CreateDynamicObject(983,-2376.54467773,-2196.51538086,33.02426147,0.00000000,0.00000000,26.00000000); //object(fenceshit3) (15)
	}
	new sendername[MAX_PLAYER_NAME];
	new string[120];
	GetPlayerName(playerid,sendername,sizeof(sendername));
	if(PlayerInfo[playerid][pAdmin] >= 1)
	{
	format(string, sizeof(string), "[ADMIN] %s [%d] je pokrenuo event",sendername,playerid);
	}
	else
	{
	format(string, sizeof(string), "[GAMEMASTER] %s [%d] je pokrenuo event",sendername,playerid);
	}
	SendClientMessageToAll(COL_NARANDZASTA, "POCEO JE EVENT - /JOIN!");
	}

	return 1;
	}
	
	if(dialogid == DIALOG_EVENTPORT)
	{
	if(response)
	{
	if(listitem == 0) // LSDR
	{
    SetPlayerPos(playerid,-509.9478,2589.1721,52.9780);
	}
	if(listitem == 1) // LSDR
	{
	SetPlayerPos(playerid,-269.5549,-2165.1125,28.7574);
	}
	if(listitem == 2) // LSDR
	{
    SetPlayerPos(playerid,-2421.8689,-609.4372,132.2674);
	}
	if(listitem == 3) // LSDR
    {
    SetPlayerPos(playerid,-2877.5713,423.5097,4.9590);
	}
	if(listitem == 4) // LSDR
	{
    SetPlayerPos(playerid,-306.8569,1302.5017,53.6073);
	}
	if(listitem == 5) // LSDR
	{
    SetPlayerPos(playerid,-2396.9985,-571.4738,132.1172);
	}
	if(listitem == 6) // LSDR
	{
    SetPlayerPos(playerid,-1509.5323,975.5475,7.1853);
	}
	if(listitem == 7) // LSDR
	{
    SetPlayerPos(playerid,2282.8188,-223.8763,11.7244);
	}
	if(listitem == 8) // LSDR
	{
    SetPlayerPos(playerid,-1947.5833,-2460.6743,30.7485);
	}
	if(listitem == 9) // LSDR
	{
    SetPlayerPos(playerid,303.3947,-732.6323,5.5578);
	}
	if(listitem == 10) // LSDR
	{
    SetPlayerPos(playerid,-2498.3689,-1453.5709,361.8633);
	}
	if(listitem == 11) // LSDR
	{
    SetPlayerPos(playerid,-2538.3408,-1470.2476,360.5102);
	}
	if(listitem == 12) // LSDR
	{
    SetPlayerPos(playerid,-2260.2354,2278.6064,4.9886);
	}
	if(listitem == 13) // LSDR
	{
    SetPlayerPos(playerid,4007.8320,-1958.6887,2.5697);
	}
	if(listitem == 14) // LSDR
	{
    SetPlayerPos(playerid,682.98284912,-3370.13720703,14.43459988);
	}
	if(listitem == 15) // LSDR
	{
    SetPlayerPos(playerid,704.7015,-3434.2771,18.2241);
	}
	if(listitem == 16) // LSDR
	{
    SetPlayerPos(playerid,4033.7151,-2105.4895,5.9028);
	}
	return 1;
	}
	}
	
}
	
	
OnPlayerDisconnect(playerid) || OnPlayerDeath
{
    if(ecp[playerid] != 0)
	{
		Prisustvuje[playerid] = false;
		vorcp[playerid] = 0;

	}
}
	
	
	

CMD:zaustavievent(playerid, params[])
{
    //#pragma unused help
	//#pragma unused params
    if(UlogovanProvera[playerid] == 0) return SCM(playerid,-1,"FarkiAS | "CRVENA"Moras se ulogovati da bi koristio ovu komandu!");
	if(AdminDuty[playerid] == 0 && GMDuty[playerid] == 0) return SCM(playerid,-1,""CRVENA"[FarkiAS] "SIVA"Morate biti na Admin & GameMaster duznosti!");
	if (PlayerInfo[playerid][pGM] >= 2 || PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(event == 19 || event == 18 || event == 17 ||  event == 16 || event == 15 || event == 14 || event == 13 || event == 12 ||  event == 11 || event == 10 || event == 9 || event == 8 || event == 7 || event == 6 || event == 5 ||event == 4 || event == 3 || event == 2 || event == 1)
		{
			foreach(Player,i)
			{
                if(event != 0 && Prisustvuje[i] != false)
                {
   					SetPlayerHealth(i,0);
                    PlayerInfo[i][pPridruzeneventu] = 0;
					DisablePlayerCheckpoint(i);
					Prisustvuje[i] = false;
					ecp[i] = 0;
					eecp[i] = 0;
					vorcp[i] = 0;
				}
			}
			auts = false;
	        event = 0;
	        DestroyDynamicObject(lsdok[0]); DestroyDynamicObject(lsdok[1]); DestroyDynamicObject(lsdok[2]);
			DestroyDynamicObject(ddrive[0]); DestroyDynamicObject(ddrive[1]); DestroyDynamicObject(ddrive[2]); DestroyDynamicObject(ddrive[3]); DestroyDynamicObject(ddrive[4]); DestroyDynamicObject(ddrive[5]); DestroyDynamicObject(ddrive[6]);
			DestroyDynamicObject(ddrive[7]); DestroyDynamicObject(ddrive[8]); DestroyDynamicObject(ddrive[9]); DestroyDynamicObject(ddrive[10]); DestroyDynamicObject(ddrive[11]); DestroyDynamicObject(ddrive[12]); DestroyDynamicObject(ddrive[13]); DestroyDynamicObject(ddrive[14]); DestroyDynamicObject(ddrive[15]); DestroyDynamicObject(ddrive[16]); DestroyDynamicObject(ddrive[17]); DestroyDynamicObject(ddrive[18]); DestroyDynamicObject(ddrive[19]);
			DestroyDynamicObject(KartO[0]); DestroyDynamicObject(KartO[1]); DestroyDynamicObject(KartO[2]); DestroyDynamicObject(KartO[3]);
			DestroyDynamicObject(srace[0]); DestroyDynamicObject(srace[1]); DestroyDynamicObject(srace[2]); DestroyDynamicObject(srace[3]);
			DestroyDynamicObject(Relly1[0]); DestroyDynamicObject(Relly1[1]); DestroyDynamicObject(Relly1[2]); DestroyDynamicObject(Relly1[3]);
			DestroyVehicle(eventa[0]); DestroyVehicle(eventa[1]); DestroyVehicle(eventa[2]); DestroyVehicle(eventa[3]); DestroyVehicle(eventa[4]); DestroyVehicle(eventa[5]); DestroyVehicle(eventa[6]); DestroyVehicle(eventa[7]); DestroyVehicle(eventa[8]); DestroyVehicle(eventa[9]); DestroyVehicle(eventa[10]); DestroyVehicle(eventa[11]); DestroyVehicle(eventa[12]); DestroyVehicle(eventa[13]); DestroyVehicle(eventa[14]);
			new sendername[MAX_PLAYER_NAME], string[100];
			GetPlayerName(playerid,sendername,sizeof(sendername));
			format(string,sizeof(string),"%s je zaustavio event",sendername);
			SCMTA(COLOR_YELLOW, string);
		}
	}
	return 1;
}
CMD:pokrenievent(playerid, params[])
{
    //#pragma unused help
	//#pragma unused params
    if(UlogovanProvera[playerid] == 0) return SCM(playerid,-1,"FarkiAS | "CRVENA"Moras se ulogovati da bi koristio ovu komandu!");
	if(AdminDuty[playerid] == 0 && GMDuty[playerid] == 0) return SCM(playerid,-1,""CRVENA"[FarkiAS] "SIVA"Morate biti na Admin & GameMaster duznosti!");
	if (PlayerInfo[playerid][pGM] >= 2 || PlayerInfo[playerid][pAdmin] >= 1)
	{
		if(event == 0)
		{
	 		ShowPlayerDialog(playerid,DIALOG_EVENTI,DIALOG_STYLE_INPUT,"{F3FF02}[EVENTI]","Event id-ovi:\n2 - Desert Drive\n3 - Suma Race\n4 - EuroGaming Drift\n5 - Vortex\n6 - Drift1\n7 - Drift2\n8 - EuroGaming Race\n9 - JetMax\n10 - Rally1\n11 - Rally2\n12 - Quad Race\n13 - Sanchez Race\n14 - Kart Race\n15 - Kruzna Trka\n16 - Morski Race\n17 - MC Vrh\n18 - NRG Race\nUnesi id eventa:","Unesi","Izlaz");
		}
		else
		{
            SCM(playerid, 0xFFC801C8, "Vec ima pokrenut event!");
		}
	}
	return 1;
}
CMD:count(playerid, params[])
{
    //#pragma unused help
	//#pragma unused params
    if(UlogovanProvera[playerid] == 0) return SCM(playerid,-1,"FarkiAS | "CRVENA"Moras se ulogovati da bi koristio ovu komandu!");
	if(AdminDuty[playerid] == 0 && GMDuty[playerid] == 0) return SCM(playerid,-1,""CRVENA"[FarkiAS] "SIVA"Morate biti na Admin & GameMaster duznosti!");
	if (PlayerInfo[playerid][pGM] >= 2 || PlayerInfo[playerid][pAdmin] >= 1)
	{
		if (auts == false)
		{
   			auts = true;
			foreach (Player, i)
			{
				if(ecp[i] == 1 || ecp[i] == 2 || ecp[i] == 3 || ecp[i] == 4 || ecp[i] == 5 || ecp[i] == 6 || ecp[i] == 7 || ecp[i] == 8 || ecp[i] == 9 || ecp[i] == 10 || ecp[i] == 11 || ecp[i] == 12 || ecp[i] == 13 || ecp[i] == 14 || ecp[i] == 15 || ecp[i] == 16 || ecp[i] == 17 || ecp[i] == 18 || ecp[i] == 19)
				{
                    if(Prisustvuje[i] != false)
                    {
		   				GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~-~y~ 5 ~g~-",1000,3);
						TogglePlayerControllable(i, 0);
     	                SetTimer("pokreni", 1, 0);
			   			SetTimer("count4",1000,0);
			   			SetTimer("count3",2000,0);
			   			SetTimer("count2",3000,0);
			   			SetTimer("count1",4000,0);
			   			SetTimer("countgo",5000,0);
					}
				}
   			}
		}
		else
		{
			SendClientMessage(playerid, 0xFF9900AA, "Vec Je pocelo!");
			return 1;
		}
	}
	if(PlayerInfo[playerid][pAdmin] >= 1 || PlayerInfo[playerid][pGM] >= 1 && event == 0)
	{
		foreach (Player, i)
		{
   			GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~ ~r~ 5 ~g~ ",1000,3);
   			GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~ ~r~ 5 ~g~ ",1000,3);
			SetTimerEx("vcount4", 1000, false, "e", playerid);
			SetTimerEx("vcount3", 2000, false, "e", playerid);
			SetTimerEx("vcount2", 3000, false, "e", playerid);
			SetTimerEx("vcount1", 4000, false, "e", playerid);
			SetTimerEx("vcountgo", 5000, false, "e", playerid);
		}
	}
	return 1;
}
CMD:join(playerid, params[])
{
    //#pragma unused help
	//#pragma unused params
	if(slotovi != 0)
	{
		if(Prisustvuje[playerid] == false && auts == false)
		{
			prisustvuje[playerid] = 1;
			if(event == 1)
			{
				ecp[playerid] = 1;
				Prisustvuje[playerid] = true;
				slotovi--;
				SetPlayerPos(playerid, 2603.7866,-2372.5149,13.1238);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 2)
			{
				ecp[playerid] = 2;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -509.9478,2589.1721,52.9780);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 3)
			{
				ecp[playerid] = 3;
				Prisustvuje[playerid] = true;
	            slotovi--;
				SetPlayerPos(playerid, -269.5549,-2165.1125,28.7574);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 4)
			{
				ecp[playerid] = 4;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2421.8689,-609.4372,132.2674);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 5)
			{
				ecp[playerid] = 5;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2877.5713,423.5097,4.9590);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 6)
			{
				ecp[playerid] = 6;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -306.8569,1302.5017,53.6073);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 7)
			{
				ecp[playerid] = 7;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2396.9985,-571.4738,132.1172);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 8)
			{
				ecp[playerid] = 8;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -1509.5323,975.5475,7.1853);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 9)
			{
				ecp[playerid] = 9;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, 2282.8188,-223.8763,11.7244);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 10)//raly 1
			{
				ecp[playerid] = 10;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -1947.5833,-2460.6743,30.7485);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 11)//raly 2
			{
				ecp[playerid] = 11;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, 303.3947,-732.6323,5.5578);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 12)
			{
				ecp[playerid] = 12;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2498.3689,-1453.5709,361.8633);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 13)
			{
				ecp[playerid] = 13;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2538.3408,-1470.2476,360.5102);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 14)
			{
				ecp[playerid] = 14;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid, -2260.2354,2278.6064,4.9886);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 15)
			{
				ecp[playerid] = 15;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            TogglePlayerControllable(playerid,0);
				SetTimerEx("Ucitavanje",2000,false,"i",playerid);
	            SetPlayerPos(playerid, 4033.7151,-2105.4895,5.9028);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			    TogglePlayerControllable(playerid,0);
			    SetTimerEx("Ucitavanje",1000,false,"i",playerid);
			}
			else if(event == 16)
			{
				ecp[playerid] = 16;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            TogglePlayerControllable(playerid,0);
				SetTimerEx("Ucitavanje",2000,false,"i",playerid);
	            SetPlayerPos(playerid,704.7015,-3434.2771,18.2241);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			    TogglePlayerControllable(playerid,0);
			    SetTimerEx("Ucitavanje",1000,false,"i",playerid);
			}
			else if(event == 17)
			{
				ecp[playerid] = 17;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid,-2361.7668,-2189.4280,33.5759);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
			else if(event == 18)//NRG
			{
				ecp[playerid] = 18;
				Prisustvuje[playerid] = true;
	            slotovi--;
	            SetPlayerPos(playerid,1410.1050,-1308.8313,9.4301);
				vorcp[playerid] = 0;
                PlayerInfo[playerid][pPridruzeneventu] = 1;
				ResetPlayerWeapons(playerid);
			}
		}
		else return SCM(playerid,-1,"Samo jednom mozete koristiti /join u toku jednog eventa ili je event vec krenuo!");
	}
	else return SCM(playerid,-1,"Zao nam je broj mjesta za ovaj event je popunjen, vise srece drugi put!");
	return 1;
}
CMD:eventport(playerid, params[])
{
    //#pragma unused help
	//#pragma unused params
    if(UlogovanProvera[playerid] == 0) return SCM(playerid,-1,"FarkiAS | "CRVENA"Moras se ulogovati da bi koristio ovu komandu!");
	if(AdminDuty[playerid] == 0 && GMDuty[playerid] == 0) return SCM(playerid,-1,""CRVENA"[FarkiAS] "SIVA"Morate biti na Admin & GameMaster duznosti!");
	if (PlayerInfo[playerid][pGM] >= 2 || PlayerInfo[playerid][pAdmin] >= 1)
	{
		ShowPlayerDialog(playerid,DIALOG_EVENTPORT,DIALOG_STYLE_LIST,"Port lista","2 - Desert Drive\n3 - Suma Race\n4 - EuroGaming Drift\n5 - Vortex\n6 - Drift1\n7 - Drift2\n8 - EuroGaming Race\n9 - JetMax\n10 - Rally1\n11 - Rally2\n12 - Quad Race\n13 - Sanchez Race\n14 - Kart Race\n15 - Kruzna Trka\n16 - Morski Race\n17 - MC Vrh\n18 - NRG Race","Pozovi","Prekid");
	}
	return 1;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
