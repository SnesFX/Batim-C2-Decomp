using System;
using UnityEngine;

// Token: 0x020002DB RID: 731
public static class PlayerPrefsManager
{
	// Token: 0x0600110C RID: 4364 RVA: 0x00089BE3 File Offset: 0x00087FE3
	public static void Save(string key, float value)
	{
		PlayerPrefs.SetFloat(key, value);
		PlayerPrefs.Save();
	}

	// Token: 0x0600110D RID: 4365 RVA: 0x00089BF1 File Offset: 0x00087FF1
	public static void Save(string key, int value)
	{
		PlayerPrefs.SetInt(key, value);
		PlayerPrefs.Save();
	}

	// Token: 0x0600110E RID: 4366 RVA: 0x00089BFF File Offset: 0x00087FFF
	public static void Save(string key, string value)
	{
		PlayerPrefs.SetString(key, value);
		PlayerPrefs.Save();
	}

	// Token: 0x0600110F RID: 4367 RVA: 0x00089C0D File Offset: 0x0008800D
	public static float GetFloat(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetFloat(key);
		}
		PlayerPrefs.SetFloat(key, 0f);
		PlayerPrefs.Save();
		return PlayerPrefs.GetFloat(key);
	}

	// Token: 0x06001110 RID: 4368 RVA: 0x00089C37 File Offset: 0x00088037
	public static int GetInt(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetInt(key);
		}
		PlayerPrefs.SetInt(key, 0);
		PlayerPrefs.Save();
		return PlayerPrefs.GetInt(key);
	}

	// Token: 0x06001111 RID: 4369 RVA: 0x00089C5D File Offset: 0x0008805D
	public static bool GetBool(string key)
	{
		return PlayerPrefs.HasKey(key) && PlayerPrefs.GetInt(key) > 0;
	}

	// Token: 0x06001112 RID: 4370 RVA: 0x00089C7F File Offset: 0x0008807F
	public static string GetString(string key)
	{
		if (PlayerPrefs.HasKey(key))
		{
			return PlayerPrefs.GetString(key);
		}
		PlayerPrefs.SetString(key, string.Empty);
		PlayerPrefs.Save();
		return PlayerPrefs.GetString(key);
	}
}
