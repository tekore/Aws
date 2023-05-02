resource "aws_budgets_budget" "ec2" {
  name              = var.budget.name
  budget_type       = "COST"
  limit_amount      = var.budget.limit-amount
  limit_unit        = var.budget.limit-unit
  time_period_start = var.budget.period-start
  time_period_end   = var.budget.period-end
  time_unit         = var.budget.time-unit
  cost_filter {
    name = "Service"
    values = [var.budget.cost-filter,]
}
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.budget.email]
  }
}
