#define PLUGIN_AUTHOR "Lawyn"
#define PLUGIN_VERSION "-"

#include <sourcemod>
#include <sdktools>

#define MODEL_T ""
#define MODEL_CT ""

#define MODEL_VIP_T ""
#define MODEL_VIP_CT ""

public Plugin myinfo = 
{
	name = "[NEVERGO] Unique Models",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = "https://nevergo.ro"
};

public void OnPluginStart()
{
	HookEvent("player_spawn", valoare2);
}

public Action valoare2(Handle event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));
	if(GetClientTeam(client) == CS_TEAM_CT)
	{
		//PrintToChat(client, "\x0f[ NGO ] \x01Te-ai spawnat cu modelul pentru \x0CCT");
		AddFileToDownloadsTable(MODEL_CT);
		PrecacheModel(MODEL_CT);
		SetEntityModel(client, MODEL_CT);
	}
	else if(GetClientTeam(client) == CS_TEAM_T)
	{
		//PrintToChat(client, "\x0f[ NGO ] \x01Te-ai spawnat cu modelul pentru \x0CT");
		AddFileToDownloadsTable(MODEL_T);
		PrecacheModel(MODEL_T);
		SetEntityModel(client, MODEL_T);
	}
	/*else if(GetUserFlagBits(client) & ADMFLAG_CUSTOM1) // flagul se pune la alegere
	{
		if (GetClientTeam(client) == CS_TEAM_T);
		{
			//PrintToChat(client, "\x0f[ NGO ] \x01Te-ai spawnat cu modelul pentru \x0CVIP T");
			AddFileToDownloadsTable(MODEL_VIP_T);
			PrecacheModel(MODEL_VIP_T);
			SetEntityModel(client, MODEL_VIP_T);
		}
		if (GetClientTeam(client) == CS_TEAM_CT);
		{
			//PrintToChat(client, "\x0f[ NGO ] \x01Te-ai spawnat cu modelul pentru \x0CVIP CT");
			AddFileToDownloadsTable(MODEL_VIP_CT);
			PrecacheModel(MODEL_VIP_CT);
			SetEntityModel(client, MODEL_VIP_CT);
		}
	}*/ //MODEL VIP (PENTRU A LE ACTIVAT SCOATE '*' SI '/')
}
