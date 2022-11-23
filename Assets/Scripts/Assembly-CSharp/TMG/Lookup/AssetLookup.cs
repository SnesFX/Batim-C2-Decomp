using System;

namespace TMG.Lookup
{
	// Token: 0x020001B1 RID: 433
	public static class AssetLookup
	{
		// Token: 0x020001B2 RID: 434
		public static class Tags
		{
			// Token: 0x04000678 RID: 1656
			public const string UNTAGGED = "Untagged";

			// Token: 0x04000679 RID: 1657
			public const string RESPAWN = "Respawn";

			// Token: 0x0400067A RID: 1658
			public const string FINISH = "Finish";

			// Token: 0x0400067B RID: 1659
			public const string EDITOR_ONLY = "EditorOnly";

			// Token: 0x0400067C RID: 1660
			public const string MAIN_CAMERA = "MainCamera";

			// Token: 0x0400067D RID: 1661
			public const string PLAYER = "Player";

			// Token: 0x0400067E RID: 1662
			public const string GAME_CONTROLLER = "GameController";

			// Token: 0x0400067F RID: 1663
			public const string ENEMY = "Enemy";

			// Token: 0x04000680 RID: 1664
			public const string P_SOUND = "PSound";

			// Token: 0x04000681 RID: 1665
			public const string CAMERA_1 = "Camera1";

			// Token: 0x04000682 RID: 1666
			public const string CAMERA_ONE = "CameraOne";

			// Token: 0x04000683 RID: 1667
			public const string LOADER = "Loader";

			// Token: 0x04000684 RID: 1668
			public const string TARGET = "Target";

			// Token: 0x04000685 RID: 1669
			public const string SHAKER = "Shaker";

			// Token: 0x04000686 RID: 1670
			public const string UI_VISUAL_CONTROLS = "UIVisualControls";

			// Token: 0x04000687 RID: 1671
			public const string UI_CAMERA = "UICamera";

			// Token: 0x04000688 RID: 1672
			public const string INK = "Ink";

			// Token: 0x04000689 RID: 1673
			public const string STAIRS = "Stairs";

			// Token: 0x0400068A RID: 1674
			public const string DEEP_INK = "DeepInk";

			// Token: 0x0400068B RID: 1675
			public const string SAMMY_TRIGGER = "SammyTrigger";
		}

		// Token: 0x020001B3 RID: 435
		public static class Layers
		{
			// Token: 0x0400068C RID: 1676
			public const string DEFAULT = "Default";

			// Token: 0x0400068D RID: 1677
			public const string TRANSPARENT_FX = "TransparentFX";

			// Token: 0x0400068E RID: 1678
			public const string IGNORE_RAYCAST = "Ignore Raycast";

			// Token: 0x0400068F RID: 1679
			public const string WATER = "Water";

			// Token: 0x04000690 RID: 1680
			public const string UI = "UI";

			// Token: 0x04000691 RID: 1681
			public const string PLAYER = "Player";

			// Token: 0x04000692 RID: 1682
			public const string CREDITS = "Credits";

			// Token: 0x04000693 RID: 1683
			public const string WEAPON = "Weapon";

			// Token: 0x04000694 RID: 1684
			public const string BREAKABLE_PLANK = "BreakablePlank";

			// Token: 0x04000695 RID: 1685
			public const string STATIC_PLANK = "StaticPlank";

			// Token: 0x04000696 RID: 1686
			public const string TRIGGER = "Trigger";

			// Token: 0x04000697 RID: 1687
			public const string LIGHT_FIXTURE = "LightFixture";

			// Token: 0x04000698 RID: 1688
			public const string EVENT_TRIGGER = "EventTrigger";

			// Token: 0x04000699 RID: 1689
			public const string FURNATURE = "Furnature";

			// Token: 0x0400069A RID: 1690
			public const string INVISIBLE = "Invisible";

			// Token: 0x0400069B RID: 1691
			public const string INVISIBLE_COLLIDER = "InvisibleCollider";

			// Token: 0x0400069C RID: 1692
			public const string SEARCHER_TRIGGER = "SearcherTrigger";

			// Token: 0x0400069D RID: 1693
			public const string AI = "Ai";

			// Token: 0x0400069E RID: 1694
			public const string JOINTS = "Joints";

			// Token: 0x0400069F RID: 1695
			public const string AI_IGNORE = "Ai_Ignore";

			// Token: 0x040006A0 RID: 1696
			public const string SELF_DEFAULT = "SelfDefault";

			// Token: 0x040006A1 RID: 1697
			public const string UI_PARTICLES = "UIParticles";

			// Token: 0x040006A2 RID: 1698
			public const string LOCKED = "Locked";
		}

		// Token: 0x020001B4 RID: 436
		public static class SortingLayers
		{
			// Token: 0x040006A3 RID: 1699
			public const string DEFAULT = "Default";
		}

		// Token: 0x020001B5 RID: 437
		public static class InputAxes
		{
			// Token: 0x040006A4 RID: 1700
			public const string JOYSTICK_1ANALOG_0 = "joystick 1 analog 0";

			// Token: 0x040006A5 RID: 1701
			public const string JOYSTICK_1ANALOG_1 = "joystick 1 analog 1";

			// Token: 0x040006A6 RID: 1702
			public const string JOYSTICK_1ANALOG_2 = "joystick 1 analog 2";

			// Token: 0x040006A7 RID: 1703
			public const string JOYSTICK_1ANALOG_3 = "joystick 1 analog 3";

			// Token: 0x040006A8 RID: 1704
			public const string JOYSTICK_1ANALOG_4 = "joystick 1 analog 4";

			// Token: 0x040006A9 RID: 1705
			public const string JOYSTICK_1ANALOG_5 = "joystick 1 analog 5";

			// Token: 0x040006AA RID: 1706
			public const string JOYSTICK_1ANALOG_6 = "joystick 1 analog 6";

			// Token: 0x040006AB RID: 1707
			public const string JOYSTICK_1ANALOG_7 = "joystick 1 analog 7";

			// Token: 0x040006AC RID: 1708
			public const string JOYSTICK_1ANALOG_8 = "joystick 1 analog 8";

			// Token: 0x040006AD RID: 1709
			public const string JOYSTICK_1ANALOG_9 = "joystick 1 analog 9";

			// Token: 0x040006AE RID: 1710
			public const string JOYSTICK_1ANALOG_10 = "joystick 1 analog 10";

			// Token: 0x040006AF RID: 1711
			public const string JOYSTICK_1ANALOG_11 = "joystick 1 analog 11";

			// Token: 0x040006B0 RID: 1712
			public const string JOYSTICK_1ANALOG_12 = "joystick 1 analog 12";

			// Token: 0x040006B1 RID: 1713
			public const string JOYSTICK_1ANALOG_13 = "joystick 1 analog 13";

			// Token: 0x040006B2 RID: 1714
			public const string JOYSTICK_1ANALOG_14 = "joystick 1 analog 14";

			// Token: 0x040006B3 RID: 1715
			public const string JOYSTICK_1ANALOG_15 = "joystick 1 analog 15";

			// Token: 0x040006B4 RID: 1716
			public const string JOYSTICK_1ANALOG_16 = "joystick 1 analog 16";

			// Token: 0x040006B5 RID: 1717
			public const string JOYSTICK_1ANALOG_17 = "joystick 1 analog 17";

			// Token: 0x040006B6 RID: 1718
			public const string JOYSTICK_1ANALOG_18 = "joystick 1 analog 18";

			// Token: 0x040006B7 RID: 1719
			public const string JOYSTICK_1ANALOG_19 = "joystick 1 analog 19";

			// Token: 0x040006B8 RID: 1720
			public const string JOYSTICK_2ANALOG_0 = "joystick 2 analog 0";

			// Token: 0x040006B9 RID: 1721
			public const string JOYSTICK_2ANALOG_1 = "joystick 2 analog 1";

			// Token: 0x040006BA RID: 1722
			public const string JOYSTICK_2ANALOG_2 = "joystick 2 analog 2";

			// Token: 0x040006BB RID: 1723
			public const string JOYSTICK_2ANALOG_3 = "joystick 2 analog 3";

			// Token: 0x040006BC RID: 1724
			public const string JOYSTICK_2ANALOG_4 = "joystick 2 analog 4";

			// Token: 0x040006BD RID: 1725
			public const string JOYSTICK_2ANALOG_5 = "joystick 2 analog 5";

			// Token: 0x040006BE RID: 1726
			public const string JOYSTICK_2ANALOG_6 = "joystick 2 analog 6";

			// Token: 0x040006BF RID: 1727
			public const string JOYSTICK_2ANALOG_7 = "joystick 2 analog 7";

			// Token: 0x040006C0 RID: 1728
			public const string JOYSTICK_2ANALOG_8 = "joystick 2 analog 8";

			// Token: 0x040006C1 RID: 1729
			public const string JOYSTICK_2ANALOG_9 = "joystick 2 analog 9";

			// Token: 0x040006C2 RID: 1730
			public const string JOYSTICK_2ANALOG_10 = "joystick 2 analog 10";

			// Token: 0x040006C3 RID: 1731
			public const string JOYSTICK_2ANALOG_11 = "joystick 2 analog 11";

			// Token: 0x040006C4 RID: 1732
			public const string JOYSTICK_2ANALOG_12 = "joystick 2 analog 12";

			// Token: 0x040006C5 RID: 1733
			public const string JOYSTICK_2ANALOG_13 = "joystick 2 analog 13";

			// Token: 0x040006C6 RID: 1734
			public const string JOYSTICK_2ANALOG_14 = "joystick 2 analog 14";

			// Token: 0x040006C7 RID: 1735
			public const string JOYSTICK_2ANALOG_15 = "joystick 2 analog 15";

			// Token: 0x040006C8 RID: 1736
			public const string JOYSTICK_2ANALOG_16 = "joystick 2 analog 16";

			// Token: 0x040006C9 RID: 1737
			public const string JOYSTICK_2ANALOG_17 = "joystick 2 analog 17";

			// Token: 0x040006CA RID: 1738
			public const string JOYSTICK_2ANALOG_18 = "joystick 2 analog 18";

			// Token: 0x040006CB RID: 1739
			public const string JOYSTICK_2ANALOG_19 = "joystick 2 analog 19";

			// Token: 0x040006CC RID: 1740
			public const string JOYSTICK_3ANALOG_0 = "joystick 3 analog 0";

			// Token: 0x040006CD RID: 1741
			public const string JOYSTICK_3ANALOG_1 = "joystick 3 analog 1";

			// Token: 0x040006CE RID: 1742
			public const string JOYSTICK_3ANALOG_2 = "joystick 3 analog 2";

			// Token: 0x040006CF RID: 1743
			public const string JOYSTICK_3ANALOG_3 = "joystick 3 analog 3";

			// Token: 0x040006D0 RID: 1744
			public const string JOYSTICK_3ANALOG_4 = "joystick 3 analog 4";

			// Token: 0x040006D1 RID: 1745
			public const string JOYSTICK_3ANALOG_5 = "joystick 3 analog 5";

			// Token: 0x040006D2 RID: 1746
			public const string JOYSTICK_3ANALOG_6 = "joystick 3 analog 6";

			// Token: 0x040006D3 RID: 1747
			public const string JOYSTICK_3ANALOG_7 = "joystick 3 analog 7";

			// Token: 0x040006D4 RID: 1748
			public const string JOYSTICK_3ANALOG_8 = "joystick 3 analog 8";

			// Token: 0x040006D5 RID: 1749
			public const string JOYSTICK_3ANALOG_9 = "joystick 3 analog 9";

			// Token: 0x040006D6 RID: 1750
			public const string JOYSTICK_3ANALOG_10 = "joystick 3 analog 10";

			// Token: 0x040006D7 RID: 1751
			public const string JOYSTICK_3ANALOG_11 = "joystick 3 analog 11";

			// Token: 0x040006D8 RID: 1752
			public const string JOYSTICK_3ANALOG_12 = "joystick 3 analog 12";

			// Token: 0x040006D9 RID: 1753
			public const string JOYSTICK_3ANALOG_13 = "joystick 3 analog 13";

			// Token: 0x040006DA RID: 1754
			public const string JOYSTICK_3ANALOG_14 = "joystick 3 analog 14";

			// Token: 0x040006DB RID: 1755
			public const string JOYSTICK_3ANALOG_15 = "joystick 3 analog 15";

			// Token: 0x040006DC RID: 1756
			public const string JOYSTICK_3ANALOG_16 = "joystick 3 analog 16";

			// Token: 0x040006DD RID: 1757
			public const string JOYSTICK_3ANALOG_17 = "joystick 3 analog 17";

			// Token: 0x040006DE RID: 1758
			public const string JOYSTICK_3ANALOG_18 = "joystick 3 analog 18";

			// Token: 0x040006DF RID: 1759
			public const string JOYSTICK_3ANALOG_19 = "joystick 3 analog 19";

			// Token: 0x040006E0 RID: 1760
			public const string JOYSTICK_4ANALOG_0 = "joystick 4 analog 0";

			// Token: 0x040006E1 RID: 1761
			public const string JOYSTICK_4ANALOG_1 = "joystick 4 analog 1";

			// Token: 0x040006E2 RID: 1762
			public const string JOYSTICK_4ANALOG_2 = "joystick 4 analog 2";

			// Token: 0x040006E3 RID: 1763
			public const string JOYSTICK_4ANALOG_3 = "joystick 4 analog 3";

