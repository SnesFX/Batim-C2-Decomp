using DG.Tweening.Core;
using UnityEngine;
using DG.Tweening.Plugins.Options;
using System.Collections.Generic;
using DG.Tweening.Plugins.Core.PathCore;

namespace DG.Tweening
{
	public class DOTweenPath : ABSAnimationComponent
	{
		public float delay;
		public float duration;
		public Ease easeType;
		public AnimationCurve easeCurve;
		public int loops;
		public string id;
		public LoopType loopType;
		public OrientType orientType;
		public Transform lookAtTransform;
		public Vector3 lookAtPosition;
		public float lookAhead;
		public bool autoPlay;
		public bool autoKill;
		public bool relative;
		public bool isLocal;
		public bool isClosedPath;
		public int pathResolution;
		public PathMode pathMode;
		public AxisConstraint lockRotation;
		public bool assignForwardAndUp;
		public Vector3 forwardDirection;
		public Vector3 upDirection;
		public bool tweenRigidbody;
		public List<Vector3> wps;
		public List<Vector3> fullWps;
		public Path path;
		public DOTweenInspectorMode inspectorMode;
		public PathType pathType;
		public HandlesType handlesType;
		public bool livePreview;
		public HandlesDrawMode handlesDrawMode;
		public float perspectiveHandleSize;
		public bool showIndexes;
		public bool showWpLength;
		public Color pathColor;
		public Vector3 lastSrcPosition;
		public bool wpsDropdown;
		public float dropToFloorOffset;
	}
}
