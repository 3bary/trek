import 'package:flutter/material.dart';

import '../../../data/models/warning_model.dart';

class WarningsAlertDialog extends StatefulWidget {
  const WarningsAlertDialog({super.key, required this.warnings});
  final List<WarningModel> warnings;

  @override
  State<WarningsAlertDialog> createState() => _WarningsAlertDialogState();
}

class _WarningsAlertDialogState extends State<WarningsAlertDialog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  Set<int> expandedItems = {};

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  IconData _getWarningIcon(String? warningType) {
    switch (warningType?.toLowerCase()) {
      case 'destination':
        return Icons.location_on_outlined;
      case 'accessibility needs':
      case 'accessibility':
        return Icons.accessible_outlined;
      default:
        return Icons.info_outline;
    }
  }

  Color _getWarningColor(String? warningType) {
    switch (warningType?.toLowerCase()) {
      case 'destination':
        return Colors.orange;
      case 'accessibility needs':
      case 'accessibility':
        return Colors.blue;
      default:
        return Colors.amber;
    }
  }

  String _getWarningTypeDisplay(String? warningType) {
    if (warningType == null) return 'General';
    return warningType
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaleTransition(
      scale: _scaleAnimation,
      child: AlertDialog(
        backgroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade50, Colors.orange.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.redAccent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Travel Warnings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "${widget.warnings.length} warning${widget.warnings.length != 1 ? 's' : ''} found",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${widget.warnings.length}",
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child:
              widget.warnings.isEmpty
                  ? const Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        "No warnings to display",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                  : ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: widget.warnings.length,
                    separatorBuilder:
                        (context, index) => Divider(
                          height: 1,
                          color: Colors.grey.shade200,
                          indent: 16,
                          endIndent: 16,
                        ),
                    itemBuilder: (context, index) {
                      final warning = widget.warnings[index];
                      final isExpanded = expandedItems.contains(index);
                      final warningColor = _getWarningColor(
                        warning.warningType,
                      );
                      final hasLongMessage =
                          (warning.message?.length ?? 0) > 100;

                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: warningColor.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: warningColor.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap:
                              hasLongMessage
                                  ? () {
                                    setState(() {
                                      if (isExpanded) {
                                        expandedItems.remove(index);
                                      } else {
                                        expandedItems.add(index);
                                      }
                                    });
                                  }
                                  : null,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: warningColor.withValues(
                                          alpha: 0.1,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        _getWarningIcon(warning.warningType),
                                        color: warningColor,
                                        size: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (warning.warningType != null) ...[
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: warningColor.withValues(
                                                  alpha: 0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                _getWarningTypeDisplay(
                                                  warning.warningType,
                                                ),
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: warningColor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                          ],
                                          Text(
                                            warning.message ??
                                                'Unknown warning',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87,
                                            ),
                                            maxLines:
                                                isExpanded
                                                    ? null
                                                    : (hasLongMessage
                                                        ? 3
                                                        : null),
                                            overflow:
                                                isExpanded
                                                    ? null
                                                    : (hasLongMessage
                                                        ? TextOverflow.ellipsis
                                                        : null),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (hasLongMessage)
                                      Icon(
                                        isExpanded
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.grey[600],
                                        size: 20,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        ),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey[700],
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      // Handle "Understand" action - could mark warnings as read
                      Navigator.of(context).pop(true);
                    },
                    icon: const Icon(Icons.check_circle_outline, size: 18),
                    label: const Text("I Understand"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.of(context).pop(false),
                    icon: const Icon(Icons.close, size: 18),
                    label: const Text("Close"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
