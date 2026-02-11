enum DeliveryStepStatus { completed, active, pending }

class DeliveryStep {
  final DeliveryStepStatus status;
  final String title;
  final String subtitle;
  final String? rightLabel;

  DeliveryStep({
    required this.status,
    required this.title,
    required this.subtitle,
    this.rightLabel,
  });
}

class DeliveryModel {
  final String id;
  final List<DeliveryStep> steps;

  DeliveryModel({required this.id, required this.steps});
}