			// Token: 0x040006E4 RID: 1764
			public const string JOYSTICK_4ANALOG_4 = "joystick 4 analog 4";

			// Token: 0x040006E5 RID: 1765
			public const string JOYSTICK_4ANALOG_5 = "joystick 4 analog 5";

			// Token: 0x040006E6 RID: 1766
			public const string JOYSTICK_4ANALOG_6 = "joystick 4 analog 6";

			// Token: 0x040006E7 RID: 1767
			public const string JOYSTICK_4ANALOG_7 = "joystick 4 analog 7";

			// Token: 0x040006E8 RID: 1768
			public const string JOYSTICK_4ANALOG_8 = "joystick 4 analog 8";

			// Token: 0x040006E9 RID: 1769
			public const string JOYSTICK_4ANALOG_9 = "joystick 4 analog 9";

			// Token: 0x040006EA RID: 1770
			public const string JOYSTICK_4ANALOG_10 = "joystick 4 analog 10";

			// Token: 0x040006EB RID: 1771
			public const string JOYSTICK_4ANALOG_11 = "joystick 4 analog 11";

			// Token: 0x040006EC RID: 1772
			public const string JOYSTICK_4ANALOG_12 = "joystick 4 analog 12";

			// Token: 0x040006ED RID: 1773
			public const string JOYSTICK_4ANALOG_13 = "joystick 4 analog 13";

			// Token: 0x040006EE RID: 1774
			public const string JOYSTICK_4ANALOG_14 = "joystick 4 analog 14";

			// Token: 0x040006EF RID: 1775
			public const string JOYSTICK_4ANALOG_15 = "joystick 4 analog 15";

			// Token: 0x040006F0 RID: 1776
			public const string JOYSTICK_4ANALOG_16 = "joystick 4 analog 16";

			// Token: 0x040006F1 RID: 1777
			public const string JOYSTICK_4ANALOG_17 = "joystick 4 analog 17";

			// Token: 0x040006F2 RID: 1778
			public const string JOYSTICK_4ANALOG_18 = "joystick 4 analog 18";

			// Token: 0x040006F3 RID: 1779
			public const string JOYSTICK_4ANALOG_19 = "joystick 4 analog 19";

			// Token: 0x040006F4 RID: 1780
			public const string JOYSTICK_5ANALOG_0 = "joystick 5 analog 0";

			// Token: 0x040006F5 RID: 1781
			public const string JOYSTICK_5ANALOG_1 = "joystick 5 analog 1";

			// Token: 0x040006F6 RID: 1782
			public const string JOYSTICK_5ANALOG_2 = "joystick 5 analog 2";

			// Token: 0x040006F7 RID: 1783
			public const string JOYSTICK_5ANALOG_3 = "joystick 5 analog 3";

			// Token: 0x040006F8 RID: 1784
			public const string JOYSTICK_5ANALOG_4 = "joystick 5 analog 4";

			// Token: 0x040006F9 RID: 1785
			public const string JOYSTICK_5ANALOG_5 = "joystick 5 analog 5";

			// Token: 0x040006FA RID: 1786
			public const string JOYSTICK_5ANALOG_6 = "joystick 5 analog 6";

			// Token: 0x040006FB RID: 1787
			public const string JOYSTICK_5ANALOG_7 = "joystick 5 analog 7";

			// Token: 0x040006FC RID: 1788
			public const string JOYSTICK_5ANALOG_8 = "joystick 5 analog 8";

			// Token: 0x040006FD RID: 1789
			public const string JOYSTICK_5ANALOG_9 = "joystick 5 analog 9";

			// Token: 0x040006FE RID: 1790
			public const string JOYSTICK_5ANALOG_10 = "joystick 5 analog 10";

			// Token: 0x040006FF RID: 1791
			public const string JOYSTICK_5ANALOG_11 = "joystick 5 analog 11";

			// Token: 0x04000700 RID: 1792
			public const string JOYSTICK_5ANALOG_12 = "joystick 5 analog 12";

			// Token: 0x04000701 RID: 1793
			public const string JOYSTICK_5ANALOG_13 = "joystick 5 analog 13";

			// Token: 0x04000702 RID: 1794
			public const string JOYSTICK_5ANALOG_14 = "joystick 5 analog 14";

			// Token: 0x04000703 RID: 1795
			public const string JOYSTICK_5ANALOG_15 = "joystick 5 analog 15";

			// Token: 0x04000704 RID: 1796
			public const string JOYSTICK_5ANALOG_16 = "joystick 5 analog 16";

			// Token: 0x04000705 RID: 1797
			public const string JOYSTICK_5ANALOG_17 = "joystick 5 analog 17";

			// Token: 0x04000706 RID: 1798
			public const string JOYSTICK_5ANALOG_18 = "joystick 5 analog 18";

			// Token: 0x04000707 RID: 1799
			public const string JOYSTICK_5ANALOG_19 = "joystick 5 analog 19";

			// Token: 0x04000708 RID: 1800
			public const string JOYSTICK_6ANALOG_0 = "joystick 6 analog 0";

			// Token: 0x04000709 RID: 1801
			public const string JOYSTICK_6ANALOG_1 = "joystick 6 analog 1";

			// Token: 0x0400070A RID: 1802
			public const string JOYSTICK_6ANALOG_2 = "joystick 6 analog 2";

			// Token: 0x0400070B RID: 1803
			public const string JOYSTICK_6ANALOG_3 = "joystick 6 analog 3";

			// Token: 0x0400070C RID: 1804
			public const string JOYSTICK_6ANALOG_4 = "joystick 6 analog 4";

			// Token: 0x0400070D RID: 1805
			public const string JOYSTICK_6ANALOG_5 = "joystick 6 analog 5";

			// Token: 0x0400070E RID: 1806
			public const string JOYSTICK_6ANALOG_6 = "joystick 6 analog 6";

			// Token: 0x0400070F RID: 1807
			public const string JOYSTICK_6ANALOG_7 = "joystick 6 analog 7";

			// Token: 0x04000710 RID: 1808
			public const string JOYSTICK_6ANALOG_8 = "joystick 6 analog 8";

			// Token: 0x04000711 RID: 1809
			public const string JOYSTICK_6ANALOG_9 = "joystick 6 analog 9";

			// Token: 0x04000712 RID: 1810
			public const string JOYSTICK_6ANALOG_10 = "joystick 6 analog 10";

			// Token: 0x04000713 RID: 1811
			public const string JOYSTICK_6ANALOG_11 = "joystick 6 analog 11";

			// Token: 0x04000714 RID: 1812
			public const string JOYSTICK_6ANALOG_12 = "joystick 6 analog 12";

			// Token: 0x04000715 RID: 1813
			public const string JOYSTICK_6ANALOG_13 = "joystick 6 analog 13";

			// Token: 0x04000716 RID: 1814
			public const string JOYSTICK_6ANALOG_14 = "joystick 6 analog 14";

			// Token: 0x04000717 RID: 1815
			public const string JOYSTICK_6ANALOG_15 = "joystick 6 analog 15";

			// Token: 0x04000718 RID: 1816
			public const string JOYSTICK_6ANALOG_16 = "joystick 6 analog 16";

			// Token: 0x04000719 RID: 1817
			public const string JOYSTICK_6ANALOG_17 = "joystick 6 analog 17";

			// Token: 0x0400071A RID: 1818
			public const string JOYSTICK_6ANALOG_18 = "joystick 6 analog 18";

			// Token: 0x0400071B RID: 1819
			public const string JOYSTICK_6ANALOG_19 = "joystick 6 analog 19";

			// Token: 0x0400071C RID: 1820
			public const string JOYSTICK_7ANALOG_0 = "joystick 7 analog 0";

			// Token: 0x0400071D RID: 1821
			public const string JOYSTICK_7ANALOG_1 = "joystick 7 analog 1";

			// Token: 0x0400071E RID: 1822
			public const string JOYSTICK_7ANALOG_2 = "joystick 7 analog 2";

			// Token: 0x0400071F RID: 1823
			public const string JOYSTICK_7ANALOG_3 = "joystick 7 analog 3";

			// Token: 0x04000720 RID: 1824
			public const string JOYSTICK_7ANALOG_4 = "joystick 7 analog 4";

			// Token: 0x04000721 RID: 1825
			public const string JOYSTICK_7ANALOG_5 = "joystick 7 analog 5";

			// Token: 0x04000722 RID: 1826
			public const string JOYSTICK_7ANALOG_6 = "joystick 7 analog 6";

			// Token: 0x04000723 RID: 1827
			public const string JOYSTICK_7ANALOG_7 = "joystick 7 analog 7";

			// Token: 0x04000724 RID: 1828
			public const string JOYSTICK_7ANALOG_8 = "joystick 7 analog 8";

			// Token: 0x04000725 RID: 1829
			public const string JOYSTICK_7ANALOG_9 = "joystick 7 analog 9";

			// Token: 0x04000726 RID: 1830
			public const string JOYSTICK_7ANALOG_10 = "joystick 7 analog 10";

			// Token: 0x04000727 RID: 1831
			public const string JOYSTICK_7ANALOG_11 = "joystick 7 analog 11";

			// Token: 0x04000728 RID: 1832
			public const string JOYSTICK_7ANALOG_12 = "joystick 7 analog 12";

			// Token: 0x04000729 RID: 1833
			public const string JOYSTICK_7ANALOG_13 = "joystick 7 analog 13";

			// Token: 0x0400072A RID: 1834
			public const string JOYSTICK_7ANALOG_14 = "joystick 7 analog 14";

			// Token: 0x0400072B RID: 1835
			public const string JOYSTICK_7ANALOG_15 = "joystick 7 analog 15";

			// Token: 0x0400072C RID: 1836
			public const string JOYSTICK_7ANALOG_16 = "joystick 7 analog 16";

			// Token: 0x0400072D RID: 1837
			public const string JOYSTICK_7ANALOG_17 = "joystick 7 analog 17";

			// Token: 0x0400072E RID: 1838
			public const string JOYSTICK_7ANALOG_18 = "joystick 7 analog 18";

			// Token: 0x0400072F RID: 1839
			public const string JOYSTICK_7ANALOG_19 = "joystick 7 analog 19";

			// Token: 0x04000730 RID: 1840
			public const string JOYSTICK_8ANALOG_0 = "joystick 8 analog 0";

			// Token: 0x04000731 RID: 1841
			public const string JOYSTICK_8ANALOG_1 = "joystick 8 analog 1";

			// Token: 0x04000732 RID: 1842
			public const string JOYSTICK_8ANALOG_2 = "joystick 8 analog 2";

			// Token: 0x04000733 RID: 1843
			public const string JOYSTICK_8ANALOG_3 = "joystick 8 analog 3";

			// Token: 0x04000734 RID: 1844
			public const string JOYSTICK_8ANALOG_4 = "joystick 8 analog 4";

			// Token: 0x04000735 RID: 1845
			public const string JOYSTICK_8ANALOG_5 = "joystick 8 analog 5";

			// Token: 0x04000736 RID: 1846
			public const string JOYSTICK_8ANALOG_6 = "joystick 8 analog 6";

			// Token: 0x04000737 RID: 1847
			public const string JOYSTICK_8ANALOG_7 = "joystick 8 analog 7";

			// Token: 0x04000738 RID: 1848
			public const string JOYSTICK_8ANALOG_8 = "joystick 8 analog 8";

			// Token: 0x04000739 RID: 1849
			public const string JOYSTICK_8ANALOG_9 = "joystick 8 analog 9";

			// Token: 0x0400073A RID: 1850
			public const string JOYSTICK_8ANALOG_10 = "joystick 8 analog 10";

			// Token: 0x0400073B RID: 1851
			public const string JOYSTICK_8ANALOG_11 = "joystick 8 analog 11";

			// Token: 0x0400073C RID: 1852
			public const string JOYSTICK_8ANALOG_12 = "joystick 8 analog 12";

			// Token: 0x0400073D RID: 1853
			public const string JOYSTICK_8ANALOG_13 = "joystick 8 analog 13";

			// Token: 0x0400073E RID: 1854
			public const string JOYSTICK_8ANALOG_14 = "joystick 8 analog 14";

			// Token: 0x0400073F RID: 1855
			public const string JOYSTICK_8ANALOG_15 = "joystick 8 analog 15";

			// Token: 0x04000740 RID: 1856
			public const string JOYSTICK_8ANALOG_16 = "joystick 8 analog 16";

			// Token: 0x04000741 RID: 1857
			public const string JOYSTICK_8ANALOG_17 = "joystick 8 analog 17";

			// Token: 0x04000742 RID: 1858
			public const string JOYSTICK_8ANALOG_18 = "joystick 8 analog 18";

			// Token: 0x04000743 RID: 1859
			public const string JOYSTICK_8ANALOG_19 = "joystick 8 analog 19";

			// Token: 0x04000744 RID: 1860
			public const string JOYSTICK_9ANALOG_0 = "joystick 9 analog 0";

			// Token: 0x04000745 RID: 1861
			public const string JOYSTICK_9ANALOG_1 = "joystick 9 analog 1";

			// Token: 0x04000746 RID: 1862
			public const string JOYSTICK_9ANALOG_2 = "joystick 9 analog 2";

			// Token: 0x04000747 RID: 1863
			public const string JOYSTICK_9ANALOG_3 = "joystick 9 analog 3";

			// Token: 0x04000748 RID: 1864
			public const string JOYSTICK_9ANALOG_4 = "joystick 9 analog 4";

