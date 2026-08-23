import 'package:fluent_ui/fluent_ui.dart';

class FluentCard extends StatelessWidget {
  final Widget? leading;
  final Widget? content;
  final Widget? trailing;
  final bool isButton;
  final bool isInner;
  final VoidCallback? onPressed;

  const FluentCard({
    Key? key,
    this.leading,
    this.content,
    this.trailing,
    this.isButton = false,
    this.isInner = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final cardContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 16.0),
          ],
          if (content != null) Expanded(child: content!),
          if (trailing != null) trailing!,
        ],
      ),
    );

    if (isButton) {
      return HoverButton(
        onPressed: onPressed,
        builder: (context, states) {
          return Card(
            backgroundColor: states.contains(WidgetState.hovered) 
                ? theme.resources.cardBackgroundFillColorSecondary 
                : (isInner ? theme.resources.cardBackgroundFillColorSecondary : theme.cardColor),
            padding: EdgeInsets.zero,
            child: cardContent,
          );
        },
      );
    }

    return Card(
      backgroundColor: isInner ? theme.resources.cardBackgroundFillColorSecondary : theme.cardColor,
      padding: EdgeInsets.zero,
      child: cardContent,
    );
  }
}