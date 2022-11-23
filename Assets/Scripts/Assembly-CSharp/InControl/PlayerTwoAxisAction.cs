namespace InControl
{
	public class PlayerTwoAxisAction : TwoAxisInputControl
	{
		internal PlayerTwoAxisAction(PlayerAction negativeXAction, PlayerAction positiveXAction, PlayerAction negativeYAction, PlayerAction positiveYAction)
		{
		}

		public BindingSourceType LastInputType;
	}
}
