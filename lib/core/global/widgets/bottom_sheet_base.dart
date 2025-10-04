import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomSheetBase extends StatelessWidget {
  /// {@macro BottomSheetBase}
  const BottomSheetBase({
    required this.child,
    super.key,
    this.height,
    this.expanded = true,
    this.title,
    this.onTapTitle,
    this.isDismissible = true,
    this.onClose,
    this.forceDarkMode = false,
    this.isFloating = true,
    this.leadingTitle,
    this.borderColor,
    this.centerBody = false,
    this.titleWidget,
    this.showTitleBlankSpace = true,
    this.topHeight,
    this.bottomHeight,
    this.backgroundColor,
    this.titleColor,
    this.closeIconColor,
    this.titleAlignment,
  });

  /// Default `String` if you only want to place
  /// a title on the [BottomSheetBase]
  final String? title;

  /// `height` for the modals. If null, the modals will be autosized
  final double? height;

  /// The `child` widget to put inside the [BottomSheetBase]
  final Widget child;

  /// The `child` widget expands or not, default is true
  final bool expanded;

  /// The [isDismissible] parameter specifies whether the bottom sheet will be
  /// dismissed when user taps on the scrim.
  final bool isDismissible;

  /// Custom event to the X button to close the modal, consider
  /// which depends on the value of the isDismissible parameter
  final VoidCallback? onClose;

  /// the [isFloating] if you want the child widget to be floating
  final bool isFloating;

  final bool forceDarkMode;

  /// the [leadingTitle] adds a widget to the title frame
  final Widget? leadingTitle;

  /// the [onTapTitle] is the event that is executed on the title.
  final VoidCallback? onTapTitle;

  /// the [borderColor] add color to the border of this widget.
  final Color? borderColor;

  /// the [centerBody] centers the widget body, required height
  final bool centerBody;

  /// the [titleWidget] a title on the [BottomSheetBase]
  final Widget? titleWidget;

  final bool showTitleBlankSpace;

  /// the [topHeight] double value
  final double? topHeight;

  /// the [bottomHeight] double value
  final double? bottomHeight;

  final Alignment? titleAlignment;

  final Color? backgroundColor;
  final Color? titleColor;
  final Color? closeIconColor;

  @override
  Widget build(BuildContext context) {
    /// widget top height
    final widgetTopHeight = topHeight ?? 16.0;

    /// widget top height
    final widgetBottomHeight = bottomHeight ?? 12.0;

    /// Default `double` size in [BottomSheetBase]
    const radiusTop = 10.0;

    final widgetBackgroundColor =
        backgroundColor ?? (forceDarkMode ? Colors.black : Colors.white);

    final size = MediaQuery.sizeOf(context);

    final Widget messageBody = ClipRRect(
      borderRadius: isFloating
          ? BorderRadius.circular(radiusTop)
          : const BorderRadius.vertical(
              top: Radius.circular(radiusTop),
            ),
      child: Container(
        height: centerBody ? null : height,
        decoration: BoxDecoration(
          color: widgetBackgroundColor,
          border: borderColor != null
              ? Border.all(
                  width: 1.5,
                  color: borderColor!,
                )
              : null,
          borderRadius: isFloating
              ? BorderRadius.circular(radiusTop)
              : const BorderRadius.vertical(
                  top: Radius.circular(radiusTop),
                ),
        ),
        child: Column(
          children: [
            SizedBox(height: widgetTopHeight),
            // if (title != null || titleWidget != null) ...[
            //   TitleBottomSheet(
            //     closeIconColor: closeIconColor,
            //     onTap: onTapTitle,
            //     title: titleWidget != null ? titleWidget! : Text(title!),
            //     leadingChildTitle: leadingTitle,
            //     forceDarkMode: forceDarkMode,
            //     showClose: isDismissible,
            //     onClose: onClose,
            //     alignment: titleAlignment,
            //     titleColor: titleColor,
            //   ),
            // ],
            SizedBox(height: widgetBottomHeight),
            if (expanded)
              Expanded(
                child: child,
              )
            else
              child,
          ],
        ),
      ),
    );
    final canPop = isDismissible && onClose == null;
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () {
                  if (canPop) {
                    context.pop();
                  }
                },
                child: const Material(
                  color: Colors.transparent,
                  child: ColoredBox(color: Colors.transparent),
                ),
              ),
              if (centerBody) ...[
                Positioned(
                  bottom: (size.height - (height != null ? height! : 0)) / 2,
                  left: isFloating ? 16 : 0,
                  right: isFloating ? 16 : 0,
                  child: messageBody,
                ),
              ] else ...[
                Positioned(
                  bottom: isFloating ? 16 : 0,
                  left: isFloating ? 16 : 0,
                  right: isFloating ? 16 : 0,
                  child: messageBody,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
