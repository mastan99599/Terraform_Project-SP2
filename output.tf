output "owners" {
  value       =[for i in var.shaik_name:i]
}

output "myownernames" {
  value       =[for k,v in var.shaik_loop:v]
}

output "nestedmapami" {
  value       =[for k,v in var.shaik_loop2:v.ami]
}

output "setdata" {
  value       =[for k,v in var.shaik:v]
}