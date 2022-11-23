using System;
using UnityEngine;
using System.Collections.Generic;

[Serializable]
public class StringLookupSettingsSO : ScriptableObject
{
	[SerializeField]
	public string Namespace;
	[SerializeField]
	public string StringLookupClass;
	[SerializeField]
	public string ResourcesFilePath;
	[SerializeField]
	public string ScriptFilePath;
	[SerializeField]
	public string LookupFilePath;
	[SerializeField]
	public bool HasWhiteList;
	[SerializeField]
	public List<string> WhiteList;
}
