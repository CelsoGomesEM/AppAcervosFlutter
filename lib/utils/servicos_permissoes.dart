enum ServicosStatus {
  /// The unknown service status indicates the state of the service could not be determined.
  unknown,

  /// There is no service for the supplied permission group.
  notApplicable,

  /// The service for the supplied permission group is disabled.
  disabled,

  /// The service for the supplied permission group is enabled.
  enabled
}