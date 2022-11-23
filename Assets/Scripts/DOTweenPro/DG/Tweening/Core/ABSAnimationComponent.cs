using UnityEngine;
using DG.Tweening;
using UnityEngine.Events;

namespace DG.Tweening.Core
{
	public class ABSAnimationComponent : MonoBehaviour
	{
		public UpdateType updateType;
		public bool isSpeedBased;
		public bool hasOnStart;
		public bool hasOnPlay;
		public bool hasOnUpdate;
		public bool hasOnStepComplete;
		public bool hasOnComplete;
		public bool hasOnTweenCreated;
		public bool hasOnRewind;
		public UnityEvent onStart;
		public UnityEvent onPlay;
		public UnityEvent onUpdate;
		public UnityEvent onStepComplete;
		public UnityEvent onComplete;
		public UnityEvent onTweenCreated;
		public UnityEvent onRewind;
	}
}
