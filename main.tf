resource "google_bigquery_connection_iam_member" "bigquery_connection_iam_members" {
  for_each = var.bigquery_connection_iam_members

  connection_id = each.value.connection_id
  member        = each.value.member
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

