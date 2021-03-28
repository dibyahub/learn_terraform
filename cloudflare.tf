variable cloudflare_email{}
variable cloudflare_api_key{}
variable cloudflare_zone_id{}

terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.0"
    }
  }
}

provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

# Create a record
resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "collaboration"
  value   = "185.136.234.230"
  type    = "A"
  ttl     = 1
  proxied = true
}

output "public_url" {
  value =  cloudflare_record.www.hostname
}
