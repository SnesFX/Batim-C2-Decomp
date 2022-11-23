using System;
using UnityEngine;
using UnityEngine.EventSystems;

// Token: 0x02000302 RID: 770
public class CustomInputModule : StandaloneInputModule
{
	// Token: 0x06001230 RID: 4656 RVA: 0x0008EB64 File Offset: 0x0008CF64
	protected override PointerInputModule.MouseState GetMousePointerEventData(int id = 0)
	{
		PointerEventData pointerEventData;
		bool pointerData = base.GetPointerData(-1, out pointerEventData, true);
		pointerEventData.Reset();
		if (pointerData)
		{
			pointerEventData.position = Input.mousePosition;
		}
		Vector2 vector = Input.mousePosition;
		pointerEventData.delta = vector - pointerEventData.position;
		pointerEventData.position = vector;
		pointerEventData.scrollDelta = Input.mouseScrollDelta;
		pointerEventData.button = PointerEventData.InputButton.Left;
		base.eventSystem.RaycastAll(pointerEventData, this.m_RaycastResultCache);
		RaycastResult pointerCurrentRaycast = BaseInputModule.FindFirstRaycast(this.m_RaycastResultCache);
		pointerEventData.pointerCurrentRaycast = pointerCurrentRaycast;
		this.m_RaycastResultCache.Clear();
		PointerEventData pointerEventData2;
		base.GetPointerData(-2, out pointerEventData2, true);
		base.CopyFromTo(pointerEventData, pointerEventData2);
		pointerEventData2.button = PointerEventData.InputButton.Right;
		PointerEventData pointerEventData3;
		base.GetPointerData(-3, out pointerEventData3, true);
		base.CopyFromTo(pointerEventData, pointerEventData3);
		pointerEventData3.button = PointerEventData.InputButton.Middle;
		this.m_MouseState.SetButtonState(PointerEventData.InputButton.Left, base.StateForMouseButton(0), pointerEventData);
		this.m_MouseState.SetButtonState(PointerEventData.InputButton.Right, base.StateForMouseButton(1), pointerEventData2);
		this.m_MouseState.SetButtonState(PointerEventData.InputButton.Middle, base.StateForMouseButton(2), pointerEventData3);
		return this.m_MouseState;
	}

	// Token: 0x06001231 RID: 4657 RVA: 0x0008EC7C File Offset: 0x0008D07C
	private void GetSelectState(PointerEventData data, PointerEventData.InputButton inputButton, bool wasPressed, bool wasReleased)
	{
		PointerEventData.FramePressState stateForMouseButton = PointerEventData.FramePressState.NotChanged;
		if (wasPressed)
		{
			stateForMouseButton = PointerEventData.FramePressState.Pressed;
		}
		else if (wasReleased)
		{
			stateForMouseButton = PointerEventData.FramePressState.Released;
		}
		this.m_MouseState.SetButtonState(inputButton, stateForMouseButton, data);
	}

	// Token: 0x040013F0 RID: 5104
	private Vector2 m_cursorPos;

	// Token: 0x040013F1 RID: 5105
	private readonly PointerInputModule.MouseState m_MouseState = new PointerInputModule.MouseState();
}