			// Token: 0x04000749 RID: 1865
			public const string JOYSTICK_9ANALOG_5 = "joystick 9 analog 5";

			// Token: 0x0400074A RID: 1866
			public const string JOYSTICK_9ANALOG_6 = "joystick 9 analog 6";

			// Token: 0x0400074B RID: 1867
			public const string JOYSTICK_9ANALOG_7 = "joystick 9 analog 7";

			// Token: 0x0400074C RID: 1868
			public const string JOYSTICK_9ANALOG_8 = "joystick 9 analog 8";

			// Token: 0x0400074D RID: 1869
			public const string JOYSTICK_9ANALOG_9 = "joystick 9 analog 9";

			// Token: 0x0400074E RID: 1870
			public const string JOYSTICK_9ANALOG_10 = "joystick 9 analog 10";

			// Token: 0x0400074F RID: 1871
			public const string JOYSTICK_9ANALOG_11 = "joystick 9 analog 11";

			// Token: 0x04000750 RID: 1872
			public const string JOYSTICK_9ANALOG_12 = "joystick 9 analog 12";

			// Token: 0x04000751 RID: 1873
			public const string JOYSTICK_9ANALOG_13 = "joystick 9 analog 13";

			// Token: 0x04000752 RID: 1874
			public const string JOYSTICK_9ANALOG_14 = "joystick 9 analog 14";

			// Token: 0x04000753 RID: 1875
			public const string JOYSTICK_9ANALOG_15 = "joystick 9 analog 15";

			// Token: 0x04000754 RID: 1876
			public const string JOYSTICK_9ANALOG_16 = "joystick 9 analog 16";

			// Token: 0x04000755 RID: 1877
			public const string JOYSTICK_9ANALOG_17 = "joystick 9 analog 17";

			// Token: 0x04000756 RID: 1878
			public const string JOYSTICK_9ANALOG_18 = "joystick 9 analog 18";

			// Token: 0x04000757 RID: 1879
			public const string JOYSTICK_9ANALOG_19 = "joystick 9 analog 19";

			// Token: 0x04000758 RID: 1880
			public const string JOYSTICK_10ANALOG_0 = "joystick 10 analog 0";

			// Token: 0x04000759 RID: 1881
			public const string JOYSTICK_10ANALOG_1 = "joystick 10 analog 1";

			// Token: 0x0400075A RID: 1882
			public const string JOYSTICK_10ANALOG_2 = "joystick 10 analog 2";

			// Token: 0x0400075B RID: 1883
			public const string JOYSTICK_10ANALOG_3 = "joystick 10 analog 3";

			// Token: 0x0400075C RID: 1884
			public const string JOYSTICK_10ANALOG_4 = "joystick 10 analog 4";

			// Token: 0x0400075D RID: 1885
			public const string JOYSTICK_10ANALOG_5 = "joystick 10 analog 5";

			// Token: 0x0400075E RID: 1886
			public const string JOYSTICK_10ANALOG_6 = "joystick 10 analog 6";

			// Token: 0x0400075F RID: 1887
			public const string JOYSTICK_10ANALOG_7 = "joystick 10 analog 7";

			// Token: 0x04000760 RID: 1888
			public const string JOYSTICK_10ANALOG_8 = "joystick 10 analog 8";

			// Token: 0x04000761 RID: 1889
			public const string JOYSTICK_10ANALOG_9 = "joystick 10 analog 9";

			// Token: 0x04000762 RID: 1890
			public const string JOYSTICK_10ANALOG_10 = "joystick 10 analog 10";

			// Token: 0x04000763 RID: 1891
			public const string JOYSTICK_10ANALOG_11 = "joystick 10 analog 11";

			// Token: 0x04000764 RID: 1892
			public const string JOYSTICK_10ANALOG_12 = "joystick 10 analog 12";

			// Token: 0x04000765 RID: 1893
			public const string JOYSTICK_10ANALOG_13 = "joystick 10 analog 13";

			// Token: 0x04000766 RID: 1894
			public const string JOYSTICK_10ANALOG_14 = "joystick 10 analog 14";

			// Token: 0x04000767 RID: 1895
			public const string JOYSTICK_10ANALOG_15 = "joystick 10 analog 15";

			// Token: 0x04000768 RID: 1896
			public const string JOYSTICK_10ANALOG_16 = "joystick 10 analog 16";

			// Token: 0x04000769 RID: 1897
			public const string JOYSTICK_10ANALOG_17 = "joystick 10 analog 17";

			// Token: 0x0400076A RID: 1898
			public const string JOYSTICK_10ANALOG_18 = "joystick 10 analog 18";

			// Token: 0x0400076B RID: 1899
			public const string JOYSTICK_10ANALOG_19 = "joystick 10 analog 19";

			// Token: 0x0400076C RID: 1900
			public const string MOUSEX = "mouse x";

			// Token: 0x0400076D RID: 1901
			public const string MOUSEY = "mouse y";

			// Token: 0x0400076E RID: 1902
			public const string MOUSEZ = "mouse z";

			// Token: 0x0400076F RID: 1903
			public const string HORIZONTAL = "Horizontal";

			// Token: 0x04000770 RID: 1904
			public const string VERTICAL = "Vertical";

			// Token: 0x04000771 RID: 1905
			public const string JUMP = "Jump";

			// Token: 0x04000772 RID: 1906
			public const string MOUSE_X = "Mouse X";

			// Token: 0x04000773 RID: 1907
			public const string MOUSE_Y = "Mouse Y";

			// Token: 0x04000774 RID: 1908
			public const string SUBMIT = "Submit";

			// Token: 0x04000775 RID: 1909
			public const string CANCEL = "Cancel";

			// Token: 0x04000776 RID: 1910
			public const string MOUSE_SCROLL_WHEEL = "Mouse ScrollWheel";
		}

		// Token: 0x020001B6 RID: 438
		public static class Audio
		{
			// Token: 0x04000777 RID: 1911
			public const string DIA_CASSETTE_TAPE_01 = "Audio/DIA/ChapterOne/AudioLogs/DIA_Cassette_Tape_01";

			// Token: 0x04000778 RID: 1912
			public const string DIA_PLAYER_01 = "Audio/DIA/ChapterOne/Henry/DIA_Player_01";

			// Token: 0x04000779 RID: 1913
			public const string DIA_PLAYER_02 = "Audio/DIA/ChapterOne/Henry/DIA_Player_02";

			// Token: 0x0400077A RID: 1914
			public const string DIA_PLAYER_03 = "Audio/DIA/ChapterOne/Henry/DIA_Player_03";

			// Token: 0x0400077B RID: 1915
			public const string DIA_PLAYER_04 = "Audio/DIA/ChapterOne/Henry/DIA_Player_04";

			// Token: 0x0400077C RID: 1916
			public const string DIA_PLAYER_05 = "Audio/DIA/ChapterOne/Henry/DIA_Player_05";

			// Token: 0x0400077D RID: 1917
			public const string DIA_PLAYER_06 = "Audio/DIA/ChapterOne/Henry/DIA_Player_06";

			// Token: 0x0400077E RID: 1918
			public const string DIA_PLAYER_07 = "Audio/DIA/ChapterOne/Henry/DIA_Player_07";

			// Token: 0x0400077F RID: 1919
			public const string DIA_PLAYER_08 = "Audio/DIA/ChapterOne/Henry/DIA_Player_08";

			// Token: 0x04000780 RID: 1920
			public const string DIA_PLAYER_09_A = "Audio/DIA/ChapterOne/Henry/DIA_Player_09A";

			// Token: 0x04000781 RID: 1921
			public const string DIA_PLAYER_09_B = "Audio/DIA/ChapterOne/Henry/DIA_Player_09B";

			// Token: 0x04000782 RID: 1922
			public const string DIA_PLAYER_11 = "Audio/DIA/ChapterOne/Henry/DIA_Player_11";

			// Token: 0x04000783 RID: 1923
			public const string DIA_PLAYER_12 = "Audio/DIA/ChapterOne/Henry/DIA_Player_12";

			// Token: 0x04000784 RID: 1924
			public const string DIA_SAMMY_FINALE_BG_AUDIO = "Audio/DIA/ChapterTwo/DIA_Sammy_Finale_BG_Audio";

			// Token: 0x04000785 RID: 1925
			public const string DIA_SAMMY_FINALE_BG_AUDIO_02 = "Audio/DIA/ChapterTwo/DIA_Sammy_Finale_BG_Audio_02";

			// Token: 0x04000786 RID: 1926
			public const string DIA_SAMMY_FINALE_BG_AUDIO_03 = "Audio/DIA/ChapterTwo/DIA_Sammy_Finale_BG_Audio_03";

			// Token: 0x04000787 RID: 1927
			public const string DIANOR_DIARY_PROJECTIONIST_01TEMP = "Audio/DIA/ChapterTwo/AudioLogs/DIA_NOR_Diary_Projectionist_01_temp";

			// Token: 0x04000788 RID: 1928
			public const string DIASAM_DIARY_DISTRACTIONS_01TEMP = "Audio/DIA/ChapterTwo/AudioLogs/DIA_SAM_Diary_Distractions_01_temp";

			// Token: 0x04000789 RID: 1929
			public const string DIASUS_DIARY_NEW_VOICE_ACTRESS_01TEMP = "Audio/DIA/ChapterTwo/AudioLogs/DIA_SUS_Diary_New_Voice_Actress_01_temp";

			// Token: 0x0400078A RID: 1930
			public const string DIAWAL_DIARY_LOST_KEYS_01TEMP = "Audio/DIA/ChapterTwo/AudioLogs/DIA_WAL_Diary_Lost_Keys_01_temp";

			// Token: 0x0400078B RID: 1931
			public const string DIA_HENRY_BREAK_ROPE_02 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Break_Rope_02";

			// Token: 0x0400078C RID: 1932
			public const string DIA_HENRY_CHAPTER_TWO_02 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_02";

			// Token: 0x0400078D RID: 1933
			public const string DIA_HENRY_CHAPTER_TWO_03 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_03";

			// Token: 0x0400078E RID: 1934
			public const string DIA_HENRY_CHAPTER_TWO_04 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_04";

			// Token: 0x0400078F RID: 1935
			public const string DIA_HENRY_CHAPTER_TWO_05 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_05";

			// Token: 0x04000790 RID: 1936
			public const string DIA_HENRY_CHAPTER_TWO_06 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_06";

			// Token: 0x04000791 RID: 1937
			public const string DIA_HENRY_CHAPTER_TWO_07 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_07";

			// Token: 0x04000792 RID: 1938
			public const string DIA_HENRY_CHAPTER_TWO_08 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_08";

			// Token: 0x04000793 RID: 1939
			public const string DIA_HENRY_CHAPTER_TWO_09 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_09";

			// Token: 0x04000794 RID: 1940
			public const string DIA_HENRY_CHAPTER_TWO_10 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_10";

			// Token: 0x04000795 RID: 1941
			public const string DIA_HENRY_CHAPTER_TWO_11 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Chapter_Two_11";

			// Token: 0x04000796 RID: 1942
			public const string DIA_HENRY_INTRO_01 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_01";

			// Token: 0x04000797 RID: 1943
			public const string DIA_HENRY_INTRO_02 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_02";

			// Token: 0x04000798 RID: 1944
			public const string DIA_HENRY_INTRO_03 = "Audio/DIA/ChapterTwo/Henry/DIA_Henry_Intro_03";

			// Token: 0x04000799 RID: 1945
			public const string DIA_SAMMY_PUZZLE_DIARY_INTRO_01 = "Audio/DIA/ChapterTwo/Puzzle/DIA_Sammy_Puzzle_Diary_Intro_01";

			// Token: 0x0400079A RID: 1946
			public const string DIA_SAMMY_PUZZLE_DIARY_OUTRO_01 = "Audio/DIA/ChapterTwo/Puzzle/DIA_Sammy_Puzzle_Diary_Outro_01";

			// Token: 0x0400079B RID: 1947
			public const string DIA_SAMMY_PUZZLE_DIARY_BANJO_01 = "Audio/DIA/ChapterTwo/Puzzle/Banjo/DIA_Sammy_Puzzle_Diary_Banjo_01";

			// Token: 0x0400079C RID: 1948
			public const string DIA_SAMMY_PUZZLE_DIARY_BANJO_02 = "Audio/DIA/ChapterTwo/Puzzle/Banjo/DIA_Sammy_Puzzle_Diary_Banjo_02";

			// Token: 0x0400079D RID: 1949
			public const string DIA_SAMMY_PUZZLE_DIARY_BASS_01 = "Audio/DIA/ChapterTwo/Puzzle/BassFiddle/DIA_Sammy_Puzzle_Diary_Bass_01";

			// Token: 0x0400079E RID: 1950
			public const string DIA_SAMMY_PUZZLE_DIARY_BASS_02 = "Audio/DIA/ChapterTwo/Puzzle/BassFiddle/DIA_Sammy_Puzzle_Diary_Bass_02";

			// Token: 0x0400079F RID: 1951
			public const string DIA_SAMMY_PUZZLE_DIARY_DRUM_01 = "Audio/DIA/ChapterTwo/Puzzle/Drum/DIA_Sammy_Puzzle_Diary_Drum_01";

			// Token: 0x040007A0 RID: 1952
			public const string DIA_SAMMY_PUZZLE_DIARY_DRUM_02 = "Audio/DIA/ChapterTwo/Puzzle/Drum/DIA_Sammy_Puzzle_Diary_Drum_02";

