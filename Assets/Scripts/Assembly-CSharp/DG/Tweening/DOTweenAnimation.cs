using DG.Tweening.Core;
using UnityEngine;

namespace DG.Tweening
{
	public class DOTweenAnimation : ABSAnimationComponent
	{
		public float delay;
		public float duration;
		public Ease easeType;
		public AnimationCurve easeCurve;
		public LoopType loopType;
		public int loops;
		public string id;
		public bool isRelative;
		public bool isFrom;
		public bool isIndependentUpdate;
		public bool autoKill;
		public bool isActive;
		public bool isValid;
		public Component target;
		public DOTweenAnimationType animationType;
		public TargetType targetType;
		public TargetType forcedTargetType;
		public bool autoPlay;
		public bool useTargetAsV3;
		public float endValueFloat;
		public Vector3 endValueV3;
		public Vector2 endValueV2;
		public Color endValueColor;
		public string endValueString;
		public Rect endValueRect;
		public Transform endValueTransform;
		public bool optionalBool0;
		public float optionalFloat0;
		public int optionalInt0;
		public RotateMode optionalRotationMode;
		public ScrambleMode optionalScrambleMode;
		public string optionalString;
	}
}
