using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace TMPro
{
	// Token: 0x020005A5 RID: 1445
	[AddComponentMenu("UI/TMP Dropdown", 35)]
	[RequireComponent(typeof(RectTransform))]
	public class TMP_Dropdown : Selectable, IPointerClickHandler, ISubmitHandler, ICancelHandler, IEventSystemHandler
	{
		// Token: 0x0600291A RID: 10522 RVA: 0x0001D9A5 File Offset: 0x0001BBA5
		protected TMP_Dropdown()
		{
		}

		// Token: 0x17000427 RID: 1063
		// (get) Token: 0x0600291B RID: 10523 RVA: 0x0001D9CE File Offset: 0x0001BBCE
		// (set) Token: 0x0600291C RID: 10524 RVA: 0x0001D9D6 File Offset: 0x0001BBD6
		public RectTransform template
		{
			get
			{
				return this.m_Template;
			}
			set
			{
				this.m_Template = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x17000428 RID: 1064
		// (get) Token: 0x0600291D RID: 10525 RVA: 0x0001D9E5 File Offset: 0x0001BBE5
		// (set) Token: 0x0600291E RID: 10526 RVA: 0x0001D9ED File Offset: 0x0001BBED
		public TMP_Text captionText
		{
			get
			{
				return this.m_CaptionText;
			}
			set
			{
				this.m_CaptionText = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x17000429 RID: 1065
		// (get) Token: 0x0600291F RID: 10527 RVA: 0x0001D9FC File Offset: 0x0001BBFC
		// (set) Token: 0x06002920 RID: 10528 RVA: 0x0001DA04 File Offset: 0x0001BC04
		public Image captionImage
		{
			get
			{
				return this.m_CaptionImage;
			}
			set
			{
				this.m_CaptionImage = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x1700042A RID: 1066
		// (get) Token: 0x06002921 RID: 10529 RVA: 0x0001DA13 File Offset: 0x0001BC13
		// (set) Token: 0x06002922 RID: 10530 RVA: 0x0001DA1B File Offset: 0x0001BC1B
		public TMP_Text itemText
		{
			get
			{
				return this.m_ItemText;
			}
			set
			{
				this.m_ItemText = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x1700042B RID: 1067
		// (get) Token: 0x06002923 RID: 10531 RVA: 0x0001DA2A File Offset: 0x0001BC2A
		// (set) Token: 0x06002924 RID: 10532 RVA: 0x0001DA32 File Offset: 0x0001BC32
		public Image itemImage
		{
			get
			{
				return this.m_ItemImage;
			}
			set
			{
				this.m_ItemImage = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x1700042C RID: 1068
		// (get) Token: 0x06002925 RID: 10533 RVA: 0x0001DA41 File Offset: 0x0001BC41
		// (set) Token: 0x06002926 RID: 10534 RVA: 0x0001DA4E File Offset: 0x0001BC4E
		public List<TMP_Dropdown.OptionData> options
		{
			get
			{
				return this.m_Options.options;
			}
			set
			{
				this.m_Options.options = value;
				this.RefreshShownValue();
			}
		}

		// Token: 0x1700042D RID: 1069
		// (get) Token: 0x06002927 RID: 10535 RVA: 0x0001DA62 File Offset: 0x0001BC62
		// (set) Token: 0x06002928 RID: 10536 RVA: 0x0001DA6A File Offset: 0x0001BC6A
		public TMP_Dropdown.DropdownEvent onValueChanged
		{
			get
			{
				return this.m_OnValueChanged;
			}
			set
			{
				this.m_OnValueChanged = value;
			}
		}

		// Token: 0x1700042E RID: 1070
		// (get) Token: 0x06002929 RID: 10537 RVA: 0x0001DA73 File Offset: 0x0001BC73
		// (set) Token: 0x0600292A RID: 10538 RVA: 0x000FBB0C File Offset: 0x000F9D0C
		public int value
		{
			get
			{
				return this.m_Value;
			}
			set
			{
				if (Application.isPlaying && (value == this.m_Value || this.options.Count == 0))
				{
					return;
				}
				this.m_Value = Mathf.Clamp(value, 0, this.options.Count - 1);
				this.RefreshShownValue();
				this.m_OnValueChanged.Invoke(this.m_Value);
			}
		}

		// Token: 0x0600292B RID: 10539 RVA: 0x000FBB74 File Offset: 0x000F9D74
		protected override void Awake()
		{
			this.m_AlphaTweenRunner = new TweenRunner<FloatTween>();
			this.m_AlphaTweenRunner.Init(this);
			if (this.m_CaptionImage)
			{
				this.m_CaptionImage.enabled = (this.m_CaptionImage.sprite != null);
			}
			if (this.m_Template)
			{
				this.m_Template.gameObject.SetActive(false);
			}
		}

		// Token: 0x0600292C RID: 10540 RVA: 0x000FBBE8 File Offset: 0x000F9DE8
		public void RefreshShownValue()
		{
			TMP_Dropdown.OptionData optionData = TMP_Dropdown.s_NoOptionData;
			if (this.options.Count > 0)
			{
				optionData = this.options[Mathf.Clamp(this.m_Value, 0, this.options.Count - 1)];
			}
			if (this.m_CaptionText)
			{
				if (optionData != null && optionData.text != null)
				{
					this.m_CaptionText.text = optionData.text;
				}
				else
				{
					this.m_CaptionText.text = string.Empty;
				}
			}
			if (this.m_CaptionImage)
			{
				if (optionData != null)
				{
					this.m_CaptionImage.sprite = optionData.image;
				}
				else
				{
					this.m_CaptionImage.sprite = null;
				}
				this.m_CaptionImage.enabled = (this.m_CaptionImage.sprite != null);
			}
		}

		// Token: 0x0600292D RID: 10541 RVA: 0x0001DA7B File Offset: 0x0001BC7B
		public void AddOptions(List<TMP_Dropdown.OptionData> options)
		{
			this.options.AddRange(options);
			this.RefreshShownValue();
		}

		// Token: 0x0600292E RID: 10542 RVA: 0x000FBCCC File Offset: 0x000F9ECC
		public void AddOptions(List<string> options)
		{
			for (int i = 0; i < options.Count; i++)
			{
				this.options.Add(new TMP_Dropdown.OptionData(options[i]));
			}
			this.RefreshShownValue();
		}

		// Token: 0x0600292F RID: 10543 RVA: 0x000FBD10 File Offset: 0x000F9F10
		public void AddOptions(List<Sprite> options)
		{
			for (int i = 0; i < options.Count; i++)
			{
				this.options.Add(new TMP_Dropdown.OptionData(options[i]));
			}
			this.RefreshShownValue();
		}

		// Token: 0x06002930 RID: 10544 RVA: 0x0001DA8F File Offset: 0x0001BC8F
		public void ClearOptions()
		{
			this.options.Clear();
			this.RefreshShownValue();
		}

		// Token: 0x06002931 RID: 10545 RVA: 0x000FBD54 File Offset: 0x000F9F54
		private void SetupTemplate()
		{
			this.validTemplate = false;
			if (!this.m_Template)
			{
				Debug.LogError("The dropdown template is not assigned. The template needs to be assigned and must have a child GameObject with a Toggle component serving as the item.", this);
				return;
			}
			GameObject gameObject = this.m_Template.gameObject;
			gameObject.SetActive(true);
			Toggle componentInChildren = this.m_Template.GetComponentInChildren<Toggle>();
			this.validTemplate = true;
			if (!componentInChildren || componentInChildren.transform == this.template)
			{
				this.validTemplate = false;
				Debug.LogError("The dropdown template is not valid. The template must have a child GameObject with a Toggle component serving as the item.", this.template);
			}
			else if (!(componentInChildren.transform.parent is RectTransform))
			{
				this.validTemplate = false;
				Debug.LogError("The dropdown template is not valid. The child GameObject with a Toggle component (the item) must have a RectTransform on its parent.", this.template);
			}
			else if (this.itemText != null && !this.itemText.transform.IsChildOf(componentInChildren.transform))
			{
				this.validTemplate = false;
				Debug.LogError("The dropdown template is not valid. The Item Text must be on the item GameObject or children of it.", this.template);
			}
			else if (this.itemImage != null && !this.itemImage.transform.IsChildOf(componentInChildren.transform))
			{
				this.validTemplate = false;
				Debug.LogError("The dropdown template is not valid. The Item Image must be on the item GameObject or children of it.", this.template);
			}
			if (!this.validTemplate)
			{
				gameObject.SetActive(false);
				return;
			}
			TMP_Dropdown.DropdownItem dropdownItem = componentInChildren.gameObject.AddComponent<TMP_Dropdown.DropdownItem>();
			dropdownItem.text = this.m_ItemText;
			dropdownItem.image = this.m_ItemImage;
			dropdownItem.toggle = componentInChildren;
			dropdownItem.rectTransform = (RectTransform)componentInChildren.transform;
			Canvas orAddComponent = TMP_Dropdown.GetOrAddComponent<Canvas>(gameObject);
			orAddComponent.overrideSorting = true;
			orAddComponent.sortingOrder = 30000;
			TMP_Dropdown.GetOrAddComponent<GraphicRaycaster>(gameObject);
			TMP_Dropdown.GetOrAddComponent<CanvasGroup>(gameObject);
			gameObject.SetActive(false);
			this.validTemplate = true;
		}

		// Token: 0x06002932 RID: 10546 RVA: 0x000FBF28 File Offset: 0x000FA128
		private static T GetOrAddComponent<T>(GameObject go) where T : Component
		{
			T t = go.GetComponent<T>();
			if (!t)
			{
				t = go.AddComponent<T>();
			}
			return t;
		}

		// Token: 0x06002933 RID: 10547 RVA: 0x0001DAA2 File Offset: 0x0001BCA2
		public virtual void OnPointerClick(PointerEventData eventData)
		{
			this.Show();
		}

		// Token: 0x06002934 RID: 10548 RVA: 0x0001DAA2 File Offset: 0x0001BCA2
		public virtual void OnSubmit(BaseEventData eventData)
		{
			this.Show();
		}

		// Token: 0x06002935 RID: 10549 RVA: 0x0001DAAA File Offset: 0x0001BCAA
		public virtual void OnCancel(BaseEventData eventData)
		{
			this.Hide();
		}

		// Token: 0x06002936 RID: 10550 RVA: 0x000FBF54 File Offset: 0x000FA154
		public void Show()
		{
			if (!this.IsActive() || !this.IsInteractable() || this.m_Dropdown != null)
			{
				return;
			}
			if (!this.validTemplate)
			{
				this.SetupTemplate();
				if (!this.validTemplate)
				{
					return;
				}
			}
			List<Canvas> list = TMP_ListPool<Canvas>.Get();
			base.gameObject.GetComponentsInParent<Canvas>(false, list);
			if (list.Count == 0)
			{
				return;
			}
			Canvas canvas = list[0];
			TMP_ListPool<Canvas>.Release(list);
			this.m_Template.gameObject.SetActive(true);
			this.m_Dropdown = this.CreateDropdownList(this.m_Template.gameObject);
			this.m_Dropdown.name = "Dropdown List";
			this.m_Dropdown.SetActive(true);
			RectTransform rectTransform = this.m_Dropdown.transform as RectTransform;
			rectTransform.SetParent(this.m_Template.transform.parent, false);
			TMP_Dropdown.DropdownItem componentInChildren = this.m_Dropdown.GetComponentInChildren<TMP_Dropdown.DropdownItem>();
			GameObject gameObject = componentInChildren.rectTransform.parent.gameObject;
			RectTransform rectTransform2 = gameObject.transform as RectTransform;
			componentInChildren.rectTransform.gameObject.SetActive(true);
			Rect rect = rectTransform2.rect;
			Rect rect2 = componentInChildren.rectTransform.rect;
			Vector2 vector = rect2.min - rect.min + (Vector2)componentInChildren.rectTransform.localPosition;
			Vector2 vector2 = rect2.max - rect.max + (Vector2)componentInChildren.rectTransform.localPosition;
			Vector2 size = rect2.size;
			this.m_Items.Clear();
			Toggle toggle = null;
			for (int i = 0; i < this.options.Count; i++)
			{
				TMP_Dropdown.OptionData data = this.options[i];
				TMP_Dropdown.DropdownItem item = this.AddItem(data, this.value == i, componentInChildren, this.m_Items);
				if (!(item == null))
				{
					item.toggle.isOn = (this.value == i);
					item.toggle.onValueChanged.AddListener(delegate(bool x)
					{
						this.OnSelectItem(item.toggle);
					});
					if (item.toggle.isOn)
					{
						item.toggle.Select();
					}
					if (toggle != null)
					{
						Navigation navigation = toggle.navigation;
						Navigation navigation2 = item.toggle.navigation;
						navigation.mode = Navigation.Mode.Explicit;
						navigation2.mode = Navigation.Mode.Explicit;
						navigation.selectOnDown = item.toggle;
						navigation.selectOnRight = item.toggle;
						navigation2.selectOnLeft = toggle;
						navigation2.selectOnUp = toggle;
						toggle.navigation = navigation;
						item.toggle.navigation = navigation2;
					}
					toggle = item.toggle;
				}
			}
			Vector2 sizeDelta = rectTransform2.sizeDelta;
			sizeDelta.y = size.y * (float)this.m_Items.Count + vector.y - vector2.y;
			rectTransform2.sizeDelta = sizeDelta;
			float num = rectTransform.rect.height - rectTransform2.rect.height;
			if (num > 0f)
			{
				rectTransform.sizeDelta = new Vector2(rectTransform.sizeDelta.x, rectTransform.sizeDelta.y - num);
			}
			Vector3[] array = new Vector3[4];
			rectTransform.GetWorldCorners(array);
			RectTransform rectTransform3 = canvas.transform as RectTransform;
			Rect rect3 = rectTransform3.rect;
			for (int j = 0; j < 2; j++)
			{
				bool flag = false;
				for (int k = 0; k < 4; k++)
				{
					Vector3 vector3 = rectTransform3.InverseTransformPoint(array[k]);
					if (vector3[j] < rect3.min[j] || vector3[j] > rect3.max[j])
					{
						flag = true;
						break;
					}
				}
				if (flag)
				{
					RectTransformUtility.FlipLayoutOnAxis(rectTransform, j, false, false);
				}
			}
			for (int l = 0; l < this.m_Items.Count; l++)
			{
				RectTransform rectTransform4 = this.m_Items[l].rectTransform;
				rectTransform4.anchorMin = new Vector2(rectTransform4.anchorMin.x, 0f);
				rectTransform4.anchorMax = new Vector2(rectTransform4.anchorMax.x, 0f);
				rectTransform4.anchoredPosition = new Vector2(rectTransform4.anchoredPosition.x, vector.y + size.y * (float)(this.m_Items.Count - 1 - l) + size.y * rectTransform4.pivot.y);
				rectTransform4.sizeDelta = new Vector2(rectTransform4.sizeDelta.x, size.y);
			}
			this.AlphaFadeList(0.15f, 0f, 1f);
			this.m_Template.gameObject.SetActive(false);
			componentInChildren.gameObject.SetActive(false);
			this.m_Blocker = this.CreateBlocker(canvas);
		}

		// Token: 0x06002937 RID: 10551 RVA: 0x000FC4FC File Offset: 0x000FA6FC
		protected virtual GameObject CreateBlocker(Canvas rootCanvas)
		{
			GameObject gameObject = new GameObject("Blocker");
			RectTransform rectTransform = gameObject.AddComponent<RectTransform>();
			rectTransform.SetParent(rootCanvas.transform, false);
			rectTransform.anchorMin = Vector3.zero;
			rectTransform.anchorMax = Vector3.one;
			rectTransform.sizeDelta = Vector2.zero;
			Canvas canvas = gameObject.AddComponent<Canvas>();
			canvas.overrideSorting = true;
			Canvas component = this.m_Dropdown.GetComponent<Canvas>();
			canvas.sortingLayerID = component.sortingLayerID;
			canvas.sortingOrder = component.sortingOrder - 1;
			gameObject.AddComponent<GraphicRaycaster>();
			Image image = gameObject.AddComponent<Image>();
			image.color = Color.clear;
			Button button = gameObject.AddComponent<Button>();
			button.onClick.AddListener(new UnityAction(this.Hide));
			return gameObject;
		}

		// Token: 0x06002938 RID: 10552 RVA: 0x0001DAB2 File Offset: 0x0001BCB2
		protected virtual void DestroyBlocker(GameObject blocker)
		{
			UnityEngine.Object.Destroy(blocker);
		}

		// Token: 0x06002939 RID: 10553 RVA: 0x0001DABA File Offset: 0x0001BCBA
		protected virtual GameObject CreateDropdownList(GameObject template)
		{
			return UnityEngine.Object.Instantiate<GameObject>(template);
		}

		// Token: 0x0600293A RID: 10554 RVA: 0x0001DAB2 File Offset: 0x0001BCB2
		protected virtual void DestroyDropdownList(GameObject dropdownList)
		{
			UnityEngine.Object.Destroy(dropdownList);
		}

		// Token: 0x0600293B RID: 10555 RVA: 0x0001DAC2 File Offset: 0x0001BCC2
		protected virtual TMP_Dropdown.DropdownItem CreateItem(TMP_Dropdown.DropdownItem itemTemplate)
		{
			return UnityEngine.Object.Instantiate<TMP_Dropdown.DropdownItem>(itemTemplate);
		}

		// Token: 0x0600293C RID: 10556 RVA: 0x00002482 File Offset: 0x00000682
		protected virtual void DestroyItem(TMP_Dropdown.DropdownItem item)
		{
		}

		// Token: 0x0600293D RID: 10557 RVA: 0x000FC5C4 File Offset: 0x000FA7C4
		private TMP_Dropdown.DropdownItem AddItem(TMP_Dropdown.OptionData data, bool selected, TMP_Dropdown.DropdownItem itemTemplate, List<TMP_Dropdown.DropdownItem> items)
		{
			TMP_Dropdown.DropdownItem dropdownItem = this.CreateItem(itemTemplate);
			dropdownItem.rectTransform.SetParent(itemTemplate.rectTransform.parent, false);
			dropdownItem.gameObject.SetActive(true);
			dropdownItem.gameObject.name = "Item " + items.Count + ((data.text == null) ? string.Empty : (": " + data.text));
			if (dropdownItem.toggle != null)
			{
				dropdownItem.toggle.isOn = false;
			}
			if (dropdownItem.text)
			{
				dropdownItem.text.text = data.text;
			}
			if (dropdownItem.image)
			{
				dropdownItem.image.sprite = data.image;
				dropdownItem.image.enabled = (dropdownItem.image.sprite != null);
			}
			items.Add(dropdownItem);
			return dropdownItem;
		}

		// Token: 0x0600293E RID: 10558 RVA: 0x000FC6C8 File Offset: 0x000FA8C8
		private void AlphaFadeList(float duration, float alpha)
		{
			CanvasGroup component = this.m_Dropdown.GetComponent<CanvasGroup>();
			this.AlphaFadeList(duration, component.alpha, alpha);
		}

		// Token: 0x0600293F RID: 10559 RVA: 0x000FC6F0 File Offset: 0x000FA8F0
		private void AlphaFadeList(float duration, float start, float end)
		{
			if (end.Equals(start))
			{
				return;
			}
			FloatTween info = new FloatTween
			{
				duration = duration,
				startValue = start,
				targetValue = end
			};
			info.AddOnChangedCallback(new UnityAction<float>(this.SetAlpha));
			info.ignoreTimeScale = true;
			this.m_AlphaTweenRunner.StartTween(info);
		}

		// Token: 0x06002940 RID: 10560 RVA: 0x000FC754 File Offset: 0x000FA954
		private void SetAlpha(float alpha)
		{
			if (!this.m_Dropdown)
			{
				return;
			}
			CanvasGroup component = this.m_Dropdown.GetComponent<CanvasGroup>();
			component.alpha = alpha;
		}

		// Token: 0x06002941 RID: 10561 RVA: 0x000FC788 File Offset: 0x000FA988
		public void Hide()
		{
			if (this.m_Dropdown != null)
			{
				this.AlphaFadeList(0.15f, 0f);
				if (this.IsActive())
				{
					base.StartCoroutine(this.DelayedDestroyDropdownList(0.15f));
				}
			}
			if (this.m_Blocker != null)
			{
				this.DestroyBlocker(this.m_Blocker);
			}
			this.m_Blocker = null;
			this.Select();
		}

		// Token: 0x06002942 RID: 10562 RVA: 0x000FC800 File Offset: 0x000FAA00
		private IEnumerator DelayedDestroyDropdownList(float delay)
		{
			yield return new WaitForSeconds(delay);
			for (int i = 0; i < this.m_Items.Count; i++)
			{
				if (this.m_Items[i] != null)
				{
					this.DestroyItem(this.m_Items[i]);
				}
				this.m_Items.Clear();
			}
			if (this.m_Dropdown != null)
			{
				this.DestroyDropdownList(this.m_Dropdown);
			}
			this.m_Dropdown = null;
			yield break;
		}

		// Token: 0x06002943 RID: 10563 RVA: 0x000FC824 File Offset: 0x000FAA24
		private void OnSelectItem(Toggle toggle)
		{
			if (!toggle.isOn)
			{
				toggle.isOn = true;
			}
			int num = -1;
			Transform transform = toggle.transform;
			Transform parent = transform.parent;
			for (int i = 0; i < parent.childCount; i++)
			{
				if (parent.GetChild(i) == transform)
				{
					num = i - 1;
					break;
				}
			}
			if (num < 0)
			{
				return;
			}
			this.value = num;
			this.Hide();
		}

		// Token: 0x04002E89 RID: 11913
		[SerializeField]
		private RectTransform m_Template;

		// Token: 0x04002E8A RID: 11914
		[SerializeField]
		private TMP_Text m_CaptionText;

		// Token: 0x04002E8B RID: 11915
		[SerializeField]
		private Image m_CaptionImage;

		// Token: 0x04002E8C RID: 11916
		[Space]
		[SerializeField]
		private TMP_Text m_ItemText;

		// Token: 0x04002E8D RID: 11917
		[SerializeField]
		private Image m_ItemImage;

		// Token: 0x04002E8E RID: 11918
		[Space]
		[SerializeField]
		private int m_Value;

		// Token: 0x04002E8F RID: 11919
		[Space]
		[SerializeField]
		private TMP_Dropdown.OptionDataList m_Options = new TMP_Dropdown.OptionDataList();

		// Token: 0x04002E90 RID: 11920
		[Space]
		[SerializeField]
		private TMP_Dropdown.DropdownEvent m_OnValueChanged = new TMP_Dropdown.DropdownEvent();

		// Token: 0x04002E91 RID: 11921
		private GameObject m_Dropdown;

		// Token: 0x04002E92 RID: 11922
		private GameObject m_Blocker;

		// Token: 0x04002E93 RID: 11923
		private List<TMP_Dropdown.DropdownItem> m_Items = new List<TMP_Dropdown.DropdownItem>();

		// Token: 0x04002E94 RID: 11924
		private TweenRunner<FloatTween> m_AlphaTweenRunner;

		// Token: 0x04002E95 RID: 11925
		private bool validTemplate;

		// Token: 0x04002E96 RID: 11926
		private static TMP_Dropdown.OptionData s_NoOptionData = new TMP_Dropdown.OptionData();

		// Token: 0x020005A6 RID: 1446
		protected internal class DropdownItem : MonoBehaviour, IPointerEnterHandler, ICancelHandler, IEventSystemHandler
		{
			// Token: 0x1700042F RID: 1071
			// (get) Token: 0x06002946 RID: 10566 RVA: 0x0001DAD6 File Offset: 0x0001BCD6
			// (set) Token: 0x06002947 RID: 10567 RVA: 0x0001DADE File Offset: 0x0001BCDE
			public TMP_Text text
			{
				get
				{
					return this.m_Text;
				}
				set
				{
					this.m_Text = value;
				}
			}

			// Token: 0x17000430 RID: 1072
			// (get) Token: 0x06002948 RID: 10568 RVA: 0x0001DAE7 File Offset: 0x0001BCE7
			// (set) Token: 0x06002949 RID: 10569 RVA: 0x0001DAEF File Offset: 0x0001BCEF
			public Image image
			{
				get
				{
					return this.m_Image;
				}
				set
				{
					this.m_Image = value;
				}
			}

			// Token: 0x17000431 RID: 1073
			// (get) Token: 0x0600294A RID: 10570 RVA: 0x0001DAF8 File Offset: 0x0001BCF8
			// (set) Token: 0x0600294B RID: 10571 RVA: 0x0001DB00 File Offset: 0x0001BD00
			public RectTransform rectTransform
			{
				get
				{
					return this.m_RectTransform;
				}
				set
				{
					this.m_RectTransform = value;
				}
			}

			// Token: 0x17000432 RID: 1074
			// (get) Token: 0x0600294C RID: 10572 RVA: 0x0001DB09 File Offset: 0x0001BD09
			// (set) Token: 0x0600294D RID: 10573 RVA: 0x0001DB11 File Offset: 0x0001BD11
			public Toggle toggle
			{
				get
				{
					return this.m_Toggle;
				}
				set
				{
					this.m_Toggle = value;
				}
			}

			// Token: 0x0600294E RID: 10574 RVA: 0x0001DB1A File Offset: 0x0001BD1A
			public virtual void OnPointerEnter(PointerEventData eventData)
			{
				EventSystem.current.SetSelectedGameObject(base.gameObject);
			}

			// Token: 0x0600294F RID: 10575 RVA: 0x000FC89C File Offset: 0x000FAA9C
			public virtual void OnCancel(BaseEventData eventData)
			{
				TMP_Dropdown componentInParent = base.GetComponentInParent<TMP_Dropdown>();
				if (componentInParent)
				{
					componentInParent.Hide();
				}
			}

			// Token: 0x04002E97 RID: 11927
			[SerializeField]
			private TMP_Text m_Text;

			// Token: 0x04002E98 RID: 11928
			[SerializeField]
			private Image m_Image;

			// Token: 0x04002E99 RID: 11929
			[SerializeField]
			private RectTransform m_RectTransform;

			// Token: 0x04002E9A RID: 11930
			[SerializeField]
			private Toggle m_Toggle;
		}

		// Token: 0x020005A7 RID: 1447
		[Serializable]
		public class OptionData
		{
			// Token: 0x06002950 RID: 10576 RVA: 0x000026AE File Offset: 0x000008AE
			public OptionData()
			{
			}

			// Token: 0x06002951 RID: 10577 RVA: 0x0001DB2C File Offset: 0x0001BD2C
			public OptionData(string text)
			{
				this.text = text;
			}

			// Token: 0x06002952 RID: 10578 RVA: 0x0001DB3B File Offset: 0x0001BD3B
			public OptionData(Sprite image)
			{
				this.image = image;
			}

			// Token: 0x06002953 RID: 10579 RVA: 0x0001DB4A File Offset: 0x0001BD4A
			public OptionData(string text, Sprite image)
			{
				this.text = text;
				this.image = image;
			}

			// Token: 0x17000433 RID: 1075
			// (get) Token: 0x06002954 RID: 10580 RVA: 0x0001DB60 File Offset: 0x0001BD60
			// (set) Token: 0x06002955 RID: 10581 RVA: 0x0001DB68 File Offset: 0x0001BD68
			public string text
			{
				get
				{
					return this.m_Text;
				}
				set
				{
					this.m_Text = value;
				}
			}

			// Token: 0x17000434 RID: 1076
			// (get) Token: 0x06002956 RID: 10582 RVA: 0x0001DB71 File Offset: 0x0001BD71
			// (set) Token: 0x06002957 RID: 10583 RVA: 0x0001DB79 File Offset: 0x0001BD79
			public Sprite image
			{
				get
				{
					return this.m_Image;
				}
				set
				{
					this.m_Image = value;
				}
			}

			// Token: 0x04002E9B RID: 11931
			[SerializeField]
			private string m_Text;

			// Token: 0x04002E9C RID: 11932
			[SerializeField]
			private Sprite m_Image;
		}

		// Token: 0x020005A8 RID: 1448
		[Serializable]
		public class OptionDataList
		{
			// Token: 0x06002958 RID: 10584 RVA: 0x0001DB82 File Offset: 0x0001BD82
			public OptionDataList()
			{
				this.options = new List<TMP_Dropdown.OptionData>();
			}

			// Token: 0x17000435 RID: 1077
			// (get) Token: 0x06002959 RID: 10585 RVA: 0x0001DB95 File Offset: 0x0001BD95
			// (set) Token: 0x0600295A RID: 10586 RVA: 0x0001DB9D File Offset: 0x0001BD9D
			public List<TMP_Dropdown.OptionData> options
			{
				get
				{
					return this.m_Options;
				}
				set
				{
					this.m_Options = value;
				}
			}

			// Token: 0x04002E9D RID: 11933
			[SerializeField]
			private List<TMP_Dropdown.OptionData> m_Options;
		}

		// Token: 0x020005A9 RID: 1449
		[Serializable]
		public class DropdownEvent : UnityEvent<int>
		{
		}
	}
}