			// Token: 0x040007A1 RID: 1953
			public const string DIA_SAMMY_PUZZLE_DIARY_PIANO_01 = "Audio/DIA/ChapterTwo/Puzzle/Piano/DIA_Sammy_Puzzle_Diary_Piano_01";

			// Token: 0x040007A2 RID: 1954
			public const string DIA_SAMMY_PUZZLE_DIARY_PIANO_02 = "Audio/DIA/ChapterTwo/Puzzle/Piano/DIA_Sammy_Puzzle_Diary_Piano_02";

			// Token: 0x040007A3 RID: 1955
			public const string DIA_SAMMY_PUZZLE_DIARY_VIOLIN_01 = "Audio/DIA/ChapterTwo/Puzzle/Violin/DIA_Sammy_Puzzle_Diary_Violin_01";

			// Token: 0x040007A4 RID: 1956
			public const string DIA_SAMMY_PUZZLE_DIARY_VIOLIN_02 = "Audio/DIA/ChapterTwo/Puzzle/Violin/DIA_Sammy_Puzzle_Diary_Violin_02";

			// Token: 0x040007A5 RID: 1957
			public const string DIA_SAMMY_C_201 = "Audio/DIA/ChapterTwo/Sammy/DIA_SammyC2_01";

			// Token: 0x040007A6 RID: 1958
			public const string DIA_SAMMY_C_2_AUDIO_DIARRY_01 = "Audio/DIA/ChapterTwo/Sammy/DIA_SammyC2_Audio_Diarry_01";

			// Token: 0x040007A7 RID: 1959
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_01 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_01";

			// Token: 0x040007A8 RID: 1960
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_02 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_02";

			// Token: 0x040007A9 RID: 1961
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_03 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_03";

			// Token: 0x040007AA RID: 1962
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_04 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_04";

			// Token: 0x040007AB RID: 1963
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_05 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_05";

			// Token: 0x040007AC RID: 1964
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_06 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_06";

			// Token: 0x040007AD RID: 1965
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_07 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_07";

			// Token: 0x040007AE RID: 1966
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_08 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_08";

			// Token: 0x040007AF RID: 1967
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_09 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_09";

			// Token: 0x040007B0 RID: 1968
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_10 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_10";

			// Token: 0x040007B1 RID: 1969
			public const string DIA_SAMMY_FINALE_MONOLOGUE_LINE_11 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologue/DIA_Sammy_Finale_Monologue_Line_11";

			// Token: 0x040007B2 RID: 1970
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_01 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_01";

			// Token: 0x040007B3 RID: 1971
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_02 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_02";

			// Token: 0x040007B4 RID: 1972
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_03 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_03";

			// Token: 0x040007B5 RID: 1973
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_04 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_04";

			// Token: 0x040007B6 RID: 1974
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_05 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_05";

			// Token: 0x040007B7 RID: 1975
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_06 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_06";

			// Token: 0x040007B8 RID: 1976
			public const string DIA_SAMMY_FINALE_SPEAKER_LINE_07 = "Audio/DIA/ChapterTwo/Sammy/FinaleMonologueSpeaker/DIA_Sammy_Finale_Speaker_Line_07";

			// Token: 0x040007B9 RID: 1977
			public const string LOUDSPEAKER_FINALE_01 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale01";

			// Token: 0x040007BA RID: 1978
			public const string LOUDSPEAKER_FINALE_02 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale02";

			// Token: 0x040007BB RID: 1979
			public const string LOUDSPEAKER_FINALE_03 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale03";

			// Token: 0x040007BC RID: 1980
			public const string LOUDSPEAKER_FINALE_04 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale04";

			// Token: 0x040007BD RID: 1981
			public const string LOUDSPEAKER_FINALE_05 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale05";

			// Token: 0x040007BE RID: 1982
			public const string LOUDSPEAKER_FINALE_06 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale06";

			// Token: 0x040007BF RID: 1983
			public const string LOUDSPEAKER_FINALE_07 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale07";

			// Token: 0x040007C0 RID: 1984
			public const string LOUDSPEAKER_FINALE_08 = "Audio/DIA/ChapterTwo/Sammy/_theMeatlySpeaker/LoudspeakerFinale08";

			// Token: 0x040007C1 RID: 1985
			public const string MUS_CHAPTER_TWO_TITLE = "Audio/MUS/MUS_Chapter_Two_Title";

			// Token: 0x040007C2 RID: 1986
			public const string MUS_HORROR_CUE_02 = "Audio/MUS/MUS_Horror_Cue_02";

			// Token: 0x040007C3 RID: 1987
			public const string MUS_LITTLE_DEVIL_DARLING_LOOP_01 = "Audio/MUS/MUS_Little_Devil_Darling_Loop_01";

			// Token: 0x040007C4 RID: 1988
			public const string MUS_LOBBY_JAZZ_01 = "Audio/MUS/MUS_Lobby_Jazz_01";

			// Token: 0x040007C5 RID: 1989
			public const string MUS_ODE_TO_BENDY_LOOP_01 = "Audio/MUS/MUS_Ode_To_Bendy_Loop_01";

			// Token: 0x040007C6 RID: 1990
			public const string MUS_ODE_TO_BENDY_LOOP_THROUGH_DOOR_01 = "Audio/MUS/MUS_Ode_To_Bendy_Loop_Through_Door_01";

			// Token: 0x040007C7 RID: 1991
			public const string MUS_SEARCHER_START_CUE_01 = "Audio/MUS/MUS_SearcherStartCue01";

			// Token: 0x040007C8 RID: 1992
			public const string MUS_SEARCHER_UNDER_CUE_LOOP_01 = "Audio/MUS/MUS_Searcher_Under_Cue_Loop_01";

			// Token: 0x040007C9 RID: 1993
			public const string MUS_STINGER_CLOSING_01 = "Audio/MUS/MUS_Stinger_Closing_01";

			// Token: 0x040007CA RID: 1994
			public const string MUS_STINGER_OPENING_01 = "Audio/MUS/MUS_Stinger_Opening_01";

			// Token: 0x040007CB RID: 1995
			public const string MUS_THE_SEARCHERS = "Audio/MUS/MUS_The_Searchers";

			// Token: 0x040007CC RID: 1996
			public const string MUS_YOU_LEFT_ME_IN_A_HEARTBEAT_LOOP_01 = "Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Loop_01";

			// Token: 0x040007CD RID: 1997
			public const string MUS_YOU_LEFT_ME_IN_A_HEARTBEAT_LOOP_01_LOUD = "Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Loop_01LOUD";

			// Token: 0x040007CE RID: 1998
			public const string MUS_YOU_LEFT_ME_IN_A_HEARTBEAT_START_UP_01 = "Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Start_Up_01";

			// Token: 0x040007CF RID: 1999
			public const string MUS_YOU_LEFT_ME_IN_A_HEARTBEAT_START_UP_01_LOUD = "Audio/MUS/MUS_You_Left_Me_In_A_Heartbeat_Start_Up_01LOUD";

			// Token: 0x040007D0 RID: 2000
			public const string AMB_BASEMENT_01 = "Audio/SFX/AMB_Basement_01";

			// Token: 0x040007D1 RID: 2001
			public const string AMB_BASEMENT_CLOSING_SCENE_01 = "Audio/SFX/AMB_Basement_Closing_Scene_01";

			// Token: 0x040007D2 RID: 2002
			public const string FOL_DUCT_CRAWLING_01 = "Audio/SFX/FOL_Duct_Crawling_01";

			// Token: 0x040007D3 RID: 2003
			public const string SFX_ACHIEVMENT_GAMEJOLT_01 = "Audio/SFX/SFX_Achievment_Gamejolt_01";

			// Token: 0x040007D4 RID: 2004
			public const string SFX_BENDY_APPEARS_FROM_INK = "Audio/SFX/SFX_BendyAppearsFromInk";

			// Token: 0x040007D5 RID: 2005
			public const string SFX_BENDY_AT_THE_DOOR = "Audio/SFX/SFX_BendyAtTheDoor";

			// Token: 0x040007D6 RID: 2006
			public const string SFX_BENDY_BREATHING_01 = "Audio/SFX/SFX_Bendy_Breathing_01";

			// Token: 0x040007D7 RID: 2007
			public const string SFX_BENDY_CUTOUT_IMPACT_01 = "Audio/SFX/SFX_Bendy_Cutout_Impact_01";

			// Token: 0x040007D8 RID: 2008
			public const string SFX_BOARD_DROP_FROM_CEILING_01 = "Audio/SFX/SFX_Board_Drop_From_Ceiling_01";

			// Token: 0x040007D9 RID: 2009
			public const string SFX_BOOK_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Book_Pick_Up_Vanish_01";

			// Token: 0x040007DA RID: 2010
			public const string SFX_CAMERA_FLASH_02 = "Audio/SFX/SFX_Camera_Flash_02";

			// Token: 0x040007DB RID: 2011
			public const string SFX_CAN_ROLLSLOW_01 = "Audio/SFX/SFX_Can_Roll_slow_01";

			// Token: 0x040007DC RID: 2012
			public const string SFX_CASSETTE_PLAYER_RUN_01 = "Audio/SFX/SFX_Cassette_Player_Run_01";

			// Token: 0x040007DD RID: 2013
			public const string SFX_CASSETTE_PLAYER_TURN_OFF_01 = "Audio/SFX/SFX_Cassette_Player_Turn_Off_01";

			// Token: 0x040007DE RID: 2014
			public const string SFX_CASSETTE_PLAYER_TURN_ON_01 = "Audio/SFX/SFX_Cassette_Player_Turn_On_01";

			// Token: 0x040007DF RID: 2015
			public const string SFX_CASSETTE_PLAYER_TURN_ON_RUN_TURN_OFF_01 = "Audio/SFX/SFX_Cassette_Player_Turn_On_Run_Turn_Off_01";

			// Token: 0x040007E0 RID: 2016
			public const string SFX_CEILING_COLLAPSE_01 = "Audio/SFX/SFX_Ceiling_Collapse_01";

			// Token: 0x040007E1 RID: 2017
			public const string SFX_CEILING_COLLAPSE_02 = "Audio/SFX/SFX_Ceiling_Collapse_02";

			// Token: 0x040007E2 RID: 2018
			public const string SFX_CEILING_SETTLE_02 = "Audio/SFX/SFX_Ceiling_Settle_02";

			// Token: 0x040007E3 RID: 2019
			public const string SFX_CHAPTER_ONE_BENDY_APPEARS = "Audio/SFX/SFX_ChapterOneBendyAppears";

			// Token: 0x040007E4 RID: 2020
			public const string SFX_DRIPS_01 = "Audio/SFX/SFX_Drips_01";

			// Token: 0x040007E5 RID: 2021
			public const string SFX_DRIPS_02 = "Audio/SFX/SFX_Drips_02";

			// Token: 0x040007E6 RID: 2022
			public const string SFX_DRIPS_03 = "Audio/SFX/SFX_Drips_03";

			// Token: 0x040007E7 RID: 2023
			public const string SFX_FLOOR_BOARDS_BREAK_01_L = "Audio/SFX/SFX_Floor_Boards_Break_01.L";

			// Token: 0x040007E8 RID: 2024
			public const string SFX_GATE_CLOSE_01 = "Audio/SFX/SFX_Gate_Close_01";

			// Token: 0x040007E9 RID: 2025
			public const string SFX_GATE_OPEN_01 = "Audio/SFX/SFX_Gate_Open_01";

			// Token: 0x040007EA RID: 2026
			public const string SFX_GATE_OPEN_SLOW_01 = "Audio/SFX/SFX_Gate_Open_Slow_01";

			// Token: 0x040007EB RID: 2027
			public const string SFX_GEAR_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Gear_Pick_UP_Vanish_01";

			// Token: 0x040007EC RID: 2028
			public const string SFX_GENERIC_DOORKNOB_RATTLE_01 = "Audio/SFX/SFX_Generic_Doorknob_Rattle_01";

			// Token: 0x040007ED RID: 2029
			public const string SFX_GENERIC_DOORKNOB_RATTLE_02 = "Audio/SFX/SFX_Generic_Doorknob_Rattle_02";

			// Token: 0x040007EE RID: 2030
			public const string SFX_GENERIC_DOORKNOB_RATTLE_03 = "Audio/SFX/SFX_Generic_Doorknob_Rattle_03";

			// Token: 0x040007EF RID: 2031
			public const string SFX_GENERIC_DOORKNOB_RATTLE_04 = "Audio/SFX/SFX_Generic_Doorknob_Rattle_04";

			// Token: 0x040007F0 RID: 2032
			public const string SFXHU_DWHOOSH_01 = "Audio/SFX/SFX_HUD_whoosh_01";

			// Token: 0x040007F1 RID: 2033
			public const string SFX_HENRY_BODY_FALL_01 = "Audio/SFX/SFX_Henry_Body_Fall_01";

			// Token: 0x040007F2 RID: 2034
			public const string SFX_HENRY_FAINT_AXE = "Audio/SFX/SFX_Henry_Faint_Axe";

			// Token: 0x040007F3 RID: 2035
			public const string SFX_HENRY_HIT_ON_HEAD = "Audio/SFX/SFX_Henry_HitOnHead";

			// Token: 0x040007F4 RID: 2036
			public const string SFX_HORROR_AMBIENCE_LOOP_01 = "Audio/SFX/SFX_Horror_Ambience_Loop_01";

