variable "rg" {
  type = map(object({
    name       = string
    location   = string
    tags       = optional(map(string))
    managed_by = optional(map(string))
  }))
}