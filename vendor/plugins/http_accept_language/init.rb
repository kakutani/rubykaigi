(
  (defined? ActionController::Request) ?
    ActionController::Request : ActionController::AbstractRequest
).send(:include, HttpAcceptLanguage)