			// Token: 0x040007F5 RID: 2037
			public const string SFX_INK_MACHINE_MOTOR_AND_WHISTLE = "Audio/SFX/SFX_InkMachineMotorAndWhistle";

			// Token: 0x040007F6 RID: 2038
			public const string SFX_INK_FLOOD_AMB_01 = "Audio/SFX/SFX_Ink_Flood_AMB_01";

			// Token: 0x040007F7 RID: 2039
			public const string SFX_INK_FLOW_BUTON_PRESS_01 = "Audio/SFX/SFX_Ink_Flow_Buton_Press_01";

			// Token: 0x040007F8 RID: 2040
			public const string SFX_INK_GUSH_HVY_01 = "Audio/SFX/SFX_Ink_Gush_Hvy_01";

			// Token: 0x040007F9 RID: 2041
			public const string SFX_INK_GUSH_MED_01 = "Audio/SFX/SFX_Ink_Gush_Med_01";

			// Token: 0x040007FA RID: 2042
			public const string SFX_INK_JAR_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Ink_Jar_Pick_UP_Vanish_01";

			// Token: 0x040007FB RID: 2043
			public const string SFX_INK_MACHINE_RUN_LOOP_01 = "Audio/SFX/SFX_Ink_Machine_Run_Loop_01";

			// Token: 0x040007FC RID: 2044
			public const string SFX_JUMPSCARE_01 = "Audio/SFX/SFX_Jumpscare_01";

			// Token: 0x040007FD RID: 2045
			public const string SFX_KEYS_PICKUP_01 = "Audio/SFX/SFX_Keys_Pickup_01";

			// Token: 0x040007FE RID: 2046
			public const string SFX_LIGHT_SWITCH_SAMMYS_ROOM_01 = "Audio/SFX/SFX_Light_Switch_Sammys_Room_01";

			// Token: 0x040007FF RID: 2047
			public const string SFX_LIGHTS_FLICKER_LOOP_01 = "Audio/SFX/SFX_Lights_Flicker_Loop_01";

			// Token: 0x04000800 RID: 2048
			public const string SFX_LIGHTS_FLICKER_LOOP_02 = "Audio/SFX/SFX_Lights_Flicker_Loop_02";

			// Token: 0x04000801 RID: 2049
			public const string SFX_LIGHTS_FLICKER_LOOP_03 = "Audio/SFX/SFX_Lights_Flicker_Loop_03";

			// Token: 0x04000802 RID: 2050
			public const string SFX_LOW_RUMBLE_CLOSING_SCENE_01 = "Audio/SFX/SFX_Low_Rumble_Closing_Scene_01";

			// Token: 0x04000803 RID: 2051
			public const string SFX_MAINR_POWER_LEVER_TURN_ON_01 = "Audio/SFX/SFX_Mainr_Power_Lever_Turn_On_01";

			// Token: 0x04000804 RID: 2052
			public const string SFX_PIANO_LID_CLOSE_JUMPSCARE = "Audio/SFX/SFX_Piano_Lid_Close_Jumpscare";

			// Token: 0x04000805 RID: 2053
			public const string SFX_PIPES_INK_FLOW_01 = "Audio/SFX/SFX_Pipes_Ink_Flow_01";

			// Token: 0x04000806 RID: 2054
			public const string SFX_PIPES_INK_FLOW_02 = "Audio/SFX/SFX_Pipes_Ink_Flow_02";

			// Token: 0x04000807 RID: 2055
			public const string SFX_PIPES_STRESS_01 = "Audio/SFX/SFX_Pipes_Stress_01";

			// Token: 0x04000808 RID: 2056
			public const string SFX_PROJECTOR_RUN_WITH_FILM_01 = "Audio/SFX/SFX_Projector_Run_With_Film_01";

			// Token: 0x04000809 RID: 2057
			public const string SFX_PROJECTOR_RUNNING_WILD_01 = "Audio/SFX/SFX_Projector_Running_Wild_01";

			// Token: 0x0400080A RID: 2058
			public const string SFX_PROJECTOR_SWITCH_TURN_ON_01 = "Audio/SFX/SFX_Projector_Switch_Turn_On_01";

			// Token: 0x0400080B RID: 2059
			public const string SFX_RECORD_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Record_Pick_UP_Vanish_01";

			// Token: 0x0400080C RID: 2060
			public const string SFX_RINGING_EARS_01 = "Audio/SFX/SFX_Ringing_Ears_01";

			// Token: 0x0400080D RID: 2061
			public const string SFX_RINGING_EARS_02 = "Audio/SFX/SFX_Ringing_Ears_02";

			// Token: 0x0400080E RID: 2062
			public const string SFX_ROPE_STRESS_01 = "Audio/SFX/SFX_Rope_Stress_01";

			// Token: 0x0400080F RID: 2063
			public const string SFX_ROPE_STRESS_SNAP_02 = "Audio/SFX/SFX_Rope_Stress_Snap_02";

			// Token: 0x04000810 RID: 2064
			public const string SFX_RUMBLE_LOOP_01 = "Audio/SFX/SFX_Rumble_Loop_01";

			// Token: 0x04000811 RID: 2065
			public const string SFX_SEARCHER_MELT_01 = "Audio/SFX/SFX_Searcher_Melt_01";

			// Token: 0x04000812 RID: 2066
			public const string SFX_SEARCHER_MELT_02 = "Audio/SFX/SFX_Searcher_Melt_02";

			// Token: 0x04000813 RID: 2067
			public const string SFX_SEARCHER_MELT_03 = "Audio/SFX/SFX_Searcher_Melt_03";

			// Token: 0x04000814 RID: 2068
			public const string SFX_SPARKS_INK_MACHINE_01 = "Audio/SFX/SFX_Sparks_Ink_Machine_01";

			// Token: 0x04000815 RID: 2069
			public const string SFX_SPEAKER_TAP_FEEDBACK = "Audio/SFX/SFX_Speaker_Tap_Feedback";

			// Token: 0x04000816 RID: 2070
			public const string SFX_STAND_UP_PLAYER_01 = "Audio/SFX/SFX_Stand_Up_Player_01";

			// Token: 0x04000817 RID: 2071
			public const string SFX_TOY_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Toy_Pick_UP_Vanish_01";

			// Token: 0x04000818 RID: 2072
			public const string SFX_TUMBLE_DOWN_SHAFT_01 = "Audio/SFX/SFX_Tumble_Down_Shaft_01";

			// Token: 0x04000819 RID: 2073
			public const string SFX_TUMBLE_DOWN_SHAFT_BODY_FALL_01 = "Audio/SFX/SFX_Tumble_Down_Shaft_Body_Fall_01";

			// Token: 0x0400081A RID: 2074
			public const string SFX_VALVE_TURN_STEAM_RELEASE_01 = "Audio/SFX/SFX_Valve_Turn_Steam_Release_01";

			// Token: 0x0400081B RID: 2075
			public const string SFX_WALL_PULLEYS_TURN_01 = "Audio/SFX/SFX_Wall_Pulleys_Turn_01";

			// Token: 0x0400081C RID: 2076
			public const string SFX_WOOD_PLANK_FALL = "Audio/SFX/SFX_WoodPlankFall";

			// Token: 0x0400081D RID: 2077
			public const string SFX_WRENCH_PICK_UP_VANISH_01 = "Audio/SFX/SFX_Wrench_Pick_UP_Vanish_01";

			// Token: 0x0400081E RID: 2078
			public const string SF_XBATIMINKDRIPPINGLOOP_01 = "Audio/SFX/SFX_batim_ink_dripping_loop_01";

			// Token: 0x0400081F RID: 2079
			public const string SF_XBATIMINKDRIPPINGSTARTUP_01 = "Audio/SFX/SFX_batim_ink_dripping_startup_01";

			// Token: 0x04000820 RID: 2080
			public const string SFX_AXE_HIT_01 = "Audio/SFX/Axe/SFX_Axe_Hit_01";

			// Token: 0x04000821 RID: 2081
			public const string SFX_AXE_HIT_02 = "Audio/SFX/Axe/SFX_Axe_Hit_02";

			// Token: 0x04000822 RID: 2082
			public const string SFX_AXE_HIT_03 = "Audio/SFX/Axe/SFX_Axe_Hit_03";

			// Token: 0x04000823 RID: 2083
			public const string SFX_AXE_HIT_04 = "Audio/SFX/Axe/SFX_Axe_Hit_04";

			// Token: 0x04000824 RID: 2084
			public const string SFX_AXE_HIT_05 = "Audio/SFX/Axe/SFX_Axe_Hit_05";

			// Token: 0x04000825 RID: 2085
			public const string SFX_AXE_HIT_06 = "Audio/SFX/Axe/SFX_Axe_Hit_06";

			// Token: 0x04000826 RID: 2086
			public const string SFX_AXE_HIT_07 = "Audio/SFX/Axe/SFX_Axe_Hit_07";

			// Token: 0x04000827 RID: 2087
			public const string SFX_AXE_HIT_08 = "Audio/SFX/Axe/SFX_Axe_Hit_08";

			// Token: 0x04000828 RID: 2088
			public const string SFX_AXE_PICK_UP_01 = "Audio/SFX/Axe/SFX_Axe_Pick_Up_01";

			// Token: 0x04000829 RID: 2089
			public const string SFX_AXE_SWING_01 = "Audio/SFX/Axe/SFX_Axe_Swing_01";

			// Token: 0x0400082A RID: 2090
			public const string SFX_AXE_SWING_02 = "Audio/SFX/Axe/SFX_Axe_Swing_02";

			// Token: 0x0400082B RID: 2091
			public const string SFX_AXE_SWING_03 = "Audio/SFX/Axe/SFX_Axe_Swing_03";

			// Token: 0x0400082C RID: 2092
			public const string SFX_AXE_SWING_04 = "Audio/SFX/Axe/SFX_Axe_Swing_04";

			// Token: 0x0400082D RID: 2093
			public const string SFX_AXE_SWING_05 = "Audio/SFX/Axe/SFX_Axe_Swing_05";

			// Token: 0x0400082E RID: 2094
			public const string SFX_AXE_SWING_06 = "Audio/SFX/Axe/SFX_Axe_Swing_06";

			// Token: 0x0400082F RID: 2095
			public const string SFX_AXE_SWING_07 = "Audio/SFX/Axe/SFX_Axe_Swing_07";

			// Token: 0x04000830 RID: 2096
			public const string SFX_AXE_SWING_08 = "Audio/SFX/Axe/SFX_Axe_Swing_08";

			// Token: 0x04000831 RID: 2097
			public const string SFX_AXE_WOOD_HIT_CRACK_01 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_01";

			// Token: 0x04000832 RID: 2098
			public const string SFX_AXE_WOOD_HIT_CRACK_02 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_02";

			// Token: 0x04000833 RID: 2099
			public const string SFX_AXE_WOOD_HIT_CRACK_03 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_03";

			// Token: 0x04000834 RID: 2100
			public const string SFX_AXE_WOOD_HIT_CRACK_04 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_04";

			// Token: 0x04000835 RID: 2101
			public const string SFX_AXE_WOOD_HIT_CRACK_05 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_05";

			// Token: 0x04000836 RID: 2102
			public const string SFX_AXE_WOOD_HIT_CRACK_06 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_06";

			// Token: 0x04000837 RID: 2103
			public const string SFX_AXE_WOOD_HIT_CRACK_07 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_07";

			// Token: 0x04000838 RID: 2104
			public const string SFX_AXE_WOOD_HIT_CRACK_08 = "Audio/SFX/Axe/SFX_Axe_Wood_Hit_Crack_08";

			// Token: 0x04000839 RID: 2105
			public const string SFX_BENDY_VOCAL_ATTACK_0107 = "Audio/SFX/Bendy/SFX_Bendy_Vocal_Attack_01-07";

			// Token: 0x0400083A RID: 2106
			public const string SFX_BENDY_VOCAL_ATTACK_02 = "Audio/SFX/Bendy/SFX_Bendy_Vocal_Attack_02";

			// Token: 0x0400083B RID: 2107
			public const string SFX_BENDY_VOCAL_ATTACK_03 = "Audio/SFX/Bendy/SFX_Bendy_Vocal_Attack_03";

			// Token: 0x0400083C RID: 2108
			public const string SFX_BENDY_VOCAL_CHEST_NOISE_LOOP_01 = "Audio/SFX/Bendy/SFX_Bendy_Vocal_Chest_Noise_Loop_01";

			// Token: 0x0400083D RID: 2109
			public const string SFX_BENDY_VOCAL_SCARED_01 = "Audio/SFX/Bendy/SFX_Bendy_Vocal_Scared_01";

			// Token: 0x0400083E RID: 2110
			public const string SFX_DOOR_GENERIC_CLOSE_01 = "Audio/SFX/Door/SFX_Door_Generic_Close_01";

			// Token: 0x0400083F RID: 2111
			public const string SFX_DOOR_GENERIC_OPEN_01 = "Audio/SFX/Door/SFX_Door_Generic_Open_01";

			// Token: 0x04000840 RID: 2112
			public const string SFX_DOOR_SLAM_01 = "Audio/SFX/Door/SFX_Door_Slam_01";

			// Token: 0x04000841 RID: 2113
			public const string SFX_DOOR_UNLOCK_OPEN_CLOSE_01 = "Audio/SFX/Door/SFX_Door_Unlock_Open_Close_01";

