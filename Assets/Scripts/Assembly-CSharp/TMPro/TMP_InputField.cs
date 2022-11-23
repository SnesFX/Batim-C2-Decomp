using System;
using System.Collections;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x020005AF RID: 1455
	[AddComponentMenu("UI/TextMeshPro - Input Field", 11)]
	public class TMP_InputField : Selectable, IUpdateSelectedHandler, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerClickHandler, ISubmitHandler, ICanvasElement, IEventSystemHandler
	{
		// Token: 0x06002977 RID: 10615 RVA: 0x000FD2F8 File Offset: 0x000FB4F8
		protected TMP_InputField()
		{
		}

		// Token: 0x1700043D RID: 1085
		// (get) Token: 0x06002978 RID: 10616 RVA: 0x0001DCAD File Offset: 0x0001BEAD
		protected Mesh mesh
		{
			get
			{
				if (this.m_Mesh == null)
				{
					this.m_Mesh = new Mesh();
				}
				return this.m_Mesh;
			}
		}

		// Token: 0x1700043E RID: 1086
		// (get) Token: 0x0600297A RID: 10618 RVA: 0x000FD3B8 File Offset: 0x000FB5B8
		// (set) Token: 0x06002979 RID: 10617 RVA: 0x0001DCD1 File Offset: 0x0001BED1
		public bool shouldHideMobileInput
		{
			get
			{
				RuntimePlatform platform = Application.platform;
				return (platform != RuntimePlatform.Android && platform != RuntimePlatform.IPhonePlayer) || this.m_HideMobileInput;
			}
			set
			{
				SetPropertyUtility.SetStruct<bool>(ref this.m_HideMobileInput, value);
			}
		}

		// Token: 0x1700043F RID: 1087
		// (get) Token: 0x0600297B RID: 10619 RVA: 0x0001DCE0 File Offset: 0x0001BEE0
		// (set) Token: 0x0600297C RID: 10620 RVA: 0x000FD3E8 File Offset: 0x000FB5E8
		public string text
		{
			get
			{
				return this.m_Text;
			}
			set
			{
				if (this.text == value)
				{
					return;
				}
				this.m_Text = value;
				if (this.m_Keyboard != null)
				{
					this.m_Keyboard.text = this.m_Text;
				}
				if (this.m_StringPosition > this.m_Text.Length)
				{
					this.m_StringPosition = (this.m_StringSelectPosition = this.m_Text.Length);
				}
				this.SendOnValueChangedAndUpdateLabel();
			}
		}

		// Token: 0x17000440 RID: 1088
		// (get) Token: 0x0600297D RID: 10621 RVA: 0x0001DCE8 File Offset: 0x0001BEE8
		public bool isFocused
		{
			get
			{
				return this.m_AllowInput;
			}
		}

		// Token: 0x17000441 RID: 1089
		// (get) Token: 0x0600297E RID: 10622 RVA: 0x0001DCF0 File Offset: 0x0001BEF0
		// (set) Token: 0x0600297F RID: 10623 RVA: 0x0001DCF8 File Offset: 0x0001BEF8
		public float caretBlinkRate
		{
			get
			{
				return this.m_CaretBlinkRate;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<float>(ref this.m_CaretBlinkRate, value) && this.m_AllowInput)
				{
					this.SetCaretActive();
				}
			}
		}

		// Token: 0x17000442 RID: 1090
		// (get) Token: 0x06002980 RID: 10624 RVA: 0x0001DD1C File Offset: 0x0001BF1C
		// (set) Token: 0x06002981 RID: 10625 RVA: 0x0001DD24 File Offset: 0x0001BF24
		public int caretWidth
		{
			get
			{
				return this.m_CaretWidth;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<int>(ref this.m_CaretWidth, value))
				{
					this.MarkGeometryAsDirty();
				}
			}
		}

		// Token: 0x17000443 RID: 1091
		// (get) Token: 0x06002982 RID: 10626 RVA: 0x0001DD3D File Offset: 0x0001BF3D
		// (set) Token: 0x06002983 RID: 10627 RVA: 0x0001DD45 File Offset: 0x0001BF45
		public RectTransform textViewport
		{
			get
			{
				return this.m_TextViewport;
			}
			set
			{
				SetPropertyUtility.SetClass<RectTransform>(ref this.m_TextViewport, value);
			}
		}

		// Token: 0x17000444 RID: 1092
		// (get) Token: 0x06002984 RID: 10628 RVA: 0x0001DD54 File Offset: 0x0001BF54
		// (set) Token: 0x06002985 RID: 10629 RVA: 0x0001DD5C File Offset: 0x0001BF5C
		public TMP_Text textComponent
		{
			get
			{
				return this.m_TextComponent;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_Text>(ref this.m_TextComponent, value);
			}
		}

		// Token: 0x17000445 RID: 1093
		// (get) Token: 0x06002986 RID: 10630 RVA: 0x0001DD6B File Offset: 0x0001BF6B
		// (set) Token: 0x06002987 RID: 10631 RVA: 0x0001DD73 File Offset: 0x0001BF73
		public Graphic placeholder
		{
			get
			{
				return this.m_Placeholder;
			}
			set
			{
				SetPropertyUtility.SetClass<Graphic>(ref this.m_Placeholder, value);
			}
		}

		// Token: 0x17000446 RID: 1094
		// (get) Token: 0x06002988 RID: 10632 RVA: 0x0001DD82 File Offset: 0x0001BF82
		// (set) Token: 0x06002989 RID: 10633 RVA: 0x0001DDA5 File Offset: 0x0001BFA5
		public Color caretColor
		{
			get
			{
				return (!this.customCaretColor) ? this.textComponent.color : this.m_CaretColor;
			}
			set
			{
				if (SetPropertyUtility.SetColor(ref this.m_CaretColor, value))
				{
					this.MarkGeometryAsDirty();
				}
			}
		}

		// Token: 0x17000447 RID: 1095
		// (get) Token: 0x0600298A RID: 10634 RVA: 0x0001DDBE File Offset: 0x0001BFBE
		// (set) Token: 0x0600298B RID: 10635 RVA: 0x0001DDC6 File Offset: 0x0001BFC6
		public bool customCaretColor
		{
			get
			{
				return this.m_CustomCaretColor;
			}
			set
			{
				if (this.m_CustomCaretColor != value)
				{
					this.m_CustomCaretColor = value;
					this.MarkGeometryAsDirty();
				}
			}
		}

		// Token: 0x17000448 RID: 1096
		// (get) Token: 0x0600298C RID: 10636 RVA: 0x0001DDE1 File Offset: 0x0001BFE1
		// (set) Token: 0x0600298D RID: 10637 RVA: 0x0001DDE9 File Offset: 0x0001BFE9
		public Color selectionColor
		{
			get
			{
				return this.m_SelectionColor;
			}
			set
			{
				if (SetPropertyUtility.SetColor(ref this.m_SelectionColor, value))
				{
					this.MarkGeometryAsDirty();
				}
			}
		}

		// Token: 0x17000449 RID: 1097
		// (get) Token: 0x0600298E RID: 10638 RVA: 0x0001DE02 File Offset: 0x0001C002
		// (set) Token: 0x0600298F RID: 10639 RVA: 0x0001DE0A File Offset: 0x0001C00A
		public TMP_InputField.SubmitEvent onEndEdit
		{
			get
			{
				return this.m_OnEndEdit;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_InputField.SubmitEvent>(ref this.m_OnEndEdit, value);
			}
		}

		// Token: 0x1700044A RID: 1098
		// (get) Token: 0x06002990 RID: 10640 RVA: 0x0001DE19 File Offset: 0x0001C019
		// (set) Token: 0x06002991 RID: 10641 RVA: 0x0001DE21 File Offset: 0x0001C021
		public TMP_InputField.SubmitEvent onSubmit
		{
			get
			{
				return this.m_OnSubmit;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_InputField.SubmitEvent>(ref this.m_OnSubmit, value);
			}
		}

		// Token: 0x1700044B RID: 1099
		// (get) Token: 0x06002992 RID: 10642 RVA: 0x0001DE30 File Offset: 0x0001C030
		// (set) Token: 0x06002993 RID: 10643 RVA: 0x0001DE38 File Offset: 0x0001C038
		public TMP_InputField.SubmitEvent onFocusLost
		{
			get
			{
				return this.m_OnFocusLost;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_InputField.SubmitEvent>(ref this.m_OnFocusLost, value);
			}
		}

		// Token: 0x1700044C RID: 1100
		// (get) Token: 0x06002994 RID: 10644 RVA: 0x0001DE47 File Offset: 0x0001C047
		// (set) Token: 0x06002995 RID: 10645 RVA: 0x0001DE4F File Offset: 0x0001C04F
		public TMP_InputField.OnChangeEvent onValueChanged
		{
			get
			{
				return this.m_OnValueChanged;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_InputField.OnChangeEvent>(ref this.m_OnValueChanged, value);
			}
		}

		// Token: 0x1700044D RID: 1101
		// (get) Token: 0x06002996 RID: 10646 RVA: 0x0001DE5E File Offset: 0x0001C05E
		// (set) Token: 0x06002997 RID: 10647 RVA: 0x0001DE66 File Offset: 0x0001C066
		public TMP_InputField.OnValidateInput onValidateInput
		{
			get
			{
				return this.m_OnValidateInput;
			}
			set
			{
				SetPropertyUtility.SetClass<TMP_InputField.OnValidateInput>(ref this.m_OnValidateInput, value);
			}
		}

		// Token: 0x1700044E RID: 1102
		// (get) Token: 0x06002998 RID: 10648 RVA: 0x0001DE75 File Offset: 0x0001C075
		// (set) Token: 0x06002999 RID: 10649 RVA: 0x0001DE7D File Offset: 0x0001C07D
		public int characterLimit
		{
			get
			{
				return this.m_CharacterLimit;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<int>(ref this.m_CharacterLimit, Math.Max(0, value)))
				{
					this.UpdateLabel();
				}
			}
		}

		// Token: 0x1700044F RID: 1103
		// (get) Token: 0x0600299A RID: 10650 RVA: 0x0001DE9C File Offset: 0x0001C09C
		// (set) Token: 0x0600299B RID: 10651 RVA: 0x0001DEA4 File Offset: 0x0001C0A4
		public TMP_InputField.ContentType contentType
		{
			get
			{
				return this.m_ContentType;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<TMP_InputField.ContentType>(ref this.m_ContentType, value))
				{
					this.EnforceContentType();
				}
			}
		}

		// Token: 0x17000450 RID: 1104
		// (get) Token: 0x0600299C RID: 10652 RVA: 0x0001DEBD File Offset: 0x0001C0BD
		// (set) Token: 0x0600299D RID: 10653 RVA: 0x0001DEC5 File Offset: 0x0001C0C5
		public TMP_InputField.LineType lineType
		{
			get
			{
				return this.m_LineType;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<TMP_InputField.LineType>(ref this.m_LineType, value))
				{
					this.SetTextComponentWrapMode();
				}
				this.SetToCustomIfContentTypeIsNot(new TMP_InputField.ContentType[]
				{
					TMP_InputField.ContentType.Standard,
					TMP_InputField.ContentType.Autocorrected
				});
			}
		}

		// Token: 0x17000451 RID: 1105
		// (get) Token: 0x0600299E RID: 10654 RVA: 0x0001DEEE File Offset: 0x0001C0EE
		// (set) Token: 0x0600299F RID: 10655 RVA: 0x0001DEF6 File Offset: 0x0001C0F6
		public TMP_InputField.InputType inputType
		{
			get
			{
				return this.m_InputType;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<TMP_InputField.InputType>(ref this.m_InputType, value))
				{
					this.SetToCustom();
				}
			}
		}

		// Token: 0x17000452 RID: 1106
		// (get) Token: 0x060029A0 RID: 10656 RVA: 0x0001DF0F File Offset: 0x0001C10F
		// (set) Token: 0x060029A1 RID: 10657 RVA: 0x0001DF17 File Offset: 0x0001C117
		public TouchScreenKeyboardType keyboardType
		{
			get
			{
				return this.m_KeyboardType;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<TouchScreenKeyboardType>(ref this.m_KeyboardType, value))
				{
					this.SetToCustom();
				}
			}
		}

		// Token: 0x17000453 RID: 1107
		// (get) Token: 0x060029A2 RID: 10658 RVA: 0x0001DF30 File Offset: 0x0001C130
		// (set) Token: 0x060029A3 RID: 10659 RVA: 0x0001DF38 File Offset: 0x0001C138
		public TMP_InputField.CharacterValidation characterValidation
		{
			get
			{
				return this.m_CharacterValidation;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<TMP_InputField.CharacterValidation>(ref this.m_CharacterValidation, value))
				{
					this.SetToCustom();
				}
			}
		}

		// Token: 0x17000454 RID: 1108
		// (get) Token: 0x060029A4 RID: 10660 RVA: 0x0001DF51 File Offset: 0x0001C151
		// (set) Token: 0x060029A5 RID: 10661 RVA: 0x0001DF59 File Offset: 0x0001C159
		public bool readOnly
		{
			get
			{
				return this.m_ReadOnly;
			}
			set
			{
				this.m_ReadOnly = value;
			}
		}

		// Token: 0x17000455 RID: 1109
		// (get) Token: 0x060029A6 RID: 10662 RVA: 0x0001DF62 File Offset: 0x0001C162
		// (set) Token: 0x060029A7 RID: 10663 RVA: 0x0001DF6A File Offset: 0x0001C16A
		public bool richText
		{
			get
			{
				return this.m_RichText;
			}
			set
			{
				this.m_RichText = value;
				this.SetTextComponentRichTextMode();
			}
		}

		// Token: 0x17000456 RID: 1110
		// (get) Token: 0x060029A8 RID: 10664 RVA: 0x0001DF79 File Offset: 0x0001C179
		public bool multiLine
		{
			get
			{
				return this.m_LineType == TMP_InputField.LineType.MultiLineNewline || this.lineType == TMP_InputField.LineType.MultiLineSubmit;
			}
		}

		// Token: 0x17000457 RID: 1111
		// (get) Token: 0x060029A9 RID: 10665 RVA: 0x0001DF93 File Offset: 0x0001C193
		// (set) Token: 0x060029AA RID: 10666 RVA: 0x0001DF9B File Offset: 0x0001C19B
		public char asteriskChar
		{
			get
			{
				return this.m_AsteriskChar;
			}
			set
			{
				if (SetPropertyUtility.SetStruct<char>(ref this.m_AsteriskChar, value))
				{
					this.UpdateLabel();
				}
			}
		}

		// Token: 0x17000458 RID: 1112
		// (get) Token: 0x060029AB RID: 10667 RVA: 0x0001DFB4 File Offset: 0x0001C1B4
		public bool wasCanceled
		{
			get
			{
				return this.m_WasCanceled;
			}
		}

		// Token: 0x060029AC RID: 10668 RVA: 0x0001DFBC File Offset: 0x0001C1BC
		protected void ClampPos(ref int pos)
		{
			if (pos < 0)
			{
				pos = 0;
			}
			else if (pos > this.text.Length)
			{
				pos = this.text.Length;
			}
		}

		// Token: 0x17000459 RID: 1113
		// (get) Token: 0x060029AD RID: 10669 RVA: 0x0001DFED File Offset: 0x0001C1ED
		// (set) Token: 0x060029AE RID: 10670 RVA: 0x0001E000 File Offset: 0x0001C200
		protected int caretPositionInternal
		{
			get
			{
				return this.m_CaretPosition + Input.compositionString.Length;
			}
			set
			{
				this.m_CaretPosition = value;
				this.ClampPos(ref this.m_CaretPosition);
			}
		}

		// Token: 0x1700045A RID: 1114
		// (get) Token: 0x060029AF RID: 10671 RVA: 0x0001E015 File Offset: 0x0001C215
		// (set) Token: 0x060029B0 RID: 10672 RVA: 0x0001E028 File Offset: 0x0001C228
		protected int stringPositionInternal
		{
			get
			{
				return this.m_StringPosition + Input.compositionString.Length;
			}
			set
			{
				this.m_StringPosition = value;
				this.ClampPos(ref this.m_StringPosition);
			}
		}

		// Token: 0x1700045B RID: 1115
		// (get) Token: 0x060029B1 RID: 10673 RVA: 0x0001E03D File Offset: 0x0001C23D
		// (set) Token: 0x060029B2 RID: 10674 RVA: 0x0001E050 File Offset: 0x0001C250
		protected int caretSelectPositionInternal
		{
			get
			{
				return this.m_CaretSelectPosition + Input.compositionString.Length;
			}
			set
			{
				this.m_CaretSelectPosition = value;
				this.ClampPos(ref this.m_CaretSelectPosition);
			}
		}

		// Token: 0x1700045C RID: 1116
		// (get) Token: 0x060029B3 RID: 10675 RVA: 0x0001E065 File Offset: 0x0001C265
		// (set) Token: 0x060029B4 RID: 10676 RVA: 0x0001E078 File Offset: 0x0001C278
		protected int stringSelectPositionInternal
		{
			get
			{
				return this.m_StringSelectPosition + Input.compositionString.Length;
			}
			set
			{
				this.m_StringSelectPosition = value;
				this.ClampPos(ref this.m_StringSelectPosition);
			}
		}

		// Token: 0x1700045D RID: 1117
		// (get) Token: 0x060029B5 RID: 10677 RVA: 0x0001E08D File Offset: 0x0001C28D
		private bool hasSelection
		{
			get
			{
				return this.stringPositionInternal != this.stringSelectPositionInternal;
			}
		}

		// Token: 0x1700045E RID: 1118
		// (get) Token: 0x060029B6 RID: 10678 RVA: 0x0001E065 File Offset: 0x0001C265
		// (set) Token: 0x060029B7 RID: 10679 RVA: 0x0001E0A0 File Offset: 0x0001C2A0
		public int caretPosition
		{
			get
			{
				return this.m_StringSelectPosition + Input.compositionString.Length;
			}
			set
			{
				this.selectionAnchorPosition = value;
				this.selectionFocusPosition = value;
			}
		}

		// Token: 0x1700045F RID: 1119
		// (get) Token: 0x060029B8 RID: 10680 RVA: 0x0001E0B0 File Offset: 0x0001C2B0
		// (set) Token: 0x060029B9 RID: 10681 RVA: 0x0001E0D5 File Offset: 0x0001C2D5
		public int selectionAnchorPosition
		{
			get
			{
				this.m_StringPosition = this.GetStringIndexFromCaretPosition(this.m_CaretPosition);
				return this.m_StringPosition + Input.compositionString.Length;
			}
			set
			{
				if (Input.compositionString.Length != 0)
				{
					return;
				}
				this.m_CaretPosition = value;
				this.ClampPos(ref this.m_CaretPosition);
			}
		}

		// Token: 0x17000460 RID: 1120
		// (get) Token: 0x060029BA RID: 10682 RVA: 0x0001E0FA File Offset: 0x0001C2FA
		// (set) Token: 0x060029BB RID: 10683 RVA: 0x0001E11F File Offset: 0x0001C31F
		public int selectionFocusPosition
		{
			get
			{
				this.m_StringSelectPosition = this.GetStringIndexFromCaretPosition(this.m_CaretSelectPosition);
				return this.m_StringSelectPosition + Input.compositionString.Length;
			}
			set
			{
				if (Input.compositionString.Length != 0)
				{
					return;
				}
				this.m_CaretSelectPosition = value;
				this.ClampPos(ref this.m_CaretSelectPosition);
			}
		}

		// Token: 0x060029BC RID: 10684 RVA: 0x000FD460 File Offset: 0x000FB660
		protected override void OnEnable()
		{
			base.OnEnable();
			if (this.m_Text == null)
			{
				this.m_Text = string.Empty;
			}
			this.m_DrawStart = 0;
			this.m_DrawEnd = this.m_Text.Length;
			if (this.m_CachedInputRenderer != null)
			{
				this.m_CachedInputRenderer.SetMaterial(Graphic.defaultGraphicMaterial, Texture2D.whiteTexture);
			}
			if (this.m_TextComponent != null)
			{
				this.m_TextComponent.RegisterDirtyVerticesCallback(new UnityAction(this.MarkGeometryAsDirty));
				this.m_TextComponent.RegisterDirtyVerticesCallback(new UnityAction(this.UpdateLabel));
				this.UpdateLabel();
			}
		}

		// Token: 0x060029BD RID: 10685 RVA: 0x000FD50C File Offset: 0x000FB70C
		protected override void OnDisable()
		{
			this.m_BlinkCoroutine = null;
			this.DeactivateInputField();
			if (this.m_TextComponent != null)
			{
				this.m_TextComponent.UnregisterDirtyVerticesCallback(new UnityAction(this.MarkGeometryAsDirty));
				this.m_TextComponent.UnregisterDirtyVerticesCallback(new UnityAction(this.UpdateLabel));
			}
			CanvasUpdateRegistry.UnRegisterCanvasElementForRebuild(this);
			if (this.m_CachedInputRenderer != null)
			{
				this.m_CachedInputRenderer.Clear();
			}
			if (this.m_Mesh != null)
			{
				UnityEngine.Object.DestroyImmediate(this.m_Mesh);
			}
			this.m_Mesh = null;
			base.OnDisable();
		}

		// Token: 0x060029BE RID: 10686 RVA: 0x000FD5B0 File Offset: 0x000FB7B0
		private IEnumerator CaretBlink()
		{
			this.m_CaretVisible = true;
			yield return null;
			while (this.isFocused && this.m_CaretBlinkRate > 0f)
			{
				float blinkPeriod = 1f / this.m_CaretBlinkRate;
				bool blinkState = (Time.unscaledTime - this.m_BlinkStartTime) % blinkPeriod < blinkPeriod / 2f;
				if (this.m_CaretVisible != blinkState)
				{
					this.m_CaretVisible = blinkState;
					if (!this.hasSelection)
					{
						this.MarkGeometryAsDirty();
					}
				}
				yield return null;
			}
			this.m_BlinkCoroutine = null;
			yield break;
		}

		// Token: 0x060029BF RID: 10687 RVA: 0x0001E144 File Offset: 0x0001C344
		private void SetCaretVisible()
		{
			if (!this.m_AllowInput)
			{
				return;
			}
			this.m_CaretVisible = true;
			this.m_BlinkStartTime = Time.unscaledTime;
			this.SetCaretActive();
		}

		// Token: 0x060029C0 RID: 10688 RVA: 0x000FD5CC File Offset: 0x000FB7CC
		private void SetCaretActive()
		{
			if (!this.m_AllowInput)
			{
				return;
			}
			if (this.m_CaretBlinkRate > 0f)
			{
				if (this.m_BlinkCoroutine == null)
				{
					this.m_BlinkCoroutine = base.StartCoroutine(this.CaretBlink());
				}
			}
			else
			{
				this.m_CaretVisible = true;
			}
		}

		// Token: 0x060029C1 RID: 10689 RVA: 0x0001E16A File Offset: 0x0001C36A
		protected void OnFocus()
		{
			this.SelectAll();
		}

		// Token: 0x060029C2 RID: 10690 RVA: 0x0001E172 File Offset: 0x0001C372
		protected void SelectAll()
		{
			this.stringPositionInternal = this.text.Length;
			this.stringSelectPositionInternal = 0;
		}

		// Token: 0x060029C3 RID: 10691 RVA: 0x000FD620 File Offset: 0x000FB820
		public void MoveTextEnd(bool shift)
		{
			int length = this.text.Length;
			if (shift)
			{
				this.stringSelectPositionInternal = length;
			}
			else
			{
				this.stringPositionInternal = length;
				this.stringSelectPositionInternal = this.stringPositionInternal;
			}
			this.UpdateLabel();
		}

		// Token: 0x060029C4 RID: 10692 RVA: 0x000FD664 File Offset: 0x000FB864
		public void MoveTextStart(bool shift)
		{
			int num = 0;
			if (shift)
			{
				this.stringSelectPositionInternal = num;
			}
			else
			{
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = this.stringPositionInternal;
			}
			this.UpdateLabel();
		}

		// Token: 0x17000461 RID: 1121
		// (get) Token: 0x060029C5 RID: 10693 RVA: 0x0001E18C File Offset: 0x0001C38C
		// (set) Token: 0x060029C6 RID: 10694 RVA: 0x0001E193 File Offset: 0x0001C393
		private static string clipboard
		{
			get
			{
				return GUIUtility.systemCopyBuffer;
			}
			set
			{
				GUIUtility.systemCopyBuffer = value;
			}
		}

		// Token: 0x060029C7 RID: 10695 RVA: 0x0001E19B File Offset: 0x0001C39B
		private bool InPlaceEditing()
		{
			return !TouchScreenKeyboard.isSupported;
		}

		// Token: 0x060029C8 RID: 10696 RVA: 0x000FD6A0 File Offset: 0x000FB8A0
		protected virtual void LateUpdate()
		{
			if (this.m_ShouldActivateNextUpdate)
			{
				if (!this.isFocused)
				{
					this.ActivateInputFieldInternal();
					this.m_ShouldActivateNextUpdate = false;
					return;
				}
				this.m_ShouldActivateNextUpdate = false;
			}
			if (this.InPlaceEditing() || !this.isFocused)
			{
				return;
			}
			this.AssignPositioningIfNeeded();
			if (this.m_Keyboard == null || !this.m_Keyboard.active)
			{
				if (this.m_Keyboard != null)
				{
					if (!this.m_ReadOnly)
					{
						this.text = this.m_Keyboard.text;
					}
					if (this.m_Keyboard.status == TouchScreenKeyboard.Status.Canceled)
					{
						this.m_WasCanceled = true;
					}
				}
				this.OnDeselect(null);
				return;
			}
			string text = this.m_Keyboard.text;
			if (this.m_Text != text)
			{
				if (this.m_ReadOnly)
				{
					this.m_Keyboard.text = this.m_Text;
				}
				else
				{
					this.m_Text = string.Empty;
					foreach (char e in text)
					{
						char c = e;

						if (c == '\r' || c == '\u0003')
						{
							c = '\n';
						}
						if (this.onValidateInput != null)
						{
							c = this.onValidateInput(this.m_Text, this.m_Text.Length, c);
						}
						else if (this.characterValidation != TMP_InputField.CharacterValidation.None)
						{
							c = this.Validate(this.m_Text, this.m_Text.Length, c);
						}
						if (this.lineType == TMP_InputField.LineType.MultiLineSubmit && c == '\n')
						{
							this.m_Keyboard.text = this.m_Text;
							this.OnDeselect(null);
							return;
						}
						if (c != '\0')
						{
							this.m_Text += c;
						}
					}
					if (this.characterLimit > 0 && this.m_Text.Length > this.characterLimit)
					{
						this.m_Text = this.m_Text.Substring(0, this.characterLimit);
					}
					int length = this.m_Text.Length;
					this.stringSelectPositionInternal = length;
					this.stringPositionInternal = length;
					if (this.m_Text != text)
					{
						this.m_Keyboard.text = this.m_Text;
					}
					this.SendOnValueChangedAndUpdateLabel();
				}
			}
			if (this.m_Keyboard.status == TouchScreenKeyboard.Status.Done)
			{
				if (this.m_Keyboard.status == TouchScreenKeyboard.Status.Canceled)
				{
					this.m_WasCanceled = true;
				}
				this.OnDeselect(null);
			}
		}

		// Token: 0x060029C9 RID: 10697 RVA: 0x0000CED2 File Offset: 0x0000B0D2
		protected int GetCharacterIndexFromPosition(Vector2 pos)
		{
			return 0;
		}

		// Token: 0x060029CA RID: 10698 RVA: 0x0001E1A5 File Offset: 0x0001C3A5
		private bool MayDrag(PointerEventData eventData)
		{
			return this.IsActive() && this.IsInteractable() && eventData.button == PointerEventData.InputButton.Left && this.m_TextComponent != null && this.m_Keyboard == null;
		}

		// Token: 0x060029CB RID: 10699 RVA: 0x0001E1E5 File Offset: 0x0001C3E5
		public virtual void OnBeginDrag(PointerEventData eventData)
		{
			if (!this.MayDrag(eventData))
			{
				return;
			}
			this.m_UpdateDrag = true;
		}

		// Token: 0x060029CC RID: 10700 RVA: 0x000FD91C File Offset: 0x000FBB1C
		public virtual void OnDrag(PointerEventData eventData)
		{
			if (!this.MayDrag(eventData))
			{
				return;
			}
			CaretPosition caretPosition;
			int cursorIndexFromPosition = TMP_TextUtilities.GetCursorIndexFromPosition(this.m_TextComponent, eventData.position, eventData.pressEventCamera, out caretPosition);
			if (caretPosition == CaretPosition.Left)
			{
				this.stringSelectPositionInternal = this.GetStringIndexFromCaretPosition(cursorIndexFromPosition);
			}
			else if (caretPosition == CaretPosition.Right)
			{
				this.stringSelectPositionInternal = this.GetStringIndexFromCaretPosition(cursorIndexFromPosition) + 1;
			}
			this.caretSelectPositionInternal = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
			this.MarkGeometryAsDirty();
			this.m_DragPositionOutOfBounds = !RectTransformUtility.RectangleContainsScreenPoint(this.textViewport, eventData.position, eventData.pressEventCamera);
			if (this.m_DragPositionOutOfBounds && this.m_DragCoroutine == null)
			{
				this.m_DragCoroutine = base.StartCoroutine(this.MouseDragOutsideRect(eventData));
			}
			eventData.Use();
		}

		// Token: 0x060029CD RID: 10701 RVA: 0x000FD9EC File Offset: 0x000FBBEC
		private IEnumerator MouseDragOutsideRect(PointerEventData eventData)
		{
			while (this.m_UpdateDrag && this.m_DragPositionOutOfBounds)
			{
				Vector2 localMousePos;
				RectTransformUtility.ScreenPointToLocalPointInRectangle(this.textViewport, eventData.position, eventData.pressEventCamera, out localMousePos);
				Rect rect = this.textViewport.rect;
				if (this.multiLine)
				{
					if (localMousePos.y > rect.yMax)
					{
						this.MoveUp(true, true);
					}
					else if (localMousePos.y < rect.yMin)
					{
						this.MoveDown(true, true);
					}
				}
				else if (localMousePos.x < rect.xMin)
				{
					this.MoveLeft(true, false);
				}
				else if (localMousePos.x > rect.xMax)
				{
					this.MoveRight(true, false);
				}
				this.UpdateLabel();
				float delay = (!this.multiLine) ? 0.05f : 0.1f;
				yield return new WaitForSeconds(delay);
			}
			this.m_DragCoroutine = null;
			yield break;
		}

		// Token: 0x060029CE RID: 10702 RVA: 0x0001E1FB File Offset: 0x0001C3FB
		public virtual void OnEndDrag(PointerEventData eventData)
		{
			if (!this.MayDrag(eventData))
			{
				return;
			}
			this.m_UpdateDrag = false;
		}

		// Token: 0x060029CF RID: 10703 RVA: 0x000FDA10 File Offset: 0x000FBC10
		public override void OnPointerDown(PointerEventData eventData)
		{
			if (!this.MayDrag(eventData))
			{
				return;
			}
			EventSystem.current.SetSelectedGameObject(base.gameObject, eventData);
			bool allowInput = this.m_AllowInput;
			base.OnPointerDown(eventData);
			if (!this.InPlaceEditing() && (this.m_Keyboard == null || !this.m_Keyboard.active))
			{
				this.OnSelect(eventData);
				return;
			}
			if (allowInput)
			{
				CaretPosition caretPosition;
				int cursorIndexFromPosition = TMP_TextUtilities.GetCursorIndexFromPosition(this.m_TextComponent, eventData.position, eventData.pressEventCamera, out caretPosition);
				int num;
				if (caretPosition == CaretPosition.Left)
				{
					num = this.GetStringIndexFromCaretPosition(cursorIndexFromPosition);
					this.stringSelectPositionInternal = num;
					this.stringPositionInternal = num;
				}
				else if (caretPosition == CaretPosition.Right)
				{
					num = this.GetStringIndexFromCaretPosition(cursorIndexFromPosition) + 1;
					this.stringSelectPositionInternal = num;
					this.stringPositionInternal = num;
				}
				num = this.GetCaretPositionFromStringIndex(this.stringPositionInternal);
				this.caretSelectPositionInternal = num;
				this.caretPositionInternal = num;
			}
			this.UpdateLabel();
			eventData.Use();
		}

		// Token: 0x060029D0 RID: 10704 RVA: 0x000FDB04 File Offset: 0x000FBD04
		protected TMP_InputField.EditState KeyPressed(Event evt)
		{
			EventModifiers modifiers = evt.modifiers;
			RuntimePlatform platform = Application.platform;
			bool flag = platform == RuntimePlatform.OSXEditor || platform == RuntimePlatform.OSXPlayer;
			bool flag2 = (!flag) ? ((modifiers & EventModifiers.Control) != EventModifiers.None) : ((modifiers & EventModifiers.Command) != EventModifiers.None);
			bool flag3 = (modifiers & EventModifiers.Shift) != EventModifiers.None;
			bool flag4 = (modifiers & EventModifiers.Alt) != EventModifiers.None;
			bool flag5 = flag2 && !flag4 && !flag3;
			KeyCode keyCode = evt.keyCode;
			switch (keyCode)
			{
			case KeyCode.KeypadEnter:
				break;
			default:
				switch (keyCode)
				{
				case KeyCode.A:
					if (flag5)
					{
						this.SelectAll();
						return TMP_InputField.EditState.Continue;
					}
					goto IL_1FE;
				default:
					switch (keyCode)
					{
					case KeyCode.V:
						if (flag5)
						{
							this.Append(TMP_InputField.clipboard);
							return TMP_InputField.EditState.Continue;
						}
						goto IL_1FE;
					default:
						if (keyCode == KeyCode.Backspace)
						{
							this.Backspace();
							return TMP_InputField.EditState.Continue;
						}
						if (keyCode != KeyCode.Return)
						{
							if (keyCode == KeyCode.Escape)
							{
								this.m_WasCanceled = true;
								return TMP_InputField.EditState.Finish;
							}
							if (keyCode != KeyCode.Delete)
							{
								goto IL_1FE;
							}
							this.ForwardSpace();
							return TMP_InputField.EditState.Continue;
						}
						break;
					case KeyCode.X:
						if (flag5)
						{
							if (this.inputType != TMP_InputField.InputType.Password)
							{
								TMP_InputField.clipboard = this.GetSelectedString();
							}
							else
							{
								TMP_InputField.clipboard = string.Empty;
							}
							this.Delete();
							this.SendOnValueChangedAndUpdateLabel();
							return TMP_InputField.EditState.Continue;
						}
						goto IL_1FE;
					}
					break;
				case KeyCode.C:
					if (flag5)
					{
						if (this.inputType != TMP_InputField.InputType.Password)
						{
							TMP_InputField.clipboard = this.GetSelectedString();
						}
						else
						{
							TMP_InputField.clipboard = string.Empty;
						}
						return TMP_InputField.EditState.Continue;
					}
					goto IL_1FE;
				}
				break;
			case KeyCode.UpArrow:
				this.MoveUp(flag3);
				return TMP_InputField.EditState.Continue;
			case KeyCode.DownArrow:
				this.MoveDown(flag3);
				return TMP_InputField.EditState.Continue;
			case KeyCode.RightArrow:
				this.MoveRight(flag3, flag2);
				return TMP_InputField.EditState.Continue;
			case KeyCode.LeftArrow:
				this.MoveLeft(flag3, flag2);
				return TMP_InputField.EditState.Continue;
			case KeyCode.Home:
				this.MoveTextStart(flag3);
				return TMP_InputField.EditState.Continue;
			case KeyCode.End:
				this.MoveTextEnd(flag3);
				return TMP_InputField.EditState.Continue;
			}
			if (this.lineType != TMP_InputField.LineType.MultiLineNewline)
			{
				return TMP_InputField.EditState.Finish;
			}
			IL_1FE:
			char c = evt.character;
			if (!this.multiLine && (c == '\t' || c == '\r' || c == '\n'))
			{
				return TMP_InputField.EditState.Continue;
			}
			if (c == '\r' || c == '\u0003')
			{
				c = '\n';
			}
			if (this.IsValidChar(c))
			{
				this.Append(c);
			}
			if (c == '\0' && Input.compositionString.Length > 0)
			{
				this.UpdateLabel();
			}
			return TMP_InputField.EditState.Continue;
		}

		// Token: 0x060029D1 RID: 10705 RVA: 0x0001E211 File Offset: 0x0001C411
		private bool IsValidChar(char c)
		{
			return c != '\u007f' && (c == '\t' || c == '\n' || this.m_TextComponent.font.HasCharacter(c, true));
		}

		// Token: 0x060029D2 RID: 10706 RVA: 0x0001E241 File Offset: 0x0001C441
		public void ProcessEvent(Event e)
		{
			this.KeyPressed(e);
		}

		// Token: 0x060029D3 RID: 10707 RVA: 0x000FDD88 File Offset: 0x000FBF88
		public virtual void OnUpdateSelected(BaseEventData eventData)
		{
			if (!this.isFocused)
			{
				return;
			}
			bool flag = false;
			while (Event.PopEvent(this.m_ProcessingEvent))
			{
				if (this.m_ProcessingEvent.rawType == EventType.KeyDown)
				{
					flag = true;
					TMP_InputField.EditState editState = this.KeyPressed(this.m_ProcessingEvent);
					if (editState == TMP_InputField.EditState.Finish)
					{
						this.DeactivateInputField();
						break;
					}
				}
				EventType type = this.m_ProcessingEvent.type;
				if (type == EventType.ValidateCommand || type == EventType.ExecuteCommand)
				{
					string commandName = this.m_ProcessingEvent.commandName;
					if (commandName != null)
					{
						if (commandName == "SelectAll")
						{
							this.SelectAll();
							flag = true;
						}
					}
				}
			}
			if (flag)
			{
				this.UpdateLabel();
			}
			eventData.Use();
		}

		// Token: 0x060029D4 RID: 10708 RVA: 0x000FDE58 File Offset: 0x000FC058
		private string GetSelectedString()
		{
			if (!this.hasSelection)
			{
				return string.Empty;
			}
			int num = this.stringPositionInternal;
			int num2 = this.stringSelectPositionInternal;
			if (num > num2)
			{
				int num3 = num;
				num = num2;
				num2 = num3;
			}
			return this.text.Substring(num, num2 - num);
		}

		// Token: 0x060029D5 RID: 10709 RVA: 0x000FDEA0 File Offset: 0x000FC0A0
		private int FindtNextWordBegin()
		{
			if (this.stringSelectPositionInternal + 1 >= this.text.Length)
			{
				return this.text.Length;
			}
			int num = this.text.IndexOfAny(TMP_InputField.kSeparators, this.stringSelectPositionInternal + 1);
			if (num == -1)
			{
				num = this.text.Length;
			}
			else
			{
				num++;
			}
			return num;
		}

		// Token: 0x060029D6 RID: 10710 RVA: 0x000FDF08 File Offset: 0x000FC108
		private void MoveRight(bool shift, bool ctrl)
		{
			if (this.hasSelection && !shift)
			{
				int num = Mathf.Max(this.stringPositionInternal, this.stringSelectPositionInternal);
				this.stringSelectPositionInternal = num;
				this.stringPositionInternal = num;
				num = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
				this.caretSelectPositionInternal = num;
				this.caretPositionInternal = num;
				return;
			}
			int caretSelectPositionInternal = this.caretSelectPositionInternal;
			int num2;
			if (ctrl)
			{
				num2 = this.FindtNextWordBegin();
			}
			else
			{
				num2 = this.stringSelectPositionInternal + 1;
			}
			if (shift)
			{
				this.stringSelectPositionInternal = num2;
				this.caretSelectPositionInternal = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
			}
			else
			{
				int num = num2;
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = num;
				num = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
				this.caretPositionInternal = num;
				this.caretSelectPositionInternal = num;
			}
			this.isCaretInsideTag = (caretSelectPositionInternal == this.caretSelectPositionInternal);
			Debug.Log("Caret is " + ((!this.isCaretInsideTag) ? " [Not Inside Tag]" : " [Inside Tag]"));
		}

		// Token: 0x060029D7 RID: 10711 RVA: 0x000FE00C File Offset: 0x000FC20C
		private int FindtPrevWordBegin()
		{
			if (this.stringSelectPositionInternal - 2 < 0)
			{
				return 0;
			}
			int num = this.text.LastIndexOfAny(TMP_InputField.kSeparators, this.stringSelectPositionInternal - 2);
			if (num == -1)
			{
				num = 0;
			}
			else
			{
				num++;
			}
			return num;
		}

		// Token: 0x060029D8 RID: 10712 RVA: 0x000FE058 File Offset: 0x000FC258
		private void MoveLeft(bool shift, bool ctrl)
		{
			if (this.hasSelection && !shift)
			{
				int num = Mathf.Min(this.stringPositionInternal, this.stringSelectPositionInternal);
				this.stringSelectPositionInternal = num;
				this.stringPositionInternal = num;
				num = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
				this.caretSelectPositionInternal = num;
				this.caretPositionInternal = num;
				return;
			}
			int caretSelectPositionInternal = this.caretSelectPositionInternal;
			int num2;
			if (ctrl)
			{
				num2 = this.FindtPrevWordBegin();
			}
			else
			{
				num2 = this.stringSelectPositionInternal - 1;
			}
			if (shift)
			{
				this.stringSelectPositionInternal = num2;
				this.caretSelectPositionInternal = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
			}
			else
			{
				int num = num2;
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = num;
				num = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
				this.caretPositionInternal = num;
				this.caretSelectPositionInternal = num;
			}
			this.isCaretInsideTag = (caretSelectPositionInternal == this.caretSelectPositionInternal);
			Debug.Log("Caret is " + ((!this.isCaretInsideTag) ? " [Not Inside Tag]" : " [Inside Tag]"));
		}

		// Token: 0x060029D9 RID: 10713 RVA: 0x000FE15C File Offset: 0x000FC35C
		private int LineUpCharacterPosition(int originalPos, bool goToFirstChar)
		{
			if (originalPos >= this.m_TextComponent.textInfo.characterCount)
			{
				originalPos--;
			}
			TMP_CharacterInfo tmp_CharacterInfo = this.m_TextComponent.textInfo.characterInfo[originalPos];
			int lineNumber = (int)tmp_CharacterInfo.lineNumber;
			if (lineNumber - 1 < 0)
			{
				return (!goToFirstChar) ? originalPos : 0;
			}
			int num = this.m_TextComponent.textInfo.lineInfo[lineNumber].firstCharacterIndex - 1;
			int i = this.m_TextComponent.textInfo.lineInfo[lineNumber - 1].firstCharacterIndex;
			while (i < num)
			{
				TMP_CharacterInfo tmp_CharacterInfo2 = this.m_TextComponent.textInfo.characterInfo[i];
				float num2 = (tmp_CharacterInfo.origin - tmp_CharacterInfo2.origin) / (tmp_CharacterInfo2.xAdvance - tmp_CharacterInfo2.origin);
				if (num2 >= 0f && num2 <= 1f)
				{
					if (num2 < 0.5f)
					{
						return i;
					}
					return i + 1;
				}
				else
				{
					i++;
				}
			}
			return num;
		}

		// Token: 0x060029DA RID: 10714 RVA: 0x000FE274 File Offset: 0x000FC474
		private int LineDownCharacterPosition(int originalPos, bool goToLastChar)
		{
			if (originalPos >= this.m_TextComponent.textInfo.characterCount)
			{
				return this.text.Length;
			}
			TMP_CharacterInfo tmp_CharacterInfo = this.m_TextComponent.textInfo.characterInfo[originalPos];
			int lineNumber = (int)tmp_CharacterInfo.lineNumber;
			if (lineNumber + 1 >= this.m_TextComponent.textInfo.lineCount)
			{
				return (!goToLastChar) ? originalPos : (this.m_TextComponent.textInfo.characterCount - 1);
			}
			int lastCharacterIndex = this.m_TextComponent.textInfo.lineInfo[lineNumber + 1].lastCharacterIndex;
			int i = this.m_TextComponent.textInfo.lineInfo[lineNumber + 1].firstCharacterIndex;
			while (i < lastCharacterIndex)
			{
				TMP_CharacterInfo tmp_CharacterInfo2 = this.m_TextComponent.textInfo.characterInfo[i];
				float num = (tmp_CharacterInfo.origin - tmp_CharacterInfo2.origin) / (tmp_CharacterInfo2.xAdvance - tmp_CharacterInfo2.origin);
				if (num >= 0f && num <= 1f)
				{
					if (num < 0.5f)
					{
						return i;
					}
					return i + 1;
				}
				else
				{
					i++;
				}
			}
			return lastCharacterIndex;
		}

		// Token: 0x060029DB RID: 10715 RVA: 0x0001E24B File Offset: 0x0001C44B
		private void MoveDown(bool shift)
		{
			this.MoveDown(shift, true);
		}

		// Token: 0x060029DC RID: 10716 RVA: 0x000FE3B4 File Offset: 0x000FC5B4
		private void MoveDown(bool shift, bool goToLastChar)
		{
			if (this.hasSelection && !shift)
			{
				int num = Mathf.Max(this.caretPositionInternal, this.caretSelectPositionInternal);
				this.caretSelectPositionInternal = num;
				this.caretPositionInternal = num;
			}
			int num2 = (!this.multiLine) ? this.text.Length : this.LineDownCharacterPosition(this.caretSelectPositionInternal, goToLastChar);
			if (shift)
			{
				this.caretSelectPositionInternal = num2;
				this.stringSelectPositionInternal = this.GetStringIndexFromCaretPosition(this.caretSelectPositionInternal);
			}
			else
			{
				int num = num2;
				this.caretPositionInternal = num;
				this.caretSelectPositionInternal = num;
				num = this.GetStringIndexFromCaretPosition(this.caretSelectPositionInternal);
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = num;
			}
		}

		// Token: 0x060029DD RID: 10717 RVA: 0x0001E255 File Offset: 0x0001C455
		private void MoveUp(bool shift)
		{
			this.MoveUp(shift, true);
		}

		// Token: 0x060029DE RID: 10718 RVA: 0x000FE46C File Offset: 0x000FC66C
		private void MoveUp(bool shift, bool goToFirstChar)
		{
			if (this.hasSelection && !shift)
			{
				int num = Mathf.Min(this.caretPositionInternal, this.caretSelectPositionInternal);
				this.caretSelectPositionInternal = num;
				this.caretPositionInternal = num;
			}
			int num2 = (!this.multiLine) ? 0 : this.LineUpCharacterPosition(this.caretSelectPositionInternal, goToFirstChar);
			if (shift)
			{
				this.caretSelectPositionInternal = num2;
				this.stringSelectPositionInternal = this.GetStringIndexFromCaretPosition(this.caretSelectPositionInternal);
			}
			else
			{
				int num = num2;
				this.caretPositionInternal = num;
				this.caretSelectPositionInternal = num;
				num = this.GetStringIndexFromCaretPosition(this.caretSelectPositionInternal);
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = num;
			}
		}

		// Token: 0x060029DF RID: 10719 RVA: 0x000FE518 File Offset: 0x000FC718
		private void Delete()
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			if (this.stringPositionInternal == this.stringSelectPositionInternal)
			{
				return;
			}
			if (this.stringPositionInternal < this.stringSelectPositionInternal)
			{
				this.m_Text = this.text.Substring(0, this.stringPositionInternal) + this.text.Substring(this.stringSelectPositionInternal, this.text.Length - this.stringSelectPositionInternal);
				this.stringSelectPositionInternal = this.stringPositionInternal;
			}
			else
			{
				this.m_Text = this.text.Substring(0, this.stringSelectPositionInternal) + this.text.Substring(this.stringPositionInternal, this.text.Length - this.stringPositionInternal);
				this.stringPositionInternal = this.stringSelectPositionInternal;
			}
		}

		// Token: 0x060029E0 RID: 10720 RVA: 0x000FE5F4 File Offset: 0x000FC7F4
		private void ForwardSpace()
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			if (this.hasSelection)
			{
				this.Delete();
				this.SendOnValueChangedAndUpdateLabel();
			}
			else if (this.stringPositionInternal < this.text.Length)
			{
				this.m_Text = this.text.Remove(this.stringPositionInternal, 1);
				this.SendOnValueChangedAndUpdateLabel();
			}
		}

		// Token: 0x060029E1 RID: 10721 RVA: 0x000FE660 File Offset: 0x000FC860
		private void Backspace()
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			if (this.hasSelection)
			{
				this.Delete();
				this.SendOnValueChangedAndUpdateLabel();
			}
			else if (this.stringPositionInternal > 0)
			{
				this.m_Text = this.text.Remove(this.stringPositionInternal - 1, 1);
				int num = this.stringPositionInternal - 1;
				this.stringPositionInternal = num;
				this.stringSelectPositionInternal = num;
				this.m_isLastKeyBackspace = true;
				this.SendOnValueChangedAndUpdateLabel();
			}
		}

		// Token: 0x060029E2 RID: 10722 RVA: 0x000FE6E0 File Offset: 0x000FC8E0
		private void Insert(char c)
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			string text = c.ToString();
			this.Delete();
			if (this.characterLimit > 0 && this.text.Length >= this.characterLimit)
			{
				return;
			}
			this.m_Text = this.text.Insert(this.m_StringPosition, text);
			this.stringSelectPositionInternal = (this.stringPositionInternal += text.Length);
			this.SendOnValueChanged();
		}

		// Token: 0x060029E3 RID: 10723 RVA: 0x0001E25F File Offset: 0x0001C45F
		private void SendOnValueChangedAndUpdateLabel()
		{
			this.SendOnValueChanged();
			this.UpdateLabel();
		}

		// Token: 0x060029E4 RID: 10724 RVA: 0x0001E26D File Offset: 0x0001C46D
		private void SendOnValueChanged()
		{
			if (this.onValueChanged != null)
			{
				this.onValueChanged.Invoke(this.text);
			}
		}

		// Token: 0x060029E5 RID: 10725 RVA: 0x0001E28B File Offset: 0x0001C48B
		protected void SendOnSubmit()
		{
			if (this.onEndEdit != null)
			{
				this.onEndEdit.Invoke(this.m_Text);
			}
		}

		// Token: 0x060029E6 RID: 10726 RVA: 0x0001E2A9 File Offset: 0x0001C4A9
		protected void SendOnFocusLost()
		{
			if (this.onFocusLost != null)
			{
				this.onFocusLost.Invoke(this.m_Text);
			}
		}

		// Token: 0x060029E7 RID: 10727 RVA: 0x000FE76C File Offset: 0x000FC96C
		protected virtual void Append(string input)
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			if (!this.InPlaceEditing())
			{
				return;
			}
			int i = 0;
			int length = input.Length;
			while (i < length)
			{
				char c = input[i];
				if (c >= ' ' || c == '\t' || c == '\r' || c == '\n' || c == '\n')
				{
					this.Append(c);
				}
				i++;
			}
		}

		// Token: 0x060029E8 RID: 10728 RVA: 0x000FE7E4 File Offset: 0x000FC9E4
		protected virtual void Append(char input)
		{
			if (this.m_ReadOnly)
			{
				return;
			}
			if (!this.InPlaceEditing())
			{
				return;
			}
			if (this.onValidateInput != null)
			{
				input = this.onValidateInput(this.text, this.stringPositionInternal, input);
			}
			else if (this.characterValidation != TMP_InputField.CharacterValidation.None)
			{
				input = this.Validate(this.text, this.stringPositionInternal, input);
			}
			if (input == '\0')
			{
				return;
			}
			this.Insert(input);
		}

		// Token: 0x060029E9 RID: 10729 RVA: 0x000FE864 File Offset: 0x000FCA64
		protected void UpdateLabel()
		{
			if (this.m_TextComponent != null && this.m_TextComponent.font != null)
			{
				string text;
				if (Input.compositionString.Length > 0)
				{
					text = this.text.Substring(0, this.m_StringPosition) + Input.compositionString + this.text.Substring(this.m_StringPosition);
				}
				else
				{
					text = this.text;
				}
				string str;
				if (this.inputType == TMP_InputField.InputType.Password)
				{
					str = new string(this.asteriskChar, text.Length);
				}
				else
				{
					str = text;
				}
				bool flag = string.IsNullOrEmpty(text);
				if (this.m_Placeholder != null)
				{
					this.m_Placeholder.enabled = flag;
				}
				if (!this.m_AllowInput)
				{
					this.m_DrawStart = 0;
					this.m_DrawEnd = this.m_Text.Length;
				}
				if (!flag)
				{
					this.SetCaretVisible();
				}
				this.m_TextComponent.text = str + "​";
				this.MarkGeometryAsDirty();
			}
		}

		// Token: 0x060029EA RID: 10730 RVA: 0x000FE978 File Offset: 0x000FCB78
		private int GetCaretPositionFromStringIndex(int stringIndex)
		{
			int characterCount = this.m_TextComponent.textInfo.characterCount;
			for (int i = 0; i < characterCount; i++)
			{
				if ((int)this.m_TextComponent.textInfo.characterInfo[i].index >= stringIndex)
				{
					return i;
				}
			}
			return characterCount;
		}

		// Token: 0x060029EB RID: 10731 RVA: 0x0001E2C7 File Offset: 0x0001C4C7
		private int GetStringIndexFromCaretPosition(int caretPosition)
		{
			return (int)this.m_TextComponent.textInfo.characterInfo[caretPosition].index;
		}

		// Token: 0x060029EC RID: 10732 RVA: 0x0001E2E4 File Offset: 0x0001C4E4
		public void ForceLabelUpdate()
		{
			this.UpdateLabel();
		}

		// Token: 0x060029ED RID: 10733 RVA: 0x0001E2EC File Offset: 0x0001C4EC
		private void MarkGeometryAsDirty()
		{
			CanvasUpdateRegistry.RegisterCanvasElementForGraphicRebuild(this);
		}

		// Token: 0x060029EE RID: 10734 RVA: 0x0001E2F4 File Offset: 0x0001C4F4
		public virtual void Rebuild(CanvasUpdate update)
		{
			if (update == CanvasUpdate.LatePreRender)
			{
				this.UpdateGeometry();
			}
		}

		// Token: 0x060029EF RID: 10735 RVA: 0x00002482 File Offset: 0x00000682
		public virtual void LayoutComplete()
		{
		}

		// Token: 0x060029F0 RID: 10736 RVA: 0x00002482 File Offset: 0x00000682
		public virtual void GraphicUpdateComplete()
		{
		}

		// Token: 0x060029F1 RID: 10737 RVA: 0x000FE9CC File Offset: 0x000FCBCC
		private void UpdateGeometry()
		{
			if (!this.shouldHideMobileInput)
			{
				return;
			}
			if (this.m_CachedInputRenderer == null && this.m_TextComponent != null)
			{
				GameObject gameObject = new GameObject(base.transform.name + " Input Caret");
				gameObject.hideFlags = HideFlags.DontSave;
				gameObject.transform.SetParent(this.m_TextComponent.transform.parent);
				gameObject.transform.SetAsFirstSibling();
				gameObject.layer = base.gameObject.layer;
				this.caretRectTrans = gameObject.AddComponent<RectTransform>();
				this.m_CachedInputRenderer = gameObject.AddComponent<CanvasRenderer>();
				this.m_CachedInputRenderer.SetMaterial(Graphic.defaultGraphicMaterial, Texture2D.whiteTexture);
				gameObject.AddComponent<LayoutElement>().ignoreLayout = true;
				this.AssignPositioningIfNeeded();
			}
			if (this.m_CachedInputRenderer == null)
			{
				return;
			}
			this.OnFillVBO(this.mesh);
			this.m_CachedInputRenderer.SetMesh(this.mesh);
		}

		// Token: 0x060029F2 RID: 10738 RVA: 0x000FEAD0 File Offset: 0x000FCCD0
		private void AssignPositioningIfNeeded()
		{
			if (this.m_TextComponent != null && this.caretRectTrans != null && (this.caretRectTrans.localPosition != this.m_TextComponent.rectTransform.localPosition || this.caretRectTrans.localRotation != this.m_TextComponent.rectTransform.localRotation || this.caretRectTrans.localScale != this.m_TextComponent.rectTransform.localScale || this.caretRectTrans.anchorMin != this.m_TextComponent.rectTransform.anchorMin || this.caretRectTrans.anchorMax != this.m_TextComponent.rectTransform.anchorMax || this.caretRectTrans.anchoredPosition != this.m_TextComponent.rectTransform.anchoredPosition || this.caretRectTrans.sizeDelta != this.m_TextComponent.rectTransform.sizeDelta || this.caretRectTrans.pivot != this.m_TextComponent.rectTransform.pivot))
			{
				this.caretRectTrans.localPosition = this.m_TextComponent.rectTransform.localPosition;
				this.caretRectTrans.localRotation = this.m_TextComponent.rectTransform.localRotation;
				this.caretRectTrans.localScale = this.m_TextComponent.rectTransform.localScale;
				this.caretRectTrans.anchorMin = this.m_TextComponent.rectTransform.anchorMin;
				this.caretRectTrans.anchorMax = this.m_TextComponent.rectTransform.anchorMax;
				this.caretRectTrans.anchoredPosition = this.m_TextComponent.rectTransform.anchoredPosition;
				this.caretRectTrans.sizeDelta = this.m_TextComponent.rectTransform.sizeDelta;
				this.caretRectTrans.pivot = this.m_TextComponent.rectTransform.pivot;
			}
		}

		// Token: 0x060029F3 RID: 10739 RVA: 0x000FED00 File Offset: 0x000FCF00
		private void OnFillVBO(Mesh vbo)
		{
			using (VertexHelper vertexHelper = new VertexHelper())
			{
				if (!this.isFocused)
				{
					vertexHelper.FillMesh(vbo);
				}
				else
				{
					if (!this.hasSelection)
					{
						this.GenerateCaret(vertexHelper, Vector2.zero);
					}
					else
					{
						this.GenerateHightlight(vertexHelper, Vector2.zero);
					}
					vertexHelper.FillMesh(vbo);
				}
			}
		}

		// Token: 0x060029F4 RID: 10740 RVA: 0x000FED7C File Offset: 0x000FCF7C
		private void GenerateCaret(VertexHelper vbo, Vector2 roundingOffset)
		{
			if (!this.m_CaretVisible)
			{
				return;
			}
			if (this.m_CursorVerts == null)
			{
				this.CreateCursorVerts();
			}
			float num = (float)this.m_CaretWidth;
			int characterCount = this.m_TextComponent.textInfo.characterCount;
			Vector2 zero = Vector2.zero;
			this.caretPositionInternal = this.GetCaretPositionFromStringIndex(this.stringPositionInternal);
			TMP_CharacterInfo tmp_CharacterInfo;
			float num2;
			if (this.caretPositionInternal == 0)
			{
				tmp_CharacterInfo = this.m_TextComponent.textInfo.characterInfo[0];
				zero = new Vector2(tmp_CharacterInfo.origin, tmp_CharacterInfo.descender);
				num2 = tmp_CharacterInfo.ascender - tmp_CharacterInfo.descender;
			}
			else if (this.caretPositionInternal < characterCount)
			{
				tmp_CharacterInfo = this.m_TextComponent.textInfo.characterInfo[this.caretPositionInternal];
				zero = new Vector2(tmp_CharacterInfo.origin, tmp_CharacterInfo.descender);
				num2 = tmp_CharacterInfo.ascender - tmp_CharacterInfo.descender;
			}
			else
			{
				tmp_CharacterInfo = this.m_TextComponent.textInfo.characterInfo[characterCount - 1];
				zero = new Vector2(tmp_CharacterInfo.xAdvance, tmp_CharacterInfo.descender);
				num2 = tmp_CharacterInfo.ascender - tmp_CharacterInfo.descender;
			}
			this.AdjustRectTransformRelativeToViewport(zero, num2, tmp_CharacterInfo.isVisible);
			float num3 = zero.y + num2;
			float y = num3 - Mathf.Min(num2, this.m_TextComponent.rectTransform.rect.height);
			this.m_CursorVerts[0].position = new Vector3(zero.x, y, 0f);
			this.m_CursorVerts[1].position = new Vector3(zero.x, num3, 0f);
			this.m_CursorVerts[2].position = new Vector3(zero.x + num, num3, 0f);
			this.m_CursorVerts[3].position = new Vector3(zero.x + num, y, 0f);
			this.m_CursorVerts[0].color = this.caretColor;
			this.m_CursorVerts[1].color = this.caretColor;
			this.m_CursorVerts[2].color = this.caretColor;
			this.m_CursorVerts[3].color = this.caretColor;
			vbo.AddUIVertexQuad(this.m_CursorVerts);
			int height = Screen.height;
			zero.y = (float)height - zero.y;
			Input.compositionCursorPos = zero;
		}

		// Token: 0x060029F5 RID: 10741 RVA: 0x000FF038 File Offset: 0x000FD238
		private void CreateCursorVerts()
		{
			this.m_CursorVerts = new UIVertex[4];
			for (int i = 0; i < this.m_CursorVerts.Length; i++)
			{
				this.m_CursorVerts[i] = UIVertex.simpleVert;
				this.m_CursorVerts[i].uv0 = Vector2.zero;
			}
		}

		// Token: 0x060029F6 RID: 10742 RVA: 0x000FF098 File Offset: 0x000FD298
		private void GenerateHightlight(VertexHelper vbo, Vector2 roundingOffset)
		{
			TMP_TextInfo textInfo = this.m_TextComponent.textInfo;
			this.caretPositionInternal = this.GetCaretPositionFromStringIndex(this.stringPositionInternal);
			this.caretSelectPositionInternal = this.GetCaretPositionFromStringIndex(this.stringSelectPositionInternal);
			Debug.Log(string.Concat(new object[]
			{
				"StringPosition:",
				this.stringPositionInternal,
				"  StringSelectPosition:",
				this.stringSelectPositionInternal
			}));
			Vector2 startPosition;
			float height;
			if (this.caretSelectPositionInternal < textInfo.characterCount)
			{
				startPosition = new Vector2(textInfo.characterInfo[this.caretSelectPositionInternal].origin, textInfo.characterInfo[this.caretSelectPositionInternal].descender);
				height = textInfo.characterInfo[this.caretSelectPositionInternal].ascender - textInfo.characterInfo[this.caretSelectPositionInternal].descender;
			}
			else
			{
				startPosition = new Vector2(textInfo.characterInfo[this.caretSelectPositionInternal - 1].xAdvance, textInfo.characterInfo[this.caretSelectPositionInternal - 1].descender);
				height = textInfo.characterInfo[this.caretSelectPositionInternal - 1].ascender - textInfo.characterInfo[this.caretSelectPositionInternal - 1].descender;
			}
			this.AdjustRectTransformRelativeToViewport(startPosition, height, true);
			int num = Mathf.Max(0, this.caretPositionInternal);
			int num2 = Mathf.Max(0, this.caretSelectPositionInternal);
			if (num > num2)
			{
				int num3 = num;
				num = num2;
				num2 = num3;
			}
			num2--;
			int num4 = (int)textInfo.characterInfo[num].lineNumber;
			int lastCharacterIndex = textInfo.lineInfo[num4].lastCharacterIndex;
			UIVertex simpleVert = UIVertex.simpleVert;
			simpleVert.uv0 = Vector2.zero;
			simpleVert.color = this.selectionColor;
			int num5 = num;
			while (num5 <= num2 && num5 < textInfo.characterCount)
			{
				if (num5 == lastCharacterIndex || num5 == num2)
				{
					TMP_CharacterInfo tmp_CharacterInfo = textInfo.characterInfo[num];
					TMP_CharacterInfo tmp_CharacterInfo2 = textInfo.characterInfo[num5];
					Vector2 vector = new Vector2(tmp_CharacterInfo.origin, tmp_CharacterInfo.ascender);
					Vector2 vector2 = new Vector2(tmp_CharacterInfo2.xAdvance, tmp_CharacterInfo2.descender);
					Vector2 min = this.m_TextViewport.rect.min;
					Vector2 max = this.m_TextViewport.rect.max;
					float num6 = this.m_TextComponent.rectTransform.anchoredPosition.x + vector.x - min.x;
					if (num6 < 0f)
					{
						vector.x -= num6;
					}
					float num7 = this.m_TextComponent.rectTransform.anchoredPosition.y + vector2.y - min.y;
					if (num7 < 0f)
					{
						vector2.y -= num7;
					}
					float num8 = max.x - (this.m_TextComponent.rectTransform.anchoredPosition.x + vector2.x);
					if (num8 < 0f)
					{
						vector2.x += num8;
					}
					float num9 = max.y - (this.m_TextComponent.rectTransform.anchoredPosition.y + vector.y);
					if (num9 < 0f)
					{
						vector.y += num9;
					}
					if (this.m_TextComponent.rectTransform.anchoredPosition.y + vector.y >= min.y && this.m_TextComponent.rectTransform.anchoredPosition.y + vector2.y <= max.y)
					{
						int currentVertCount = vbo.currentVertCount;
						simpleVert.position = new Vector3(vector.x, vector2.y, 0f);
						vbo.AddVert(simpleVert);
						simpleVert.position = new Vector3(vector2.x, vector2.y, 0f);
						vbo.AddVert(simpleVert);
						simpleVert.position = new Vector3(vector2.x, vector.y, 0f);
						vbo.AddVert(simpleVert);
						simpleVert.position = new Vector3(vector.x, vector.y, 0f);
						vbo.AddVert(simpleVert);
						vbo.AddTriangle(currentVertCount, currentVertCount + 1, currentVertCount + 2);
						vbo.AddTriangle(currentVertCount + 2, currentVertCount + 3, currentVertCount);
					}
					num = num5 + 1;
					num4++;
					if (num4 < textInfo.lineCount)
					{
						lastCharacterIndex = textInfo.lineInfo[num4].lastCharacterIndex;
					}
				}
				num5++;
			}
		}

		// Token: 0x060029F7 RID: 10743 RVA: 0x000FF5A0 File Offset: 0x000FD7A0
		private void AdjustRectTransformRelativeToViewport(Vector2 startPosition, float height, bool isCharVisible)
		{
			float xMin = this.m_TextViewport.rect.xMin;
			float xMax = this.m_TextViewport.rect.xMax;
			float num = xMax - (this.m_TextComponent.rectTransform.anchoredPosition.x + startPosition.x + this.m_TextComponent.margin.z);
			if (num < 0f && (!this.multiLine || (this.multiLine && isCharVisible)))
			{
				this.m_TextComponent.rectTransform.anchoredPosition += new Vector2(num, 0f);
				this.AssignPositioningIfNeeded();
			}
			float num2 = this.m_TextComponent.rectTransform.anchoredPosition.x + startPosition.x - this.m_TextComponent.margin.x - xMin;
			if (num2 < 0f)
			{
				this.m_TextComponent.rectTransform.anchoredPosition += new Vector2(-num2, 0f);
				this.AssignPositioningIfNeeded();
			}
			if (this.m_LineType != TMP_InputField.LineType.SingleLine)
			{
				float num3 = this.m_TextViewport.rect.yMax - (this.m_TextComponent.rectTransform.anchoredPosition.y + startPosition.y + height);
				if (num3 < -0.0001f)
				{
					this.m_TextComponent.rectTransform.anchoredPosition += new Vector2(0f, num3);
					this.AssignPositioningIfNeeded();
				}
				float num4 = this.m_TextComponent.rectTransform.anchoredPosition.y + startPosition.y - this.m_TextViewport.rect.yMin;
				if (num4 < 0f)
				{
					this.m_TextComponent.rectTransform.anchoredPosition -= new Vector2(0f, num4);
					this.AssignPositioningIfNeeded();
				}
			}
			if (this.m_isLastKeyBackspace)
			{
				float num5 = this.m_TextComponent.rectTransform.anchoredPosition.x + this.m_TextComponent.textInfo.characterInfo[0].origin - this.m_TextComponent.margin.x;
				float num6 = this.m_TextComponent.rectTransform.anchoredPosition.x + this.m_TextComponent.textInfo.characterInfo[this.m_TextComponent.textInfo.characterCount - 1].origin + this.m_TextComponent.margin.z;
				if (this.m_TextComponent.rectTransform.anchoredPosition.x + startPosition.x <= xMin + 0.0001f)
				{
					if (num5 < xMin)
					{
						float x = Mathf.Min((xMax - xMin) / 2f, xMin - num5);
						this.m_TextComponent.rectTransform.anchoredPosition += new Vector2(x, 0f);
						this.AssignPositioningIfNeeded();
					}
				}
				else if (num6 < xMax && num5 < xMin)
				{
					float x2 = Mathf.Min(xMax - num6, xMin - num5);
					this.m_TextComponent.rectTransform.anchoredPosition += new Vector2(x2, 0f);
					this.AssignPositioningIfNeeded();
				}
				this.m_isLastKeyBackspace = false;
			}
		}

		// Token: 0x060029F8 RID: 10744 RVA: 0x000FF94C File Offset: 0x000FDB4C
		protected char Validate(string text, int pos, char ch)
		{
			if (this.characterValidation == TMP_InputField.CharacterValidation.None || !base.enabled)
			{
				return ch;
			}
			if (this.characterValidation == TMP_InputField.CharacterValidation.Integer || this.characterValidation == TMP_InputField.CharacterValidation.Decimal)
			{
				bool flag = pos == 0 && text.Length > 0 && text[0] == '-';
				bool flag2 = this.stringPositionInternal == 0 || this.stringSelectPositionInternal == 0;
				if (!flag)
				{
					if (ch >= '0' && ch <= '9')
					{
						return ch;
					}
					if (ch == '-' && (pos == 0 || flag2))
					{
						return ch;
					}
					if (ch == '.' && this.characterValidation == TMP_InputField.CharacterValidation.Decimal && !text.Contains("."))
					{
						return ch;
					}
				}
			}
			else if (this.characterValidation == TMP_InputField.CharacterValidation.Alphanumeric)
			{
				if (ch >= 'A' && ch <= 'Z')
				{
					return ch;
				}
				if (ch >= 'a' && ch <= 'z')
				{
					return ch;
				}
				if (ch >= '0' && ch <= '9')
				{
					return ch;
				}
			}
			else if (this.characterValidation == TMP_InputField.CharacterValidation.Name)
			{
				char c = (text.Length <= 0) ? ' ' : text[Mathf.Clamp(pos, 0, text.Length - 1)];
				char c2 = (text.Length <= 0) ? '\n' : text[Mathf.Clamp(pos + 1, 0, text.Length - 1)];
				if (char.IsLetter(ch))
				{
					if (char.IsLower(ch) && c == ' ')
					{
						return char.ToUpper(ch);
					}
					if (char.IsUpper(ch) && c != ' ' && c != '\'')
					{
						return char.ToLower(ch);
					}
					return ch;
				}
				else if (ch == '\'')
				{
					if (c != ' ' && c != '\'' && c2 != '\'' && !text.Contains("'"))
					{
						return ch;
					}
				}
				else if (ch == ' ' && c != ' ' && c != '\'' && c2 != ' ' && c2 != '\'')
				{
					return ch;
				}
			}
			else if (this.characterValidation == TMP_InputField.CharacterValidation.EmailAddress)
			{
				if (ch >= 'A' && ch <= 'Z')
				{
					return ch;
				}
				if (ch >= 'a' && ch <= 'z')
				{
					return ch;
				}
				if (ch >= '0' && ch <= '9')
				{
					return ch;
				}
				if (ch == '@' && text.IndexOf('@') == -1)
				{
					return ch;
				}
				if ("!#$%&'*+-/=?^_`{|}~".IndexOf(ch) != -1)
				{
					return ch;
				}
				if (ch == '.')
				{
					char c3 = (text.Length <= 0) ? ' ' : text[Mathf.Clamp(pos, 0, text.Length - 1)];
					char c4 = (text.Length <= 0) ? '\n' : text[Mathf.Clamp(pos + 1, 0, text.Length - 1)];
					if (c3 != '.' && c4 != '.')
					{
						return ch;
					}
				}
			}
			return '\0';
		}

		// Token: 0x060029F9 RID: 10745 RVA: 0x000FFC54 File Offset: 0x000FDE54
		public void ActivateInputField()
		{
			if (this.m_TextComponent == null || this.m_TextComponent.font == null || !this.IsActive() || !this.IsInteractable())
			{
				return;
			}
			if (this.isFocused && this.m_Keyboard != null && !this.m_Keyboard.active)
			{
				this.m_Keyboard.active = true;
				this.m_Keyboard.text = this.m_Text;
			}
			this.m_HasLostFocus = false;
			this.m_ShouldActivateNextUpdate = true;
		}

		// Token: 0x060029FA RID: 10746 RVA: 0x000FFCF0 File Offset: 0x000FDEF0
		private void ActivateInputFieldInternal()
		{
			if (EventSystem.current == null)
			{
				return;
			}
			if (EventSystem.current.currentSelectedGameObject != base.gameObject)
			{
				EventSystem.current.SetSelectedGameObject(base.gameObject);
			}
			if (TouchScreenKeyboard.isSupported)
			{
				if (Input.touchSupported)
				{
					TouchScreenKeyboard.hideInput = this.shouldHideMobileInput;
				}
				this.m_Keyboard = ((this.inputType != TMP_InputField.InputType.Password) ? TouchScreenKeyboard.Open(this.m_Text, this.keyboardType, this.inputType == TMP_InputField.InputType.AutoCorrect, this.multiLine) : TouchScreenKeyboard.Open(this.m_Text, this.keyboardType, false, this.multiLine, true));
				this.MoveTextEnd(false);
			}
			else
			{
				Input.imeCompositionMode = IMECompositionMode.On;
				this.OnFocus();
			}
			this.m_AllowInput = true;
			this.m_OriginalText = this.text;
			this.m_WasCanceled = false;
			this.SetCaretVisible();
			this.UpdateLabel();
		}

		// Token: 0x060029FB RID: 10747 RVA: 0x0001E30D File Offset: 0x0001C50D
		public override void OnSelect(BaseEventData eventData)
		{
			Debug.Log("OnSelect()");
			base.OnSelect(eventData);
			this.ActivateInputField();
		}

		// Token: 0x060029FC RID: 10748 RVA: 0x0001E326 File Offset: 0x0001C526
		public virtual void OnPointerClick(PointerEventData eventData)
		{
			if (eventData.button != PointerEventData.InputButton.Left)
			{
				return;
			}
			this.ActivateInputField();
		}

		// Token: 0x060029FD RID: 10749 RVA: 0x000FFDE8 File Offset: 0x000FDFE8
		public void DeactivateInputField()
		{
			if (!this.m_AllowInput)
			{
				return;
			}
			this.m_HasDoneFocusTransition = false;
			this.m_AllowInput = false;
			if (this.m_Placeholder != null)
			{
				this.m_Placeholder.enabled = string.IsNullOrEmpty(this.m_Text);
			}
			if (this.m_TextComponent != null && this.IsInteractable())
			{
				if (this.m_WasCanceled)
				{
					this.text = this.m_OriginalText;
				}
				if (this.m_Keyboard != null)
				{
					this.m_Keyboard.active = false;
					this.m_Keyboard = null;
				}
				this.m_StringPosition = (this.m_StringSelectPosition = 0);
				this.m_TextComponent.rectTransform.localPosition = Vector3.zero;
				if (this.caretRectTrans != null)
				{
					this.caretRectTrans.localPosition = Vector3.zero;
				}
				this.SendOnSubmit();
				if (this.m_HasLostFocus)
				{
					this.SendOnFocusLost();
				}
				Input.imeCompositionMode = IMECompositionMode.Auto;
			}
			this.MarkGeometryAsDirty();
		}

		// Token: 0x060029FE RID: 10750 RVA: 0x0001E33A File Offset: 0x0001C53A
		public override void OnDeselect(BaseEventData eventData)
		{
			Debug.Log("OnDeselect()");
			this.m_HasLostFocus = true;
			this.DeactivateInputField();
			base.OnDeselect(eventData);
		}

		// Token: 0x060029FF RID: 10751 RVA: 0x0001E35A File Offset: 0x0001C55A
		public virtual void OnSubmit(BaseEventData eventData)
		{
			Debug.Log("OnSubmit()");
			if (!this.IsActive() || !this.IsInteractable())
			{
				return;
			}
			if (!this.isFocused)
			{
				this.m_ShouldActivateNextUpdate = true;
			}
		}

		// Token: 0x06002A00 RID: 10752 RVA: 0x000FFEF0 File Offset: 0x000FE0F0
		private void EnforceContentType()
		{
			switch (this.contentType)
			{
			case TMP_InputField.ContentType.Standard:
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.Default;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.None;
				return;
			case TMP_InputField.ContentType.Autocorrected:
				this.m_InputType = TMP_InputField.InputType.AutoCorrect;
				this.m_KeyboardType = TouchScreenKeyboardType.Default;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.None;
				return;
			case TMP_InputField.ContentType.IntegerNumber:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.NumberPad;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.Integer;
				return;
			case TMP_InputField.ContentType.DecimalNumber:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.NumbersAndPunctuation;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.Decimal;
				return;
			case TMP_InputField.ContentType.Alphanumeric:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.ASCIICapable;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.Alphanumeric;
				return;
			case TMP_InputField.ContentType.Name:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.Default;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.Name;
				return;
			case TMP_InputField.ContentType.EmailAddress:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Standard;
				this.m_KeyboardType = TouchScreenKeyboardType.EmailAddress;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.EmailAddress;
				return;
			case TMP_InputField.ContentType.Password:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Password;
				this.m_KeyboardType = TouchScreenKeyboardType.Default;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.None;
				return;
			case TMP_InputField.ContentType.Pin:
				this.m_LineType = TMP_InputField.LineType.SingleLine;
				this.m_TextComponent.enableWordWrapping = false;
				this.m_InputType = TMP_InputField.InputType.Password;
				this.m_KeyboardType = TouchScreenKeyboardType.NumberPad;
				this.m_CharacterValidation = TMP_InputField.CharacterValidation.Integer;
				return;
			default:
				return;
			}
		}

		// Token: 0x06002A01 RID: 10753 RVA: 0x0001E38F File Offset: 0x0001C58F
		private void SetTextComponentWrapMode()
		{
			if (this.m_TextComponent == null)
			{
				return;
			}
			if (this.m_LineType == TMP_InputField.LineType.SingleLine)
			{
				this.m_TextComponent.enableWordWrapping = false;
			}
			else
			{
				this.m_TextComponent.enableWordWrapping = true;
			}
		}

		// Token: 0x06002A02 RID: 10754 RVA: 0x0001E3CB File Offset: 0x0001C5CB
		private void SetTextComponentRichTextMode()
		{
			if (this.m_TextComponent == null)
			{
				return;
			}
			this.m_TextComponent.richText = this.m_RichText;
		}

		// Token: 0x06002A03 RID: 10755 RVA: 0x00100080 File Offset: 0x000FE280
		private void SetToCustomIfContentTypeIsNot(params TMP_InputField.ContentType[] allowedContentTypes)
		{
			if (this.contentType == TMP_InputField.ContentType.Custom)
			{
				return;
			}
			for (int i = 0; i < allowedContentTypes.Length; i++)
			{
				if (this.contentType == allowedContentTypes[i])
				{
					return;
				}
			}
			this.contentType = TMP_InputField.ContentType.Custom;
		}

		// Token: 0x06002A04 RID: 10756 RVA: 0x0001E3F0 File Offset: 0x0001C5F0
		private void SetToCustom()
		{
			if (this.contentType == TMP_InputField.ContentType.Custom)
			{
				return;
			}
			this.contentType = TMP_InputField.ContentType.Custom;
		}

		// Token: 0x06002A05 RID: 10757 RVA: 0x0001E408 File Offset: 0x0001C608
		protected override void DoStateTransition(Selectable.SelectionState state, bool instant)
		{
			if (this.m_HasDoneFocusTransition)
			{
				state = Selectable.SelectionState.Highlighted;
			}
			else if (state == Selectable.SelectionState.Pressed)
			{
				this.m_HasDoneFocusTransition = true;
			}
			base.DoStateTransition(state, instant);
		}

		// Token: 0x06002A07 RID: 10759 RVA: 0x0001E44B File Offset: 0x0001C64B
		Transform ICanvasElement()
		{
			return base.transform;
		}

		// Token: 0x06002A08 RID: 10760 RVA: 0x0001E453 File Offset: 0x0001C653
		bool ICanvasElement.IsDestroyed()
		{
			return base.IsDestroyed();
		}

		// Token: 0x04002EC0 RID: 11968
		protected TouchScreenKeyboard m_Keyboard;

		// Token: 0x04002EC1 RID: 11969
		private static readonly char[] kSeparators = new char[]
		{
			' ',
			'.',
			',',
			'\t',
			'\r',
			'\n'
		};

		// Token: 0x04002EC2 RID: 11970
		[SerializeField]
		protected RectTransform m_TextViewport;

		// Token: 0x04002EC3 RID: 11971
		[SerializeField]
		protected TMP_Text m_TextComponent;

		// Token: 0x04002EC4 RID: 11972
		protected RectTransform m_TextComponentRectTransform;

		// Token: 0x04002EC5 RID: 11973
		[SerializeField]
		protected Graphic m_Placeholder;

		// Token: 0x04002EC6 RID: 11974
		[SerializeField]
		private TMP_InputField.ContentType m_ContentType;

		// Token: 0x04002EC7 RID: 11975
		[SerializeField]
		private TMP_InputField.InputType m_InputType;

		// Token: 0x04002EC8 RID: 11976
		[SerializeField]
		private char m_AsteriskChar = '*';

		// Token: 0x04002EC9 RID: 11977
		[SerializeField]
		private TouchScreenKeyboardType m_KeyboardType;

		// Token: 0x04002ECA RID: 11978
		[SerializeField]
		private TMP_InputField.LineType m_LineType;

		// Token: 0x04002ECB RID: 11979
		[SerializeField]
		private bool m_HideMobileInput;

		// Token: 0x04002ECC RID: 11980
		[SerializeField]
		private TMP_InputField.CharacterValidation m_CharacterValidation;

		// Token: 0x04002ECD RID: 11981
		[SerializeField]
		private int m_CharacterLimit;

		// Token: 0x04002ECE RID: 11982
		[SerializeField]
		private TMP_InputField.SubmitEvent m_OnEndEdit = new TMP_InputField.SubmitEvent();

		// Token: 0x04002ECF RID: 11983
		[SerializeField]
		private TMP_InputField.SubmitEvent m_OnSubmit = new TMP_InputField.SubmitEvent();

		// Token: 0x04002ED0 RID: 11984
		[SerializeField]
		private TMP_InputField.SubmitEvent m_OnFocusLost = new TMP_InputField.SubmitEvent();

		// Token: 0x04002ED1 RID: 11985
		[SerializeField]
		private TMP_InputField.OnChangeEvent m_OnValueChanged = new TMP_InputField.OnChangeEvent();

		// Token: 0x04002ED2 RID: 11986
		[SerializeField]
		private TMP_InputField.OnValidateInput m_OnValidateInput;

		// Token: 0x04002ED3 RID: 11987
		[SerializeField]
		private Color m_CaretColor = new Color(0.19607843f, 0.19607843f, 0.19607843f, 1f);

		// Token: 0x04002ED4 RID: 11988
		[SerializeField]
		private bool m_CustomCaretColor;

		// Token: 0x04002ED5 RID: 11989
		[SerializeField]
		private Color m_SelectionColor = new Color(0.65882355f, 0.80784315f, 1f, 0.7529412f);

		// Token: 0x04002ED6 RID: 11990
		[SerializeField]
		protected string m_Text = string.Empty;

		// Token: 0x04002ED7 RID: 11991
		[SerializeField]
		[Range(0f, 4f)]
		private float m_CaretBlinkRate = 0.85f;

		// Token: 0x04002ED8 RID: 11992
		[SerializeField]
		[Range(1f, 5f)]
		private int m_CaretWidth = 1;

		// Token: 0x04002ED9 RID: 11993
		[SerializeField]
		private bool m_ReadOnly;

		// Token: 0x04002EDA RID: 11994
		[SerializeField]
		private bool m_RichText = true;

		// Token: 0x04002EDB RID: 11995
		protected int m_StringPosition;

		// Token: 0x04002EDC RID: 11996
		protected int m_StringSelectPosition;

		// Token: 0x04002EDD RID: 11997
		protected int m_CaretPosition;

		// Token: 0x04002EDE RID: 11998
		protected int m_CaretSelectPosition;

		// Token: 0x04002EDF RID: 11999
		private RectTransform caretRectTrans;

		// Token: 0x04002EE0 RID: 12000
		protected UIVertex[] m_CursorVerts;

		// Token: 0x04002EE1 RID: 12001
		private CanvasRenderer m_CachedInputRenderer;

		// Token: 0x04002EE2 RID: 12002
		[NonSerialized]
		protected Mesh m_Mesh;

		// Token: 0x04002EE3 RID: 12003
		private bool m_AllowInput;

		// Token: 0x04002EE4 RID: 12004
		private bool m_HasLostFocus;

		// Token: 0x04002EE5 RID: 12005
		private bool m_ShouldActivateNextUpdate;

		// Token: 0x04002EE6 RID: 12006
		private bool m_UpdateDrag;

		// Token: 0x04002EE7 RID: 12007
		private bool m_DragPositionOutOfBounds;

		// Token: 0x04002EE8 RID: 12008
		private const float kHScrollSpeed = 0.05f;

		// Token: 0x04002EE9 RID: 12009
		private const float kVScrollSpeed = 0.1f;

		// Token: 0x04002EEA RID: 12010
		protected bool m_CaretVisible;

		// Token: 0x04002EEB RID: 12011
		private Coroutine m_BlinkCoroutine;

		// Token: 0x04002EEC RID: 12012
		private float m_BlinkStartTime;

		// Token: 0x04002EED RID: 12013
		protected int m_DrawStart;

		// Token: 0x04002EEE RID: 12014
		protected int m_DrawEnd;

		// Token: 0x04002EEF RID: 12015
		private Coroutine m_DragCoroutine;

		// Token: 0x04002EF0 RID: 12016
		private string m_OriginalText = string.Empty;

		// Token: 0x04002EF1 RID: 12017
		private bool m_WasCanceled;

		// Token: 0x04002EF2 RID: 12018
		private bool m_HasDoneFocusTransition;

		// Token: 0x04002EF3 RID: 12019
		private bool m_isLastKeyBackspace;

		// Token: 0x04002EF4 RID: 12020
		private const string kEmailSpecialCharacters = "!#$%&'*+-/=?^_`{|}~";

		// Token: 0x04002EF5 RID: 12021
		private bool isCaretInsideTag;

		// Token: 0x04002EF6 RID: 12022
		private Event m_ProcessingEvent = new Event();

		// Token: 0x020005B0 RID: 1456
		public enum ContentType
		{
			// Token: 0x04002EF8 RID: 12024
			Standard,
			// Token: 0x04002EF9 RID: 12025
			Autocorrected,
			// Token: 0x04002EFA RID: 12026
			IntegerNumber,
			// Token: 0x04002EFB RID: 12027
			DecimalNumber,
			// Token: 0x04002EFC RID: 12028
			Alphanumeric,
			// Token: 0x04002EFD RID: 12029
			Name,
			// Token: 0x04002EFE RID: 12030
			EmailAddress,
			// Token: 0x04002EFF RID: 12031
			Password,
			// Token: 0x04002F00 RID: 12032
			Pin,
			// Token: 0x04002F01 RID: 12033
			Custom
		}

		// Token: 0x020005B1 RID: 1457
		public enum InputType
		{
			// Token: 0x04002F03 RID: 12035
			Standard,
			// Token: 0x04002F04 RID: 12036
			AutoCorrect,
			// Token: 0x04002F05 RID: 12037
			Password
		}

		// Token: 0x020005B2 RID: 1458
		public enum CharacterValidation
		{
			// Token: 0x04002F07 RID: 12039
			None,
			// Token: 0x04002F08 RID: 12040
			Integer,
			// Token: 0x04002F09 RID: 12041
			Decimal,
			// Token: 0x04002F0A RID: 12042
			Alphanumeric,
			// Token: 0x04002F0B RID: 12043
			Name,
			// Token: 0x04002F0C RID: 12044
			EmailAddress
		}

		// Token: 0x020005B3 RID: 1459
		public enum LineType
		{
			// Token: 0x04002F0E RID: 12046
			SingleLine,
			// Token: 0x04002F0F RID: 12047
			MultiLineSubmit,
			// Token: 0x04002F10 RID: 12048
			MultiLineNewline
		}

		// Token: 0x020005B4 RID: 1460
		// (Invoke) Token: 0x06002A0A RID: 10762
		public delegate char OnValidateInput(string text, int charIndex, char addedChar);

		// Token: 0x020005B5 RID: 1461
		[Serializable]
		public class SubmitEvent : UnityEvent<string>
		{
		}

		// Token: 0x020005B6 RID: 1462
		[Serializable]
		public class OnChangeEvent : UnityEvent<string>
		{
		}

		// Token: 0x020005B7 RID: 1463
		protected enum EditState
		{
			// Token: 0x04002F12 RID: 12050
			Continue,
			// Token: 0x04002F13 RID: 12051
			Finish
		}
	}
}
