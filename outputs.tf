output "image" {
  value = data.google_compute_image.all
}

output "self_link" {
  value = data.google_compute_image.all.self_link
}