			// Token: 0x04000842 RID: 2114
			public const string SFX_DOOR_UNLOCK_OPEN_CLOSE_02 = "Audio/SFX/Door/SFX_Door_Unlock_Open_Close_02";

			// Token: 0x04000843 RID: 2115
			public const string FOL_FOOTSTEPS_BENDY_WOOD_01 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_01";

			// Token: 0x04000844 RID: 2116
			public const string FOL_FOOTSTEPS_BENDY_WOOD_02 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_02";

			// Token: 0x04000845 RID: 2117
			public const string FOL_FOOTSTEPS_BENDY_WOOD_03 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_03";

			// Token: 0x04000846 RID: 2118
			public const string FOL_FOOTSTEPS_BENDY_WOOD_04 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_04";

			// Token: 0x04000847 RID: 2119
			public const string FOL_FOOTSTEPS_BENDY_WOOD_05 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_05";

			// Token: 0x04000848 RID: 2120
			public const string FOL_FOOTSTEPS_BENDY_WOOD_06 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_06";

			// Token: 0x04000849 RID: 2121
			public const string FOL_FOOTSTEPS_BENDY_WOOD_07 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_07";

			// Token: 0x0400084A RID: 2122
			public const string FOL_FOOTSTEPS_BENDY_WOOD_08 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_08";

			// Token: 0x0400084B RID: 2123
			public const string FOL_FOOTSTEPS_BENDY_WOOD_09 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_09";

			// Token: 0x0400084C RID: 2124
			public const string FOL_FOOTSTEPS_BENDY_WOOD_10 = "Audio/SFX/Footsteps/Bendy/Ink/FOL_Footsteps_Bendy_Wood_10";

			// Token: 0x0400084D RID: 2125
			public const string BENDY_NEW_FOOTSTEPS_01 = "Audio/SFX/Footsteps/Bendy/Loud/Bendy_NewFootsteps_01";

			// Token: 0x0400084E RID: 2126
			public const string BENDY_NEW_FOOTSTEPS_02 = "Audio/SFX/Footsteps/Bendy/Loud/Bendy_NewFootsteps_02";

			// Token: 0x0400084F RID: 2127
			public const string BENDY_NEW_FOOTSTEPS_03 = "Audio/SFX/Footsteps/Bendy/Loud/Bendy_NewFootsteps_03";

			// Token: 0x04000850 RID: 2128
			public const string BENDY_NEW_FOOTSTEPS_04 = "Audio/SFX/Footsteps/Bendy/Loud/Bendy_NewFootsteps_04";

			// Token: 0x04000851 RID: 2129
			public const string FOL_FOOTSTEPS_BORIS_WOOD_01 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_01";

			// Token: 0x04000852 RID: 2130
			public const string FOL_FOOTSTEPS_BORIS_WOOD_02 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_02";

			// Token: 0x04000853 RID: 2131
			public const string FOL_FOOTSTEPS_BORIS_WOOD_03 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_03";

			// Token: 0x04000854 RID: 2132
			public const string FOL_FOOTSTEPS_BORIS_WOOD_04 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_04";

			// Token: 0x04000855 RID: 2133
			public const string FOL_FOOTSTEPS_BORIS_WOOD_05 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_05";

			// Token: 0x04000856 RID: 2134
			public const string FOL_FOOTSTEPS_BORIS_WOOD_06 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_06";

			// Token: 0x04000857 RID: 2135
			public const string FOL_FOOTSTEPS_BORIS_WOOD_07 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_07";

			// Token: 0x04000858 RID: 2136
			public const string FOL_FOOTSTEPS_BORIS_WOOD_08 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_08";

			// Token: 0x04000859 RID: 2137
			public const string FOL_FOOTSTEPS_BORIS_WOOD_09 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_09";

			// Token: 0x0400085A RID: 2138
			public const string FOL_FOOTSTEPS_BORIS_WOOD_10 = "Audio/SFX/Footsteps/Boris/Wood/FOL_Footsteps_Boris_Wood_10";

			// Token: 0x0400085B RID: 2139
			public const string FOL_FOOTSTEPS_PLAYER_WET_SCUFF_01 = "Audio/SFX/Footsteps/Player/FOL_Footsteps_Player_Wet_Scuff_01";

			// Token: 0x0400085C RID: 2140
			public const string FO_LFOOTSTEPS_PLAYER_DRY_SCUFF_01 = "Audio/SFX/Footsteps/Player/FOL_footsteps_Player_Dry_Scuff_01";

			// Token: 0x0400085D RID: 2141
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_01 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_01";

			// Token: 0x0400085E RID: 2142
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_02 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_02";

			// Token: 0x0400085F RID: 2143
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_03 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_03";

			// Token: 0x04000860 RID: 2144
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_04 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_04";

			// Token: 0x04000861 RID: 2145
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_05 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_05";

			// Token: 0x04000862 RID: 2146
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_06 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_06";

			// Token: 0x04000863 RID: 2147
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_07 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_07";

			// Token: 0x04000864 RID: 2148
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_08 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_08";

			// Token: 0x04000865 RID: 2149
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_09 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_09";

			// Token: 0x04000866 RID: 2150
			public const string FOL_FOOTSTEPS_PLAYER_WET_WALK_10 = "Audio/SFX/Footsteps/Player/Ink/FOL_Footsteps_Player_Wet_Walk_10";

			// Token: 0x04000867 RID: 2151
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_01 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_01";

			// Token: 0x04000868 RID: 2152
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_02 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_02";

			// Token: 0x04000869 RID: 2153
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_03 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_03";

			// Token: 0x0400086A RID: 2154
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_04 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_04";

			// Token: 0x0400086B RID: 2155
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_05 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_05";

			// Token: 0x0400086C RID: 2156
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_06 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_06";

			// Token: 0x0400086D RID: 2157
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_07 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_07";

			// Token: 0x0400086E RID: 2158
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_08 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_08";

			// Token: 0x0400086F RID: 2159
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_09 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_09";

			// Token: 0x04000870 RID: 2160
			public const string FO_LFOOTSTEPS_PLAYER_PUDDLE_WALK_10 = "Audio/SFX/Footsteps/Player/InkDeep/FOL_footsteps_Player_Puddle_Walk_10";

			// Token: 0x04000871 RID: 2161
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_01 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_01";

			// Token: 0x04000872 RID: 2162
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_02 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_02";

			// Token: 0x04000873 RID: 2163
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_03 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_03";

			// Token: 0x04000874 RID: 2164
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_04 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_04";

			// Token: 0x04000875 RID: 2165
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_05 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_05";

			// Token: 0x04000876 RID: 2166
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_06 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_06";

			// Token: 0x04000877 RID: 2167
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_07 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_07";

			// Token: 0x04000878 RID: 2168
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_08 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_08";

			// Token: 0x04000879 RID: 2169
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_09 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_09";

			// Token: 0x0400087A RID: 2170
			public const string FOL_FOOTSTEPS_PLAYER_WET_STAIRS_10 = "Audio/SFX/Footsteps/Player/InkStairs/FOL_Footsteps_Player_Wet_Stairs_10";

			// Token: 0x0400087B RID: 2171
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_01 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_01";

			// Token: 0x0400087C RID: 2172
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_02 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_02";

			// Token: 0x0400087D RID: 2173
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_03 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_03";

			// Token: 0x0400087E RID: 2174
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_04 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_04";

			// Token: 0x0400087F RID: 2175
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_05 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_05";

			// Token: 0x04000880 RID: 2176
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_06 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_06";

			// Token: 0x04000881 RID: 2177
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_07 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_07";

			// Token: 0x04000882 RID: 2178
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_08 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_08";

			// Token: 0x04000883 RID: 2179
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_09 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_09";

			// Token: 0x04000884 RID: 2180
			public const string FO_LFOOTSTEPS_PLAYER_DRY_WALK_10 = "Audio/SFX/Footsteps/Player/Wood/FOL_footsteps_Player_Dry_Walk_10";

			// Token: 0x04000885 RID: 2181
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_01 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_01";

			// Token: 0x04000886 RID: 2182
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_02 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_02";

			// Token: 0x04000887 RID: 2183
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_03 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_03";

			// Token: 0x04000888 RID: 2184
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_04 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_04";

			// Token: 0x04000889 RID: 2185
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_05 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_05";

			// Token: 0x0400088A RID: 2186
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_06 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_06";

			// Token: 0x0400088B RID: 2187
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_07 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_07";

			// Token: 0x0400088C RID: 2188
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_08 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_08";

			// Token: 0x0400088D RID: 2189
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_09 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_09";

			// Token: 0x0400088E RID: 2190
			public const string FO_LFOOTSTEPS_PLAYER_DRY_STAIRS_10 = "Audio/SFX/Footsteps/Player/WoodStairs/FOL_footsteps_Player_Dry_Stairs_10";

			// Token: 0x0400088F RID: 2191
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_01 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_01";

			// Token: 0x04000890 RID: 2192
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_02 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_02";

			// Token: 0x04000891 RID: 2193
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_03 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_03";

			// Token: 0x04000892 RID: 2194
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_04 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_04";

			// Token: 0x04000893 RID: 2195
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_05 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_05";

			// Token: 0x04000894 RID: 2196
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_06 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_06";

			// Token: 0x04000895 RID: 2197
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_07 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_07";

			// Token: 0x04000896 RID: 2198
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_08 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_08";

			// Token: 0x04000897 RID: 2199
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_09 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_09";

			// Token: 0x04000898 RID: 2200
			public const string FOL_FOOTSTEPS_SAMMY_WOOD_10 = "Audio/SFX/Footsteps/Sammy/Wood/FOL_Footsteps_Sammy_Wood_10";

			// Token: 0x04000899 RID: 2201
			public const string SFX_BUTTON_PUSH_01 = "Audio/SFX/GenericButtons/SFX_Button_Push_01";

			// Token: 0x0400089A RID: 2202
			public const string SFX_BUTTON_PUSH_02 = "Audio/SFX/GenericButtons/SFX_Button_Push_02";

			// Token: 0x0400089B RID: 2203
			public const string SFX_BUTTON_PUSH_03 = "Audio/SFX/GenericButtons/SFX_Button_Push_03";

			// Token: 0x0400089C RID: 2204
			public const string HENRY_DEAD_01_LOUD = "Audio/SFX/Henry/Death/HenryDead01LOUD";

			// Token: 0x0400089D RID: 2205
			public const string HENRY_DEAD_02_LOUD = "Audio/SFX/Henry/Death/HenryDead02LOUD";

			// Token: 0x0400089E RID: 2206
			public const string HENRY_DEAD_03_LOUD = "Audio/SFX/Henry/Death/HenryDead03LOUD";

			// Token: 0x0400089F RID: 2207
			public const string HENRY_HURT_01_LOUD = "Audio/SFX/Henry/Hurt/HenryHurt01LOUD";

			// Token: 0x040008A0 RID: 2208
			public const string HENRY_HURT_02_LOUD = "Audio/SFX/Henry/Hurt/HenryHurt02LOUD";

			// Token: 0x040008A1 RID: 2209
			public const string HENRY_HURT_03_LOUD = "Audio/SFX/Henry/Hurt/HenryHurt03LOUD";

			// Token: 0x040008A2 RID: 2210
			public const string SFX_BANJO_NOTE_01 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_01";

			// Token: 0x040008A3 RID: 2211
			public const string SFX_BANJO_NOTE_02 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_02";

			// Token: 0x040008A4 RID: 2212
			public const string SFX_BANJO_NOTE_03 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_03";

			// Token: 0x040008A5 RID: 2213
			public const string SFX_BANJO_NOTE_04 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_04";

			// Token: 0x040008A6 RID: 2214
			public const string SFX_BANJO_NOTE_05 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_05";

			// Token: 0x040008A7 RID: 2215
			public const string SFX_BANJO_NOTE_06 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_06";

			// Token: 0x040008A8 RID: 2216
			public const string SFX_BANJO_NOTE_07 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_07";

			// Token: 0x040008A9 RID: 2217
			public const string SFX_BANJO_NOTE_08 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_08";

			// Token: 0x040008AA RID: 2218
			public const string SFX_BANJO_NOTE_09 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_09";

			// Token: 0x040008AB RID: 2219
			public const string SFX_BANJO_NOTE_10 = "Audio/SFX/Instruments/Banjo/SFX_Banjo_Note_10";

			// Token: 0x040008AC RID: 2220
			public const string SFX_BASS_NOTE_01 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_01";

			// Token: 0x040008AD RID: 2221
			public const string SFX_BASS_NOTE_02 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_02";

			// Token: 0x040008AE RID: 2222
			public const string SFX_BASS_NOTE_03 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_03";

			// Token: 0x040008AF RID: 2223
			public const string SFX_BASS_NOTE_04 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_04";

			// Token: 0x040008B0 RID: 2224
			public const string SFX_BASS_NOTE_05 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_05";

			// Token: 0x040008B1 RID: 2225
			public const string SFX_BASS_NOTE_06 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_06";

			// Token: 0x040008B2 RID: 2226
			public const string SFX_BASS_NOTE_07 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_07";

			// Token: 0x040008B3 RID: 2227
			public const string SFX_BASS_NOTE_08 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_08";

			// Token: 0x040008B4 RID: 2228
			public const string SFX_BASS_NOTE_09 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_09";

			// Token: 0x040008B5 RID: 2229
			public const string SFX_BASS_NOTE_10 = "Audio/SFX/Instruments/BassFiddle/SFX_Bass_Note_10";

