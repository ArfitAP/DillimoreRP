#tryinclude "a_samp.inc"
#if !defined _samp_included
	#error Please place a_samp.inc library into your includes folder.
#endif

/*
 *  Version: MPL 1.1
 *
 *  The contents of this file are subject to the Mozilla Public License Version
 *  1.1 (the "License"); you may not use this file except in compliance with
 *  the License. You may obtain a copy of the License at
 *  http://www.mozilla.org/MPL/
 *
 *  Software distributed under the License is distributed on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 *  for the specific language governing rights and limitations under the
 *  License.
 *
 *  The Original Code is the Spam Prevention System (Anti Spam) Version 1
 *
 *  The Initial Developer of the Original Code is Luka Pupak.
 *  Portions created by the Initial Developer are Copyright (C) 2010
 *  the Initial Developer. All Rights Reserved.
*/
 
forward SPS_Remove_Messages_Limit(playerid);
forward SPS_Unmute_Player(playerid);
forward SPS_Reset_PVars();

// Define the mute time expressed in minutes
#define PLAYER_MUTE_TIME_MINUTES (1)
#define CRVENA          "{F81414}"

public SPS_Reset_PVars()
{
	for(new i=0; i < MAX_PLAYERS; i++)
	{
	    if(GetPVarType(i, "SPS Muted") != PLAYER_VARTYPE_NONE) {
			SetPVarInt(i, "SPS Muted", 0);
		}
		if(GetPVarType(i, "SPS Messages Sent") != PLAYER_VARTYPE_NONE) {
	    	SetPVarInt(i, "SPS Messages Sent", 0);
	    }
	    if(GetPVarType(i, "SPS Spam Warnings") != PLAYER_VARTYPE_NONE) {
	    	SetPVarInt(i, "SPS Spam Warnings", 0);
	    }
	}
	return 1;
}

public OnFilterScriptInit()
{
	CallLocalFunction("SPS_Reset_PVars", "");
	return 1;
}

public OnFilterScriptExit()
{
	CallLocalFunction("SPS_Reset_PVars", "");
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if(GetPVarInt(playerid, "SPS Muted") == 0)
	{
		SetPVarInt(playerid, "SPS Messages Sent", GetPVarInt(playerid, "SPS Messages Sent") + 1);
		SetTimerEx("SPS_Remove_Messages_Limit", 2000, 0, "i", playerid);

		if(GetPVarInt(playerid, "SPS Messages Sent") >= 3)
		{
		    if(!(((GetPVarInt(playerid, "SPS Spam Warnings") + 2) == 3)))
		    {
			    SendClientMessage(playerid, -1, ""CRVENA"Molimo vas da ne spamate jer cete u protivnom biti mutani na jednu minutu.");
		    }
		    SetPVarInt(playerid, "SPS Spam Warnings", GetPVarInt(playerid, "SPS Spam Warnings") + 1);
		}
	}
	else
	{
		SendClientMessage(playerid, -1, ""CRVENA"Zabranjeno vam je pisanje na minutu zbog spama");
		return 0;
	}
	return 1;
}

public SPS_Remove_Messages_Limit(playerid)
{
	if(GetPVarInt(playerid, "SPS Spam Warnings") >= 2)
	{
		SetTimerEx("SPS_Unmute_Player", (PLAYER_MUTE_TIME_MINUTES * 60000), 0, "i", playerid);
		SetPVarInt(playerid, "SPS Muted", 1);
		
		CallRemoteFunction("OnPlayerGetMuted", "i", playerid);
	}
	SetPVarInt(playerid, "SPS Messages Sent", 0);
	SetPVarInt(playerid, "SPS Spam Warnings", 0);
	return 1;
}

public SPS_Unmute_Player(playerid)
{
	SendClientMessage(playerid, 0x28C900FF, ""CRVENA"Mozete ponovo pisati.");
	SetPVarInt(playerid, "SPS Muted", 0);
	return 1;
}