			// Token: 0x040008B6 RID: 2230
			public const string SFX_DRUM_NOTE_01 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_01";

			// Token: 0x040008B7 RID: 2231
			public const string SFX_DRUM_NOTE_02 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_02";

			// Token: 0x040008B8 RID: 2232
			public const string SFX_DRUM_NOTE_03 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_03";

			// Token: 0x040008B9 RID: 2233
			public const string SFX_DRUM_NOTE_04 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_04";

			// Token: 0x040008BA RID: 2234
			public const string SFX_DRUM_NOTE_05 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_05";

			// Token: 0x040008BB RID: 2235
			public const string SFX_DRUM_NOTE_06 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_06";

			// Token: 0x040008BC RID: 2236
			public const string SFX_DRUM_NOTE_07 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_07";

			// Token: 0x040008BD RID: 2237
			public const string SFX_DRUM_NOTE_08 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_08";

			// Token: 0x040008BE RID: 2238
			public const string SFX_DRUM_NOTE_09 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_09";

			// Token: 0x040008BF RID: 2239
			public const string SFX_DRUM_NOTE_10 = "Audio/SFX/Instruments/Drum/SFX_Drum_Note_10";

			// Token: 0x040008C0 RID: 2240
			public const string SFX_PIANOO_NOTE_01 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_01";

			// Token: 0x040008C1 RID: 2241
			public const string SFX_PIANOO_NOTE_02 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_02";

			// Token: 0x040008C2 RID: 2242
			public const string SFX_PIANOO_NOTE_03 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_03";

			// Token: 0x040008C3 RID: 2243
			public const string SFX_PIANOO_NOTE_04 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_04";

			// Token: 0x040008C4 RID: 2244
			public const string SFX_PIANOO_NOTE_05 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_05";

			// Token: 0x040008C5 RID: 2245
			public const string SFX_PIANOO_NOTE_06 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_06";

			// Token: 0x040008C6 RID: 2246
			public const string SFX_PIANOO_NOTE_07 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_07";

			// Token: 0x040008C7 RID: 2247
			public const string SFX_PIANOO_NOTE_08 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_08";

			// Token: 0x040008C8 RID: 2248
			public const string SFX_PIANOO_NOTE_09 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_09";

			// Token: 0x040008C9 RID: 2249
			public const string SFX_PIANOO_NOTE_10 = "Audio/SFX/Instruments/Piano/SFX_Pianoo_Note_10";

			// Token: 0x040008CA RID: 2250
			public const string SFX_ORGAN_SCREAM_NOTE_01 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_01";

			// Token: 0x040008CB RID: 2251
			public const string SFX_ORGAN_SCREAM_NOTE_02 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_02";

			// Token: 0x040008CC RID: 2252
			public const string SFX_ORGAN_SCREAM_NOTE_03 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_03";

			// Token: 0x040008CD RID: 2253
			public const string SFX_ORGAN_SCREAM_NOTE_04 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_04";

			// Token: 0x040008CE RID: 2254
			public const string SFX_ORGAN_SCREAM_NOTE_05 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_05";

			// Token: 0x040008CF RID: 2255
			public const string SFX_ORGAN_SCREAM_NOTE_06 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_06";

			// Token: 0x040008D0 RID: 2256
			public const string SFX_ORGAN_SCREAM_NOTE_07 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_07";

			// Token: 0x040008D1 RID: 2257
			public const string SFX_ORGAN_SCREAM_NOTE_08 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_08";

			// Token: 0x040008D2 RID: 2258
			public const string SFX_ORGAN_SCREAM_NOTE_09 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_09";

			// Token: 0x040008D3 RID: 2259
			public const string SFX_ORGAN_SCREAM_NOTE_10 = "Audio/SFX/Instruments/PipeOrgan/SFX_Organ_Scream_Note_10";

			// Token: 0x040008D4 RID: 2260
			public const string SFX_VIOLIN_NOTE_01 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_01";

			// Token: 0x040008D5 RID: 2261
			public const string SFX_VIOLIN_NOTE_02 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_02";

			// Token: 0x040008D6 RID: 2262
			public const string SFX_VIOLIN_NOTE_03 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_03";

			// Token: 0x040008D7 RID: 2263
			public const string SFX_VIOLIN_NOTE_04 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_04";

			// Token: 0x040008D8 RID: 2264
			public const string SFX_VIOLIN_NOTE_05 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_05";

			// Token: 0x040008D9 RID: 2265
			public const string SFX_VIOLIN_NOTE_06 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_06";

			// Token: 0x040008DA RID: 2266
			public const string SFX_VIOLIN_NOTE_07 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_07";

			// Token: 0x040008DB RID: 2267
			public const string SFX_VIOLIN_NOTE_08 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_08";

			// Token: 0x040008DC RID: 2268
			public const string SFX_VIOLIN_NOTE_09 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_09";

			// Token: 0x040008DD RID: 2269
			public const string SFX_VIOLIN_NOTE_10 = "Audio/SFX/Instruments/Violin/SFX_Violin_Note_10";

			// Token: 0x040008DE RID: 2270
			public const string SEARCHER_APPEAR_01 = "Audio/SFX/Searchers/Appear/SearcherAppear01";

			// Token: 0x040008DF RID: 2271
			public const string SEARCHER_APPEAR_02 = "Audio/SFX/Searchers/Appear/SearcherAppear02";

			// Token: 0x040008E0 RID: 2272
			public const string SFX_SEARCHERS_VOIICE_ATTACK_01 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_01";

			// Token: 0x040008E1 RID: 2273
			public const string SFX_SEARCHERS_VOIICE_ATTACK_02 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_02";

			// Token: 0x040008E2 RID: 2274
			public const string SFX_SEARCHERS_VOIICE_ATTACK_03 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_03";

			// Token: 0x040008E3 RID: 2275
			public const string SFX_SEARCHERS_VOIICE_ATTACK_04 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_04";

			// Token: 0x040008E4 RID: 2276
			public const string SFX_SEARCHERS_VOIICE_ATTACK_05 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_05";

			// Token: 0x040008E5 RID: 2277
			public const string SFX_SEARCHERS_VOIICE_ATTACK_06 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_06";

			// Token: 0x040008E6 RID: 2278
			public const string SFX_SEARCHERS_VOIICE_ATTACK_07 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_07";

			// Token: 0x040008E7 RID: 2279
			public const string SFX_SEARCHERS_VOIICE_ATTACK_08 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_08";

			// Token: 0x040008E8 RID: 2280
			public const string SFX_SEARCHERS_VOIICE_ATTACK_09 = "Audio/SFX/Searchers/Attack/SFX_Searchers_Voiice_Attack_09";

			// Token: 0x040008E9 RID: 2281
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_01 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_01";

			// Token: 0x040008EA RID: 2282
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_02 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_02";

			// Token: 0x040008EB RID: 2283
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_03 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_03";

			// Token: 0x040008EC RID: 2284
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_04 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_04";

			// Token: 0x040008ED RID: 2285
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_05 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_05";

			// Token: 0x040008EE RID: 2286
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_06 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_06";

			// Token: 0x040008EF RID: 2287
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_07 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_07";

			// Token: 0x040008F0 RID: 2288
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_08 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_08";

			// Token: 0x040008F1 RID: 2289
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_09 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_09";

			// Token: 0x040008F2 RID: 2290
			public const string SFX_SEARCHERS_VOIICE_MOUTH_OPEN_10 = "Audio/SFX/Searchers/Generic/SFX_Searchers_Voiice_Mouth_Open_10";

			// Token: 0x040008F3 RID: 2291
			public const string SEARCHER_BURST_01 = "Audio/SFX/Searchers/Hurt/Searcher_Burst_01";

			// Token: 0x040008F4 RID: 2292
			public const string SEARCHER_BURST_02 = "Audio/SFX/Searchers/Hurt/Searcher_Burst_02";

			// Token: 0x040008F5 RID: 2293
			public const string SFX_SEARCHERS_VOIICE_HURT_01 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_01";

			// Token: 0x040008F6 RID: 2294
			public const string SFX_SEARCHERS_VOIICE_HURT_02 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_02";

			// Token: 0x040008F7 RID: 2295
			public const string SFX_SEARCHERS_VOIICE_HURT_03 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_03";

			// Token: 0x040008F8 RID: 2296
			public const string SFX_SEARCHERS_VOIICE_HURT_04 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_04";

			// Token: 0x040008F9 RID: 2297
			public const string SFX_SEARCHERS_VOIICE_HURT_05 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_05";

			// Token: 0x040008FA RID: 2298
			public const string SFX_SEARCHERS_VOIICE_HURT_06 = "Audio/SFX/Searchers/OLD_Hurt/SFX_Searchers_Voiice_Hurt_06";

			// Token: 0x040008FB RID: 2299
			public const string SFX_GULP_SOUP_01 = "Audio/SFX/Soup/SFX_Gulp_Soup_01";

			// Token: 0x040008FC RID: 2300
			public const string SFX_GULP_SOUP_02 = "Audio/SFX/Soup/SFX_Gulp_Soup_02";

			// Token: 0x040008FD RID: 2301
			public const string SFX_GULP_SOUP_03 = "Audio/SFX/Soup/SFX_Gulp_Soup_03";

			// Token: 0x040008FE RID: 2302
			public const string SFX_GULP_SOUP_04 = "Audio/SFX/Soup/SFX_Gulp_Soup_04";

			// Token: 0x040008FF RID: 2303
			public const string SFX_GULP_SOUP_05 = "Audio/SFX/Soup/SFX_Gulp_Soup_05";

			// Token: 0x04000900 RID: 2304
			public const string SFX_GULP_SOUP_06 = "Audio/SFX/Soup/SFX_Gulp_Soup_06";

			// Token: 0x04000901 RID: 2305
			public const string SFX_GULP_SOUP_07 = "Audio/SFX/Soup/SFX_Gulp_Soup_07";

			// Token: 0x04000902 RID: 2306
			public const string WOOD_CRASH_LARGE_OGG = "Audio/Sounds/Effects/WoodCrashLarge_OGG";

			// Token: 0x04000903 RID: 2307
			public const string WOOD_CRASH_SMALL_OGG = "Audio/Sounds/Effects/WoodCrashSmall_OGG";

			// Token: 0x04000904 RID: 2308
			public const string SINGLEDRIP = "Audio/Sounds/Effects/single_drip";

			// Token: 0x04000905 RID: 2309
			public const string SFXHENRYDEAD_01_TEMP = "Audio/TEMP/SFX_HENRY_DEAD_01_TEMP";

			// Token: 0x04000906 RID: 2310
			public const string SFXHENRYDEAD_02_TEMP = "Audio/TEMP/SFX_HENRY_DEAD_02_TEMP";

			// Token: 0x04000907 RID: 2311
			public const string SFXHENRYDEAD_03_TEMP = "Audio/TEMP/SFX_HENRY_DEAD_03_TEMP";

			// Token: 0x04000908 RID: 2312
			public const string SFXHENRYHURT_01_TEMP = "Audio/TEMP/SFX_HENRY_HURT_01_TEMP";

			// Token: 0x04000909 RID: 2313
			public const string SFXHENRYHURT_02_TEMP = "Audio/TEMP/SFX_HENRY_HURT_02_TEMP";

			// Token: 0x0400090A RID: 2314
			public const string SFXHENRYHURT_03_TEMP = "Audio/TEMP/SFX_HENRY_HURT_03_TEMP";

			// Token: 0x0400090B RID: 2315
			public const string DIA_SAMMY_01 = "Audio/DIA/ChapterTwo/Sammy/DIA_Sammy_01";

			// Token: 0x0400090C RID: 2316
			public const string EASTER_EGG_DA_GAMES_BUILD_OUR_MACHINE = "Audio/EasterEggs/EasterEggDAGamesBuildOurMachine";

			// Token: 0x0400090D RID: 2317
			public const string EASTER_EGG_KYLE_BENDY_SONG = "Audio/EasterEggs/EasterEggKyleBendySong";

			// Token: 0x0400090E RID: 2318
			public const string MUS_DRAWN_TO_DARKNESS = "Audio/MUS/MUS_DrawnToDarkness";

			// Token: 0x0400090F RID: 2319
			public const string MUS_HELLFIRE_FOLLIES = "Audio/MUS/MUS_Hellfire_Follies";

			// Token: 0x04000910 RID: 2320
			public const string MUS_TITLE_MUSIC_SKETCHES = "Audio/MUS/MUS_Title_Music_Sketches";

			// Token: 0x04000911 RID: 2321
			public const string CREDIT_JUMP_SCARE = "Audio/Sounds/Credits/CreditJumpScare";

			// Token: 0x04000912 RID: 2322
			public const string WHOOSH = "Audio/Sounds/Credits/Whoosh";

			// Token: 0x04000913 RID: 2323
			public const string IMPACT_DRUM = "Audio/Sounds/Effects/ImpactDrum";

			// Token: 0x04000914 RID: 2324
			public const string IMPACT_METAL = "Audio/Sounds/Effects/ImpactMetal";

			// Token: 0x04000915 RID: 2325
			public const string LIGHT_TURN_ON = "Audio/Sounds/Effects/LightTurnOn";

			// Token: 0x04000916 RID: 2326
			public const string PRESSURE_BUTTON = "Audio/Sounds/Effects/PressureButton";

			// Token: 0x04000917 RID: 2327
			public const string VIOLIN_STROKE = "Audio/Sounds/Effects/ViolinStroke";

			// Token: 0x04000918 RID: 2328
			public const string INKSQUIRT = "Audio/Sounds/Effects/ink_squirt";

			// Token: 0x04000919 RID: 2329
			public const string DRUM_BASS_OLD = "Audio/Sounds/Other/DrumBass_Old";
		}

		// Token: 0x020001B7 RID: 439
		public static class Prefabs
		{
			// Token: 0x0400091A RID: 2330
			public const string AUDIO_OBJECT = "GamePlay/Audio/AudioObject";

			// Token: 0x0400091B RID: 2331
			public const string PLAYER_CONTROLLER = "GamePlay/Characters/Player/PlayerController";

			// Token: 0x0400091C RID: 2332
			public const string AI_SEARCHER = "GamePlay/Characters/Searcher/Ai_Searcher";

			// Token: 0x0400091D RID: 2333
			public const string INK_SPLAT = "GamePlay/Decals/InkSplat";

			// Token: 0x0400091E RID: 2334
			public const string GAME_JOLT_MANAGER = "Managers/GameJoltManager";

			// Token: 0x0400091F RID: 2335
			public const string SCREEN_BLOCKER_CONTROLLER = "UI/Blocker/ScreenBlockerController";

			// Token: 0x04000920 RID: 2336
			public const string HURT_BORDERS_CONTROLLER = "UI/Borders/HurtBordersController";

			// Token: 0x04000921 RID: 2337
			public const string MAIN_CROSSHAIR_CONTROLLER = "UI/Crosshairs/MainCrosshairController";

			// Token: 0x04000922 RID: 2338
			public const string GENERIC_LOADER_CONTROLLER = "UI/Loaders/GenericLoaderController";

			// Token: 0x04000923 RID: 2339
			public const string GAME_MENU_CONTROLLER = "UI/Menus/GameMenuController";

			// Token: 0x04000924 RID: 2340
			public const string AUDIO_LOG_MODAL_CONTROLLER = "UI/Modals/AudioLogModalController";

			// Token: 0x04000925 RID: 2341
			public const string CHAPTER_ONE_CONCLUSION_MODAL_CONTROLLER = "UI/Modals/ChapterOneConclusionModalController";

			// Token: 0x04000926 RID: 2342
			public const string CHAPTER_ONE_INTRO_MODAL_CONTROLLER = "UI/Modals/ChapterOneIntroModalController";

			// Token: 0x04000927 RID: 2343
			public const string CHAPTER_TITLE_MODAL_CONTROLLER = "UI/Modals/ChapterTitleModalController";

			// Token: 0x04000928 RID: 2344
			public const string COLLECTABLE_MODAL_CONTROLLER = "UI/Modals/CollectableModalController";

			// Token: 0x04000929 RID: 2345
			public const string GAME_MENU_NOTIFICATION_CONTROLLER = "UI/Notifications/GameMenuNotificationController";

			// Token: 0x0400092A RID: 2346
			public const string OBJECTIVE_CONTROLLER = "UI/Objectives/ObjectiveController";

			// Token: 0x0400092B RID: 2347
			public const string QUIT_PROMPT_CONTROLLER = "UI/Prompts/QuitPromptController";

			// Token: 0x0400092C RID: 2348
			public const string MAIN_SUBTITLES_CONTROLLER = "UI/Subtitles/MainSubtitlesController";

			// Token: 0x0400092D RID: 2349
			public const string CREDITS = "UI/Views/Credits";

			// Token: 0x0400092E RID: 2350
			public const string CREDITS_SCREEN = "UI/Views/CreditsScreen";

			// Token: 0x0400092F RID: 2351
			public const string SPLASH_SCREEN = "UI/Views/SplashScreen";

			// Token: 0x04000930 RID: 2352
			public const string TITLE_SCREEN = "UI/Views/TitleScreen";
		}

		// Token: 0x020001B8 RID: 440
		public static class Scenes
		{
			// Token: 0x04000931 RID: 2353
			public const string CREDITS = "Credits";

			// Token: 0x04000932 RID: 2354
			public const string INITIALIZE_GAME = "InitializeGame";

			// Token: 0x04000933 RID: 2355
			public const string MAIN_MENU = "MainMenu";

			// Token: 0x04000934 RID: 2356
			public const string RESET = "Reset";

			// Token: 0x04000935 RID: 2357
			public const string CHAPTER_ONE = "ChapterOne";

			// Token: 0x04000936 RID: 2358
			public const string CHAPTER_TWO = "ChapterTwo";

			// Token: 0x04000937 RID: 2359
			public const string PLAYER_TEST_SCENE = "PlayerTestScene";

			// Token: 0x04000938 RID: 2360
			public const string PREFABS = "Prefabs";

			// Token: 0x04000939 RID: 2361
			public const string SCREEN_BLOCKER = "ScreenBlocker";

			// Token: 0x0400093A RID: 2362
			public const string HURT_BORDERS = "HurtBorders";

			// Token: 0x0400093B RID: 2363
			public const string MAIN_CROSSHAIR = "MainCrosshair";

			// Token: 0x0400093C RID: 2364
			public const string GENERIC_LOADER = "GenericLoader";

			// Token: 0x0400093D RID: 2365
			public const string GAME_MENU = "GameMenu";

			// Token: 0x0400093E RID: 2366
			public const string AUDIO_LOG_MODAL = "AudioLogModal";

			// Token: 0x0400093F RID: 2367
			public const string CHAPTER_ONE_CONCLUSION_MODAL = "ChapterOneConclusionModal";

			// Token: 0x04000940 RID: 2368
			public const string CHAPTER_ONE_INTRO_MODAL = "ChapterOneIntroModal";

			// Token: 0x04000941 RID: 2369
			public const string CHAPTER_TITLE_MODAL = "ChapterTitleModal";

			// Token: 0x04000942 RID: 2370
			public const string COLLECTABLE_MODAL = "CollectableModal";

			// Token: 0x04000943 RID: 2371
			public const string GAME_MENU_NOTIFICATION = "GameMenuNotification";

			// Token: 0x04000944 RID: 2372
			public const string OBJECTIVE_LAYOUT = "ObjectiveLayout";

			// Token: 0x04000945 RID: 2373
			public const string QUIT_PROMPT = "QuitPrompt";

			// Token: 0x04000946 RID: 2374
			public const string MAIN_SUBTITLES = "MainSubtitles";

			// Token: 0x04000947 RID: 2375
			public const string CREDITS_SCREEN = "CreditsScreen";

			// Token: 0x04000948 RID: 2376
			public const string SPLASH_SCREEN = "SplashScreen";

			// Token: 0x04000949 RID: 2377
			public const string TITLE_SCREEN = "TitleScreen";
		}

		// Token: 0x020001B9 RID: 441
		public static class Materials
		{
			// Token: 0x0400094A RID: 2378
			public const string MAT_SAMMY = "Mat_Sammy";

			// Token: 0x0400094B RID: 2379
			public const string BLACK = "Black";

			// Token: 0x0400094C RID: 2380
			public const string BLACK_MAT = "BlackMat";

			// Token: 0x0400094D RID: 2381
			public const string BLACK_TAPE = "BlackTape";

			// Token: 0x0400094E RID: 2382
			public const string BLACK_SPEC = "Black_Spec";

			// Token: 0x0400094F RID: 2383
			public const string BORIS_MATERIAL = "BorisMaterial";

			// Token: 0x04000950 RID: 2384
			public const string DANCING_BENDY = "DancingBendy";

			// Token: 0x04000951 RID: 2385
			public const string DEAD_BORIS_MATERIAL = "DeadBorisMaterial";

			// Token: 0x04000952 RID: 2386
			public const string DEAD_BORIS_STRAPS = "DeadBorisStraps";

			// Token: 0x04000953 RID: 2387
			public const string DISSOLVE_MATERIAL_01 = "DissolveMaterial_01";

			// Token: 0x04000954 RID: 2388
			public const string DISSOLVE_MATERIAL_02 = "DissolveMaterial_02";

			// Token: 0x04000955 RID: 2389
			public const string DRIP = "Drip";

			// Token: 0x04000956 RID: 2390
			public const string DRIP_ANGLE = "DripAngle";

			// Token: 0x04000957 RID: 2391
			public const string DUST_PARTICLE = "DustParticle";

			// Token: 0x04000958 RID: 2392
			public const string FACE = "Face";

			// Token: 0x04000959 RID: 2393
			public const string HIGHLIGHT_MASTER_MATERIAL_01 = "HighlightMasterMaterial_01";

			// Token: 0x0400095A RID: 2394
			public const string HIGHLIGHT_MASTER_MATERIAL_02 = "HighlightMasterMaterial_02";

			// Token: 0x0400095B RID: 2395
			public const string INK_BENDY_MATERIAL = "InkBendyMaterial";

			// Token: 0x0400095C RID: 2396
			public const string INK_BLACK = "InkBlack";

			// Token: 0x0400095D RID: 2397
			public const string INK_DISSOLVE = "InkDissolve";

			// Token: 0x0400095E RID: 2398
			public const string INK_SPLAT_MATERIAL = "InkSplatMaterial";

			// Token: 0x0400095F RID: 2399
			public const string INK_WATER_MATERIAL = "InkWaterMaterial";

			// Token: 0x04000960 RID: 2400
			public const string LIGHT = "Light";

			// Token: 0x04000961 RID: 2401
			public const string LIGHT_MATERIAL = "LightMaterial";

			// Token: 0x04000962 RID: 2402
			public const string LIGHT_OFF_MATERIAL = "LightOffMaterial";

			// Token: 0x04000963 RID: 2403
			public const string MASTER_MATERIAL_01 = "MasterMaterial_01";

			// Token: 0x04000964 RID: 2404
			public const string MASTER_MATERIAL_02 = "MasterMaterial_02";

			// Token: 0x04000965 RID: 2405
			public const string MISC_TEXTURE_02 = "MiscTexture02";

			// Token: 0x04000966 RID: 2406
			public const string MORE_BLACK_MISC_TEXTURE_02PNG_001 = "More_Black__MiscTexture02_png_001";

			// Token: 0x04000967 RID: 2407
			public const string SCREEN = "Screen";

			// Token: 0x04000968 RID: 2408
			public const string SEARCHER_MATERIAL = "SearcherMaterial";

			// Token: 0x04000969 RID: 2409
			public const string THEMEATLYMAT = "themeatly_mat";
		}

		// Token: 0x020001BA RID: 442
		public static class Shaders
		{
			// Token: 0x0400096A RID: 2410
			public const string SHADER_FORGE_DISSOLVE_SHADER = "Shader Forge/DissolveShader";

			// Token: 0x0400096B RID: 2411
			public const string SHADER_FORGE_HIGHLIGHT_MASTER_SHADER = "Shader Forge/HighlightMasterShader";

			// Token: 0x0400096C RID: 2412
			public const string SHADER_FORGE_INK_DISSOLVE_SHADER = "Shader Forge/InkDissolveShader";

			// Token: 0x0400096D RID: 2413
			public const string SHADER_FORGE_INK_WATER_SHADER = "Shader Forge/InkWaterShader";

			// Token: 0x0400096E RID: 2414
			public const string SHADER_FORGE_INTERACT_MASTER_SHADER = "Shader Forge/InteractMasterShader";

			// Token: 0x0400096F RID: 2415
			public const string SHADER_FORGE_LIGHT_SHADER = "Shader Forge/LightShader";

			// Token: 0x04000970 RID: 2416
			public const string SHADER_FORGE_MASTER_SHADER = "Shader Forge/MasterShader";
		}

		// Token: 0x020001BB RID: 443
		public static class Textures
		{
			// Token: 0x04000971 RID: 2417
			public const string CHAPTER_ONE_COLLECTABLES = "UI/ChapterOneCollectables/ChapterOneCollectables";
		}

		// Token: 0x020001BC RID: 444
		public static class Sprites
		{
			// Token: 0x020001BD RID: 445
			public class Lookup
			{
				// Token: 0x04000972 RID: 2418
				public const string CHAPTER_ONE_COLLECTABLES = "UI/ChapterOneCollectables/ChapterOneCollectables";
			}

			// Token: 0x020001BE RID: 446
			public class Lists
			{
				// Token: 0x04000973 RID: 2419
				public const string COLLECTABLE_BOOK = "collectable_book";

				// Token: 0x04000974 RID: 2420
				public const string COLLECTABLE_DOLL = "collectable_doll";

				// Token: 0x04000975 RID: 2421
				public const string COLLECTABLE_GEAR = "collectable_gear";

				// Token: 0x04000976 RID: 2422
				public const string COLLECTABLE_INKWELL = "collectable_inkwell";

				// Token: 0x04000977 RID: 2423
				public const string COLLECTABLE_KEYS = "collectable_keys";

				// Token: 0x04000978 RID: 2424
				public const string COLLECTABLE_RECORD = "collectable_record";

				// Token: 0x04000979 RID: 2425
				public const string COLLECTABLE_WRENCH = "collectable_wrench";
			}
		}

		// Token: 0x020001BF RID: 447
		public static class ScriptableObjects
		{
			// Token: 0x0400097A RID: 2426
			public const string PROJECT_SETTINGS = "ProjectSettings";
		}

		// Token: 0x020001C0 RID: 448
		public static class Custom
		{
			// Token: 0x0400097B RID: 2427
			public const string NEW_CUSTOM_STRING = "New Custom String";
		}
	}
}
